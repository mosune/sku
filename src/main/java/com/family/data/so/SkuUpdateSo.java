package com.family.data.so;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SkuUpdateSo {

    private List<Long> ids;

    private Integer version;

    private String remark;

    private Integer status;

}
