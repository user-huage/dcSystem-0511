package com.hx.dc.service.impl;


import com.hx.dc.entity.Param;
import com.hx.dc.mapper.ParamMapper;
import com.hx.dc.service.ParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 85361 on 2020/5/12.
 */
@Service("ParamService")
public class ParamServiceImpl extends BaseServiceimpl<Param> implements ParamService {

    @Autowired
    ParamMapper paramMapper;
    @Override
    public Map<String, Object> loadSysParam() {
        Map<String,Object> sysParamMap=new HashMap<>();
        Map<String,String> fileMap=null;

        List<Param> list= paramMapper.selectAll();
        for (Param s: list) {
            if(s.getType().equals("1")){
                //暂时不处理
            }else {
                if(null==sysParamMap.get(s.getField())){
                    fileMap=new LinkedHashMap<>();
                    fileMap.put(s.getFieldName(),s.getFieldValue());
                    sysParamMap.put(s.getField(),fileMap);
                }else {
                    fileMap= (Map<String,String>)sysParamMap.get(s.getField());
                    fileMap.put(s.getFieldName(),s.getFieldValue());
                }
            }
        }
        return sysParamMap;
    }
    @Override
    public void updateParam(Param param) {
        paramMapper.updateParam(param);
    }

    @Override
    public void setParam(Param param) {
        paramMapper.setParam(param);
    }

}
