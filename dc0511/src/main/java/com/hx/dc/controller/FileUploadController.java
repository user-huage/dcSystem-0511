package com.hx.dc.controller;


import com.hx.dc.entity.FileUpload;
import com.hx.dc.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zcf on 2020/4/30.
 */
@Controller
@RequestMapping("/fileUploadController")
public class FileUploadController extends BaseController {

    @Resource
    FileUploadUtil fileUploadUtil;

    @RequestMapping(value = "/upload")
    @ResponseBody
    public Object upload(FileUpload fileUpload) {
        System.out.println("FileUpload:" + fileUpload);
        String path2 = application.getRealPath("/");
        System.out.println("绝对路径："+path2);

        MultipartFile[] files = fileUpload.getFiles();
        String fileName=null;
        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                System.out.println("文件为空");
            } else {
                // 下边接收到的新文件名，可以存到数据库
                fileName = fileUploadUtil.upload(file,"aa",path2);
                //可以加null判断，看文件是否保存成功
                //if(null == fileName ){}
            }
        }
        System.out.println("保存成功，可以返回保存的地址");
        return fileName;
    }
}

