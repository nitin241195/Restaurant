@isTest
private class QuantityValidationTest {
    @isTest
    static void testQuantityValidationRule() {
        // Create a test record for the object with Quantity__c <= 0
        Orders__c testRecord = new Orders__c(
            //Name = 'Test Record',
            Quantity__c = 0 // Adjust the value as needed, e.g., set it to -1 for <= 0
            // Add other required fields as needed
        );

        // Use a try-catch block to catch the validation exception
        try {
            insert testRecord;
            // If the record is created successfully, it means the validation rule didn't trigger
            System.assert(false, 'Validation rule did not trigger as expected');
        } catch (DmlException e) {
            // Verify that the expected validation error message is present in the exception
            System.assert(e.getMessage().contains('Quantity must be greater than zero.'));
        }
    }
}