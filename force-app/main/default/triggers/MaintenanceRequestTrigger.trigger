trigger MaintenanceRequestTrigger on Maintenance_Request__c (before insert, before update, before delete,
                                   after insert, after update, after delete, after undelete) {
	switch on trigger.OperationType {
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
            
        }
        when AFTER_INSERT{
            MaintenanceRequestTriggerHandler.sendVendorMail(trigger.new);
        }
        when AFTER_UPDATE{
            MaintenanceRequestTriggerHandler.sendVendorMail(trigger.new);
        }
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
    }
}