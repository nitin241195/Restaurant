@isTest
private class TableStatusValidationTest {
    @isTest
    static void testValidationRule() {
        // Create a test Table__c record with Status__c set to "Available"
        Table__c testTable = new Table__c(
            Status__c = 'Available'
            // Add other required fields as needed
        );
        insert testTable;

        // Attempt to create a test Reservation__c record related to the test table
        Reservation__c testReservation = new Reservation__c(
            Table_No__c = testTable.Id
            // Add other required fields as needed
        );

        // Use a try-catch block to catch the validation exception
        try {
            insert testReservation;
            // If the record is created successfully, it means the validation rule didn't trigger
            System.assert(false, 'Validation rule did not trigger as expected');
        } catch (DmlException e) {
            // Verify that the expected validation error message is present in the exception
            System.assert(e.getMessage().contains('This table is already booked. Please choose another table.'));
        }
    }
}