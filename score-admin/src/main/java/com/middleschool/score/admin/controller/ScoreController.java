package com.middleschool.score.admin.controller;

import com.middleschool.score.admin.utils.*;
import com.middleschool.score.common.dto.MsScore;
import com.middleschool.score.common.service.ScoreService;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ScoreController {

    @Autowired
    private ScoreService scoreService;
    /**
     * 导入excel文件
     */
    @RequestMapping(value = "/import")
    public void importArchives(/*@RequestParam(value = "file") MultipartFile file*/) {
       /* Long courseId=1L;
        String grade="2";
        String jibu="ajib";
        List<MsScorePojo> msScoreList = new ArrayList<MsScorePojo>();
        List<MsScore> scoreList = new ArrayList<MsScore>();
        MsScore msScore=new MsScore();
        InputStream is = null;
        try {
            is = FileInputStreamToInputStream.getInputStream(new FileInputStream("/home/mentongwu/bb.xls"));
            String[] fileNames = new String[] { "courseId", "studentId", "score" };
            if (!is.markSupported()) {
                is = new PushbackInputStream(is, 8);
            }
            if (POIFSFileSystem.hasPOIFSHeader(is)) {
                ExcelHelper hssf = HssfExcelHelper.getInstance(is);
                msScoreList = hssf.readExcel(MsScorePojo.class, fileNames, true);
            }
            if (POIXMLDocument.hasOOXMLHeader(is)) {
                ExcelHelper xssf = XssfExcelHelper.getInstance(is);
                msScoreList = xssf.readExcel(MsScorePojo.class, fileNames, true);
            }
            for(MsScorePojo msScorePojo: msScoreList){
                msScore.setCourseCode(Long.valueOf(msScorePojo.getCourseId()));
                msScore.setGrade(grade);
                msScore.setStudentId(Long.valueOf(msScorePojo.getStudentId()));
                msScore.setJibu(jibu);
                msScore.setScore(Double.valueOf(msScorePojo.getScore()));
                scoreList.add(msScore);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        scoreService.saveScores(scoreList);*/
    }

}
