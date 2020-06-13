package com.hx.dc.service.impl;

import com.hx.dc.entity.MenuParameter;
import com.hx.dc.service.MenuParameterService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LYS on 2020/5/24.
 */
@Service("menuParameterService")
public class MenuParameterServiceImpl extends BaseServiceimpl<MenuParameter> implements MenuParameterService {
    @Override
    public List<MenuParameter> selectImt(String menuParameter) {
        return menuParameterMapper.selectImt(menuParameter);
    }
    @Override
    public int insert(MenuParameter record) {
        record.setMenuparDelete("2");
        return baseMapper.insert(record);
    }
    @Override
    public int deleteByMunuName(String menuName) {
        return menuParameterMapper.deleteByMunuName(menuName);
    }
    @Override
    public int updateByPrimaryKeySelective(MenuParameter record) {
        record.setMenuparDelete("1");
        return baseMapper.updateByPrimaryKeySelective(record);
    }
}
