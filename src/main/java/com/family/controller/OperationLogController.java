package com.family.controller;

import com.family.data.entity.dto.OperationLogDto;
import com.family.data.entity.dto.SkuDto;
import com.family.dispatch.OperationLogDispatch;
import com.family.dispatch.SkuDispatch;
import com.family.exception.FamilyException;
import com.family.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:09
 */
@Controller
@RequestMapping("/log")
public class OperationLogController {

	@Autowired
	private OperationLogDispatch operationLogDispatch;

	@Autowired
	private SkuDispatch skuDispatch;

	@RequestMapping("index.do")
	private ModelAndView index(Long id) throws FamilyException {
		SkuDto skuDto = skuDispatch.getData(id);
		if (skuDto == null) {
			throw new FamilyException("商品不存在");
		}
		ModelAndView mv = new ModelAndView("/log/index");
		mv.addObject("name", skuDto.getName());
		mv.addObject("id", skuDto.getId());
		return mv;
	}

	/**
	 * 首页列表
	 * @param limit
	 * @param offset
	 * @return
	 */
	@ResponseBody
	@RequestMapping("list.do")
	public Page<OperationLogDto> list(long skuId, int limit, int offset) {
		return operationLogDispatch.list(skuId, limit, offset);
	}
	
}