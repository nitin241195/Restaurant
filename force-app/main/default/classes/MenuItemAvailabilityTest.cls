@isTest
private class MenuItemAvailabilityTest {
    static Profile pro = [Select Id from Profile where Name='Demo Standard Platform User for NitinCQ'];
    static User testUser;
    static {
        testUser = new User(
            ProfileId = pro.id, 
            Username = 'nitinnain@fmail.com',
            Email = 'nitinnain@fmail.com',
            FirstName='Test',
            LastName='Nain',
            Alias = 'tnain',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;
    }
    
    static testMethod void testValidationRule() {
        System.runAs(testUser){
        // Create a test Menu_Item__c record with Availability__c set to false
        Menu_Item__c testMenuItem = new Menu_Item__c(
            Name = 'Paneer Tikka Masala',
            Availability__c = false
        );
        insert testMenuItem;

        // Attempt to create a record that should trigger the validation rule
        Orders__c testRecord = new Orders__c(
            //Name = 'Test Record',
            Menu_Item__c = testMenuItem.Id
            // Add other required fields as needed
        );

        // Use a try-catch block to catch the validation exception
        try {
            insert testRecord;
            // If the record is created successfully, it means the validation rule didn't trigger
            System.assert(false, 'Validation rule did not trigger as expected');
        } catch (DmlException e) {
            // Verify that the expected validation error message is present in the exception
            System.assert(e.getMessage().contains('This menu item is currently unavailable. Please choose another item'));
        }
        }
    }
}