package com.hx.dc.mapper;

import com.hx.dc.entity.Order_Details;

import java.util.List;

public interface Order_DetailsMapper extends BaseMapper<Order_Details> {

   /* List<Order_Details> selectPage(Order_Details record);*/
   int insertList(List<Order_Details> odlist);
   List<Order_Details> selectDetails(List<String> list);
}