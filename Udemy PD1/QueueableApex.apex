/*
Trigger Handler
*/

global class AccountTriggerQueueable implements Queueable{
    
    global set<Id> newAccountIds;
    
    //Constructor
    global AccountTriggerQueueable(Set<Id> newAccountIds){
        
    }
    
    //Execute Queueable Job
    global void execute(QueueableContext context){
        Integer count = 1;
        List<Contact> newContacts = new List<Contact>();
        for(Id accountId : this.newAccountIds){
            newContacts.add(new Contact(FirstName = 'Test',
                                        LastName = 'Contact '+ count,
                                        AccountId = accountId));
            count++;
        }
        insert newContacts;
    }

}

/*
Trigger
*/

trigger AccountQueueableTrigger on Account (after insert) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            System.enqueueJob(new AccountTriggerQueueable(Trigger.newMap.keySet()));        
        }
    }

}