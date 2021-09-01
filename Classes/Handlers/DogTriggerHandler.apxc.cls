/*

After insert
Soslsearch transaction number + trigger.size set loyalty discount with conditional

*/
public class DogTriggerHandler{
   public static void createWalk(list<Dog__c> doggy){
        uberdog__c walker = [SELECT id from uberdog__c where name like '%queue%' limit 1];
        list<walk__c> walkList = new list<walk__c>();
        for(dog__c dog: doggy){
            system.debug('Walker ID:'+ walker.id + 'DOG ID: '+ dog.id);
            walk__c tempWalk = new walk__c(UberDog__c=walker.id, dog__C=dog.id);
            system.debug(tempwalk);
            walkList.add(tempWalk);
            
        }
       
            //NEED A GOVERNNER LIMIT CATCH AND REROUTE
            database.insert(walkList);
        
        
    }
}