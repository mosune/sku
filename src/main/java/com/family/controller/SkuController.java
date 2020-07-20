package com.family.controller;

import com.family.data.entity.Category;
import com.family.data.entity.Sku;
import com.family.data.entity.dto.SkuDto;
import com.family.data.so.SkuUpdateSo;
import com.family.dispatch.SkuDispatch;
import com.family.exception.FamilyException;
import com.family.util.DateUtil;
import com.family.util.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:09
 */
@Controller
@RequestMapping("/sku")
public class SkuController {

	@Autowired
	private SkuDispatch skuDispatch;

	/**
	 * 列表
	 * @return
	 */
	@RequestMapping("index.do")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("sku/index");
		List<Category> list = new ArrayList<>();

		Category category = Category.builder().name("衣服").id(1L).build();
		Category category2 = Category.builder().name("书本").id(1L).build();
		list.add(category);
		list.add(category2);

		modelAndView.addObject("categorys", list);
		return modelAndView;
	}

	/**
	 * 列表
	 * @return
	 */
	@RequestMapping("addPage.do")
	public ModelAndView addPage() {
		ModelAndView modelAndView = new ModelAndView("sku/add");
		List<Category> list = new ArrayList<>();

		Category category = Category.builder().name("衣服").id(1L).build();
		Category category2 = Category.builder().name("书本").id(1L).build();
		list.add(category);
		list.add(category2);

		modelAndView.addObject("categorys", list);
		return modelAndView;
	}

	/**
	 * 列表
	 * @param limit
	 * @param offset
	 * @return
	 */
	@ResponseBody
	@RequestMapping("list.do")
	public Page<SkuDto> list(Integer limit, Integer offset, String nameLike, String startTime, String endTime, Integer categoryId, Integer status) throws ParseException {
		Date start = null;
		Date end = null;
		if (StringUtils.isNotEmpty(startTime)) {
			start = DateUtil.getDate(startTime);
		}
		if (StringUtils.isNotEmpty(endTime)) {
			end = DateUtil.getDate(endTime);
		}
		return skuDispatch.list(limit, offset, nameLike, start, end, categoryId, status);
	}

	/**
	 * 删除或者修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdate.do")
	public Integer addOrUpdate(Sku sku) throws FamilyException {
		if (StringUtils.isEmpty(sku.getName())) {
			throw new FamilyException("名称不能为空");
		}
		if (sku.getCategoryId() == null) {
			throw new FamilyException("类目一定要选");
		}
		if (StringUtils.isEmpty(sku.getPicUrl())) {
			throw new FamilyException("图片不能为空");
		}
		if (sku.getChangeTime() == null) {
			throw new FamilyException("更换时间不能为空");
		}
		return skuDispatch.addOrUpdate(sku);
	}

	/**
	 * 获取数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getData.do")
	public SkuDto getData(Long id) {
		return skuDispatch.getData(id);
	}

	/**
	 * 删除数据
	 * @return
	 */
	@RequestMapping(value = "delete.do")
	public void delete(List<SkuUpdateSo> list) throws FamilyException {
		skuDispatch.delete(list);
	}

	/**
	 * 修改状态
	 * @return
	 */
	@RequestMapping(value = "updateStatus.do")
	public void updateStatus(List<SkuUpdateSo> list) throws FamilyException {
		skuDispatch.updateStatus(list);
	}

}