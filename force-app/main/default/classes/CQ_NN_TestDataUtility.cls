public class CQ_NN_TestDataUtility {

    public static Profile pro = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
    public static Id permSetId;

    static {
        PermissionSet existingPermSet = [SELECT Id FROM PermissionSet WHERE Name = 'CQ_NN_Common_Permission_set' LIMIT 1];
        permSetId = existingPermSet.Id;
    }

    public static User createTestUser() {
        User testUser = new User(
            ProfileId = pro.id, 
            Username = 'nitinnain' + DateTime.now().getTime() + '@fmail.com', // To ensure unique usernames
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
        return testUser;
    }

    public static void assignPermSetToUser(User u) {
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = u.Id,
            PermissionSetId = permSetId
        );
        insert psa;
    }
}