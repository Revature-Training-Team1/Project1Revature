public without sharing class Shipments_CC {

    private Account customer {get; set;}
    public List<MailWrapper> shippingOut{
        get {
            if(shippingOut == null){
                shippingOut = new List<MailWrapper>();
                try{
                	List<Mail__c> queryResults = 
<<<<<<< HEAD
                    	[SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c FROM Mail__c 
                    	WHERE Sender__r.Contact__c IN :customer.Contacts AND Delivery_Status__c = 'Being Delivered'];
                    for(Mail__c m:queryResults){
                        System.debug(m);
=======
                    	[SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Being Delivered'];
                    for(Mail__c m:queryResults){
                        // if(customer.contact.contains(m.Addressee__c.contact__c))
>>>>>>> Brandon
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
<<<<<<< HEAD
                try {
                    List<Mail__c> query = [SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Delivered'];
                    for (Mail__c b:query)
    
                    {
                        shippingToYou.add(new MailWrapper(b));
                    }
                }
                catch (System.Exception e) {
                    //ApexPages.addMessage(new ApexPages.Message(ApexPages.Sererity.INFO, e.getStackTraceString()));
                }
=======
                //TODO
                try{
                List<Mail__c> query = 
                    	[SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Being Delivered'];
                    for(Mail__c b:query){
                        //  if(customer.Contacts.contains(b.Addressee__c))
                        shippingToYou.add(new MailWrapper(b));
                    }
                } catch (System.Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, e.getStackTraceString()));
            }
        }
            return shippingToYou;
>>>>>>> Brandon
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
                try{
                    List<Mail__c> query=
                    [SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Delivered'];
                    for(mail__c c:query){
                        // if(customer.contacts.contains(m.Addressee__c.contact__c))
                        sentItems.add(new MailWrapper(c));
                    }
                } catch (System.Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, e.getStackTraceString()));
            }
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
                try{
                    List<Mail__c> query=
                    [SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Delivered'];
                    for(mail__c d:query){
                        // if(customer.contacts.contains(m.Addressee__c.contact__c))
                        receivedItems.add(new MailWrapper(d));
                    }
                }
                catch (System.Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, e.getStackTraceString()));
                }
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