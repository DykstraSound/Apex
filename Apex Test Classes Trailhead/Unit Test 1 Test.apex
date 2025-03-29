@isTest
public class TestVerifyDate {
    @isTest
    static void testCheckDates() {
        // Test Case 1: date2 is within 30 days of date1
        Date date1 = Date.newInstance(2025, 3, 1); // March 1, 2025
        Date date2 = Date.newInstance(2025, 3, 15); // March 15, 2025 (within 30 days of date1)
        Date result1 = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result1, 'Expected date2 to be returned when it is within 30 days of date1.');

        // Test Case 2: date2 is not within 30 days of date1
        Date date3 = Date.newInstance(2025, 3, 1); // March 1, 2025
        Date date4 = Date.newInstance(2025, 5, 1); // May 1, 2025 (more than 30 days from date3)
        Date result2 = VerifyDate.CheckDates(date3, date4);
        Date expectedEndOfMonth = Date.newInstance(2025, 3, 31); // End of March 2025
        System.assertEquals(expectedEndOfMonth, result2, 'Expected the end of the month for date1 to be returned when date2 is not within 30 days.');
    }
}