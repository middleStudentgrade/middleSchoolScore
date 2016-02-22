package com.middleschool.grade.web.utils;

import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class DateFormatUtil {
	public static String dateToStringByFormat(Date date){
		Properties prop = new Properties();
		String dateFormat = null;
		InputStream is = Object.class.getResourceAsStream("/properties/resource.properties");
		try {
			prop.load(is);
			dateFormat = prop.getProperty("PRO_DATE_FORMAT");
		} catch (Exception e) {
			e.printStackTrace();
		}
		DateFormat d= new SimpleDateFormat(dateFormat);
		String format = d.format(date);
		return format;
	}
}
