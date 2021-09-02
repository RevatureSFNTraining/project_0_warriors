public class UpdateAccountBalance {
    public static Database.SaveResult[] updateBalance(List<Transaction__c> tList) {
        
        // Get each bank account object from tList and update the balance.
        
        // Get all the bank accounts that have transactions. 
        List<Bank_Account__c> accList = [SELECT id, Balance__c FROM Bank_Account__c WHERE id IN (SELECT Bank_Account__c FROM Transaction__c)];
        

        for (Transaction__c t : tList) {
            for (Bank_Account__c acc : accList) { // Might need to avoid nested for loop.
                if (acc.Id == t.Bank_Account__c) { // Need to update the balance of this bank account.
                    if (t.Transaction_Type__c == 'Deposit') {
                        if (t.Amount__c < 1) {
                            t.addError('You cannot deposit less than $1.');
                        } else {
                            acc.Balance__c += t.Amount__c;
                            System.debug('New balance from deposit: ' + acc.Balance__c);
                        }                       
                    } else { // Withdraw
                        // Add error if the new balance is < 0.
                        if (acc.Balance__c < t.Amount__c || t.Amount__c < 0) {
                            t.addError('Invalid withdrw amount.');
                        } else {
                            acc.Balance__c -= t.Amount__c;
                            System.debug('New balance from withdarw: ' + acc.Balance__c);
                        }
                    }
                }
            }
        }
        Database.SaveResult[] results = Database.update(accList, false);
        return results;
    }
}

/*  
 // This would have a SOQL inside a loop, bad implementation.
 public static void updateBalance(Transaction__c t) {
        // Get the bank account id.
        List<Bank_Account__c> accList = [SELECT id, Balance__c FROM Bank_Account__c WHERE id IN (SELECT Bank_Account__c FROM Transaction__c WHERE id = :t.Id)];
        Bank_Account__c acc = accList[0];
        
        if (t.Transaction_Type__c == 'Deposit') {
            acc.Balance__c += t.Amount__c;
        } else {
            acc.Balance__c -= t.Amount__c;
        }
        update acc;
 } 
*/