public class BookingConfirmationEmailTriggerHandler {
    public static void sendEmailNotification(List<Reservation__c> rsvList) {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        for (Reservation__c rsv : rsvList) {
            if (rsv.Email__c != null) {
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{rsv.Email__c};
                emailMsg.setToAddresses(toAddress);
                emailMsg.setSenderDisplayName('Happy Singh');
                //emailMsg.

                Id userId = rsv.User__c;
                
                // Query the User object to retrieve User Names based on User Ids
                User recipientUser = [SELECT Id, Name, Email FROM User WHERE Id = :userId LIMIT 1];

                String emailSub = 'Welcome ' + recipientUser.Name;
                emailMsg.setSubject(emailSub);
                
                String recordId = rsv.Table_No__c;
                Table__c retrievedRecord = [SELECT Name FROM Table__c WHERE Id = :recordId LIMIT 1];

                String content = 'Hi ' + recipientUser.Name + ',' + '<br/><br/>' +
                    'Your Table no ' + retrievedRecord.Name + ' for date ' + rsv.Booking_Date__c + ' has been booked';
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }

        if (!emailList.isEmpty()) {
            try {
                Messaging.sendEmail(emailList);
            } catch (Exception e) {
                System.debug('Email sending failed: ' + e.getMessage());
                // Handle email sending errors here, if needed
            }
        }
    }
}