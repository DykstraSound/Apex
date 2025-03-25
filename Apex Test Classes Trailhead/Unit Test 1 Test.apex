@isTest
public class TestVerifyDate {
    @isTest
    static void testCheckDates(){
        Date date1 = Date.newInstance(2025, 3, 1);
        Date date2 = Date.newInstance(2025, 3, 15);
        Date pri = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, pri, 'date2 is within 30 days of date1');
    }
    
    @isTest
    static void testDateWithin30Days(){
        Date date1 = Date.newInstance(2025, 3, 1);
        Date date2 = Date.newInstance(2025, 4, 15);
        Boolean pri = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(true, pri, 'date2 is within 30 days of date1');
        System.assertEquals(false, pri, 'date2 is not within 30 days of date1');
    }
    
    @isTest
    static void testSetEndOfMonthDate(){
        Date testDate = today();

    }

}
