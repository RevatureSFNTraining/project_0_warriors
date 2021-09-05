// This class is used to handle the logic for the trigger.
public class BankAccountHandler {
    public static void addNewAccountBonus(Bank_Account__c acc) {
        // Apply $500 bonus to new bank account if a customer deposit $5000 or more.
        if (acc.Balance__c >= 5000) {
            acc.Balance__c += 500;
        }
    }
}