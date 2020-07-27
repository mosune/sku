package com.family.data.dao;

import com.family.data.entity.Category;
import com.family.data.so.CateSo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:08
 */
@Repository("categoryDao")
public interface CategoryDao {

    /**
     * 获取第一级别的列表
     * @param map
     * @return
     */
    List<Category> getTopLevel(Map<String, Object> map);

    /**
     * 查询所有类目
     * @return
     * @param level
     */
    List<Category> queryAll(@Param("level") Integer level);

    Category getData(@Param("id") Long id);

    int insert(@Param("so") CateSo cateSo);

    int update(@Param("so") CateSo cateSo);

    int getSkuCount(@Param("id") Long id);
}