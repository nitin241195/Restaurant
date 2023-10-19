@isTest
private class CQ_NN_Test_UpdateTargetDate_AL_Flow {
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

    static testMethod void givenARestaurantRecordWhenFlowIsExecutedThenTargetDateIsSetToTenDaysAhead() {
        System.runAs(testUser){
            // Given a test restaurant record without the expected updates from the Flow
            CQ_NN_SQX_Restaurant__c testRestaurant = new CQ_NN_SQX_Restaurant__c(
                Name = 'Test Restaurant'
            );
            insert testRestaurant;

            // Set up Flow and its variables
            Flow.Interview.CQUI_NN_Update_Target_Date flow = new Flow.Interview.CQUI_NN_Update_Target_Date(
                new Map<String, Object> {
                    'InRecord' => testRestaurant
                }
            );

            // When the flow is executed
            Test.startTest();
            flow.start();
            Test.stopTest();

            // Then validate the expected changes on OutRecord
            CQ_NN_SQX_Restaurant__c outRestaurant = (CQ_NN_SQX_Restaurant__c)flow.getVariableValue('OutRecord');
            System.assertEquals(Date.today().addDays(10), outRestaurant.CQ_NN_Target_Date__c, 'Target date on OutRecord should be 10 days ahead of the current date.');
        }
    }
}