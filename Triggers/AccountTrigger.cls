/////////////////////////////////////////////
// Name: AccountTrigger
// Author: Matthew Nicholson
// Created: 8/29/21
// Updated: 9/1/21
// Description: Trigger for Account Standard Object
/////////////////////////////////////////////
trigger AccountTrigger on Account (before insert, before update, before delete, after delete, after undelete, after update, after insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
            AccountTriggerHandler.CheckNegativeCredits(Trigger.New);
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