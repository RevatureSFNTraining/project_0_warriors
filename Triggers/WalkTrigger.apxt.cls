trigger WalkTrigger on Walk__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on trigger.operationType{
        when AFTER_INSERT {
            WalkTriggerHandler.setPriority();
        }
        when else{
            //do nothing
        }
    }
}