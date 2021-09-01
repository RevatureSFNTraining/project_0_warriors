@isTest
public class DogTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //setup walker
        uberdog__c walker = new uberdog__c{Name='Test Walker'};
        
        //setup contact
        contact dogOwner = new contact{Name='Test Owner'};
    }
    /*
    public TestMethod static void SINGLE_TEST(){
        dog__c doggy = new dog__c{Name='Test', UberDog__c=walker.id, contact=dogowner.id};
        system.debug(doggy);
        //create a single dog
        insert(doggy);
        //throw to POSITIVE_TEST
        Positive_Test(doggy);
    }
    public TestMethod static void BULK_TEST(){
        //create 200 dogs
    }
    public TestMethod static void POSITIVE_TEST(dog__c doggy){
        system.debug('Dog:'+[SELECT ALL(Fields) on dog__C where id = doggy.id]);
        //verify single dog made single walk 
    }
    public TestMethod static void NEGATIVE_TEST(){
        //catch a error? which one who knows? make one up.
    }*/

 @isTest static void Positive_Single_Test1() {
        // create single record
        dog__c doggy = new dog__c{Name='Test', UberDog__c=walker.id, contact=dogowner.id};
        // begin testing, refresh governerlimites
        Test.startTest();
        Database.SaveResult[] results = Database.insert(doggy, false);
        Test.stopTest();        
        // assert that the results are correct 
        System.assert(results[0].isSuccess()); 
    }

    @isTest static void Positive_Bulk_Test() {
    
        //error handling not in place

        //create variables
        list <dog__c> newDogs = new list<dog__c>[200];
        //build list
        for(dog__c newDog: newDogs){
            newDog.name='TESTCONTACT-'+i;
            newDog.contact = dogOwner.id;
        }

        
        /* error handling is not in place. Under Construction
        Test.startTest();
        Database.SaveResult[] results = Database.insert(newDogs, false);
        Test.stopTest();        
        System.assert(results[0].isSuccess());
        */
        }









}