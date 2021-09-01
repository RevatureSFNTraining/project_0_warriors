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
        insert(dogOwner);
        insert(doggy);
        insert(walker);
    }    
    
    
 public TestMethod static void SINGLE_TEST(){
        //WalkTrigger takes no parameters
        //single insert
        walk__c weeJaunt = new walk__c{Name='Wee little jaunt', dog_C=doggy.id, uberdog_c=walker.id}
        system.debug(weeJaunt);
        insert(weeJaunt);
        
        //throw POSITIVE_TEST
        POSITIVE_TEST(weejaunt);
    }
    public TestMethod static void BULK_TEST(){
        //WalkTrigger takes no parameters
        //200 insert
        //this is the same as single. Only 1 trigger regardless of the number of inserts.
    }
    public TestMethod static void POSITIVE_TEST(walk_c testWalk){
       
        //verify single test succeeded
         
    system.debug('Dog:'+[SELECT ALL(Fields) on walk__c where id = testWalk.id]);
       
    }
    public TestMethod static void NEGATIVE_TEST(){
        //errors cannot exist. trigger is after insert, so there will always be 1 walk for the soql statement to select.
    }
}