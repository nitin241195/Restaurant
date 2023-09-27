@isTest
private class MenuItemTriggerTest {

    @isTest
    static void testMenuItemTrigger() {
        // Create a test Menu_Item__c record
        Menu_Item__c testMenuItem = new Menu_Item__c(
            Name = 'Test Menu Item'
            // Add other required fields as needed
        );
        insert testMenuItem;

        // Create test Feedback__c records associated with the test menu item
        Feedback__c feedback1 = new Feedback__c(
            Menu_Item__c = testMenuItem.Id,
            Rating__c = '4' // Provide a rating value
            // Add other required fields as needed
        );
        Feedback__c feedback2 = new Feedback__c(
            Menu_Item__c = testMenuItem.Id,
            Rating__c = '5' // Provide another rating value
            // Add other required fields as needed
        );

        // Insert the feedback records to trigger the MenuItemTrigger
        List<Feedback__c> feedbackList = new List<Feedback__c>{feedback1, feedback2};
        Test.startTest();
        insert feedbackList;
        Test.stopTest();

        // Query the Menu_Item__c record to check if Average_Rating__c has been updated
        Menu_Item__c updatedMenuItem = [SELECT Average_Rating__c FROM Menu_Item__c WHERE Id = :testMenuItem.Id];

        // Verify that the Average_Rating__c field has been updated correctly
        System.assertEquals(4.5, updatedMenuItem.Average_Rating__c, 'Average rating should be 4.5');
    }

    // Add other test methods as needed
}