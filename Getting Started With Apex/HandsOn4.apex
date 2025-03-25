public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String criteria){
        List<List<sObject>> people = [FIND :criteria IN NAME FIELDS
                                      RETURNING Contact(Name), Lead(Name)];
        Contact[] searchContact = (Contact[])people[0];
        Lead[] searchLead = (Lead[])people[1];
        
        return people;
        }

}