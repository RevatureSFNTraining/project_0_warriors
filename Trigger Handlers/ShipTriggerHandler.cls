/////////////////////////////////////////////
// Name: ShipTriggerHandler
// Author: Matthew Nicholson
// Created: 8/27/21
// Updated: 9/1/21
// Description: Handler Class for ShipTrigger
/////////////////////////////////////////////
public class ShipTriggerHandler {
//Method # 1 (NOT WORKING/NOTIMPLEMENTED): Before Updating weapon types and/or equipment types,
//			  All Clearances MUST be cleared from the ship record.
//			  Step 1: Check if weapon types and/or equipment types 
//			  		  were updated.
//			  Step 2: Delete clearance record connected to the 
//			  		  specific ship record.
    /*public static void DeleteClearances(List<Ship__c> updatedShips){
        for (Ship__c updatedShip : updatedShips){
            if(updatedShip.Weapon_Types__c != Trigger.Old || updatedShip.Equipment_Type__c != Trigger.Old){
                
            }
        }*/ 
//Method # 2 (NOT WORKING/NOT IMPLEMENTED): Before Inserting a new ship with the launch bay, check to see if that
//			  launch bay is full (already has 5 ships), if it is, tell to select a valid launch bay.
    public static void AvailableLaunchBays(List<Ship__c> shipsList){
        List<Launch_Bay__c> updLaunches = new List<Launch_Bay__c>();
        for (Ship__c newShip : shipsList){
            if (newShip.Launch_Bay__r.Number_of_Ships_Loaded__c < 5 || newShip.Launch_Bay__r.Number_of_Ships_Loaded__c == null){
                Launch_Bay__c updLaunch = new Launch_Bay__c();
                updLaunch.Number_of_Ships_Loaded__c = newShip.Launch_Bay__r.Number_of_Ships_Loaded__c + 1;
            	updLaunches.add(updLaunch);
            }
        }
        update updLaunches;
    } 
}