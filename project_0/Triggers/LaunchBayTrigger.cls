/////////////////////////////////////////////
// Name: LaunchBayTrigger
// Author: Matthew Nicholson
// Created: 9/1/21
// Updated: 9/1/21
// Description: Trigger for Launch Bay Custom Object
/////////////////////////////////////////////
trigger LaunchBayTrigger on Launch_Bay__c (before insert, before update, before delete, after delete, after undelete, after update, after insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
		}
        when BEFORE_UPDATE{
		}
        when BEFORE_DELETE{
            LaunchBayTriggerHandler.NeedOneLaunchBay(Trigger.Old);
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