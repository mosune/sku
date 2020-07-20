package com.family.data.entity.dto;

import com.family.data.entity.Category;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Category Dto
 *
 * @author gcg
 * @create 2018-04-02 10:38
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class CategoryDto extends Category {

    private String levelName;

}
