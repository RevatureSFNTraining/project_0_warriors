/////////////////////////////////////////////
// Name: LaunchBayTriggerHandler
// Author: Matthew Nicholson
// Created: 9/1/21
// Updated: 9/1/21
// Description: Handler Class for LaunchBayTrigger
/////////////////////////////////////////////
public class LaunchBayTriggerHandler {
// Method # 1: before deleting a launch bay, if that launch bay is the last one,
// 			   throw an error.   
    public static void NeedOneLaunchBay (List<Launch_Bay__c> launchBayList) {
        List<Launch_Bay__c> launchBays = [SELECT Name FROM Launch_Bay__c];
        Integer numLaunchBays = launchBays.size();
        for (Launch_Bay__c lb : launchBayList){
            if (numLaunchBays <= 1){
                lb.addError('Cannot delete Launch Bay, it is the last one!');
            }
        }
    }
}