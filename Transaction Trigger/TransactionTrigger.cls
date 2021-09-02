trigger TransactionTrigger on Transaction__c (before insert, 
                                              before update, 
                                              before delete, 
                                              after insert, 
                                              after update, 
                                              after delete, 
                                              after undelete) {                                                 
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            
        }
        when BEFORE_UPDATE{
            
        }
        When BEFORE_DELETE{
            
        }
        when AFTER_INSERT{
            
            UpdateAccountBalance.updateBalance(Trigger.new);
       
/*
 			// Have SOQL in a loop, and have logic in the trigger.
            for(Transaction__c t : Trigger.new) {
                if (t.Amount__c < 1) {
                    if (t.Transaction_Type__c == 'Deposit') {
                        t.addError('The minimum amount for a transaction is $1.');
                    } else {
                        t.addError('The minimum amount for a transaction is $1.');
                    }
                } else {
                    UpdateAccountBalance.updateBalance(t);
                }
            }
*/
			
        }
        when AFTER_UPDATE{
            
        }
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
    }                                        
}