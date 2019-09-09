package kr.co.kic.dev1.util;

public class Utility {
	public static String getConvert(String msg) {
		msg = msg.replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>");
		
		return msg;
	}
}
