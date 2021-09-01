@isTest
public class WalkTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //create all required fields for Walk to be created.
        //create contact record
        //create dog record
        //create uber_dog record
    }    
    
    
 public TestMethod static void SINGLE_TEST(){
        //WalkTrigger takes no parameters
        //single insert
        //throw POSITIVE_TEST
    }
    public TestMethod static void BULK_TEST(){
        //WalkTrigger takes no parameters
        //200 insert
        //this is the same as single. Only 1 trigger regardless of the number of inserts.
    }
    public TestMethod static void POSITIVE_TEST(){
        //verify single test succeeded
    }
    public TestMethod static void NEGATIVE_TEST(){
        //errors cannot exist. trigger is after insert, so there will always be 1 walk for the soql statement to select.
    }
}