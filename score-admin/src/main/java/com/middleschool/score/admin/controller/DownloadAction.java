package com.middleschool.score.admin.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2016/5/10.
 */
@Controller
@RequestMapping("/admin/downloadFile/")
public class DownloadAction {

    @RequestMapping("download")
    public ResponseEntity<byte[]> download() throws IOException {
        String path="E:\\aa.xls";
        File file=new File(path);
        HttpHeaders headers = new HttpHeaders();
        String fileName=new String("成绩录入模板.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }
}
