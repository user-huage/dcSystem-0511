package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.SysParam;
import com.hx.dc.service.SysparamService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * Created by my on 2020/6/12.
 */
@Controller
@RequestMapping("/sysparamparam")
public class SysparamparamController extends BaseController {

    @Resource
    private SysparamService sysparamService;

    private boolean bool =false;

    @PostConstruct
    private void loadSysParam() {
        //存所有字段的系统参数
		/*Map<String, Object> sysParamMap = new HashMap<String, Object>();
		Map<String, Object> supTypeMap = new LinkedHashMap<String, Object>();
		supTypeMap.put("1", "一级供应商");
		supTypeMap.put("2", "二级供应商");
		supTypeMap.put("3", "三级供应商");


		sysParamMap.put("supType", supTypeMap);

		Map<String, Object> goodsColorMap = new HashMap<String, Object>();
		goodsColorMap.put("1", "红色");
		goodsColorMap.put("2", "绿色");
		goodsColorMap.put("3", "蓝色");
		sysParamMap.put("goodsColor", goodsColorMap);*/

        application.setAttribute("sysParam", sysparamService.loadSysParam());
        System.out.println("-----------------系统参数加载完毕2-------------------");
        bool = true;

    }

    @RequestMapping(value = "/selectList")
    @ResponseBody
    public Object selectList(SysParam sysParam,Integer page, Integer rows){
        System.out.println("diaoyong");
       /* if(sysParam.getSysParamId(). == ""){
            sysParam.setSysParamId(null);
        }*/
        if(sysParam.getSysParamField() == ""){
            sysParam.setSysParamField(null);
        }
        if(sysParam.getSysParamValue()== ""){
            sysParam.setSysParamValue(null);
        }
        if(sysParam.getSysParamText() == ""){
            sysParam.setSysParamText(null);
        }
        if(sysParam.getSysParamType() == ""){
            sysParam.setSysParamType(null);
        }
        System.out.println(sysParam);
        System.out.println("fanwen");
        PageInfo<SysParam> pageInfo = sysparamService.selectPage(sysParam,page,rows);//page,rows);
        System.out.print(pageInfo.getList());
        return getPageMap(pageInfo);
    }

    //系统参数添加时保存数据到数据库后要同步缓存（SysParamMap）的信息
    @RequestMapping(value="/insert")
    @ResponseBody
    public Object insert(SysParam sysParam) throws Exception{
		System.out.println("---action.sysParam:"+sysParam);
        System.out.println(sysParam);
        int i = sysparamService.insert(sysParam);
        if(i > 0){
            bool = false;
        }
		return i;
    }
    //系统参数修改时保存修改后的数据到数据库后要同步缓存（SysParamMap）的信息
    @RequestMapping(value="/update")
    @ResponseBody
    public Object update(SysParam sysParam) throws Exception{
        if(sysParam.getSysParamField() == ""){
            sysParam.setSysParamField(null);
        }
        if(sysParam.getSysParamValue()== ""){
            sysParam.setSysParamValue(null);
        }
        if(sysParam.getSysParamText() == ""){
            sysParam.setSysParamText(null);
        }
        if(sysParam.getSysParamType() == ""){
            sysParam.setSysParamType(null);
        }
		System.out.println("---action.sysParam:"+sysParam);
		int i = sysparamService.updateByPrimaryKeySelective(sysParam);
        if(i > 0){
            bool = false;
        }
        return i;

    }

    @RequestMapping(value="/updateAll")
    @ResponseBody
    public Object updateAll()throws Exception{
        System.out.println("updateAll调用");
        if(true) {
            loadSysParam();
            bool = true;
        }
        return bool;
    }



  /*  //系统参数删除时删除了数据库数据后要同步缓存（SysParamMap）的信息
    @RequestMapping("/deleteByPks")
    @ResponseBody
    public Object deleteByPks(String [] pks) throws Exception {
		for (String string : pks) {
			System.out.println(string.toString());
		}
		System.out.println("---deleteByPks.pks:" + pks);
		return sysparamService.deleteByPrimaryKey(pks);
    }*/
  //系统参数删除时删除了数据库数据后要同步缓存（SysParamMap）的信息
  @RequestMapping("/deleteByPks")
  @ResponseBody
  public Object deleteByPks(SysParam sysParam) throws Exception {
     /* for (String string : pks) {
          System.out.println(string.toString());
      }*/
      System.out.println("---deleteByPks.pks:" + sysParam);
      int i = sysparamService.deleteByPrimaryKey(sysParam);
      if(i > 1){
          bool = false;
      }
      return i;
  }
}

