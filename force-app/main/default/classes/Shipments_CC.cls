public without sharing class Shipments_CC {

    public Account customer {get; set;}
    public List<MailWrapper> shippingOut{
        get {
            if(shippingOut == null){
                shippingOut = new List<MailWrapper>();
                try{
                	List<Mail__c> queryResults = 
                    	[SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c FROM Mail__c 
                    	WHERE Sender__r.Contact__c IN :customer.Contacts AND Delivery_Status__c = 'Shipping'];
                    for(Mail__c m:queryResults){
                        shippingOut.add(new MailWrapper(m));
                    }
                    if(shippingOut.size()<=0){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'No packages found.'));
                    }
                } catch (System.Exception e){
                    ApexPages.addMessages(e);
                }
            }
            return shippingOut;
        }
        private set;
    }
    public List<MailWrapper> shippingToYou{
        get {
            if(shippingToYou==null){
                shippingToYou = new List<MailWrapper>();
                //TODO
            }
            return shippingToYou;
        }
        private set;
    }
    public List<MailWrapper> sentItems{
        get {
            if(sentItems==null){
                sentItems = new List<MailWrapper>();
                //TODO
            }
            return sentItems;
        }
        private set;
    }
    public List<MailWrapper> receivedItems{
        get {
            if(receivedItems==null){
                receivedItems = new List<MailWrapper>();
                //TODO
            }
            return receivedItems;
        }
        private set;
    }
}