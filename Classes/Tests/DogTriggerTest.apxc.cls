@isTest
public class DogTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //setup walker
        //setup contact
    }
    public TestMethod static void SINGLE_TEST(){
        //create a single dog
        //throw to POSITIVE_TEST
    }
    public TestMethod static void BULK_TEST(){
        //create 200 dogs
    }
    public TestMethod static void POSITIVE_TEST(){
        //verify single dog made single walk 
    }
    public TestMethod static void NEGATIVE_TEST(){
        //catch a error? which one who knows? make one up.
    }
}