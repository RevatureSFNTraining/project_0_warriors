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
        }
        when AFTER_UPDATE{
            
        }
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
    }                                        
}