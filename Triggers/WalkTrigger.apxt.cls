/*

After insert
Sosl search, by time created
Searching database by when it was created and isn't complete
If not priority, then set priority. Else do nothing.

---

After insert
If trigger.New.Emailaddress != Null, then send email confirmation
Else do nothing

After update
If trigger.New.Emailaddress != Null, then send email confirmation
Else do nothing

---sdfd

After insert
Soslsearch transaction number + trigger.size set loyalty discount with conditional

*/

trigger WalkTrigger on Walk(before insert, before update, before delete, after insert, after update, after delete, after undelete){
    switch on trigger.operationType{
        When AFTER_INSERT{
            //no arguments needed, just doing search and updating fields unrelated to insert.
            WalkTriggerHandler.setPriority();
            
        }
        When else{
            //do nothing
        }
    }




}