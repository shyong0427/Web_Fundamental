package kr.co.kic.dev1.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Utility {
	public static String getConvert(String msg) {
		msg = msg.replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>");
		
		return msg;
	}
	
	public static String getKoreanDate(String date) { //Aug 05, 2019 -> 2019-08-05
		String koreanDate = null;
		SimpleDateFormat from = new SimpleDateFormat("MMM dd, yyyy", Locale.US);
		SimpleDateFormat to = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
		
		try {
			Date d = from.parse(date);
			koreanDate = to.format(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return koreanDate;
	}
}
