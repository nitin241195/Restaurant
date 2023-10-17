public class CQ_NN_RestaurantHandler {

    public static void handleBeforeUpdate(List<CQ_NN_SQX_Restaurant__c> newRestaurants, Map<Id, CQ_NN_SQX_Restaurant__c> oldRestaurantMap) {
        preventStatusUpdate(newRestaurants, oldRestaurantMap);
        handleRestaurantStatusUpdate(newRestaurants, oldRestaurantMap);
    }
    
    private static void preventStatusUpdate(List<CQ_NN_SQX_Restaurant__c> newRestaurants, Map<Id, CQ_NN_SQX_Restaurant__c> oldRestaurantMap) {
        for (CQ_NN_SQX_Restaurant__c rest : newRestaurants) {
            CQ_NN_SQX_Restaurant__c oldRest = oldRestaurantMap.get(rest.Id);

            if (oldRest.Status__c == 'Closed') {
                rest.Status__c.addError('Updating the status is not allowed.');
            }
        }
    }

    private static void handleRestaurantStatusUpdate(List<CQ_NN_SQX_Restaurant__c> newRecords, Map<Id, CQ_NN_SQX_Restaurant__c> oldMap) {
        Set<Id> restaurantIdsToUpdate = new Set<Id>();
        
        for(CQ_NN_SQX_Restaurant__c res : newRecords) {
            if(oldMap.get(res.Id).Status__c == 'In Progress' && res.Status__c == 'Complete') {
                restaurantIdsToUpdate.add(res.Id);
            }
        }
        
        Map<Id, List<CQ_NN_SQX_Menu_Item__c>> restaurantToMenuItemsMap = new Map<Id, List<CQ_NN_SQX_Menu_Item__c>>();
        for(CQ_NN_SQX_Menu_Item__c menuItem : [SELECT Id, CQ_NN_SQX_Restaurant__c, CQ_NN_Item_Image__c FROM CQ_NN_SQX_Menu_Item__c WHERE CQ_NN_SQX_Restaurant__c IN :restaurantIdsToUpdate AND CQ_NN_Item_Image__c != NULL]){
            if(!restaurantToMenuItemsMap.containsKey(menuItem.CQ_NN_SQX_Restaurant__c)) {
                restaurantToMenuItemsMap.put(menuItem.CQ_NN_SQX_Restaurant__c, new List<CQ_NN_SQX_Menu_Item__c>());
            }
            restaurantToMenuItemsMap.get(menuItem.CQ_NN_SQX_Restaurant__c).add(menuItem);
        }
        
        for(CQ_NN_SQX_Restaurant__c res : newRecords) {
            if(res.Status__c == 'Complete' && (!restaurantToMenuItemsMap.containsKey(res.Id) || restaurantToMenuItemsMap.get(res.Id).isEmpty())){
                res.addError('Child record with attachments in it is a must before completion.');
            }
        }
    }
}