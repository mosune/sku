package com.family.controller;

import com.family.data.entity.dto.OperationLogDto;
import com.family.dispatch.OperationLogDispatch;
import com.family.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:09
 */
@Controller
@RequestMapping("/operationLog")
public class OperationLogController extends BaseController {

	@Autowired
	private OperationLogDispatch operationLogDispatch;

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