public inherited sharing class Shipments_CC {
    public List<MailWrapper> shippingOut{
        get {
            if(shippingOut == null){
                shippingOut = new List<MailWrapper>();
                //TODO
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
            return shippingToYou;
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
