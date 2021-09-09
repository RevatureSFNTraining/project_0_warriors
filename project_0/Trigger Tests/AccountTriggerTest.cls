@isTest
public class AccountTriggerTest {
    @isTest static void singleNegTest(){
        //testing with invalid credits value
        Account accTest = new Account(Name = 'AccTest', Credits__c = -20);
        //insert should fail with correctly implemented error message.
        insert accTest;
    }
}