public class CQ_NN_RestaurantHandler {

    /**
     * This method handles actions that should be executed before updating a restaurant record.
     * It prevents updates on certain statuses and ensures necessary conditions on status transitions.
     *
     * @param newRestaurants List of new restaurant records being updated.
     * @param oldRestaurantMap Map of old restaurant records with their IDs.
     */
    public static void handleBeforeUpdate(List<CQ_NN_SQX_Restaurant__c> newRestaurants, Map<Id, CQ_NN_SQX_Restaurant__c> oldRestaurantMap) {
        preventStatusUpdate(newRestaurants, oldRestaurantMap);
        handleRestaurantStatusUpdate(newRestaurants, oldRestaurantMap);
    }

    /**
     * Prevent updating the status if the old status is 'Closed'.
     *
     * @param newRestaurants List of new restaurant records being updated.
     * @param oldRestaurantMap Map of old restaurant records with their IDs.
     */
    private static void preventStatusUpdate(List<CQ_NN_SQX_Restaurant__c> newRestaurants, Map<Id, CQ_NN_SQX_Restaurant__c> oldRestaurantMap) {
        for (CQ_NN_SQX_Restaurant__c rest : newRestaurants) {
            CQ_NN_SQX_Restaurant__c oldRest = oldRestaurantMap.get(rest.Id);

            if (oldRest.CQ_NN_Status__c == 'Closed') {
                rest.CQ_NN_Status__c.addError('Updating the status is not allowed.');
            }
        }
    }

    /**
     * Handles updates related to restaurant status changes.
     * If a restaurant's status is updated to 'Complete', ensure it has related menu items with attachments.
     *
     * @param newRecords List of new restaurant records being updated.
     * @param oldMap Map of old restaurant records with their IDs.
     */
    private static void handleRestaurantStatusUpdate(List<CQ_NN_SQX_Restaurant__c> newRecords, Map<Id, CQ_NN_SQX_Restaurant__c> oldMap) {
        Set<Id> restaurantIdsToUpdate = new Set<Id>();

        // Check which restaurants have their status changed from 'In Progress' to 'Complete'
        for(CQ_NN_SQX_Restaurant__c res : newRecords) {
            if(oldMap.get(res.Id).CQ_NN_Status__c == 'In Progress' && res.CQ_NN_Status__c == 'Complete') {
                restaurantIdsToUpdate.add(res.Id);
            }
        }

        // Map restaurants to their associated menu items (which have attachments)
        Map<Id, List<CQ_NN_SQX_Menu_Item__c>> restaurantToMenuItemsMap = new Map<Id, List<CQ_NN_SQX_Menu_Item__c>>();
        for(CQ_NN_SQX_Menu_Item__c menuItem : [SELECT Id, CQ_NN_SQX_Restaurant__c, CQ_NN_Item_Image__c FROM CQ_NN_SQX_Menu_Item__c WHERE CQ_NN_SQX_Restaurant__c IN :restaurantIdsToUpdate AND CQ_NN_Item_Image__c != NULL]) {
            if(!restaurantToMenuItemsMap.containsKey(menuItem.CQ_NN_SQX_Restaurant__c)) {
                restaurantToMenuItemsMap.put(menuItem.CQ_NN_SQX_Restaurant__c, new List<CQ_NN_SQX_Menu_Item__c>());
            }
            restaurantToMenuItemsMap.get(menuItem.CQ_NN_SQX_Restaurant__c).add(menuItem);
        }

        // For restaurants being set to 'Complete', ensure they have associated menu items with attachments
        for(CQ_NN_SQX_Restaurant__c res : newRecords) {
            if(res.CQ_NN_Status__c == 'Complete' && (!restaurantToMenuItemsMap.containsKey(res.Id) || restaurantToMenuItemsMap.get(res.Id).isEmpty())) {
                res.addError('Child record with attachments in it is a must before completion.');
            }
        }
    }
}