public class StringListTest {
    public static List<String> generateStringList(Integer numString) {
        List<String> test = new List<String>();
        for(Integer i = 0; i < numString; i++){
            test.add('Test ' + i);            
        }
        return test;
    }
}