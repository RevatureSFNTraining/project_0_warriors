@isTest
public class CoordinateTriggerTest {
    @isTest static void singleNegTest100(){
        //add new coordinate and related Account and Starport Navigator
        Account accTest = new Account(Name = 'AccTest', Credits__c = 20.21);
        insert accTest;
        Starport_Navigator__c navTest = new Starport_Navigator__c(Name = 'NavTest');
        insert navTest;
        Coordinate__c coorTest = new Coordinate__c(Name = 'CoorTest', Account__c = accTest.Id, Starport_Navigator__c = navTest.Id, Sector__c = 20, Price__c = 185.43);
        insert coorTest;
        coorTest.Sector__c = 4;
      	//when updating, price will be too high for this sector, should return error.
        update coorTest;
    }
        @isTest static void singleNegTest200(){
        //add new coordinate and related Account and Starport Navigator
        Account accTest = new Account(Name = 'AccTest', Credits__c = 20.21);
        insert accTest;
        Starport_Navigator__c navTest = new Starport_Navigator__c(Name = 'NavTest');
        insert navTest;
        Coordinate__c coorTest = new Coordinate__c(Name = 'CoorTest', Account__c = accTest.Id, Starport_Navigator__c = navTest.Id, Sector__c = 30, Price__c = 285.43);
        insert coorTest;
        coorTest.Sector__c = 14;
      	//when updating, price will be too high for this sector, should return error.
        update coorTest;
    }
        @isTest static void singleNegTest300(){
        //add new coordinate and related Account and Starport Navigator
        Account accTest = new Account(Name = 'AccTest', Credits__c = 20.21);
        insert accTest;
        Starport_Navigator__c navTest = new Starport_Navigator__c(Name = 'NavTest');
        insert navTest;
        Coordinate__c coorTest = new Coordinate__c(Name = 'CoorTest', Account__c = accTest.Id, Starport_Navigator__c = navTest.Id, Sector__c = 40, Price__c = 385.43);
        insert coorTest;
        coorTest.Sector__c = 24;
      	//when updating, price will be too high for this sector, should return error.
        update coorTest;
    }
        @isTest static void singleNegTest400(){
        //add new coordinate and related Account and Starport Navigator
        Account accTest = new Account(Name = 'AccTest', Credits__c = 20.21);
        insert accTest;
        Starport_Navigator__c navTest = new Starport_Navigator__c(Name = 'NavTest');
        insert navTest;
        Coordinate__c coorTest = new Coordinate__c(Name = 'CoorTest', Account__c = accTest.Id, Starport_Navigator__c = navTest.Id, Sector__c = 40, Price__c = 385.43);
        insert coorTest;
        coorTest.Price__c = 485.43;
      	//when updating, price will be too high for this sector, should return error.
        update coorTest;
    }
        @isTest static void singleNegTestInvalidSector(){
        //add new coordinate and related Account and Starport Navigator
        Account accTest = new Account(Name = 'AccTest', Credits__c = 20.21);
        insert accTest;
        Starport_Navigator__c navTest = new Starport_Navigator__c(Name = 'NavTest');
        insert navTest;
        Coordinate__c coorTest = new Coordinate__c(Name = 'CoorTest', Account__c = accTest.Id, Starport_Navigator__c = navTest.Id, Sector__c = 20, Price__c = 185.43);
        insert coorTest;
        coorTest.Sector__c = -20;
      	//when updating, invalid sector.
        update coorTest;
    }
        @isTest static void singleNegTestOutOfRange(){
        //add new coordinate and related Account and Starport Navigator
        Account accTest = new Account(Name = 'AccTest', Credits__c = 20.21);
        insert accTest;
        Starport_Navigator__c navTest = new Starport_Navigator__c(Name = 'NavTest');
        insert navTest;
        Coordinate__c coorTest = new Coordinate__c(Name = 'CoorTest', Account__c = accTest.Id, Starport_Navigator__c = navTest.Id, Sector__c = 40, Price__c = 185.43);
        insert coorTest;
        coorTest.Sector__c = 41;
      	//when updating, out of range of sectors, too high of a number.
        update coorTest;
    }
}