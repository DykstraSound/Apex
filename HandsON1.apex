public class StringListTest {
    public static void generateStringList(integer numString) {
        List<String> test = new List<String>();
        integer n = 0;
        for(Integer i = 0; i < numString; i++){
            
            test.add('Test '+ n);            
            n++;
        }
        system.debug(test);
    }
}