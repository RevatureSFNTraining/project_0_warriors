// This class generate test data for testing the trigger.
public class CreditCardTriggerTestData {
    
    public static List<Credit_Card__c> GenerateTestData(Integer numOfCC, Integer balance) {
        List<Contact> cList = new List<Contact>();
        List<Credit_Card__c> ccList = new List<Credit_Card__c>();
        if (numOfCC <= 0) {
            System.debug('Please create at least 1 card');
            return ccList;
        } else {
        	for(Integer i = 0; i < numOfcc; i++) {
            	Contact con = new Contact(LastName = 'Test ' + i);
            	cList.add(con);
        	}
        	insert cList;
        	for (Contact c : cList) {
            	Credit_Card__c cc = new Credit_Card__c(Card_Owner__c = c.id, Balance__c = balance);
            	ccList.add(cc);
        	}
        	return ccList;
        }       
    }
    
}