trigger CQ_NN_RestaurantTrg_Trigger on CQ_NN_SQX_Restaurant__c (before update) {
    CQ_NN_RestaurantHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
}