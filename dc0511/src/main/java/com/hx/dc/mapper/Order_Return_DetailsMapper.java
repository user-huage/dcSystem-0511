package com.hx.dc.mapper;
import com.hx.dc.entity.Order_Return_Details;

import java.util.List;

public interface Order_Return_DetailsMapper extends BaseMapper<Order_Return_Details> {
    List<Order_Return_Details> selectDetails(List<String> list);

}