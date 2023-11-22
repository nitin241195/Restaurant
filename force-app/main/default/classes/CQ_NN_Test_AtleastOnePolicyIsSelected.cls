@isTest
private class CQ_NN_Test_AtleastOnePolicyIsSelected {

    // Helper method to create a test record
    private static compliancequest__SQX_Nonconformance__c createTestRecord(Boolean closureApproval, Boolean containmentRequired, Boolean dispositionRequired, Boolean investigationRequired) {
        return new compliancequest__SQX_Nonconformance__c(
            CQ_NN_Incident_Type__c = 'Nonconformance',
            CQ_NN_Closure_Approval_Required__c = closureApproval,
            compliancequest__Containment_Required__c = containmentRequired,
            compliancequest__Disposition_Required__c = dispositionRequired,
            compliancequest__Investigation_Required__c = investigationRequired
        );
    }

    @isTest static void testValidationRuleTrigger() {
        compliancequest__SQX_Nonconformance__c testRecord = createTestRecord(false, false, false, false);

        Boolean isExceptionThrown = false;
        try {
            insert testRecord;
        } catch (DmlException e) {
            isExceptionThrown = true;
        }
        System.assert(isExceptionThrown, 'Validation rule did not trigger as expected.');
    }

}