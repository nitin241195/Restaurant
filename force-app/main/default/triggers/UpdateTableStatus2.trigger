trigger UpdateTableStatus2 on Reservation__c (after update) {
    UpdateTableStatus2Handler.afterUpdate(Trigger.new);
}