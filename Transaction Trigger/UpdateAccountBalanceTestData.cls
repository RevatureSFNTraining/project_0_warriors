public class UpdateAccountBalanceTestData {
    public static List<Transaction__c> GenerateData(Integer numOfTransaction, String typeOfTransaction, Integer amount) {
        List<Transaction__c> tList = new List<Transaction__c>();
        
        // Create a test contact.
        Contact c = new Contact(LastName = 'Test');
        insert c;
        // Create a test bank account.
        Bank_Account__c acc = new Bank_Account__c(Account_Owner__c = c.id, 
                                                      Account_Type__c = 'Saving Account', 
                                                      Balance__c = 1000);
        insert acc;
        // Create transactions.
        for (Integer i = 0; i < numOfTransaction; i++) {
            //Transaction__c t = new Transaction__c(Bank_Account__c = acc.Id, Transaction_Type__c = typeOfTransaction, Amount__c = amount);
            //tList.add(t);
            tList.add(new Transaction__c(Bank_Account__c = acc.Id, Transaction_Type__c = typeOfTransaction, Amount__c = amount));
        }
        insert tList;
        return tList;
    } 
}