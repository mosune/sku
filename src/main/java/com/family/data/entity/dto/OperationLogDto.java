package com.family.data.entity.dto;

import com.family.data.entity.OperationLog;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class OperationLogDto extends OperationLog {

    private String name;

}
