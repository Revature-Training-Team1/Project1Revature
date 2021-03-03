public inherited sharing class AccountList_CC {
    public List<Account> results {
        get {
          if (results == null) {
            Id userId = UserInfo.getUserId();
            List<Account> queryResults = [
                SELECT Id, Name, AccountNumber, OwnerId
                FROM Account
                WHERE OwnerId = :userId
            ];
            results = queryResults;
            //List<AccountWrapper> results = new List<AccountWrapper>();
            //for(Account a:queryResults){
            //    results.add(new AccountWrapper(a));
            //}
          }
          return results;
        }
        private set;
      }
    //public class AccountWrapper {
    //    public Account Account {get;private set;}
    //    public AccountWrapper(Account account){
    //        this.Account = account;
    //    }
    //}
}