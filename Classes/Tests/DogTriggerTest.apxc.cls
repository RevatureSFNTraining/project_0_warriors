@isTest
public class DogTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //setup walker
        uberdog__c walker = new uberdog__c{Name='Test Walker'};
        
        //setup contact
        contact dogOwner = new contact{Name='Test Owner'};
        insert(dogOwer);
        insert(walker);
    }
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
    }
}