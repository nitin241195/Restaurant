public class MenuItemTriggerHandler {
    public static void updateAverageRating(List<Feedback__c> newFeedbackList) {
        List<Menu_Item__c> menuItemsToUpdate = new List<Menu_Item__c>();
        Set<Id> uniqueMenuItemIds = new Set<Id>();

        for (Feedback__c rating : newFeedbackList) {
            if (!uniqueMenuItemIds.contains(rating.Menu_Item__c)) {
                uniqueMenuItemIds.add(rating.Menu_Item__c);

                Decimal totalRating = 0;
                Decimal averageRating = 0;

                List<Feedback__c> ratings = [SELECT Rating__c FROM Feedback__c WHERE Menu_Item__c = :rating.Menu_Item__c];

                for (Feedback__c r : ratings) {
                    Decimal decimalValue = Decimal.valueOf(r.Rating__c);
                    totalRating += decimalValue;
                }

                if (ratings.size() > 0) {
                    averageRating = totalRating / ratings.size();
                }

                Menu_Item__c menuItem = new Menu_Item__c(
                    Id = rating.Menu_Item__c,
                    Average_Rating__c = averageRating
                );

                menuItemsToUpdate.add(menuItem);
            }
        }

        if (!menuItemsToUpdate.isEmpty()) {
            update menuItemsToUpdate;
        }
    }
}