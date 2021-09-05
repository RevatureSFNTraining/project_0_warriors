// Test class for the Trigger.
@isTest
private class BankAccountTriggerTest {

    // Positive & Single 
    @isTest static void Test1() {
        // Test data setup
        List<Bank_Account__c> accList = new List<Bank_Account__c>(BankAccountHandlerTestData.GenerateTestData(1, 5000));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(accList, false);
        Test.stopTest();        
        // Verify
        System.assert(results[0].isSuccess()); // The insert operation is success.
    }

    // Negative & Single
    @isTest static void Test2() {
        // Test data setup
        List<Bank_Account__c> accList = new List<Bank_Account__c>(BankAccountHandlerTestData.GenerateTestData(1, -1));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(accList, false);
        Test.stopTest();        
        // Verify
        System.assert(!results[0].isSuccess()); // The insert operation is not success.
        System.assert(results[0].getErrors().size() > 0); // It generate least 1 error.
        System.assertEquals('The initial balance cannot be lower than $0.', results[0].getErrors()[0].getMessage()); // Check if the error message is what I expected.
    }
    
    // Positive & Bulk
    @isTest static void Test3() {
        // Test data setup
        List<Bank_Account__c> accList = new List<Bank_Account__c>(BankAccountHandlerTestData.GenerateTestData(200, 5000));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(accList, false);
        Test.stopTest();
        // Verify
        for (Integer i = 0; i < results.size(); i++) {
            System.assert(results[i].isSuccess()); // The insert operation is success.
        }
    } 
    
    // Negative & Bulk
    @isTest static void Test4() {
        // Test data setup
        List<Bank_Account__c> accList = new List<Bank_Account__c>(BankAccountHandlerTestData.GenerateTestData(200, -1));
        // Perform test
        Test.startTest();
        Database.SaveResult[] results = Database.insert(accList, false);
        Test.stopTest();
        // Verify
        for (Integer i = 0; i < results.size(); i++) {
            System.assert(!results[i].isSuccess()); // The insert operation is not success
            System.assert(results[i].getErrors().size() > 0); // It generate least 1 error.
            System.assertEquals('The initial balance cannot be lower than $0.', results[i].getErrors()[0].getMessage()); // Check if the error message is what I expected.
        }
    } 
      
}