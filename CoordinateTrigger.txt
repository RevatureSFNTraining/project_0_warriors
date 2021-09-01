/////////////////////////////////////////////
// Name: CoordinateTrigger
// Author: Matthew Nicholson
// Created: 8/29/21
// Updated: 9/1/21
// Description: Trigger for Coordinate Custom Object
/////////////////////////////////////////////
trigger CoordinateTrigger on Coordinate__c (before insert, before update, before delete, after delete, after undelete, after update, after insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            
		}
        when BEFORE_UPDATE{
            CoordinateTriggerHandler.CheckPrice(Trigger.New);
            //CoordinateTriggerHandler.UpdateCredits(Trigger.New);
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