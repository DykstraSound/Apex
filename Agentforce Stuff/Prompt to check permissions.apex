public class AgentforcePermissionChecker {
    /**
     * Checks if a specific user or all users have permissions to access Agentforce.
     * 
     * @param userId (Optional) The ID of the user to check. If null, checks all users.
     * @return A map of user IDs to their access status (true = has access, false = no access).
     */
    public static Map<Id, Boolean> checkPermissions(Id userId) {
        Map<Id, Boolean> userPermissions = new Map<Id, Boolean>();

        // Query to check permissions for a specific user or all users
        List<User> users;
        if (userId != null) {
            users = [SELECT Id, Name, CustomPermission__c FROM User WHERE Id = :userId];
        } else {
            users = [SELECT Id, Name, CustomPermission__c FROM User];
        }

        // Evaluate permissions
        for (User user : users) {
            Boolean hasAccess = user.CustomPermission__c; // Replace with your actual permission field
            userPermissions.put(user.Id, hasAccess);
        }

        return userPermissions;
    }
}