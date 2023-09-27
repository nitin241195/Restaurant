trigger UpdateTableStatus on Reservation__c (after insert) {
    UpdateTableStatusHandler.updateTableStatus(Trigger.new);
}