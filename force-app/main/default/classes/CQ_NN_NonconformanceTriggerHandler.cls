public class CQ_NN_NonconformanceTriggerHandler {

    // Method to handle the merged trigger logic
    public static void processRecords(List<compliancequest__SQX_Nonconformance__c> records, Map<Id, compliancequest__SQX_Nonconformance__c> oldMap) {
        Date today = Date.today();

        for (compliancequest__SQX_Nonconformance__c record : records) {
            // Handle Due Date for Investigation
            handleInvestigationDueDate(record, oldMap, today);

            // Handle Due Date for Containment
            handleContainmentDueDate(record, oldMap, today);
        }
    }

    private static void handleInvestigationDueDate(compliancequest__SQX_Nonconformance__c record, Map<Id, compliancequest__SQX_Nonconformance__c> oldMap, Date today) {
        Date dueDateBase = (record.Id == null) ? today : record.CreatedDate.date();

        if (record.compliancequest__Priority__c != null) {
            switch on record.compliancequest__Priority__c {
                when '1 - Low' {
                    record.compliancequest__Due_Date_Investigation__c = dueDateBase.addDays(42);
                }
                when '2 - Medium' {
                    record.compliancequest__Due_Date_Investigation__c = dueDateBase.addDays(35);
                }
                when '3 - High' {
                    record.compliancequest__Due_Date_Investigation__c = dueDateBase.addDays(28);
                }
            }
        }
    }

    private static void handleContainmentDueDate(compliancequest__SQX_Nonconformance__c record, Map<Id, compliancequest__SQX_Nonconformance__c> oldMap, Date today) {
        if (record.Id == null && record.compliancequest__Status__c == 'Open') {
            record.compliancequest__Due_Date_Containment__c = today.addDays(7);
        } else if (record.Id != null && oldMap != null) {
            compliancequest__SQX_Nonconformance__c oldRecord = oldMap.get(record.Id);
            if (record.compliancequest__Status__c == 'Open' && oldRecord.compliancequest__Status__c != 'Open') {
                record.compliancequest__Due_Date_Containment__c = today.addDays(7);
            }
        }
    }
}