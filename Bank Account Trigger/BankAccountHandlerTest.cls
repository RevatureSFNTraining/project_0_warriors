// This class is to test the handler class of the trigger.
@isTest
private class BankAccountHandlerTest {
    
    // When the balance is < 0.
    // The trigger won't use the BankAccountHandler class.
    // No need to test it?
    
    // When the balance is 5000.
    @isTest static void test1() {
        List<Bank_Account__c> newBankAccount = BankAccountHandlerTestData.GenerateTestData(1, 5000);
        BankAccountHandler.addNewAccountBonus(newBankAccount[0]);
        System.assertEquals(5500, newBankAccount[0].Balance__c);
    }
    
     // When the balance is 10000.
    @isTest static void test2() {
        List<Bank_Account__c> newBankAccount = BankAccountHandlerTestData.GenerateTestData(1, 10000);
        BankAccountHandler.addNewAccountBonus(newBankAccount[0]);
        System.assertEquals(10500, newBankAccount[0].Balance__c);
    }
    
    // When the balance is 4999.
    @isTest static void test3() {
        List<Bank_Account__c> newBankAccount = BankAccountHandlerTestData.GenerateTestData(1, 4999);
        BankAccountHandler.addNewAccountBonus(newBankAccount[0]);
        System.assertEquals(4999, newBankAccount[0].Balance__c);
    }
    
     // When the balance is 0.
    @isTest static void test4() {
        List<Bank_Account__c> newBankAccount = BankAccountHandlerTestData.GenerateTestData(1, 0);
        BankAccountHandler.addNewAccountBonus(newBankAccount[0]);
        System.assertEquals(0, newBankAccount[0].Balance__c);
    }
    
}