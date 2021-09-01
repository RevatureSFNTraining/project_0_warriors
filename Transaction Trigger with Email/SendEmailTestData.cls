public class SendEmailTestData {

    public static List<Transaction__c> GenerateData(Integer numOfTransaction, String tType, Integer amount) {
        Contact C = new Contact(LastName = 'TestData', Relation_to_Company__c = 'Customer', Email = 'cannelson491@gmail.com');
        insert c;
        Bank_Account__c acc = new Bank_Account__c(Account_Owner__c = c.Id, Account_Type__c = 'Saving Account', 	Balance__c = 123);
        insert acc;
        List<Transaction__c> tList = new List<Transaction__c>();
        for(Integer i = 0; i < numOfTransaction; i++) {
            Transaction__c t = new Transaction__c(Amount__c = amount, Transaction_Type__c = tType, Bank_Account__c = acc.Id);
            tList.add(t);
            System.debug(t.Amount__c);
        }
        //insert tList;
        return tList;
    }
}