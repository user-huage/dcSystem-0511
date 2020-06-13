package com.hx.dc.service.impl;

import com.hx.dc.entity.SysParam;
import com.hx.dc.mapper.SysParamMapper;
import com.hx.dc.service.SysparamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by my on 2020/6/12.
 */
@Service
public class SysparamServiceImpl extends BaseServiceimpl<SysParam> implements SysparamService {

    @Override
    public Map<String, Object> loadSysParam() {
        //用来保存系统所有字段的参数
        Map<String, Object> sysParamMap = new HashMap<String, Object>();
        //用来存放某个字段的参数
        Map<String, Object> fieldMap = null;
        List<SysParam> sysParams = sysParamMapper.selectPage(null);
        for (SysParam sysParam : sysParams) {
            if("1".equals(sysParam.getSysParamType())){
                //sys_param_type为1的存的是sql语句，需要把sql语句重新进行查询
                String sql = sysParam.getSysParamValue();
                System.out.println("=======================================sql:"+sql);
                List<SysParam> otherSysParams = sysParamMapper.selectOtherTable(sql);
                //系统参数的map没有相关字段的map,创建一个
                fieldMap = new LinkedHashMap<String, Object>();
                //把通过sql查询出来的参数（因一条sql使用同一个字段）全部放到fieldMap
                for (SysParam sysParam2 : otherSysParams) {
                    //把对应的key和value(显示文本)存放字段的map里
                    fieldMap.put(sysParam2.getSysParamValue(), sysParam2.getSysParamText());
                }
                //把字段map参数存到系统参数map
                sysParamMap.put(sysParam.getSysParamField(), fieldMap);

            }else{

                if(null==sysParamMap.get(sysParam.getSysParamField())){
                    //系统参数的map没有相关字段的map,就创建一个
                    fieldMap = new LinkedHashMap<String, Object>();
                    //把对应的key和value(显示文本)存放字段的map里
                    fieldMap.put(sysParam.getSysParamValue(), sysParam.getSysParamText());
                    //把字段的map存到系统参数的map里，下次再取时就存在字段map了
                    sysParamMap.put(sysParam.getSysParamField(), fieldMap);
                }else{
                    //系统参数的map已经有相关字段的map,就直接使用
                    fieldMap =(Map<String, Object>) sysParamMap.get(sysParam.getSysParamField());
                    //把对应的key和value(显示文本)存放字段的map里
                    fieldMap.put(sysParam.getSysParamValue(), sysParam.getSysParamText());
                    //把字段的map存到系统参数的map里，下次再取时就存在字段map了
                    //sysParamMap.put(sysParam.getSysParamField(), fieldMap);
                }
            }
        }
        return sysParamMap;
    }

}
