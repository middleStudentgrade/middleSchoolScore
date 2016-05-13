package com.middleschool.score.common.utils.excel;


import com.middleschool.score.common.utils.DateUtil;
import com.middleschool.score.common.utils.ExcelUtil;
import com.middleschool.score.common.utils.ReflectUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class XssfExcelUtil extends ExcelUtil {

	public XssfExcelUtil(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	    public <T> List<T> readExcel(Class<T> clazz, int sheetNo, boolean hasTitle) throws Exception {
	        List<T> dataModels = new ArrayList<>();
	        // 获取excel工作簿
	        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
	        XSSFSheet sheet = workbook.getSheetAt(sheetNo);
	        int start = sheet.getFirstRowNum() + (hasTitle ? 1 : 0); // 如果有标题则从第二行开始
	        for (int i = start; i <= sheet.getLastRowNum(); i++) {
	            XSSFRow row = sheet.getRow(i);
	            if (row == null) {
	                continue;
	            }
	            // 生成实例并通过反射调用setter方法
	            T target = clazz.newInstance();
				Object[] fieldNames = getFile(clazz);
	            for (int j = 0; j < fieldNames.length; j++) {
	                String fieldName = (String)fieldNames[j];
	                if (fieldName == null || SERIALVERSIONUID.equals(fieldName)) {
	                    continue; // 过滤serialVersionUID属性
	                }
	                // 获取excel单元格的内容
	                XSSFCell cell = row.getCell(j);
					cell.getCellType();
					if (cell == null) {
	                    continue;
	                }
					if (isDateType(clazz, fieldName)) {
						String date = DateUtil.formatDate(cell.getDateCellValue());
						ReflectUtil.invokeSetter(target, fieldName, date);
					} else {
						String content = getCellContent(cell);
						Field field = clazz.getDeclaredField(fieldName);
						Object object = parseValueWithType(content, field.getType());
						ReflectUtil.invokeSetter(target, fieldName, object);
					}
	            }
	            dataModels.add(target);
	        }
	        return dataModels;
	    }

	@Override
	public <T> void writeExcel(HttpServletResponse response,String fileName, String sheetName, List<T> list) throws Exception {

	}

	@Override
	    protected Object parseValueWithType(String value, Class<?> type) {
	        // 由于Excel2007的numeric类型只返回double型，所以对于类型为整型的属性，要提前对numeric字符串进行转换
	        if (Byte.TYPE == type || Short.TYPE == type || Short.TYPE == type || Long.TYPE == type) {
	            value = String.valueOf((long) Double.parseDouble(value));
	        }
	        return super.parseValueWithType(value, type);
	    }
	 
	    /**
	     * 获取单元格的内容
	     * 
	     * @param cell
	     *            单元格
	     * @return 返回单元格内容
	     */
		private String getCellContent(XSSFCell cell) {
			Object obj = null;
			switch (cell.getCellType()) {
				case XSSFCell.CELL_TYPE_NUMERIC : // 数字
					obj = cell.getNumericCellValue();
					break;
				case XSSFCell.CELL_TYPE_BOOLEAN : // 布尔
					obj = cell.getBooleanCellValue();
					break;
				case XSSFCell.CELL_TYPE_FORMULA : // 公式
					obj = cell.getCellFormula() ;
					break;
				case XSSFCell.CELL_TYPE_STRING : // 字符串
					obj = cell.getStringCellValue();
					break;
				case XSSFCell.CELL_TYPE_BLANK : // 空值
				case XSSFCell.CELL_TYPE_ERROR : // 故障
				default :
					break;
			}
			return obj + "";
		}

}
