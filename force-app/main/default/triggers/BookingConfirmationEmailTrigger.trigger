trigger BookingConfirmationEmailTrigger on Reservation__c (before insert) {

    if(Trigger.isInsert && Trigger.isAfter){
        BookingConfirmationEmailTriggerHandler.sendEmailNotification(Trigger.new);
    }
}