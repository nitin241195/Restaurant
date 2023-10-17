@isTest
private class CQ_NN_Test_Date {
    static Profile pro = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    static User testUser;
    static Id permSetId;

    static {
        PermissionSet existingPermSet = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_NN_Common_Permission_set' LIMIT 1];
        permSetId = existingPermSet.Id;

        testUser = new User(
            ProfileId = pro.id, 
            Username = 'nitinnain@fmail.com',
            Email = 'nitinnain@fmail.com',
            FirstName = 'Test',
            LastName = 'Nain',
            Alias = 'tnain',
            TimeZoneSidKey = 'GMT',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;

        // Assign the Permission Set to the test user
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = testUser.Id,
            PermissionSetId = permSetId
        );
        insert psa;
    }

    static testMethod void testDateCondition() {
        System.runAs(testUser){
        // Create a test record with CQ_NN_Initiated_Date__c >= CQ_NN_Target_Date__c
        CQ_NN_SQX_Restaurant__c testRestaurant = new CQ_NN_SQX_Restaurant__c(
            Name = 'Test Restaurant',
            CQ_NN_Initiated_Date__c = Date.today(),
            CQ_NN_Target_Date__c = Date.today().addDays(-1) // Making target date 1 day before the initiated date
        );

        Exception expectedException;
        try {
            insert testRestaurant;
        } catch (System.DmlException e) {
            expectedException = e;
        }

        // Assertions
        System.assertNotEquals(null, expectedException, 'A DML Exception should have been thrown due to the validation rule.');
        System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION', expectedException.getDmlType(0).name(), 'Expected a custom validation exception.');
        System.assert(expectedException.getMessage().contains('Initiated date should be less than target date'), 'Initiated date should be less than target date');
        }
    }
}