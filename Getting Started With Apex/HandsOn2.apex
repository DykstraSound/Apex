// New public class : AccountHandler
public class AccountHandler{
    // New public static method: insertNewAccount
    public static Account insertNewAccount(String varName){
        try {
            // The method must accept an incoming string as a parameter, which will be used to create the Account Name
            // The method must also accept an empty string, catch the failed DML and then return null
            Account acct = new Account();
            acct.Name = varName;
            insert acct;
            // The method must also return the account that was created
            return acct;
            
        } catch (DMLException e) {
            // Return null if the DML fails
            return null;
            
        }

    }
}