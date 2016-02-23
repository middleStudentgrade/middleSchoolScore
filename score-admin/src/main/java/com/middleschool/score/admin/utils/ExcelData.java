package com.middleschool.score.admin.utils;

import java.util.List;

public class ExcelData {
	private int rows;
	private int cols;
	private List<List<String>> data;
	
	
	public ExcelData(int rows, int cols, List<List<String>> data){
		this.rows = rows;
		this.cols = cols;
		this.data = data;
		if(data!=null){
			this.rows = data.size();
		}
	}


	public int getCols() {
		return cols;
	}


	public List<List<String>> getData() {
		return data;
	}


	public int getRows() {
		return rows;
	}
	
	public String getCellData(int row,int col){
		if(row>-1 && col>-1 && row<rows && col<cols){
			return data.get(row).get(col);
		}else{
			return null;
		}
	}
	
}
