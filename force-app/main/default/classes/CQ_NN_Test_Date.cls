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
        System.runAs(testUser) {
            // Create a test record with valid dates
            CQ_NN_SQX_Restaurant__c testTeacher = new CQ_NN_SQX_Restaurant__c(
                Name = 'Test Teacher',
                CQ_NN_Initiated_Date__c = Date.today().addDays(-2), // Course start date 2 days before end date
                CQ_NN_Target_Date__c = Date.today()
            );

            // Insert the record
            insert testTeacher;

            // Validate that the record is inserted successfully
            List<CQ_NN_SQX_Restaurant__c> insertedTeachers = [SELECT Id FROM CQ_NN_SQX_Restaurant__c WHERE Id = :testTeacher.Id];
            System.assertEquals(1, insertedTeachers.size(), 'Record should have been inserted successfully');
        }
    }
}