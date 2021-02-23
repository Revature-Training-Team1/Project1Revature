public class AccountHandler {
    public static Account insertNewAccount(String accountName)
    {
        Account addAccount = new Account();
        try
        {
            addAccount = new Account (Name=accountName);
            insert addAccount;
        }
        catch (DmlException e) {
            System.debug('There was a DML exception: '+ e.getMessage());
            return null;
        }        
        return addAccount;
    }
}