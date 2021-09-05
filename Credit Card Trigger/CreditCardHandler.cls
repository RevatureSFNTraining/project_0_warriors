// This class is used to handle the logic for the trigger.
public class CreditCardHandler {
    public static void addBonus(Credit_Card__c cc) {
        // Apply $200 credit to new credit cards.
        cc.Balance__c -= 200;
    }
}