package com.family.service;

import com.family.data.entity.OperationLog;
import com.family.data.entity.Sku;
import com.family.data.so.SkuUpdateSo;

import java.util.List;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:08
 */
public interface SkuService {

    /**
     * 新增或修改
     * @param sku
     * @return
     */
    Integer addOrUpdate(Sku sku);

    /**
     * 删除
     * @param list
     * @return
     */
    void delete(List<SkuUpdateSo> list);

    /**
     * 修改装填
     * @param skuUpdateSo
     * @param operationLogs
     * @return
     */
    void updateStatus(SkuUpdateSo skuUpdateSo, List<OperationLog> operationLogs);
}