package com.family.dispatch.impl;

import com.family.data.dao.CategoryDao;
import com.family.data.entity.Category;
import com.family.data.so.CateSo;
import com.family.dispatch.CategoryDispatch;
import com.family.exception.FamilyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 类目
 *
 * @author gcg
 * @create 2020-07-27 14:05
 **/
@Component("categoryDispatch")
public class CategoryDispatchImpl implements CategoryDispatch {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> queryAll(Integer level) {
        return categoryDao.queryAll(level);
    }

    @Override
    public Integer addOrUpdate(CateSo cateSo) throws FamilyException {
        checkInfo(cateSo.getId());
        if (cateSo.getFatherId() == null) {
            cateSo.setLevel(1);
        }
        Category father = checkInfo(cateSo.getFatherId());
        if (father != null) {
            cateSo.setLevel(father.getLevel() + 1);
        }
        int result;
        if (cateSo.getId() == null) {
            result = categoryDao.insert(cateSo);
        } else {
            result = categoryDao.update(cateSo);
        }
        return result;
    }

    @Override
    public Integer delete(Long id) throws FamilyException {
        checkInfo(id);
        int count = categoryDao.getSkuCount(id);
        return null;
    }

    private Category checkInfo(Long id) throws FamilyException {
        if (id == null) {
            return null;
        }
        Category category = categoryDao.getData(id);
        if (category == null) {
            throw new FamilyException("类目不存在");
        }
        return category;
    }
}
