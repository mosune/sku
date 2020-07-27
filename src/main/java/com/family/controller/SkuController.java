package com.family.controller;

import com.family.data.entity.Category;
import com.family.data.entity.Sku;
import com.family.data.entity.dto.SkuDto;
import com.family.data.so.SkuSo;
import com.family.data.so.SkuUpdateSo;
import com.family.dispatch.CategoryDispatch;
import com.family.dispatch.SkuDispatch;
import com.family.exception.FamilyException;
import com.family.util.DateUtil;
import com.family.util.Page;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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

	@Autowired
	private CategoryDispatch categoryDispatch;

	/**
	 * 列表
	 * @return
	 */
	@RequestMapping("index.do")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("sku/index");
		modelAndView.addObject("categorys", categoryDispatch.queryAll(3));
		return modelAndView;
	}

	/**
	 * 添加页面
	 * @return
	 */
	@RequestMapping("addPage.do")
	public ModelAndView addPage() {
		ModelAndView modelAndView = new ModelAndView("sku/add");
		modelAndView.addObject("categorys", categoryDispatch.queryAll(3));
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
	 * 添加或者修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdate.do")
	public Integer addOrUpdate(@RequestBody SkuSo skuSo) throws FamilyException, ParseException {
		if (StringUtils.isEmpty(skuSo.getName())) {
			throw new FamilyException("名称不能为空");
		}
		if (skuSo.getCategoryId() == null) {
			throw new FamilyException("类目一定要选");
		}
		if (StringUtils.isEmpty(skuSo.getPicUrl())) {
			throw new FamilyException("图片不能为空");
		}
		if (skuSo.getStatus() == null) {
			throw new FamilyException("状态不能为空");
		}
		Sku sku = Sku.builder()
				.id(skuSo.getId())
				.name(skuSo.getName())
				.categoryId(skuSo.getCategoryId())
				.buyTime(DateUtil.getDate2(skuSo.getBuyTime()))
				.changeTime(DateUtil.getDate2(skuSo.getChangeTime()))
				.productTime(DateUtil.getDate(skuSo.getProductTime()))
				.expiredTime(DateUtil.getDate(skuSo.getExpiredTime()))
				.picUrl(skuSo.getPicUrl())
				.shopName(skuSo.getShopName())
				.brand(skuSo.getBrand())
				.url(skuSo.getUrl())
				.status(skuSo.getStatus())
				.star(skuSo.getStar())
				.build();
		return skuDispatch.addOrUpdate(sku);
	}

	/**
	 * 获取数据
	 * @return
	 */
	@RequestMapping("updatePage.do")
	public ModelAndView getData(Long id) {
		ModelAndView mv = new ModelAndView("/sku/add");
		mv.addObject("sku", skuDispatch.getData(id));

		List<Category> list = new ArrayList<>();

		Category category = Category.builder().name("衣服").id(1L).build();
		Category category2 = Category.builder().name("书本").id(1L).build();
		list.add(category);
		list.add(category2);

		mv.addObject("categorys", list);

		return mv;
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
	@ResponseBody
	@RequestMapping(value = "updateStatus.do")
	public int updateStatus(@RequestBody SkuUpdateSo skuUpdateSo) throws FamilyException {
		if (CollectionUtils.isEmpty(skuUpdateSo.getIds())) {
			throw new FamilyException("请选择物品");
		}
		skuDispatch.updateStatus(skuUpdateSo);
		return 1;
	}

}