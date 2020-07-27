package com.family.controller;

import com.family.data.so.CateSo;
import com.family.dispatch.CategoryDispatch;
import com.family.exception.FamilyException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author gcg
 * @create 2020-07-24 17:21
 **/
@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryDispatch categoryDispatch;

    @RequestMapping("index.do")
    private ModelAndView index() {
        ModelAndView mv = new ModelAndView("/category/index");
        mv.addObject("first", categoryDispatch.queryAll(1));
        mv.addObject("cates", categoryDispatch.queryAll(null));
        return mv;
    }

    @ResponseBody
    @RequestMapping("addOrUpdate.do")
    private Integer addOrUpdate(@RequestBody CateSo cateSo) throws FamilyException {
        if (StringUtils.isEmpty(cateSo.getName())) {
            throw new FamilyException("类目名称为空");
        }
        return categoryDispatch.addOrUpdate(cateSo);
    }

    @ResponseBody
    @RequestMapping("delete.do")
    private Integer delete(@RequestBody Long id) throws FamilyException {
        if (id == null) {
            throw new FamilyException("没有选择数据");
        }
        return categoryDispatch.delete(id);
    }

}
