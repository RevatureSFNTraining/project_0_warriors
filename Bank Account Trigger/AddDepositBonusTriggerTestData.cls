// This class generate test data for testing the trigger.
public class AddDepositBonusTriggerTestData {
    public static List<Bank_Account__c> GenerateTestData(Integer numOfAccount, Integer balance) {
        List<Contact> cList = new List<Contact>();
        for(Integer i = 0; i < numOfAccount; i++) {
            Contact con = new Contact(LastName = 'Test ' + i);
            cList.add(con);
        }
        insert cList;
        List<Bank_Account__c> accList = new List<Bank_Account__c>();
        for(Contact c : cList) {
            Bank_Account__c acc = new Bank_Account__c(Account_Owner__c = c.id, 
                                                      Account_Type__c = 'Saving Account', 
                                                      Balance__c = balance);
            accList.add(acc);
        }
        return accList;     
    }
}