package com.family.data.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品
 * 
 * @author gcg
 * @date 2018-03-24 24:53:07
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Sku {
	
	private Long id;
	private Integer version;
	private Long categoryId;
	private String name;
	private String shopName;
	private String brand;
	private String url;
	private Integer status;
	private Date buyTime;
	private Date productTime;
	private Date expiredTime;
	private Date changeTime;
	private String picUrl;
	private Integer deleteTag;
	private Date createTime;
	private Date updateTime;
	private BigDecimal price;
	private Integer star;

}