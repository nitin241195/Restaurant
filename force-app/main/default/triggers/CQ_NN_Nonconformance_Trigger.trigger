trigger CQ_NN_Nonconformance_Trigger on compliancequest__SQX_Nonconformance__c (before insert, before update) {
    CQ_NN_NonconformanceTriggerHandler.processRecords(Trigger.new, Trigger.isUpdate ? Trigger.oldMap : null);
}