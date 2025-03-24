public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postCode){
        List<Contact> contactList = new List<Contact>();
        for(Contact clist : [SELECT Id, Name 
                             FROM Contact 
                             WHERE LastName=:lastName 
                             AND MailingPostalCode=:postCode]){
            contactList.add(clist);
                       }
       return contactList;
    }

} 