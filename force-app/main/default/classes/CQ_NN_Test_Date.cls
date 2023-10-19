@isTest
private class CQ_NN_Test_Date {
    
    static testMethod void testDateCondition() {
        User testUser = CQ_NN_TestDataUtility.createTestUser();
        CQ_NN_TestDataUtility.assignPermSetToUser(testUser);

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