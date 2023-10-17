@isTest
public class CQUI_NN_Filter_Products_By_PF_Test {
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
    
    static testMethod void testFilterProductsByProductFamily() {
        System.runAs(testUser){
        
        // Create test data for Product Family
        // Assuming there's an object for Product Family - if not, you can adjust accordingly
        compliancequest__SQX_Part_Family__c testFamily = new compliancequest__SQX_Part_Family__c(
            Name = 'Test Family'
        );
        insert testFamily;

        // Create test data for Parts
        compliancequest__SQX_Part__c part1 = new compliancequest__SQX_Part__c(
            Name = 'Part1',
            compliancequest__Part_Risk_Level__c = 4,
            compliancequest__Part_Number__c = '432',
            compliancequest__Part_Family__c = testFamily.Id
        );
        
        compliancequest__SQX_Part__c part2 = new compliancequest__SQX_Part__c(
            Name = 'SpecialPart2',
            compliancequest__Part_Risk_Level__c = 3,
            compliancequest__Part_Number__c = '43',
            compliancequest__Part_Family__c = testFamily.Id
        );

        insert new List<compliancequest__SQX_Part__c>{ part1, part2 };

        // Test with search term
        Map<String, Object> currentRecord = new Map<String, Object>{
            'CQ_NN_SQX_Part_Family__c' => testFamily.Id
        };
        
        List<SObject> results = CQUI_NN_Filter_Products_By_ProductFamily.getRecords(currentRecord, 'Special');
        System.assertEquals(1, results.size(), 'Expected only one matching part with the search term');
        
        compliancequest__SQX_Part__c resultPart = (compliancequest__SQX_Part__c)results[0];
        System.assertEquals(part2.Id, resultPart.Id, 'Expected the SpecialPart2 to be the result');

        // Test without search term
        results = CQUI_NN_Filter_Products_By_ProductFamily.getRecords(currentRecord, '');
        System.assertEquals(2, results.size(), 'Expected both parts when no search term provided');

        // Test with a null map
        results = CQUI_NN_Filter_Products_By_ProductFamily.getRecords(null, 'Part');
        System.assertEquals(0, results.size(), 'Expected no results when providing a null map');
        
        // Test with map not containing 'CQ_NN_SQX_Part_Family__c' key
        currentRecord.clear();
        results = CQUI_NN_Filter_Products_By_ProductFamily.getRecords(currentRecord, 'Part');
        System.assertEquals(0, results.size(), 'Expected no results when map doesn\'t contain the required key');

        }
    }
}