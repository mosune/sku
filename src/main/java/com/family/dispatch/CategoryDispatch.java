package com.family.dispatch;

import com.family.data.entity.Category;
import com.family.data.so.CateSo;
import com.family.exception.FamilyException;

import java.util.List;

/**
 * @author gcg
 * @create 2020-06-30 16:58
 **/
public interface CategoryDispatch {

    /**
     * 查询所有类目
     * @return
     * @param level
     */
    List<Category> queryAll(Integer level);

    Integer addOrUpdate(CateSo cateSo) throws FamilyException;

    Integer delete(Long id) throws FamilyException;
}
