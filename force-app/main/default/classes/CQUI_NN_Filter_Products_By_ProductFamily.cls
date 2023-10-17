global class CQUI_NN_Filter_Products_By_ProductFamily implements cqext.CQUI_DynamicFilterInterface {

    /**
    * Filters products based on product family and an optional search term.
    *
    * @param currentRecord: Object that needs to be queried.
    * @param searchTerm: the term that needs to be matched.
    */
    global static List<SObject> getRecords(Map<String, Object> currentRecord, String searchTerm) {

        // Set search text if the search string is entered
        String searchText = (String.isNotBlank(searchTerm)) ? ('%' + searchTerm + '%') : null;

        List<compliancequest__SQX_Part__c> filteredParts = new List<compliancequest__SQX_Part__c>();

        // Check if currentRecord map has the necessary key and it's of correct type
        if (currentRecord != null && currentRecord.containsKey('CQ_NN_SQX_Part_Family__c') && currentRecord.get('CQ_NN_SQX_Part_Family__c') instanceof Id) {
            Id partfamilyId = (Id) currentRecord.get('CQ_NN_SQX_Part_Family__c');

            // Build the SOQL query dynamically based on whether search term is provided or not
            String query = 'SELECT Id, Name, compliancequest__Part_Number__c, compliancequest__Part_Type__c, compliancequest__Part_Family__c, compliancequest__Part_Risk_Level__c FROM compliancequest__SQX_Part__c WHERE compliancequest__Part_Family__c = :partfamilyId';
            if (searchText != null) {
                query += ' AND Name LIKE :searchText';
            }

            filteredParts = Database.query(query);
        }

        return filteredParts;
    }
}