@isTest
private class PastDateTimeValidationTest {
    @isTest
    static void testValidationRule() {
        // Create a test Reservation__c record with Booking_Time__c set to a past time
        Reservation__c testReservation = new Reservation__c(
            Booking_Time__c = Time.newInstance(System.now().hour(), System.now().minute() - 30, 0, 0)
            // Add other required fields as needed
        );

        // Use a try-catch block to catch the validation exception
        try {
            insert testReservation;
            // If the record is created successfully, it means the validation rule didn't trigger
            System.assert(false, 'Validation rule did not trigger as expected');
        } catch (DmlException e) {
            // Verify that the expected validation error message is present in the exception
            System.assert(e.getMessage().contains('Reservations cannot be made for past times on the current day. Please select a future time.'));
        }
    }
}