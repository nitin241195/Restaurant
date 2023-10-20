@isTest
private class CQ_NN_Test_RestaurantHanler {
    
    @testSetup
    static void setupTestData() {
        // Create a test user and assign permission set
        User testUser = CQ_NN_TestDataUtility.createTestUser();
        CQ_NN_TestDataUtility.assignPermSetToUser(testUser);
    }
    
    static testMethod void testHandleBeforeUpdate() {
        User testUser = [SELECT Id, Username FROM User WHERE Username LIKE 'nitinnain%@fmail.com' LIMIT 1];

        System.runAs(testUser) {
        // Prepare test data
        List<CQ_NN_SQX_Restaurant__c> restaurants = new List<CQ_NN_SQX_Restaurant__c>{
            new CQ_NN_SQX_Restaurant__c(Name='Test Restaurant 1', CQ_NN_Status__c='In Progress'),
            new CQ_NN_SQX_Restaurant__c(Name='Test Restaurant 2', CQ_NN_Status__c='Closed')
        };
        insert restaurants;

        CQ_NN_SQX_Menu_Item__c menuItem = new CQ_NN_SQX_Menu_Item__c(
            CQ_NN_SQX_Restaurant__c = restaurants[0].Id,
            CQ_NN_Item_Image__c = 'Test Image'
        );
        insert menuItem;

        // Test: prevent status update from Closed
        restaurants[1].CQ_NN_Status__c = 'In Progress';
        //Test.startTest();
        Database.SaveResult sr1 = Database.update(restaurants[1], false);
        //Test.stopTest();
        System.assert(!sr1.isSuccess());
        System.assertEquals(1, sr1.getErrors().size());
        System.assertEquals('Updating the status is not allowed.', sr1.getErrors()[0].getMessage());

        // Test: handle restaurant status update with a valid menu item
        restaurants[0].CQ_NN_Status__c = 'Complete';
        //Test.startTest();
        Database.SaveResult sr2 = Database.update(restaurants[0], false);
        //Test.stopTest();
        System.assert(sr2.isSuccess());

        // Test: handle restaurant status update without a valid menu item
        delete menuItem;
        //Test.startTest();
        Database.SaveResult sr3 = Database.update(restaurants[0], false);
        //Test.stopTest();
        System.assert(!sr3.isSuccess());
        System.assertEquals(1, sr3.getErrors().size());
        System.assertEquals('Child record with attachments in it is a must before completion.', sr3.getErrors()[0].getMessage());
    }
}
}