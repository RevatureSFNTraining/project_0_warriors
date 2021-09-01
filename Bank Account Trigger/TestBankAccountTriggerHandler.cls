// This class is to test the handler class of the trigger.
@isTest
private class TestBankAccountTriggerHandler {
    
    // When the balance is < 0.
    // The trigger won't use the BankAccountTriggerHandler class.
    // No need to test it?
    
    // When the balance is 5000.
    @isTest static void testAddNewAccountBonus1() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
		Bank_Account__c newBankAccount = new Bank_Account__c(Account_Owner__c = newContact.Id, 
                                                             Account_Type__c = 'Saving Account', 
                                                             Balance__c = 5000); 
        BankAccountTriggerHandler.addNewAccountBonus(newBankAccount);
        System.assertEquals(5500, newBankAccount.Balance__c);
    }
    
     // When the balance is 10000.
    @isTest static void testAddNewAccountBonus2() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
		Bank_Account__c newBankAccount = new Bank_Account__c(Account_Owner__c = newContact.Id, 
                                                             Account_Type__c = 'Saving Account', 
                                                             Balance__c = 10000); 
        BankAccountTriggerHandler.addNewAccountBonus(newBankAccount);
        System.assertEquals(10500, newBankAccount.Balance__c);
    }
    
    // When the balance is 4999.
    @isTest static void testAddNewAccountBonus3() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
		Bank_Account__c newBankAccount = new Bank_Account__c(Account_Owner__c = newContact.Id, 
                                                             Account_Type__c = 'Saving Account', 
                                                             Balance__c = 4999); 
        BankAccountTriggerHandler.addNewAccountBonus(newBankAccount);
        System.assertEquals(4999, newBankAccount.Balance__c);
    }
    
     // When the balance is 0.
    @isTest static void testAddNewAccountBonus4() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
		Bank_Account__c newBankAccount = new Bank_Account__c(Account_Owner__c = newContact.Id, 
                                                             Account_Type__c = 'Saving Account', 
                                                             Balance__c = 0); 
        BankAccountTriggerHandler.addNewAccountBonus(newBankAccount);
        System.assertEquals(0, newBankAccount.Balance__c);
    }
    
}