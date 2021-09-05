// This class is to test the handler class of the trigger.
@isTest
private class CreditCardHandlerTest {
    
    // When the balance is <0.
    @isTest static void Test1() {
        List<Credit_Card__c> ccList = CreditCardTestData.GenerateTestData(1, -100);
        CreditCardHandler.addBonus(ccList[0]);
        System.assertEquals(-300, ccList[0].Balance__c);
    }
    
    // When the balance is 0.
    @isTest static void Test2() {
        List<Credit_Card__c> ccList = CreditCardTestData.GenerateTestData(1, 0);
        CreditCardHandler.addBonus(ccList[0]);
        System.assertEquals(-200, ccList[0].Balance__c);
    }
    
    // When the balance is >0 and <200.
    @isTest static void Test3() {
        List<Credit_Card__c> ccList = CreditCardTestData.GenerateTestData(1, 100);
        CreditCardHandler.addBonus(ccList[0]);
        System.assertEquals(-100, ccList[0].Balance__c);
    }
    
    // When the balance is 200.
    @isTest static void Test4() {
        List<Credit_Card__c> ccList = CreditCardTestData.GenerateTestData(1, 200);
        CreditCardHandler.addBonus(ccList[0]);
        System.assertEquals(0, ccList[0].Balance__c);
    }
    
    // When the balance is >200.
    @isTest static void Test5() {
        List<Credit_Card__c> ccList = CreditCardTestData.GenerateTestData(1, 500);
        CreditCardHandler.addBonus(ccList[0]);
        System.assertEquals(300, ccList[0].Balance__c);
    }
    
}