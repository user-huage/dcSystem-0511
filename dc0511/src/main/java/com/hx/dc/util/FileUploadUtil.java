package com.hx.dc.util;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by LYS on 2020/5/5.
 */
/*
 * 1。读取配置文件的信息，后边可保存文件到该 目录下
 * 2。生成新的唯一文件名
 * 3。根据MultipartFile类型的对象保存相关的文件到指定的目录
 * 4。保存成功后需要返回新的文件名（甚至相关目录地址）
 */
@Component(value="fileUploadUtil")  //普通的bean注入
public class FileUploadUtil {
    //后边需要变成读取配置文件方式赋值
    //static String path = "e:/testupload/";

    @Value("#{uploadProperties.path}")
    private String path;

    //获取文件后缀名
    private  String getExtName(MultipartFile file){
        return FilenameUtils.getExtension(file.getOriginalFilename());
    }
    //生成新的文件名
    private  String getNewName(MultipartFile file){
        //生成唯一的字符串，可作为文件名
        String uuid = UUID.randomUUID().toString();
        //拼接新的文件名

         String newName = uuid +"." + getExtName(file);

        return newName;
    }


    //保存文件,并返回新的文件保存地址（包括文件名)，如果不成功，返回null
    public  String upload(MultipartFile file, String name, String path5){
        try {
          //  f:/work/repo/git-repo/dc-repo/dc0511/src/main/webapp
            String a = name+getNewName(file);

            String path2 = path+"/"+a;//path5+path + "/" +a;
            System.out.println(path2);
//            File filepath=new File(path2);
//            if(filepath.isDirectory()&&!filepath.exists()){
//                filepath.mkdirs();
//            }
//            System.out.println(filepath.getAbsolutePath());

            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path2));
            return a;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    //
    public  Map<String, String>[] upload(MultipartFile[] file){
        return null;
    }



}