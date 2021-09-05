// This class generate test data for testing the trigger.
public class CreditCardTestData {
    
    public static List<Credit_Card__c> GenerateTestData(Integer numOfCC, Integer balance) {
        Contact c = new Contact(LastName = 'Test', Phone = '1234567890', Social_Security_Number__c = '123009999');
        insert c;
        List<Credit_Card__c> ccList = new List<Credit_Card__c>();
        if (numOfCC <= 0) {
            System.debug('Please create at least 1 card');
            return ccList;
        } else {
            for (Integer i = 0; i < numOfCC; i++) {
                Credit_Card__c cc = new Credit_Card__c(Card_Owner__c = c.id, Balance__c = 0); // The initial balance has to be $0.
                cc.Balance__c = balance;
                ccList.add(cc);
            }
        }
        return ccList;
    }

}