trigger PropertyManagerTrigger on Property_Manager__c (before insert, before update, before delete,
                                   					   after insert, after update, after delete, after undelete) {
	switch on trigger.OperationType {
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
            PropertyManagerTriggerHandler.checkproperties(trigger.old);
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