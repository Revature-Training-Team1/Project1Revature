public inherited sharing class MailWrapper {
    public Mail__c mail {get; private set;}
    public MailWrapper(Mail__c mail){
        this.mail = mail;
    }
}