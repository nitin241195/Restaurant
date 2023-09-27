@isTest
public class TestRecordTriggeredFlow {

    @isTest
    static void testEmailSendingOnStatusDelivered() {
        // Create a test record with Status__c = 'Delivered'
        Orders__c testRecord = new Orders__c(Status__c = 'Pending');
        insert testRecord;

        Test.startTest();

        // Trigger the record-triggered flow by updating the test record
        System.debug('Status before update: ' + testRecord.Status__c);
        testRecord.Status__c = 'Delivered'; // Change the status to trigger the flow
        update testRecord;
        System.debug('Status after update: ' + testRecord.Status__c);

        Test.stopTest();

        // Retrieve the emails sent during the test
        List<EmailMessage> sentEmails = [SELECT Id FROM EmailMessage WHERE ParentId = :testRecord.Id];

        // Assert that an email was sent
        System.assertEquals(1, sentEmails.size(), 'Expected one email to be sent.');
    }
}
