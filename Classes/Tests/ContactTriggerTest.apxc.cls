@isTest
public class ContactTriggerTest {
    
    @testSetup static void TestDataFactory(){
        //no objects requried
    }
    public TestMethod static void SINGLE_TEST(){
        //toss a single record into the contact
        contact newContact = new contact{Name='TestContact', EmailAddress = 'cdirkswager@gmail.com'};
        insert(newContact);
        //throw POSITIVE_TEST
        POSITIVE_TEST(newContact);
    }
    public TestMethod static void BULK_TEST(){
        //toss 200 records into the email
    }
    public TestMethod static void POSITIVE_TEST(contact c){
        //verify single test succeeded
        system.debug([SELECT all(fields) on contact where id = c.id]);
        
    }
    public TestMethod static void NEGATIVE_TEST(){
        //test.starttest()
        //hit daily limit error, catch error uncheck email_confirmation_sent;
        //test.stoptest()
    }
    public TestMethod static void NEGATIVE_TEST2(){
        contact newContact = new contact{Name='TestContact'};
        insert(newContact);
      
       
        //toss a single record into contact, null email field
    }
}