trigger BookingEmailNotificationTrigger on Reservation__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        BookingConfirmationEmailTriggerHandler.sendEmailNotification(Trigger.new);
    }
}