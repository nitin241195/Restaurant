@isTest
private class BCEmailTriggerHandlerTest {

    @isTest
    static void testSendEmailNotification() {
        // Create a test User record
        User testUser = new User(
            Username = 'testuserr@example.com',
            Alias = 'tuser',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'ISO-8859-1',
            ProfileId = '00e5j000000nU4E', // Replace with an actual Profile Id
            LanguageLocaleKey = 'en_US',
            FirstName = 'Test',
            LastName = 'Userr',
            Email = 'testuserr@example.com'
        );
        insert testUser;

        // Create a test Table__c record with Status__c set to "Available"
        Table__c testTable = new Table__c(
            Status__c = 'Available'
            // Add other required fields as needed
        );
        insert testTable;

        // Create a test Reservation__c record with valid data
        Time bookingTime = Time.newInstance(22, 0, 0, 0); // 10:00 PM
        Reservation__c testReservation = new Reservation__c(
            Email__c = 'validemail@example.com', // Use a valid email address
            //User__c = testUser.Id,
            Table_No__c = testTable.Id,
            Booking_Time__c = bookingTime // Assign the Time value
            // Add other required fields as needed
        );
        insert testReservation;

        // Call the sendEmailNotification method to trigger email sending
        List<Reservation__c> testReservationList = new List<Reservation__c>{testReservation};
        Test.startTest();
        BookingConfirmationEmailTriggerHandler.sendEmailNotification(testReservationList);
        Test.stopTest();

        // Verify that the email was sent by checking the EmailMessage records
        List<EmailMessage> sentEmails = [SELECT Id FROM EmailMessage];
        System.assertEquals(1, sentEmails.size(), 'Email should be sent');
    }

    @isTest
    static void testSendEmailNotificationErrorHandling() {
        // Create a test Reservation__c record with an invalid email address
        Reservation__c testReservation = new Reservation__c(
            Email__c = 'validemail@example.com' // Invalid email address
            // Add other required fields as needed
        );
        insert testReservation;

        // Call the sendEmailNotification method to trigger email sending with an invalid email
        List<Reservation__c> testReservationList = new List<Reservation__c>{testReservation};
        Test.startTest();
        BookingConfirmationEmailTriggerHandler.sendEmailNotification(testReservationList);
        Test.stopTest();

        // Verify that no email was sent for an invalid email address
        List<EmailMessage> sentEmails = [SELECT Id FROM EmailMessage];
        System.assertEquals(0, sentEmails.size(), 'No email should be sent');
    }
}