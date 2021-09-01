public class WalkTriggerHandler {
    public static void setPriority(){
        //soql/sosl search for parameters
        //filter out completed, find oldest walk and set priority.
        Walk__c updateWalk = [SELECT id FROM walk__c WHERE Complete__c = false ORDER BY CreatedDate ASC LIMIT 1];
        updateWalk.Priority__c = TRUE;

        try{
            update updateWalk;
        }
        catch(DMLException e){
            //error handling
        }
    }
}