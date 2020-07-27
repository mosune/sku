package com.family.data.so;

import lombok.Data;

/**
 * @author gcg
 * @create 2020-07-22 17:07
 **/
@Data
public class SkuSo {

    private Long id;

    private String name;

    private Long categoryId;

    private String buyTime;

    private String changeTime;

    private String productTime;

    private String expiredTime;

    private String picUrl;

    private String shopName;

    private String brand;

    private String url;

    private Integer status;

    private Integer star;

}
