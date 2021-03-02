public without sharing class Shipments_CC {
    private List<Id> contacts {
        get {
            if(contacts == null){
                if(customer==null){ return null;}
                List<Contact> fullContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId = :customer.Id];
                List<Id> contacts = new List<Id>();
                for(Contact c:fullContacts){
                    contacts.add(c.Id);
                }
            }
            return contacts;
        }
        private set;
    }
    public Account customer {get; set;}
    public List<MailWrapper> shippingOut{
        get {
            if(shippingOut == null){
                shippingOut = new List<MailWrapper>();
                try{
                	List<Mail__c> queryResults = 
                    	[SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, Addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Being Delivered'];
                    for(Mail__c mail:queryResults){
                        if(contacts.contains(mail.Sender__r.Contact__c)){
                            shippingOut.add(new MailWrapper(mail));
                        }   
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
                try{
                List<Mail__c> query = 
                    	[SELECT Id, Delivery_Status__c, Addressee__c, Addressee__r.Contact__c FROM Mail__c WHERE Delivery_Status__c = 'Being Delivered'];
                    for(Mail__c mail:query){
                        if(contacts.contains(mail.Addressee__r.Contact__c)){
                           shippingToYou.add(new MailWrapper(mail));
                        }
                    }
                } catch (System.Exception e){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, e.getStackTraceString()));
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
                try{
                    List<Mail__c> query=
                    [SELECT Id, Sender__c, Sender__r.Contact__c, Delivery_Status__c, Addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Delivered'];
                    for(Mail__c mail:query){
                        if(contacts.contains(mail.Sender__r.Contact__c)){
                            sentItems.add(new MailWrapper(mail));
                        }
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
                try{
                    List<Mail__c> query=
                    [SELECT Id, Delivery_Status__c, Addressee__r.Contact__c, Addressee__c FROM Mail__c WHERE Delivery_Status__c = 'Delivered'];
                    for(Mail__c mail:query){
                        if(contacts.contains(mail.Addressee__r.Contact__c)){
                            receivedItems.add(new MailWrapper(mail));
                        }
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
}