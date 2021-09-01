/////////////////////////////////////////////
// Name: AccountTriggerHandler
// Author: Matthew Nicholson
// Created: 8/29/21
// Updated: 9/1/21
// Description: Handler Class for AccountTrigger
/////////////////////////////////////////////
public class AccountTriggerHandler {
// Method # 1 (NOT IMPLEMENTED): before deleting an account, if that record has a parent account,
// 			   transfer credit value from account to be deleted to parent account.
    //public static void TransferCredits(){
        
    //}

// Method # 2 (NOT WORKING): before updating an Account's credits from a new coordinate, if the
// 			   price on a new coordinate is greater than the Account's credits, fail,
// 			   otherwise, update Credits field
   /* public statid void UpdateCredits(List<Account> accountsList){
        List<Coordinate__c> coordinatesList = [SELECT Name, Credits__c FROM Account WHERE Credits__C != null];
        for (Coordinate__c coor : coordinatesList){
            for(Account acc : accountsList){
                if(acc.Name == coor.Account__r.Name){
                    if(acc.Credits__c >= coor.Price__c){
                    	acc.Credits__c -= coor.Price__c;
                    }
                    else if (acc.Credits__c < coor.Price__c){
                        coor.addError('Cannot add Coordinate to this Account; not enough credits.');
                    }
                    else{
                        coor.addError('Uh oh. We should not be here!');
                    }

                }
            }
        } 
        update accountsList;
        
    }*/
// Method # 3: Before inserting An account, make sure Credits aren't negative, otherwise throw error
    public static void CheckNegativeCredits(List<Account> accountsList){
        for (Account acc : accountsList){
            if (acc.Credits__c < 0){
                acc.addError('Invalid input for credits, add a positive value.');
			}
        }
    }
}