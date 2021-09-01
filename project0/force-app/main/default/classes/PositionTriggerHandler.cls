/*
 * Name: PositionTriggerHandler
 * Author: Joseph Gay
 * Date Created: 8/26/2021
 * Date Modified: 9/1/2021
 * Description: Prevents users from deleting open positions.
 */
public with sharing class PositionTriggerHandler {
    
    public static void beforeDeleteHandle(List<Position__c> PosList) {
        for (Position__c pos: PosList) {
            if (pos.Status__c == 'Open') {
                pos.addError('Error: not authorized to delete open positions. If position is closed, change status to closed then delete.');
            }
        }
    }
}
