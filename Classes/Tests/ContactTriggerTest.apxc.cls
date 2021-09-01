@isTest
public class ContactTriggerTest {

    
    @isTest static void Positive_Single_Test1() {
        // create single record
        Contact newContact = new contact{Name='TestContact', EmailAddress='cdirkswager@gmail.com'};
        // begin testing, refresh governerlimites
        Test.startTest();
        Database.SaveResult[] results = Database.insert(newContact, false);
        Test.stopTest();        
        // assert that the results are correct 
        System.assert(results[0].isSuccess()); 
    }
    @isTest static void Positive_Single_Test2() {
        // create single record with no email(null email)
        Contact newContact = new contact{Name='TestContact'};
        // begin testing
        Test.startTest();
        Database.SaveResult[] results = Database.insert(newContact, false);
        Test.stopTest();   
        //assert that the results are correct
        System.assert(results[0].isSuccess()); 
    }

    @isTest static void Negative_Bulk_Test() {
        // governer limit on emails. so anything about 15 or so should throw govorner limit error. NOT 200.
        //I have a if statement in place to push error before governor limit attempted.

        //create variables
        string email = 'cdirkswager@gmail.com';
        list <contact> newContacts = new list<contact>[20];
        //build list
        for(contact newContact: newContacts){
            newContact.name='TESTCONTACT-'+i;
            newContact.EmailAddress = email;
        }
        
        // begin testing list of contacts
        Test.startTest();
        Database.SaveResult[] results = Database.insert(newContacts, false);
        Test.stopTest();        
        //assert that the results are correct
        System.assert(!results[0].isSuccess()); // The insert operation is not success.
        //if it generates at least 1 error
        System.assert(results[0].getErrors().size() > 0);
        // making sure the string output is what I wanted it to be.
        System.assertEquals('Email Limit reached, uncheck Send Email Confirmation', results[0].getErrors()[0].getMessage()); 
        }

      
}