// Test class for the trigger.
@isTest
private class TestCreditCardTrigger {

    // Positive & Single
    @isTest static void Test1() {
        // Test data setup
        List<Credit_Card__c> ccList = new List<Credit_Card__c>(CreditCardTriggerTestData.GenerateTestData(1, 0));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(ccList, false);
        Test.stopTest();
        // Verify
        System.assert(results[0].isSuccess()); // The insert operation is success.
    }
    
    // Negative & Single
    @isTest static void Test2() {
        // Test data setup
        List<Credit_Card__c> ccList = new List<Credit_Card__c>(CreditCardTriggerTestData.GenerateTestData(1, -10));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(ccList, false);
        Test.stopTest();
        // Verify
        System.assert(!results[0].isSuccess()); // The insert operation is not success.
        System.assert(results[0].getErrors().size() > 0); // It generate least 1 error.
        // Check if the error message is what I expected.
        System.assertEquals('The initial balance can only be $0.', results[0].getErrors()[0].getMessage()); 
    }
    
    // Positive & Bulk
    @isTest static void Test3() {
        // Test data setup
        List<Credit_Card__c> ccList = new List<Credit_Card__c>(CreditCardTriggerTestData.GenerateTestData(200, 0));
		// Perform test
		Test.startTest();
        Database.SaveResult[] results = Database.insert(ccList, false);
        Test.stopTest();
		// Verify
        for (Integer i = 0; i < results.size(); i++) {
            System.assert(results[i].isSuccess()); // The insert operation is success.  
        }
    }
    
    // Negative & Bulk
    @isTest static void Test4() {
        // Test data setup
        List<Credit_Card__c> ccList = new List<Credit_Card__c>(CreditCardTriggerTestData.GenerateTestData(200, -10));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(ccList, false);
        Test.stopTest();
        // Verify
        for (Integer i = 0; i < results.size(); i++) {
            System.assert(!results[i].isSuccess()); // The insert operation is not success.
        	System.assert(results[i].getErrors().size() > 0); // It generate least 1 error.
        	// Check if the error message is what I expected.
        	System.assertEquals('The initial balance can only be $0.', results[i].getErrors()[0].getMessage()); 
        }   
    }
  
}