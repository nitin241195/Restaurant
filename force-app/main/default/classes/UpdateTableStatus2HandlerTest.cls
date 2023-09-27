@isTest
private class UpdateTableStatus2HandlerTest {
    // Declare the testTable variable at the class level
    static Table__c testTable;

    @testSetup
    static void setupTestData() {
        // Create a test Table__c record with Status__c set to 'Booked'
        testTable = new Table__c(
            Status__c = 'Booked'
            // Add other required fields as needed
        );
        insert testTable;

        // Create a test Reservation__c record associated with the testTable
        Reservation__c testReservation = new Reservation__c(
            Table_No__c = testTable.Id
            // Add other required fields as needed
        );
        insert testReservation;
    }

    @isTest
    static void testAfterUpdate() {
        // Explicitly call the trigger to invoke it
        Test.startTest();
        UpdateTableStatus2Handler.afterUpdate(Trigger.new);
        Test.stopTest();

        // Query the table to verify if its status has been updated
        Table__c updatedTable = [SELECT Status__c FROM Table__c WHERE Id = :testTable.Id];
        
        // Verify that the table status has been updated to 'Available'
        System.assertEquals('Available', updatedTable.Status__c, 'Table status should be Available');
    }
}
