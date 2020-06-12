package com.hx.dc.Exception;

/**
 * Created by my on 2020/5/5.
 */
public class CustomException extends Exception {
    public CustomException() {}
    public CustomException(String message){
        super(message);
    }
}
