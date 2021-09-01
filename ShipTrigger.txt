/////////////////////////////////////////////
// Name: ShipTrigger
// Author: Matthew Nicholson
// Created: 8/27/21
// Updated: 9/1/21
// Description: Trigger for Ship Custom Object
/////////////////////////////////////////////
trigger ShipTrigger on Ship__c (before insert, before update, before delete, after delete, after undelete, after update, after insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
         //ShipTriggerHandler.AvailableLaunchBays(Trigger.New);
		}
        when BEFORE_UPDATE{
		}
        when BEFORE_DELETE{
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