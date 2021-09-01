// This class is to test the handler class of the trigger.
@isTest
private class TestCreditCardHandler {
    
    // When the balance is <0.
    @isTest static void Test1() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
        Credit_Card__c newCreditCard = new Credit_Card__c(Card_Owner__c = newContact.Id, 
                                                          Balance__c = -100);
        CreditCardHandler.addBonus(newCreditCard);
        System.assertEquals(-300, newCreditCard.Balance__c);
    }
    
    // When the balance is 0.
    @isTest static void Test2() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
        Credit_Card__c newCreditCard = new Credit_Card__c(Card_Owner__c = newContact.Id, 
                                                          Balance__c = 0);
        CreditCardHandler.addBonus(newCreditCard);
        System.assertEquals(-200, newCreditCard.Balance__c);
    }
    
    // When the balance is >0 and <200.
    @isTest static void Test3() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
        Credit_Card__c newCreditCard = new Credit_Card__c(Card_Owner__c = newContact.Id, 
                                                          Balance__c = 100);
        CreditCardHandler.addBonus(newCreditCard);
        System.assertEquals(-100, newCreditCard.Balance__c);
    }
    
    // When the balance is 200.
    @isTest static void Test4() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
        Credit_Card__c newCreditCard = new Credit_Card__c(Card_Owner__c = newContact.Id, 
                                                          Balance__c = 200);
        CreditCardHandler.addBonus(newCreditCard);
        System.assertEquals(0, newCreditCard.Balance__c);
    }
    
    // When the balance is >200.
    @isTest static void Test5() {
        Contact newContact = new Contact(LastName = 'TestData');
		insert newContact;
        Credit_Card__c newCreditCard = new Credit_Card__c(Card_Owner__c = newContact.Id, 
                                                          Balance__c = 500);
        CreditCardHandler.addBonus(newCreditCard);
        System.assertEquals(300, newCreditCard.Balance__c);
    }
   
}