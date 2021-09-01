/////////////////////////////////////////////
// Name: CoordinateTriggerHandler
// Author: Matthew Nicholson
// Created: 8/29/21
// Updated: 9/1/21
// Description: Handler Class for CoordinateTrigger
/////////////////////////////////////////////
public class CoordinateTriggerHandler {
// Method # 1 (NOT WORKING): Before updating a coordinate, must update Account credits based on Price of Coordinate
     /* public static void UpdateCredits(List<Coordinate__c> coordinatesList){
        List<Account> accountsToUpdate = new List<Account>();
        for(Coordinate__c coor : coordinatesList){
            //if(coor.old == null){
                 Account upAcc = new Account();
                 upAcc.Name = coor.Account__r.Name;
                 upAcc.Credits__c = coor.Account__r.Credits__c + coor.Price__c;
                 accountsToUpdate.add(upAcc);
               //}
               // else if (coor.Account__r.Credits__c < coor.Price__c){
                  // coor.addError('Cannot add Coordinate to this Account; not enough credits.');
               // }
              //  else{
                 //  coor.addError('Uh oh. We should not be here!');
            //}

          }
        update accountsToUpdate;
       }
}*/

// Method # 2: before updating the sector number, with non-null values of Price and Sector Number,
// 			   check to see what range the sector is in, and if the price set is too high for that range.
    public static void CheckPrice(List<Coordinate__c> coordinatesList){
        List<Coordinate__c> updatedCoordinates = new List<Coordinate__c>();
        for (Coordinate__c coor : coordinatesList){
            if (coor.Sector__c != null && coor.Price__c != null){
            	if (coor.Sector__c >= 0 && coor.Sector__c <= 10 && coor.Price__c > 100.00){
                	coor.addError('Price is too high for this sector! Choose a price lower than $100.00');
            	}
            	else if (coor.Sector__c > 10 && coor.Sector__c <= 20 && coor.Price__c > 200.00){
                	coor.addError('Price is too high for this sector! Choose a price lower than $200.00');
            	}
            	else if (coor.Sector__c > 20 && coor.Sector__c <= 30 && coor.Price__c > 300.00){
                	coor.addError('Price is too high for this sector! Choose a price lower than $300.00');
            	}
            	else if (coor.Sector__c > 30 && coor.Sector__c <= 40 && coor.Price__c > 400.00){
                	coor.addError('Price is too high for this sector! Choose a price lower than $400.00');
            	}
            	else if (coor.Sector__c < 0){
               		coor.addError('Not a valid sector. Valid sectors are from 0 - 40 inclusive.'); 
            	}
            	else if (coor.Sector__c > 40){
                	coor.addError('Not an accessible sector from this Starport. Valid sectors are from 0 - 40 inclusive.');
            	}
                else{
                    continue;
                }
                
            }
        } 
    }
}