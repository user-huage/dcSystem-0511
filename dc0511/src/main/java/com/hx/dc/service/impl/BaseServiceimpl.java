package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.mapper.*;
import com.hx.dc.service.BaseService;
import com.hx.dc.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by SuperMr.gong on 2020/6/3.
 */
public class BaseServiceimpl<T> implements BaseService<T> {

    BaseMapper<T> baseMapper;//不能直接注入对应代理对象

    @Autowired
    Menu2Mapper menu2Mapper;

    @Autowired
    MenuParameterMapper menuParameterMapper;

    @Autowired
    protected Order_DetailsMapper order_DetailsMapper;
    @Autowired
    protected  OrderMapper orderMapper;
    @Autowired
    protected Order_ReturnsMapper order_ReturnsMapper;
    @Autowired
    protected Order_Return_DetailsMapper order_Return_DetailsMapper;
    @Autowired
    protected  GoodsMapper goodsMapper;
    @Autowired
    ParamMapper paramMapper;
    @Autowired
    AccountsDayMapper accountsDayMapper;
    @Autowired
    LogMapper logMapper;
    @Resource
    TableMapper tableMapper;
    @Resource
    OrderTableMapper orderTableMapper;
    @Resource
    GoodsOrderMapper goodsOrderMapper;
    @Resource
    SysParamMapper sysParamMapper;
    //后边要把所有的Mapper接口都要在这里配置出来

    //在构建父类完成后，baseMapper需要有对应的相关子Mapper的对象作为引用
    @PostConstruct//在构造方法后，初始数据的处理
    private void initBaseMapper() throws Exception{
        //完成以下逻辑，需要对研发本身进行命名与使用规范
        //this关键字指对象本身，这里指的是调用此方法的实现类（子类）
        System.out.println("=======this :"+this);
        System.out.println("=======父类基本信息："+this.getClass().getSuperclass());
        System.out.println("=======父类和泛型的信息："+this.getClass().getGenericSuperclass());

        ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
        //获取第一个参数的class
        Class clazz = (Class)type.getActualTypeArguments()[0];//SysUser
        System.out.println("=======class:"+clazz);
        //转化为属性名（相关的Mapper子类的引用名） sysUserMapper
        String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Mapper";
        System.out.println("=======localField:"+localField);
        //getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
        Field field=this.getClass().getSuperclass().getDeclaredField(localField);
        System.out.println("=======field:"+field);
        System.out.println("=======field对应的对象:"+field.get(this));
        Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");

        System.out.println("=======baseField:"+baseField);
        System.out.println("=======baseField对应的对象:"+baseField.get(this));
        //field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中
        baseField.set(this, field.get(this));
        System.out.println("========baseField对应的对象:"+baseMapper);

    }


    @Override
    public <K> int deleteByPrimaryKey(K id) {
        return baseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(T record) {
        return baseMapper.insert(record);
    }

    @Override
    public int insertSelective(T record) {
        return baseMapper.insertSelective(record);
    }

    @Override
    public T selectByPrimaryKey(String id) {
        return baseMapper.selectByPrimaryKey(id);
    }

  /*  @Override
    public T selectByPrimaryKey(String id) {
        baseMapper.selectByPrimaryKey()
        return null;
    }*/

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return baseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(T record) {
        return baseMapper.updateByPrimaryKey(record);
    }

    //分页查询
    @Override
    public PageInfo<T> selectPage(T entity, Integer pageIndex, Integer pageSize) {
        //startPage：设置的分页查询条件，它只起作用于接下来的第一条执行的sql
        PageHelper.startPage(pageIndex, pageSize);
        //查询数据
        List<T> list = baseMapper.selectPage(entity);
        //封装查询信息，便于使用
        PageInfo<T> pageInfo = new PageInfo<T>(list);

        return pageInfo;

    }
}
