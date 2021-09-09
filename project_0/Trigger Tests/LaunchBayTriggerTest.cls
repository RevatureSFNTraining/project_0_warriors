@isTest
public class LaunchBayTriggerTest {
    @isTest static void singleNegTest(){
        //insert new Launch Bay
        Launch_Bay__c testLaunchBay = new Launch_Bay__c(Name = 'testLB');
        insert testLaunchBay;
        // now try to delete launch bay, should fail with correctly implemented error message.
        delete testLaunchBay;
    }
}