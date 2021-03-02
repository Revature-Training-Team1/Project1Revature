public inherited sharing class PackageTracker_CC {
    public Id whatToLookup {get; set;}
    public List<MailWrapper> lookupResults {
        get {
            if(lookupResults==null){
                lookupResults = new List<MailWrapper>();
            }
            return lookupResults;
        } 
        private set;
    }
    public PageReference doLookup(){
        lookupResults = new List<MailWrapper>();
        List<Mail__c> queryResults = [SELECT Id, Sender__c, Addressee__c, Delivery_Status__c FROM Mail__c WHERE Id = :whatToLookup];
        for(Mail__c item: queryResults){
            lookupResults.add(new MailWrapper(item));
        }
        PageReference newPage;
        if(queryResults.size()>0){
            newPage = new PageReference('/apex/SimpleMail?Id='+whatToLookup);
            newPage.setRedirect(true);
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Mail not found.'));
        }
        return newPage;
    }
}