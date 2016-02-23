package com.middleschool.score.admin.utils;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.LabelCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;

public class ExcelUtils {

	public ExcelData parseExcelFile(InputStream is) throws Exception {
		List<List<String>> data = new ArrayList<List<String>>();
		Workbook rwb = Workbook.getWorkbook(is);
		Sheet rs = rwb.getSheet(0);
		int nColumns = rs.getColumns();
		int nRows = rs.getRows();
		String msg = null;

		for (int i = 1; i < nRows; i++) {
			List<String> rowData = new ArrayList<String>();
			data.add(rowData);
			for (int j = 0; j < nColumns; j++) {
				Cell sCell = rs.getCell(j, i);
				if (sCell.getType() == CellType.LABEL) // 文本类型
				{
					LabelCell tCell = (LabelCell) sCell;
					msg = tCell.getString();
				} else if (sCell.getType() == CellType.NUMBER || sCell.getType() == CellType.NUMBER_FORMULA) // 数字类型
				{
					NumberCell nCell = (NumberCell) sCell;
					msg = new java.text.DecimalFormat("#").format(nCell.getValue());
				} else if (sCell.getType() == CellType.DATE || sCell.getType() == CellType.DATE_FORMULA) // 日期类型
				{
					DateCell dCell = (DateCell) sCell;
					int count = 1900 + dCell.getDate().getYear();
					msg = count + "-";
					count = dCell.getDate().getMonth() + 1;
					msg += count + "-" + dCell.getDate().getDate();
				} else // EMPTY，STRING，BOOLEAN，ERROR，STRING_FORMULA，BOOLEAN_FORMULA，FORMULA_ERROR
				{
					msg = sCell.getContents().toString();
				}
				rowData.add(msg);
			} // end for

		} // end for
		rwb.close();

		ExcelData eData = new ExcelData(nRows, nColumns, data);

		for (int i = 1; i < nRows; i++) {
			List<String> rowData = new ArrayList<String>();
			data.add(rowData);
			for (int j = 0; j < nColumns; j++) {
				Cell sCell = rs.getCell(j, i);
				if (sCell.getType() == CellType.LABEL) // 文本类型
				{
					LabelCell tCell = (LabelCell) sCell;
					msg = tCell.getString();
				} else if (sCell.getType() == CellType.NUMBER || sCell.getType() == CellType.NUMBER_FORMULA) // 数字类型
				{
					NumberCell nCell = (NumberCell) sCell;
					msg = new java.text.DecimalFormat("#").format(nCell.getValue());
				} else if (sCell.getType() == CellType.DATE || sCell.getType() == CellType.DATE_FORMULA) // 日期类型
				{
					DateCell dCell = (DateCell) sCell;
					int count = 1900 + dCell.getDate().getYear();
					msg = count + "-";
					count = dCell.getDate().getMonth() + 1;
					msg += count + "-" + dCell.getDate().getDate();
				} else // EMPTY，STRING，BOOLEAN，ERROR，STRING_FORMULA，BOOLEAN_FORMULA，FORMULA_ERROR
				{
					msg = sCell.getContents().toString();
				}
				rowData.add(msg);
			} // end for

		} // end for
		rwb.close();

		return eData;
	}
}
