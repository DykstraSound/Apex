/*
*Name: Udemy PD1 Challenge 2
*Description: Business solution to keep track of types of courses that an individual has signed up for.
*Author: Travis Dykstra
*/

/**************************************************  TRIGGER  **************************************************/
trigger SubscriptionTrigger on Subscription__c (after insert, after update, after delete){

    if (Trigger.isAfter){
        if (Trigger.isInsert){
            SubscriptionCounter counter = new SubscriptionCounter(Trigger.new);
            counter.calculate();
        }
        if (Trigger.isUpdate){
            SubscriptionCounter counter = new SubscriptionCounter(Trigger.new);
            counter.calculate();
        }
        if (Trigger.isDelete){
            SubscriptionCounter counter = new SubscriptionCounter(Trigger.old);
            counter.calculate();
        }
    }

}


/**************************************************  OBJECTS  **************************************************/
// Subscription Counter

global class SubscriptionCounter {

    // Contact Ids mapped to Subscription records
    private Map<Id, List<Subscription__c>> contactsToSubscriptions;
    // List of Contacts that subscriptions are being rolled up to
    private List<Contact> contactsToUpdate;
    // All Contact Ids on newSubs
    private Set<Id> allContactIds;

    // Constructor accepting list of Subscription records
    global SubscriptionCounter(Subscription__c[] newSubs){
        // Initialize ContactMap
        this.contactsToUpdate = new List<Contact>();
        // Get Contact Ids on newSubs
        this.allContactIds = getContactIdSet(newSubs);
        // Get all subs on all Contacts related to newSubs
        Subscription__c[] allSubs = [SELECT Id, Contact__c, Course_Type__c 
                                     FROM Subscriptions__c 
                                     WHERE Contact__c IN :getContactIdSet(newSubs)];
        // Map all subs to their contacts  
        this.contactsToSubscriptions = createSubscriptionList(allSubs);
    }

    // Calculates Contact Subscription totals and updates records to reflect calculations
    global void calculate(){
        // Loop Contact Ids
        for(Id contactId : this.allContactIds){
            Contact thisContact = new Contact(Id = contactId);
            thisContact.Business_Subscriptions__c = 0;
            thisContact.Cooking_Subscriptions__c = 0;
            thisContact.Crafts_Subscriptions__c = 0;
            thisContact.Development_Subscriptions__c = 0;
            thisContact.Music_Subscriptions__c = 0;
            thisContact.Teaching_Subscriptions__c = 0;
            // Roll-up subs
            if(this.contactToSubscriptions.containsKey(contactId)){
                for(Subscription__c sub : this.contactsToSubscriptions.get(contactId)){
                    switch on sub.Course_Type__c {
                        when 'Business' {
                            this.Contact.Business_Subscriptions__c += 1;
                        }
                        when 'Cooking' {
                            this.Contact.Cooking_Subscriptions__c += 1;
                        }
                        when 'Crafts' {
                            this.Contact.Crafts_Subscriptions__c += 1;
                        }
                        when 'Development' {
                            this.Contact.Development_Subscriptions__c += 1;
                        }
                        when 'Music' {
                            this.Contact.Music_Subscriptions__c += 1;
                        }
                        when 'Teaching' {
                            this.Contact.Teaching_Subscriptions__c += 1;
                        }
                        when else{}
                    }
                }
            }
            this.contactsToUpdate.add(thisContact);
        }
        update this.contactsToUpdate;
    }

    // Return all Contact__c lookup values on Subscription list
    private Set<Id> getContactIdSet(Subscription__c[] newSubs){
        Set<Id> contactIds = new Set<Id>();
        for(Subscription__c sub : newSubs){
            contactIds.add(sub.Contact__c);
        }
        return contactIds;
    }

    // This method creates a map of Contact Ids to related subscriptions
    private Map<Id, List<Subscription__c>> createSubscriptionList(Subscription__c[] allSubs){
        // Initialize map to return
        Map<Id, List<Subscription__c>> subMap = new Map<Id, List<Subscription__c>>();
        // Loop through all subs queried
        for(Subscription__ sub : allSubs){
            // Initialize blank list variable
            List<Subscription__c> contactSubscriptions = new List<Subscription__c>();
            // Get existing list if Contact alread added to subMap
            if (subMap.containsKey(sub.Contact__c)){
                contactSubscriptions = subMap.get(sub.Contact__c);

            }
            // Add sub to list of subs on this Contact
            contactSubscriptions.add(sub);
            // Put list back in map
            subMap.put(sub.Contact__c, contactSubscriptions);
        }
        // Return map to caller
        return subMap;
    }

}