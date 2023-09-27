public class UpdateTableStatusHandler {
    public static void updateTableStatus(List<Reservation__c> newReservations) {
        List<Id> tableIdsToUpdate = new List<Id>();

        for (Reservation__c res : newReservations) {
            tableIdsToUpdate.add(res.Table_No__c);
        }

        List<Table__c> tablesToUpdate = [SELECT Id FROM Table__c WHERE Id IN :tableIdsToUpdate AND Status__c = 'Available'];

        if (!tablesToUpdate.isEmpty()) {
            for (Table__c table : tablesToUpdate) {
                table.Status__c = 'Booked';
            }

            update tablesToUpdate;
        }
    }
}