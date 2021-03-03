public inherited sharing class CustomerPage_CX {
    public CustomerPage_CX(ApexPages.StandardController orig) {

    }
        public Id acc{
            get {
                if(acc==null){
                    try{
                        Id user = UserInfo.getUserId();
                        User u = [SELECT Id, ContactId FROM User WHERE Id = :user];
                        if(u.ContactId != null){
                            acc = [SELECT AccountId, Id FROM Contact WHERE Id = :u.ContactId][0].AccountId;
                        }
                    } catch (System.QueryException e){
                        //no rows returned, its fine
                    }
                }
                return acc;
            }
            private set;
        }
}
