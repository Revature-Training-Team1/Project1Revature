trigger FixContactRelationship on Account (after insert, after update) {
    List<Contact> updates = new List<Contact>();
    for(Contact c: [SELECT Id, AccountId, Phone, MailingStreet FROM Contact 
                    WHERE AccountID = null]){
        List<Account> matches = [SELECT Id,Phone,ShippingStreet FROM Account
                                WHERE Phone LIKE :c.Phone OR ShippingStreet LIKE :c.MailingStreet
                                LIMIT 1];
        if(matches.size()>0){
            c.AccountId = matches[0].Id;
            updates.add(c);
        }
    }
    update updates;
}