package com.family.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 分页对象
 * @author gcg
 * 
 * 2017年4月14日 下午4:15:17
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Page<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int total;

	private List<T> rows;
}
