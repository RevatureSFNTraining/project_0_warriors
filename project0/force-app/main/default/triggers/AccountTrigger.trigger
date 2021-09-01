trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            AccountTriggerHandler.preventDuplicateAccounts(Trigger.new);
        }
        when BEFORE_UPDATE {
            // ...
        }
        when BEFORE_DELETE {
            // ...
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