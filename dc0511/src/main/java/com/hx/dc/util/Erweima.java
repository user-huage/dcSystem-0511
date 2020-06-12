package com.hx.dc.util;


import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import org.springframework.stereotype.Component;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Hashtable;

/**
 * Created by my on 2020/6/8.
 */

public class Erweima {

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;

/*    public static void main(String[] args) {


        //String path3;
       // String path0 = application.getRealPath("/");
       // String path2 = path0+basePath;
        ///System.out.print("sdf"+path2);
        String Type = "gif";
        String url="http://localhost:8080/goURL/Table_Order/addOrder.mvc";
        String name = "DiningtableName"+"_"+"DepName";
        String path = "e://tooks/";
      *//*  //path3 = path2+name+Type;
        try {
            create(url,path2,w,h,Type,name);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*//*
        try {
            create(url,path,900,900,Type,name);

            create();
        } catch (Exception e) {
            e.printStackTrace();
        }
     *//*   String text = "https://www.baidu.com?departid=1&tableid=88"; // 这里是URL ，扫描之后就跳转到这个界面
        String path = "e:/testdir"; // 图片生成的位置
        int width = 900;
        int height = 900;
        // 二维码图片格式
        String format = "gif";
        // 设置编码，防止中文乱码
        Hashtable<EncodeHintType, Object> ht = new Hashtable<EncodeHintType, Object>();
        ht.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        // 设置二维码参数(编码内容，编码类型，图片宽度，图片高度,格式)

        BitMatrix bitMatrix = new MultiFormatWriter().encode(text,
                BarcodeFormat.QR_CODE, width, height, ht);
        // 生成二维码(定义二维码输出服务器路径)
        File outputFile = new File(path);
        if (!outputFile.exists()) {
            // 创建文件夹
            outputFile.mkdir();
        }
        int b_width = bitMatrix.getWidth();
        int b_height = bitMatrix.getHeight();
        // 建立图像缓冲器
        BufferedImage image = new BufferedImage(b_width, b_height,
                BufferedImage.TYPE_3BYTE_BGR);
        for (int x = 0; x < b_width; x++) {
            for (int y = 0; y < b_height; y++) {
                image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
            }
        }
        // 生成二维码
        ImageIO.write(image, format, new File(path + "/erweima." + format)); // 二维码的名称
        // 是
        // erweima.sgif*//*
    }*/

    /*
    参数需要：
    1、二维码扫描后跳转的路径（可以带参数）,
    2、图片的存放路径，3
    3、图片的宽
    4、图片的高
    5、图处的格式
     */
    public static void create(String url,String basePath,int w,int h,String f,String name) throws Exception{
        String text = url;//"https://www.baidu.com/deptId=a001&deskId=33"; //这里是URL ，扫描之后就跳转到这个界面
        String path = basePath;//"e:/"; //图片生成的位置
        int width =w;// 900;
        int height = h;//900;
        // 二维码图片格式
        String format =f;// "gif";
        System.out.println("duizhun"+text+basePath+w+h+format);
        // 设置编码，防止中文乱码
        Hashtable<EncodeHintType, Object> ht = new Hashtable<EncodeHintType, Object> ();
        System.out.println("调用了hashTt");
        ht.put (EncodeHintType.CHARACTER_SET, "UTF-8");
        // 设置二维码参数(编码内容，编码类型，图片宽度，图片高度,格式)
        BitMatrix bitMatrix = new MultiFormatWriter().encode (text, BarcodeFormat.QR_CODE, width, height, ht);
        // 生成二维码(定义二维码输出服务器路径)
        File outputFile = new File (path);
        if (!outputFile.exists ()&&!outputFile.isDirectory())
        {
            //创建文件夹
            outputFile.mkdirs();
        }else{
            System.out.print("文件夹已存在");
        }
        int b_width = bitMatrix.getWidth ();
        int b_height = bitMatrix.getHeight ();
        // 建立图像缓冲器
        BufferedImage image = new BufferedImage (b_width, b_height, BufferedImage.TYPE_3BYTE_BGR);
        for ( int x = 0; x < b_width; x++ )
        {
            for ( int y = 0; y < b_height; y++ )
            {
                image.setRGB (x, y, bitMatrix.get (x, y) ? BLACK : WHITE);
            }
        }

       /* //格式输出流
        MultiFormatWriter out = new MultiFormatWriter();
        //创建二维码矩阵
        BitMatrix bitMatrix = out.encode(content, BarcodeFormat.QR_CODE, size, size,hits);

        //创建一个图像缓冲区，用来存放二维码的图像数据
        BufferedImage bufferQR = new BufferedImage(size, size, BufferedImage.TYPE_INT_RGB);
*/
        // 生成二维码"erweima."
        System.out.println(path+"/"+format);
        String path5 = path+"/"+name;
        ImageIO.write (image, format, new File (path5 +"Erweima."+format)); //二维码的名称 是 erweima.sgif
    }

    ////参数需要：1店铺的标记,2餐桌编号，3长，4，宽
    // public static void create(String sId,String tNo,Integer w,Integer h) throws Exception{
    public static void create( ) throws Exception{
        System.out.println("调用了");
        String text = "https://www.baidu.com/deptId=a001&deskId=33"; //这里是URL ，扫描之后就跳转到这个界面
        String path = "e://took/"; //图片生成的位置
        int width = 900;
        int height = 900;
        // 二维码图片格式
        String format = "gif";
        // 设置编码，防止中文乱码
        System.out.println("调用了2");
        Hashtable<EncodeHintType, Object> ht = new Hashtable<EncodeHintType, Object> ();
        ht.put (EncodeHintType.CHARACTER_SET, "UTF-8");
        // 设置二维码参数(编码内容，编码类型，图片宽度，图片高度,格式)
        System.out.println("调用了3");
        BitMatrix bitMatrix = new MultiFormatWriter ().encode (text, BarcodeFormat.QR_CODE, width, height, ht);
        // 生成二维码(定义二维码输出服务器路径)
        System.out.println("调用了4");
        File outputFile = new File (path);
        System.out.println("调用了5");
        if (!outputFile.exists ())
        {
            //创建文件夹
            outputFile.mkdir ();
        }
        System.out.println("调用了6");
        int b_width = bitMatrix.getWidth ();
        int b_height = bitMatrix.getHeight ();
        // 建立图像缓冲器
        System.out.println("调用了7");
        BufferedImage image = new BufferedImage (b_width, b_height, BufferedImage.TYPE_3BYTE_BGR);
        System.out.println("调用了8");
        for ( int x = 0; x < b_width; x++ )
        {
            for ( int y = 0; y < b_height; y++ )
            {
                image.setRGB (x, y, bitMatrix.get (x, y) ? BLACK : WHITE);
            }
        }
        System.out.println("调用了9");
        String name = "餐桌.";
        // 生成二维码,文件名可以设计成根据 “店的编号+"_"+餐桌号”生成唯一。
        ImageIO.write (image, format, new File (path +"保养汤火锅."+ format)); //二维码的名称 是 erweima.sgif
    }

}
