@isTest
private class CQ_NN_Test_UpdateTargetDate_AL_Flow {

    static testMethod void givenARestaurantRecordWhenFlowIsExecutedThenTargetDateIsSetToTenDaysAhead() {
        User testUser = CQ_NN_TestDataUtility.createTestUser();
        CQ_NN_TestDataUtility.assignPermSetToUser(testUser);

        System.runAs(testUser) {
            // Given a test restaurant record without the expected updates from the Flow
            CQ_NN_SQX_Restaurant__c testRestaurant = new CQ_NN_SQX_Restaurant__c(
                Name = 'Test Restaurant'
            );
            insert testRestaurant;

            // Set up Flow and its variables
            Flow.Interview.CQUI_NN_Update_Target_Date_AL_Flow flow = new Flow.Interview.CQUI_NN_Update_Target_Date_AL_Flow(
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