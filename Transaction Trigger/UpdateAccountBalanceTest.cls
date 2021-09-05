@isTest
private class UpdateAccountBalanceTest {
    
    // The test bank account have $1000.

	@isTest static void Test1() {
        List<Transaction__c> tList = UpdateAccountBalanceTestData.GenerateData(1, 'Deposit', 1);
        Database.SaveResult[] results = UpdateAccountBalance.updateBalance(tList);
        Bank_Account__c acc = [SELECT id, Balance__c FROM Bank_Account__c WHERE Account_Owner__r.LastName = 'Test'];
        
        // The test insert x1, the trigger also insert x1, so the expect balance should be ------ 2 x (numOfTransaction x transactionAmount)
        System.assertEquals(1002, acc.Balance__c);
    }
    
    @isTest static void Test2() {
        List<Transaction__c> tList = UpdateAccountBalanceTestData.GenerateData(5, 'Deposit', 1);
        Database.SaveResult[] results = UpdateAccountBalance.updateBalance(tList);
        Bank_Account__c acc = [SELECT id, Balance__c FROM Bank_Account__c WHERE Account_Owner__r.LastName = 'Test'];
        
        // The test insert x1, the trigger also insert x1, so the expect balance should be ------ 2 x (numOfTransaction x transactionAmount)
        System.assertEquals(1010, acc.Balance__c);
    }
    
    @isTest static void Test3() {
        List<Transaction__c> tList = UpdateAccountBalanceTestData.GenerateData(1, 'Deposit', 10);
        Database.SaveResult[] results = UpdateAccountBalance.updateBalance(tList);
        Bank_Account__c acc = [SELECT id, Balance__c FROM Bank_Account__c WHERE Account_Owner__r.LastName = 'Test'];
        
        // The test insert x1, the trigger also insert x1, so the expect balance should be ------ 2 x (numOfTransaction x transactionAmount)
        System.assertEquals(1020, acc.Balance__c);
    }
    
    @isTest static void Test4() {
        List<Transaction__c> tList = UpdateAccountBalanceTestData.GenerateData(3, 'Deposit', 10);
        Database.SaveResult[] results = UpdateAccountBalance.updateBalance(tList);
        Bank_Account__c acc = [SELECT id, Balance__c FROM Bank_Account__c WHERE Account_Owner__r.LastName = 'Test'];
        
        // The test insert x1, the trigger also insert x1, so the expect balance should be ------ 2 x (numOfTransaction x transactionAmount)
        System.assertEquals(1060, acc.Balance__c);
    }
    
    @isTest static void Test5() {
        List<Transaction__c> tList = UpdateAccountBalanceTestData.GenerateData(1, 'Withdraw', 10);
        Database.SaveResult[] results = UpdateAccountBalance.updateBalance(tList);
        Bank_Account__c acc = [SELECT id, Balance__c FROM Bank_Account__c WHERE Account_Owner__r.LastName = 'Test'];
        
        // The test insert x1, the trigger also insert x1, so the expect balance should be ------ 2 x (numOfTransaction x transactionAmount)
        System.assertEquals(980, acc.Balance__c);
    }
    
    @isTest static void Test6() {
        List<Transaction__c> tList = UpdateAccountBalanceTestData.GenerateData(3, 'Withdraw', 10);
        Database.SaveResult[] results = UpdateAccountBalance.updateBalance(tList);
        Bank_Account__c acc = [SELECT id, Balance__c FROM Bank_Account__c WHERE Account_Owner__r.LastName = 'Test'];
        
        // The test insert x1, the trigger also insert x1, so the expect balance should be ------ 2 x (numOfTransaction x transactionAmount)
        System.assertEquals(940, acc.Balance__c);
    }

}