package personal.frequency.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	public static final String DATE_FORMAT_SIMPLE = "yyyy-MM-dd";
	public static final String DATE_FORMAT_LONG = "MM/dd/yyyy h:mm a";
	
	public static String getDateNowFormatted(String template) {
		Calendar cal = Calendar.getInstance();
		Date now = cal.getTime();
		SimpleDateFormat format = new SimpleDateFormat(template);
		return format.format(now);
	}

	public static String getDateFormatted(Date date, String template) {
		Calendar cal = Calendar.getInstance();
		Date now = cal.getTime();
		SimpleDateFormat format = new SimpleDateFormat(template);
		if (date == null) {
			return format.format(now);
		}
		return format.format(date);
	}

}
