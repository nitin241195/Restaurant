trigger MenuItemTrigger on Feedback__c (after insert) {
    MenuItemTriggerHandler.updateAverageRating(Trigger.new);
}