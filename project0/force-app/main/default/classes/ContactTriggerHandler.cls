/*
 * Name: ContactTriggerHandler
 * Author: Joseph Gay
 * Date Created: 8/26/2021
 * Date Modified: 8/31/2021
 * Description: Basic contact trigger handler methods.
 */
public with sharing class ContactTriggerHandler {
    
    public static void beforeInsertHandle(List<Contact> conList) {
        for (Contact con: conList) {
            con.Description = 'Contact created successfully. Description updated with before-insert trigger.';
        }
    }
    
    public static void beforeUpdateHandle(List<Contact> conList, Map<Id, Contact> oldContactMap) {
        for (Contact con: conList) {
            con.Description = 'Contact updated successfully by ' + UserInfo.getUserName();
        }
    }
    
    public static void beforeDeleteHandle(List<Contact> ConList) {
        for (Contact con: conList) {
            if (con.AccountId == NULL) {
                con.addError('Error: not authorized to delete contacts without an associated account.');
            }
        }
    }
}
