public class UpdateTableStatus2Handler {
    public static void afterUpdate(List<Reservation__c> updatedReservations) {
        Set<Id> tableIdsToUpdate = new Set<Id>();

        // Collect the table IDs from the updated reservations
        for (Reservation__c res : updatedReservations) {
            tableIdsToUpdate.add(res.Table_No__c);
        }

        // Query the tables that need to be updated
        List<Table__c> tablesToUpdate = [
            SELECT Id
            FROM Table__c
            WHERE Id IN :tableIdsToUpdate
            AND Status__c = 'Booked'
        ];

        if (!tablesToUpdate.isEmpty()) {
            // Update the status of the tables to 'Available'
            for (Table__c table : tablesToUpdate) {
                table.Status__c = 'Available';
            }

            // Perform the update operation
            update tablesToUpdate;
        }
    }
}