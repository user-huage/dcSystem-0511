package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Goods;
import com.hx.dc.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by SuperMr.gong on 2020/6/4.
 */
@Controller
@RequestMapping("goods")
public class GoodsController {
    @Autowired
    HttpSession session;
    @Resource
    private GoodsService goodsService;
    @RequestMapping("selectPage")
    @ResponseBody
    public Object selectPage(Goods goods,Integer page,Integer rows){
        PageInfo<Goods> pageInfo = goodsService .selectPage(goods, page, rows);
        Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
        pageMap.put("rows",pageInfo.getList());//获取用户列表
        return pageMap;
    }
    @RequestMapping("shop")
    @ResponseBody
    public Object shop(int [] ids){
        int [] newArr=new int[10];
        for(int i = 0 ; i < ids.length ; i++) {
            newArr[i]=ids[i];
        }
        session.setAttribute("d",newArr);
        Map m=new HashMap();
        m.put("a","操作成功");
        return m;
    }
    @RequestMapping("list")
    @ResponseBody
    public Object list(int[] list,Integer page,Integer rows){
        //System.out.println("aaaaaaaaaaa==="+list[0]);
        ArrayList<Goods> l = new ArrayList();
            for (int i=0;i<list.length;i++){
                Goods g=new Goods();
                if (list[i]!=0){
                    g.setGoodsId(list[i]);
                    l.add(g);
                }
                //System.out.println("qqqqqqqqqqq:"+list[i]);
            }
      /*  for (Goods s:l
             ) {
            //System.out.println("pppppppppppp==="+s.getGoodsId());
        }*/
       PageInfo<List<Goods>> pageInfo = goodsService.select1Page2(l, page, rows);
        Map<String,Object> pageMap = new HashMap<>();
        pageMap.put("total",pageInfo.getTotal());//获取总记录数
       pageMap.put("rows",pageInfo.getList());//获取用户列表
        return pageMap;
    }
}
