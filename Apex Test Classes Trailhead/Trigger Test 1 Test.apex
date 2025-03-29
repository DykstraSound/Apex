@isTest
public class TestRestrictContactByName {
    @isTest
    static void testRestrictContactValid(){
        //Create valid Contact
        Contact validCont = new Contact(FirstName = 'Johnny', LastName = 'Rockets');
        Contact invalidCont = new Contact(FirstName = 'Oopsie', LastName = 'INVALIDNAME');
        
        Test.startTest();
        	insert validCont;
			Database.SaveResult con1 = Database.insert(validCont, false);
        	System.assertEquals(true, !con1.isSuccess());
        
        	insert invalidCont;
        	Database.SaveResult con2 = Database.insert(validCont, false);
        	System.assertEquals(false, !con2.isSuccess());
    }

}