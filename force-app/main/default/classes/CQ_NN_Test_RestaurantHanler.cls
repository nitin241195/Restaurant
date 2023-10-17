@isTest
private class CQ_NN_Test_RestaurantHanler {
    static Profile pro = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    static User testUser;
    static Id permSetId;

    static {
        PermissionSet existingPermSet = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_NN_Common_Permission_set' LIMIT 1];
        permSetId = existingPermSet.Id;

        testUser = new User(
            ProfileId = pro.id, 
            Username = 'nitinnain@fmail.com',
            Email = 'nitinnain@fmail.com',
            FirstName = 'Test',
            LastName = 'Nain',
            Alias = 'tnain',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;

        // Assign the Permission Set to the test user
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = permSetId
        );
        insert psa;
    }

    static testMethod void testHandleBeforeUpdate() {
        System.runAs(testUser){
        // Prepare test data
        List<CQ_NN_SQX_Restaurant__c> restaurants = new List<CQ_NN_SQX_Restaurant__c>{
            new CQ_NN_SQX_Restaurant__c(Name='Test Restaurant 1', Status__c='In Progress'),
            new CQ_NN_SQX_Restaurant__c(Name='Test Restaurant 2', Status__c='Closed')
        };
        insert restaurants;

        CQ_NN_SQX_Menu_Item__c menuItem = new CQ_NN_SQX_Menu_Item__c(
            CQ_NN_SQX_Restaurant__c = restaurants[0].Id,
            CQ_NN_Item_Image__c = 'Test Image'
        );
        insert menuItem;

        // Test: prevent status update from Closed
        restaurants[1].Status__c = 'In Progress';
        //Test.startTest();
        Database.SaveResult sr1 = Database.update(restaurants[1], false);
        //Test.stopTest();
        System.assert(!sr1.isSuccess());
        System.assertEquals(1, sr1.getErrors().size());
        System.assertEquals('Updating the status is not allowed.', sr1.getErrors()[0].getMessage());

        // Test: handle restaurant status update with a valid menu item
        restaurants[0].Status__c = 'Complete';
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