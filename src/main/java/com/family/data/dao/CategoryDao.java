package com.family.data.dao;

import com.family.data.entity.Category;
import com.family.util.Page;
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

}