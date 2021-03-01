public without sharing class Shipments_CC {

    private Account customer {get; set;}
    public List<MailWrapper> shippingOut{
        get {
            if(shippingOut == null){
                shippingOut = new List<MailWrapper>();
                try{
                	List<Mail__c> queryResults = 
                    	[SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c FROM Mail__c 
                    	WHERE Sender__r.Contact__c IN :customer.Contacts AND Delivery_Status__c = 'Being Delivered'];
                    for(Mail__c m:queryResults){
                        System.debug(m);
                        shippingOut.add(new MailWrapper(m));
                    }
                } catch (System.Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, e.getStackTraceString()));
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
                try {
                    List<Mail__c> query = [SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Shipped'];
                    for (Mail__c b:query)
    
                    {
                        shippingToYou.add(new MailWrapper(b));
                    }
                }
                catch (System.Exception e) {
                    //ApexPages.addMessage(new ApexPages.Message(ApexPages.Sererity.INFO, e.getStackTraceString()));
                }
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
    public class MailWrapper{
        public Mail__c mail{get; private set;}
        public MailWrapper(Mail__c m){
            mail = m;
        }
    }
}