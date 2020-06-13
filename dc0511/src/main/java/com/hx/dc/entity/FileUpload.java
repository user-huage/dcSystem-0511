package com.hx.dc.entity;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

/**
 * Created by LYS on 2020/5/3.
 */
public class FileUpload implements Serializable {

    private static final long serialVersionUID = 1L;
    /* private String id;
     private String name;
     private String operCode;*/
    private MultipartFile[] files;

    public MultipartFile[] getFiles() {
        return files;
    }

    public void setFiles(MultipartFile[] files) {
        this.files = files;
    }
}
