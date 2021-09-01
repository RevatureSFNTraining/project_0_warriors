@isTest
private class MaintenanceRequestTriggerTest {
    
    @isTest static void SingleRequestTest(){
        
        //Setting up data for test
        Property__c testProperty = new Property__c(Name='Test Property', Address__c='123 Example', City__c='Test', State__c='NC',
                                     			   Zip_Code__c='12345', Bedrooms__c=1, Bathrooms__c=1);
        insert testProperty;
        Maintenance_Request__c testRequest = new Maintenance_Request__c(Name='Test Request', Maintenance_Type__c = 'Plumbing', 
                                                                        Description__c = 'Test', Property__c= testProperty.Id);
        insert testRequest;
        List<Vendor__c> testVendors = new List<Vendor__c>();
        
        for (Integer i = 0; i<10; i++){
            testVendors.add(new Vendor__c(Name='Test Vendor ' + i, Email__c = i + 'test@test.com'));
        }
        
        insert testVendors;
        testRequest.Approved__c = true;
        Test.StartTest();
        Database.update(testRequest, false);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();

        // Check that emails were sent
        System.assert(invocations >= 1);
    }
	
    @isTest static void NegativeTest(){
        
        Property__c testProperty = new Property__c(Name='Test Property', Address__c='123 Example', City__c='Test', State__c='NC',
                                     			   Zip_Code__c='12345', Bedrooms__c=1, Bathrooms__c=1);
        insert testProperty;
        
        // Set up request that isn't approved
        Maintenance_Request__c testRequest = new Maintenance_Request__c(Name='Test Request', Maintenance_Type__c = 'Plumbing', 
                                                                        Description__c = 'Test', Property__c= testProperty.Id, Approved__c = false);
        List<Vendor__c> testVendors = new List<Vendor__c>();
        
        for (Integer i = 0; i<10; i++){
            testVendors.add(new Vendor__c(Name='Test Vendor ' + i, Email__c = i + 'test@test.com'));
        }
        
        insert testVendors;
        
        Test.StartTest();
        Database.insert(testRequest, false);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        
        // Make sure email wasn't sent
        System.assertequals(0, invocations);
    }
}