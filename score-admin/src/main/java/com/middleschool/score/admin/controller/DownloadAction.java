package com.middleschool.score.admin.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2016/5/10.
 */
@Controller
@RequestMapping("/admin/downloadFile/")
public class DownloadAction {

    @RequestMapping("download")
    public ResponseEntity<byte[]> download(@RequestParam(value = "grade",defaultValue = "1")int grade,@RequestParam(value = "className",defaultValue = "高一")String className,HttpServletRequest request) throws IOException {
        File file=null;
        String fileName="";
        String basePath=request.getSession().getServletContext().getRealPath("/")+"WEB-INF/file/";
        HttpHeaders headers = new HttpHeaders();
        if("高一".equals(className)){
            String path=basePath+"gaoyi.xlsx";
            file=new File(path);
            fileName=new String("高一成绩录入模板.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
        }else if("高二".equals(className)){
            if(grade<7) {
                String path = basePath+"gaoerwen.xlsx";
                file = new File(path);
                fileName = new String("高二文科成绩录入模板.xlsx".getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
            }else{
                String path = basePath+"gaoerli.xlsx";
                file = new File(path);
                fileName = new String("高二理科成绩录入模板.xlsx".getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
            }
        }else{
            if(grade<7) {
                String path = basePath+"gaosanwen.xlsx";
                file = new File(path);
                fileName = new String("高三文科成绩录入模板.xlsx".getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
            }else{
                String path = basePath+"gaosanli.xlsx";
                file = new File(path);
                fileName = new String("高三理科成绩录入模板.xlsx".getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
            }
        }
       headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
}
