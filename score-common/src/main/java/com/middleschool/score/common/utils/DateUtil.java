package com.middleschool.score.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	private final  static String VERIFYFORMAT = "yyyy-MM";

	private final  static String DATEFORMAT = "yyyy-MM-dd";

	private final  static String TIMEFORMAT = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 格式化日期
	 *
	 * @return String
	 */
	public static String formatDate(Date date) {
		return format(date, DATEFORMAT);
	}

	/**
	 * 格式化日期
	 *
	 * @return Date
	 */
	public static Date formatDate(String strDate) {
		return format(strDate, DATEFORMAT);
	}

	/**
	 * 校验格式化日期
	 *
	 * @return Date
	 */
	public static boolean verifyDate(String strDate) {
		if (format(strDate, DATEFORMAT) == null) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 格式化时间
	 *
	 * @return String
	 */
	public static String formatTime(Date date) {
		return format(date, TIMEFORMAT);
	}

	/**
	 * 格式化时间
	 *
	 * @return Date
	 */
	public static Date formatTime(String strDate) {
		return format(strDate, TIMEFORMAT);
	}

	/**
	 * 获取当前系统日期
	 *
	 * @return String
	 */
	public static String formatDate() {
		return format(new Date(), DATEFORMAT);
	}


	public static String format(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	public static Date format(String strDate, String format) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.parse(strDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Date addDate(Date strDate, int number) {
		Date date;
		Calendar cal = Calendar.getInstance();
		cal.setTime(strDate);
		cal.add(Calendar.DATE, number);
		date = cal.getTime();
		return date;
	}

	/***
	 * 日期月份减一个月
	 *
	 * @param
	 * @return
	 */
	public static String subMonthYearAndMonth(String datetime,int subMonth) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = null;
		try {
			date = sdf.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cl = Calendar.getInstance();
		cl.setTime(date);
		cl.add(Calendar.MONTH, -subMonth);
		date = cl.getTime();
		return sdf.format(date);
	}

	public static String addMonthYearAndMonth(String datetime,int subMonth) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = null;
		try {
			date = sdf.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar cl = Calendar.getInstance();
		cl.setTime(date);
		cl.add(Calendar.MONTH, subMonth);
		date = cl.getTime();
		return sdf.format(date);
	}

	public static String dateFormat(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		return sdf.format(date);
	}

	/****
	 * 传入具体日期 ，返回具体日期减一个月。
	 *
	 * @param
	 * @return
	 * @throws ParseException
	 */
	public static String subMonth(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = sdf.parse(date);
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);

		rightNow.add(Calendar.MONTH, -1);
		Date dt1 = rightNow.getTime();
		String reStr = sdf.format(dt1);

		return reStr;
	}

	public static String addMonth(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = sdf.parse(date);
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);

		rightNow.add(Calendar.MONTH, 1);
		Date dt1 = rightNow.getTime();
		String reStr = sdf.format(dt1);

		return reStr;
	}

	/****
	 * 获取月末最后一天
	 *
	 * @param
	 * @return 30
	 */
	private static String getMonthMaxDay(String sDate) {
		SimpleDateFormat sdf_full = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date date = null;
		try {
			date = sdf_full.parse(sDate + "-01");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.setTime(date);
		int last = cal.getActualMaximum(Calendar.DATE);
		return String.valueOf(last);
	}

	// 判断是否是月末
	public static boolean isMonthEnd(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		if (cal.get(Calendar.DATE) == cal
				.getActualMaximum(Calendar.DAY_OF_MONTH))
			return true;
		else
			return false;
	}

	/***
	 * 日期减一天、加一天
	 *
	 * @param option 传入类型 pro：日期减一天，next：日期加一天
	 * @param
	 * @return 减一天：2014-11-23或(加一天：)
	 */
	public static String checkOption(String option, String _date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cl = Calendar.getInstance();
		Date date = null;

		try {
			date = (Date) sdf.parse(_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cl.setTime(date);
		if ("pre".equals(option)) {
			// 时间减一天
			cl.add(Calendar.DAY_OF_MONTH, -1);

		} else if ("next".equals(option)) {
			// 时间加一天
			cl.add(Calendar.DAY_OF_YEAR, 1);
		} else {
			// do nothing
		}
		date = cl.getTime();
		return sdf.format(date);
	}

	/***
	 * 判断日期是否为当前月， 是当前月返回当月最小日期和当月目前最大日期以及传入日期上月的最大日和最小日
	 * 不是当前月返回传入月份的最大日和最小日以及传入日期上月的最大日和最小日
	 *
	 * @param date 日期 例如：2016-11
	 * @return String[] 开始日期，结束日期，上月开始日期，上月结束日期
	 * @throws ParseException
	 */
	public static String[] getNow_Pre_Date(String date) throws ParseException {

		String[] str_date = new String[4];
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat sdf_full = new SimpleDateFormat("yyyy-MM-dd");
		String stMonth = sdf.format(now);
		String stdate = "";// 开始日期
		String endate = "";// 结束日期
		String preDate_start = "";// 上月开始日期
		String preDate_end = "";// 上月结束日期

		// 当前月
		if (date.equals(stMonth)) {
			stdate = stMonth + "-01";
			endate = sdf_full.format(now);
			preDate_start = subMonth(stdate);
			preDate_end = subMonth(endate);
		} else {
			// 非当前月
			String monthMaxDay = getMonthMaxDay(date);
			stdate = date + "-01";
			endate = date + "-" + monthMaxDay;
			preDate_start = subMonth(stdate);
			preDate_end = subMonth(endate);
		}
		str_date[0] = stdate;
		str_date[1] = endate;
		str_date[2] = preDate_start;
		str_date[3] = preDate_end;

		return str_date;
	}

	/**
	 * 计算两个日期之间相差的天数
	 * @param smdate 较小的时间
	 * @param bdate  较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	public static int daysBetween(Date smdate,Date bdate) throws ParseException
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		smdate=sdf.parse(sdf.format(smdate));
		bdate=sdf.parse(sdf.format(bdate));
		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days=(time2-time1)/(1000*3600*24);

		return Integer.parseInt(String.valueOf(between_days));
	}
}
