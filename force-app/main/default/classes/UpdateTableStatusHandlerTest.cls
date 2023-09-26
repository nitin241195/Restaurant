@isTest
public class UpdateTableStatusHandlerTest {
    // Test method to cover the updateTableStatus method
    @isTest
    static void testUpdateTableStatusHandler() {
        // Create test data: Table__c records and Reservation__c records
        Table__c availableTable1 = new Table__c(Status__c = 'Available');
        Table__c availableTable2 = new Table__c(Status__c = 'Available');
        Table__c bookedTable = new Table__c(Status__c = 'Booked');
        
        insert new List<Table__c>{availableTable1, availableTable2, bookedTable};
        
        Reservation__c reservation1 = new Reservation__c(Table_No__c = availableTable1.Id);
        Reservation__c reservation2 = new Reservation__c(Table_No__c = availableTable2.Id);
        Reservation__c reservation3 = new Reservation__c(Table_No__c = bookedTable.Id);
        
        insert new List<Reservation__c>{reservation1, reservation2, reservation3};
        
        Test.startTest();
        // Trigger the updateTableStatus method with test data
        UpdateTableStatusHandler.updateTableStatus(new List<Reservation__c>{reservation1, reservation2, reservation3});
        Test.stopTest();
        
        // Verify that the status of available tables has been updated to 'Booked'
        List<Table__c> updatedTables = [SELECT Id, Status__c FROM Table__c WHERE Id IN :new List<Id>{availableTable1.Id, availableTable2.Id}];
        for (Table__c table : updatedTables) {
            System.assertEquals('Booked', table.Status__c, 'Table status should be updated to Booked');
        }
        
        // Verify that the status of the booked table remains unchanged
        Table__c unchangedTable = [SELECT Id, Status__c FROM Table__c WHERE Id = :bookedTable.Id];
        System.assertEquals('Booked', unchangedTable.Status__c, 'Table status should remain Booked');
    }
}