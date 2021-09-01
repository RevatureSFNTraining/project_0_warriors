@isTest
public class ContactTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //no objects requried
    }
    public TestMethod static void SINGLE_TEST(){
        //toss a single record into the email
        //throw POSITIVE_TEST
    }
    public TestMethod static void BULK_TEST(){
        //toss 200 records into the email
    }
    public TestMethod static void POSITIVE_TEST(){
        //verify single test succeeded
    }
    public TestMethod static void NEGATIVE_TEST(){
        //test.starttest()
        //hit daily limit error, catch error uncheck email_confirmation_sent;
        //test.stoptest()
    }
    public TestMethod static void NEGATIVE_TEST2(){
        //toss a single record into contact, null email field
    }
}