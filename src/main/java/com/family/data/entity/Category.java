package com.family.data.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 类目
 * 
 * @author gcg
 * @date 2018-03-24 24:53:07
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Category {

	private Long id;
	private Integer version;
	private String name;
	private Long fatherId;
	private Integer level;
	private Date createTime;
	private Date updateTime;

}