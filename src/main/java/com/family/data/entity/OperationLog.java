package com.family.data.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 日志
 * 
 * @author gcg
 * @date 2018-03-24 24:53:07
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OperationLog {

	private Long id;
	private Long skuId;
	private Integer beforeStatus;
	private Integer afterStatus;
	private String remark;
	private Date createTime;

}