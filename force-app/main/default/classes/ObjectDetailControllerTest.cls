@isTest
private class ObjectDetailControllerTest {

    @isTest
    static void testGetCustomObjectData() {
        // Create test data
        List<Menu_Item__c> testMenuItems = new List<Menu_Item__c>();
        for (Integer i = 0; i < 5; i++) {
            Menu_Item__c menuItem = new Menu_Item__c(
                Name = 'Item ' + i,
                Price__c = 10.00, // Set an appropriate price
                Category__c = 'Main Courses'
                // Add other required fields as needed
            );
            testMenuItems.add(menuItem);
        }
        insert testMenuItems;

        // Call the getCustomObjectData method
        List<Menu_Item__c> result = ObjectDetailController.getCustomObjectData();

        // Verify that the method returns the expected data
        System.assertEquals(5, result.size(), 'Expected 5 Menu_Item__c records');

        // You can add more specific assertions to check the returned data as needed
        // For example, verify the fields of each Menu_Item__c record in the result list
        for (Integer i = 0; i < 5; i++) {
            System.assertEquals('Item ' + i, result[i].Name, 'Incorrect Name');
            System.assertEquals(10.00, result[i].Price__c, 'Incorrect Price');
            System.assertEquals('Main Courses', result[i].Category__c, 'Incorrect Category');
        }
    }
}