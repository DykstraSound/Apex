@isTest
public class AccountTriggerTest {
    @isTest
    static Void TestNewAccountContact() {
        //Arrange
        Account acct = new Account();
        acct.Name = 'Unit Test Account';
        //Act
        insert acct;
        //Assert
        List<Contact> contacts = [SELECT Id, FirstName, LastName
                                  FROM Contact
                                  WHERE FirstName = 'Hello'
                                  AND LastName = 'World'
                                  AND AccountId = :acct.Id
                                 ];
        System.assert(contacts.size() > 0, 'Related contact not found');
        
        
    }

}

//  With new Assert class
@isTest
public class AccountTriggerTest {
    @isTest
    static Void TestNewAccountContact() {
        //Arrange
        Account acct = new Account();
        acct.Name = 'Unit Test Account';
        //Act
        insert acct;
        //Assert
        List<Contact> contacts = [SELECT Id, FirstName, LastName
                                  FROM Contact
                                  WHERE FirstName = 'Hello'
                                  AND LastName = 'World'
                                  AND AccountId = :acct.Id
                                 ];
        Assert.isTrue(contacts.size() > 0, 'Related contact not found');
        
        
    }

}