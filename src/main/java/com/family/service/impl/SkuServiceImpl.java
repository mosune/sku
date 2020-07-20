package com.family.service.impl;

import com.family.data.dao.OperationLogDao;
import com.family.data.dao.SkuDao;
import com.family.data.entity.OperationLog;
import com.family.data.entity.Sku;
import com.family.data.so.SkuUpdateSo;
import com.family.enums.DeleteTag;
import com.family.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:08
 */
@Service("skuService")
public class SkuServiceImpl implements SkuService {

    @Autowired
    private SkuDao skuDao;

    @Autowired
    private OperationLogDao operationLogDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer addOrUpdate(Sku sku) {
        int result;
        if (sku.getId() == null) {
            result = skuDao.insert(sku);
        } else {
            result = skuDao.update(sku);
        }
        return result;
    }

    @Override
    public void delete(List<SkuUpdateSo> list) {
        List<Sku> skus = new ArrayList<>(list.size() * 2);
        for (SkuUpdateSo skuUpdateSo : list) {
            skus.add(Sku.builder().id(skuUpdateSo.getId()).version(skuUpdateSo.getVersion()).deleteTag(DeleteTag.YES.getType()).build());
        }
        skuDao.batchUpdate(skus);
    }

    @Override
    public void updateStatus(List<SkuUpdateSo> list, List<OperationLog> operationLogs) {
        List<Sku> skus = new ArrayList<>(list.size() * 2);
        for (SkuUpdateSo skuUpdateSo : list) {
            skus.add(Sku.builder().id(skuUpdateSo.getId()).version(skuUpdateSo.getVersion()).status(skuUpdateSo.getStatus()).build());
        }
        skuDao.batchUpdate(skus);
        operationLogDao.batchInsert(operationLogs);
    }
}