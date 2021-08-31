/*
After insert
Sosl search, by time created
Searching database by when it was created and isn't complete
If not priority, then set priority. Else do nothing.
*/

public class WalkTriggerHandler {
    public static void setPriority(){
        //Logic
        //filter out completed, find oldest walk and set priority.
        //Template:: Select Id, Name from YourObject Order By AttachmentDateField__c Desc Limit 1
        //Select Id from walk__c Order By CreatedDate__c Time Limit 1;
        Walk__c updateWalk = [SELECT id FROM walk__c WHERE priority__c = false ORDER BY CreatedDate__c DESC LIMIT 1];
        updateWalk.priority__c = TRUE;

        try{
            update updateWalk;
        }
        catch(DMLException e){
            //error handling
        }
    }
}