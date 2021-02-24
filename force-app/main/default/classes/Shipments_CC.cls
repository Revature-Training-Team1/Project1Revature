public inherited sharing class Shipments_CC {
    public List<MailWrapper> shippingOut{
        get {
            if(shippingOut == null){

            }
            return shippingOut;
        }
        private set;
    }
    public List<MailWrapper> shippingToYou{
        get {
            if(shippingToYou==null){

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
