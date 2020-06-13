package com.hx.dc.service.impl;

import com.hx.dc.entity.Menu2;
import com.hx.dc.service.Menu2Service;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LYS on 2020/5/24.
 */
@Service("menu2Service")
public class Menu2ServiceImpl extends BaseServiceimpl<Menu2> implements Menu2Service{
    @Override
    public int insert(Menu2 record) {
        record.setMenuDelete("2");
        return baseMapper.insert(record);
    }
    @Override
    public List<Menu2> selectMenu() {
        return menu2Mapper.selectMenu();
    }
    @Override
    public int updateByPrimaryKeySelective(Menu2 record) {
        record.setMenuDelete("1");
        return baseMapper.updateByPrimaryKeySelective(record);
    }
}
