import org.junit.Test;

import java.text.ParseException;
import java.util.Date;

public class test {
    @Test
    public void test() throws ParseException {
        String time = "2022-2-1 2:0:0";
        Date date = new Date();
//        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////        System.out.println(dateFormat.format(date));
//        Date parse = dateFormat.parse(time);
//        Calendar c = Calendar.getInstance();
//        c.setTime(parse);
//        System.out.println(c.get(Calendar.MONTH));
//        int i = c.get(Calendar.DATE);
        System.out.println(date.getTime());
    }
}
