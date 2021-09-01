trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	switch on trigger.operationType{
        When AFTER_INSERT{
            //method call referencing trigger.new >pull out email and send email
            ContactTriggerHandler.sendEmailConfirmation(trigger.new);
            
        }
        When AFTER_UPDATE{
            //method call referencing trigger.new >pull out email and send email
            ContactTriggerHandler.sendEmailConfirmation(trigger.new);
        }
        When else{
            //do nothing
        }
	}
}