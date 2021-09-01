trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    Switch on Trigger.OperationType {
        when BEFORE_INSERT {
            ContactTriggerHandler.beforeInsertHandle(Trigger.new);
        }
        when BEFORE_UPDATE {
            ContactTriggerHandler.beforeUpdateHandle(Trigger.new, Trigger.oldMap);
        }
        when BEFORE_DELETE {
            ContactTriggerHandler.beforeDeleteHandle(Trigger.old);
        }
        when AFTER_INSERT {
            // ...
        }
        when AFTER_UPDATE {
            // ...
        }
        when AFTER_DELETE {
            // ...
        }
        when AFTER_UNDELETE {
            // ...
        } when else {
            // ...
        }
    }
}