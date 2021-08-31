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

---

After insert
Soslsearch transaction number + trigger.size set loyalty discount with conditional

*/

trigger ContractTrigger on Contact(before insert, before update, before delete, after insert, after update, after delete, after undelete){
    switch on trigger.operationType{
        When AFTER_INSERT{
            //method call referencing trigger.new >pull out email and send email
            ContractTriggerHandler.sendEmailConfirmation();
            
        }
        When AFTER_UPDATE{
            //method call referencing trigger.new >pull out email and send email
            ContractTriggerHandler.sendEmailConfirmation();
        }
        When else{
            //do nothing
        }
    }




}