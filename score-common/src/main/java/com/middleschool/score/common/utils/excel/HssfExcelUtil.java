package com.middleschool.score.common.utils.excel;


import com.middleschool.score.common.utils.DateUtil;
import com.middleschool.score.common.utils.ExcelUtil;
import com.middleschool.score.common.utils.ReflectUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;

import javax.servlet.http.HttpServletResponse;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HssfExcelUtil extends ExcelUtil {

    private final static String FILE_TYPE = ".xls";

    // sheet 多少条数据
    private final static Integer COUNT = 5000;

    public HssfExcelUtil(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public HssfExcelUtil() {
    }

    @Override
    public <T> List<T> readExcel(Class<T> clazz, int sheetNo, boolean hasTitle) throws Exception {
        List<T> dataModels = new ArrayList<>();
        // 获取excel工作簿
        HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
        HSSFSheet sheet = workbook.getSheetAt(sheetNo);
        int start = sheet.getFirstRowNum() + (hasTitle ? 1 : 0); // 如果有标题则从第二行开始
        for (int i = start; i <= sheet.getLastRowNum(); i++) {
            HSSFRow row = sheet.getRow(i);
            if (row == null) {
                continue;
            }
            // 生成实例并通过反射调用setter方法
            T target = clazz.newInstance();
            Object[] fieldNames = getFile(clazz);
            for (int j = 0; j < fieldNames.length; j++) {
                String fieldName = (String) fieldNames[j];
                if (fieldName == null || SERIALVERSIONUID.equals(fieldName)) {
                    continue; // 过滤serialVersionUID属性
                }
                // 获取excel单元格的内容
                HSSFCell cell = row.getCell(j);
                if (cell == null) {
                    continue;
                }
                
                // 如果属性是日期类型则将内容转换成日期对象
                if (isDateType(clazz, fieldName)) {
                	Date date = null;
                	if (HSSFDateUtil.isCellDateFormatted(cell)) {
                		double d = cell.getNumericCellValue();
                        date = HSSFDateUtil.getJavaDate(d);
                    }
                    // 如果属性是日期类型则将内容转换成日期对象
                    ReflectUtil.invokeSetter(target, fieldName, DateUtil.formatDate(date));
                } else {
                	cell.setCellType(Cell.CELL_TYPE_STRING);
                	String content = cell.getStringCellValue();
                    Field field = clazz.getDeclaredField(fieldName);
                    ReflectUtil.invokeSetter(target, fieldName, parseValueWithType(content, field.getType()));
                }
            }
            dataModels.add(target);
        }
        return dataModels;
    }

    @Override
    public <T> void writeExcel(HttpServletResponse response, String filename, String sheetName, List<T> list) throws Exception {
        //reponse init
        response.setContentType("octets/stream");
        response.addHeader("Content-Type", "octets/stream; charset=utf-8");
        filename = new String(filename.getBytes("UTF-8"), "iso8859-1");
        response.addHeader("Content-Disposition", "attachment;filename=" + filename + FILE_TYPE);
        OutputStream outputStream = response.getOutputStream();
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 字段中文名
        List<String> headers = new ArrayList<>();
        // 字段名
        List<String> fields = new ArrayList<>();
        getHeadName(list.get(0).getClass(), headers, fields);
        if (headers.size() == 0) {
            throw new Exception("该类没有注解请检查!");
        }
        setSheet(workbook, sheetName, headers, list, fields);
        try {
            workbook.write(outputStream);
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            outputStream.close();
        }
    }

//    private static String getFileName() {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");
//        return sdf.format(System.currentTimeMillis()) + FILE_TYPE;
//    }

    private <T> void setSheet(HSSFWorkbook workbook, String sheetName, List<String> headers, List<T> list, List<String> fields) {
        // 生成一个表格
        HSSFSheet sheet = workbook.createSheet(sheetName);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth(15);
        // 表头样式
        HSSFCellStyle headerStyle = getHeadStyle(workbook);
        // 正文内容样式
        HSSFCellStyle contentStyle = getContentStyle(workbook);
        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        HSSFRichTextString text;
        for (int i = 0; i < headers.size(); i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(headerStyle);
            text = new HSSFRichTextString(headers.get(i));
            cell.setCellValue(text);
        }
        // 循环赋值
        int rowCount = 1;
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(rowCount++);
//            HSSFCell cell = row.createCell(rowCount);
//            cell.setCellStyle(contentStyle);
            setRowValue(list.get(i), contentStyle, fields, row);
        }
    }

    // 填写sheet的每行的值
    private static void setRowValue(Object obj,HSSFCellStyle contentStyle, List<String> fields, HSSFRow row) {
//        WritableCellFormat doubleFormat = new WritableCellFormat(NumberFormats.FLOAT);
//        WritableCellFormat intFormat = new WritableCellFormat(NumberFormats.INTEGER);
//        WritableCellFormat percentFlaot = new WritableCellFormat(NumberFormats.PERCENT_FLOAT);
        Class<?> c = obj.getClass();
//        Field[] fields = c.getDeclaredFields();
        Object value = null;
//        jxl.write.Number number = null;
//        Label label = null;
        PropertyDescriptor pd = null;
        for (int i = 0; i < fields.size(); i++) {
            try {
                HSSFCell cell = row.createCell(i);
                cell.setCellStyle(contentStyle);
                pd = new PropertyDescriptor(fields.get(i), c);
                Method getMethod = pd.getReadMethod();// 获得get方法
                value = getMethod.invoke(obj);
                if (value instanceof Double) {
                    cell.setCellValue((Double)value);
                } else if (value instanceof Date) {
                    cell.setCellValue((Date)value);
                } else {
                    cell.setCellValue(value == null ?"":value.toString());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //基本样式
    private HSSFCellStyle getCellBaseStyle(HSSFWorkbook workbook) {
        HSSFCellStyle contentStyle = workbook.createCellStyle();
        contentStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        contentStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        contentStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        contentStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        contentStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        return contentStyle;
    }

    // 抬头样式
    private HSSFCellStyle getHeadStyle(HSSFWorkbook workbook) {
        HSSFCellStyle headerStyle = getCellBaseStyle(workbook);
        headerStyle.setFillForegroundColor(HSSFColor.WHITE.index);
        HSSFFont font = workbook.createFont();
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFont(font);
        return headerStyle;
    }

    //内容样式
    private HSSFCellStyle getContentStyle(HSSFWorkbook workbook) {
        HSSFCellStyle contentStyle = getCellBaseStyle(workbook);
        contentStyle.setFillForegroundColor(HSSFColor.WHITE.index);
        contentStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont font = workbook.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        font.setColor(HSSFColor.BLACK.index);
        contentStyle.setFont(font);
        return contentStyle;
    }

    // 获取标有excel注解的属性, 得到字段的中文和字段名称
    private void getHeadName(Class<?> c, List<String> headers, List<String> fields) {
        Field[] allFields = c.getDeclaredFields();
        for (Field field : allFields) {
            if (!field.isAnnotationPresent(ExcelExport.class)) {
                continue;
            }
            fields.add(field.getName());
            ExcelExport excel = field.getAnnotation(ExcelExport.class);
            headers.add(excel.name());
        }
    }

}
