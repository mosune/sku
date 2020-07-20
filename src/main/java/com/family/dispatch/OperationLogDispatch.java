package com.family.dispatch;

import com.family.data.entity.dto.OperationLogDto;
import com.family.util.Page;

/**
 * @author gcg
 * @create 2020-06-30 14:59
 **/
public interface OperationLogDispatch {

    /**
     * 列表
     *
     * @param skuId
     * @param limit
     * @param offset
     * @return
     */
    Page<OperationLogDto> list(long skuId, int limit, int offset);
}
