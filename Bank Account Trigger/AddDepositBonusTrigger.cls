trigger AddDepositBonusTrigger on Bank_Account__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    switch on trigger.operationType {
        when BEFORE_INSERT{
            for(Bank_Account__c acc : Trigger.new) {
        		if (acc.Balance__c < 0) { 
                    // Handle if when the user put the balance below $0 gracefully!
            		acc.addError('The initial balance cannot be lower than $0.');
        		} else {
                    // When the input is valid.
                    // Call the method from the handler to execute the logic.
            		BankAccountTriggerHandler.addNewAccountBonus(acc);
        		}
    		}  
        }
        when BEFORE_UPDATE{
            
        }
        When BEFORE_DELETE{
            
        }
        when AFTER_INSERT{
            
        }
        when AFTER_UPDATE{
            
        }
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
    }

}