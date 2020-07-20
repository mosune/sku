package com.family.data.entity.dto;

import com.family.data.entity.Sku;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * goods dto
 *
 * @author gcg
 * @create 2018-04-02 20:41
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuDto extends Sku {

    private String cateName;

}
