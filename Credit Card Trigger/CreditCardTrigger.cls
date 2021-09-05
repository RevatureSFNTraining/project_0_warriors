trigger CreditCardTrigger on Credit_Card__c (before insert, 
                                             before update, 
                                             before delete, 
                                             after insert, 
                                             after update, 
                                             after delete, 
                                             after undelete) {
	switch on trigger.operationType {
        when BEFORE_INSERT{
            for(Credit_Card__c cc : Trigger.new) {
        		if (cc.Balance__c != 0) { 
                    // Handle if when the user put the balance that is not $0 gracefully!
            		cc.addError('The initial balance can only be $0.');
        		} else {
                    // When the input is valid.
                    // Call the method from the handler to execute the logic.
            		CreditCardHandler.addBonus(cc);
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