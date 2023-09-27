@isTest
private class MaxOccupancyValidationTest {
    @isTest
    static void testValidationRule() {
        // Create a test Table__c record
        Table__c testTable = new Table__c(
            Max_Occupancy__c = 5 // Adjust the max occupancy value as needed
            // Add other required fields as needed
        );
        insert testTable;

        // Attempt to create a test Reservation__c record with Number_of_Guests__c > Max_Occupancy__c
        Reservation__c testReservation = new Reservation__c(
            Table_No__c = testTable.Id,
            Number_of_Guests__c = 6 // Adjust the guest count as needed (greater than max occupancy)
            // Add other required fields as needed
        );

        // Use a try-catch block to catch the validation exception
        try {
            insert testReservation;
            // If the record is created successfully, it means the validation rule didn't trigger
            System.assert(false, 'Validation rule did not trigger as expected');
        } catch (DmlException e) {
            // Verify that the expected validation error message is present in the exception
            System.assert(e.getMessage().contains('The number of guests exceeds the maximum occupancy for the selected table. Please select a larger table or reduce the number of guests.'));
        }
    }
}