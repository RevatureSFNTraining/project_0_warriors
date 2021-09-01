@isTest
public class WalkTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //create all required fields for Walk to be created.
        //create contact record
        contact dogOwner = new contact{Name='TestOwner'};
        //create dog record
        dog_c doggy = new dog_c{Name='TestDog', contact= dogowner.id};
        //create uber_dog record
        uberdog_c walker = new uberdog_c{Name='TestWalker'};
        
       
    }
   
    @isTest static void Positive_Single_Test1() {
        // create single record
        walk__c weeJaunt = new walk__c{Name='Wee little jaunt', dog_C=doggy.id, uberdog_c=walker.id}
        // begin testing, refresh governerlimites
        Test.startTest();
        Database.insert(dogOwner, false);
        Database.insert(doggy, false);
        Database.insert(walker, false);
        Database.SaveResult[] results = Database.insert(weeJuant,false);
        Test.stopTest();        
        // assert that the results are correct 
        System.assert(results[0].isSuccess()); 
    }

    @isTest static void Positive_Bulk_Test() {
        // error handling not in place

        //create variables
        string email = 'cdirkswager@gmail.com';
        list <walk__c> newWalks = new list<walk__C>[200];
        //build list
        for(contact newWalk: newWalks){
            newWalk.name='TESTWALK-'+i;
            newWalk.dog__c = doggy.id;
            newWalk.uberdog__c = walker.id;

        }
        
        // begin testing list of walks

        //error handling not setup, test under constructions
        /*Test.startTest();
        Database.SaveResult[] results = Database.insert(newWalks, false);
        Test.stopTest();        
        //assert that the results are correct
        System.assert(results[0].isSuccess()); */

        
        }








}