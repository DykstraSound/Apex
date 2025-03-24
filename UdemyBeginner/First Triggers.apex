trigger AccountActive on Account (before insert) {
    for (Account acct : Trigger.new){
        acct.Active__c = 'Yes';
    }
}

trigger AddContactToAccount on Account (after insert) {    
    for (Account acct : Trigger.new){
        Contact c = new Contact();
        c.FirstName = 'Hello';
        c.LastName = 'World';
        c.AccountId = acct.Id;        
    }
   }

// Bulkify the trigger
trigger AddContactToAccount on Account (after insert) {
    List<Contact> contacts = new List<Contact>();
    for (Account acct : Trigger.new){
        Contact c = new Contact();
        c.FirstName = 'Hello';
        c.LastName = 'World';
        c.AccountId = acct.Id;
        contacts.add(c);
    }
    insert contacts;
}