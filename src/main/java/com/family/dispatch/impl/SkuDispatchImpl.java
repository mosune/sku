package com.family.dispatch.impl;

import com.family.data.dao.SkuDao;
import com.family.data.entity.OperationLog;
import com.family.data.entity.Sku;
import com.family.data.entity.dto.SkuDto;
import com.family.data.so.SkuUpdateSo;
import com.family.dispatch.SkuDispatch;
import com.family.exception.FamilyException;
import com.family.service.SkuService;
import com.family.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author gcg
 * @create 2020-06-30 11:25
 **/
@Component("skuDispatch")
public class SkuDispatchImpl implements SkuDispatch {

    @Autowired
    private SkuDao skuDao;

    @Autowired
    private SkuService skuService;

    @Override
    public Page<SkuDto> list(Integer limit, Integer offset, String nameLike, Date startTime, Date endTime, Integer categoryId, Integer status) {
        int count = skuDao.count(nameLike, startTime, endTime, categoryId, status);
        if (count == 0) {
            return new Page(0, new ArrayList<SkuDto>(0));
        }
        return new Page(count, skuDao.list(limit, offset, nameLike, startTime, endTime, categoryId, status));
    }

    @Override
    public Integer addOrUpdate(Sku sku) {
        return skuService.addOrUpdate(sku);
    }

    @Override
    public SkuDto getData(Long id) {
        return skuDao.getData(id);
    }

    @Override
    public void delete(List<SkuUpdateSo> list) throws FamilyException {
        checkData(list);
        skuService.delete(list);
    }

    @Override
    public void updateStatus(List<SkuUpdateSo> list) throws FamilyException {
        List<SkuDto> skuDtos = checkData(list);
        List<OperationLog> operationLogs = new ArrayList<>();
        Map<Long, Integer> map = skuDtos.stream().collect(Collectors.toMap(SkuDto::getId, SkuDto::getStatus));
        for (SkuUpdateSo skuUpdateSo : list) {
            operationLogs.add(OperationLog.builder().skuId(skuUpdateSo.getId()).remark(skuUpdateSo.getRemark()).beforeStatus(map.get(skuUpdateSo.getId())).afterStatus(skuUpdateSo.getStatus()).build());
        }
        skuService.updateStatus(list, operationLogs);
    }

    /**
     * 检查数据
     * @param list
     * @return
     * @throws FamilyException
     */
    private List<SkuDto> checkData(List<SkuUpdateSo> list) throws FamilyException {
        List<Long> ids = list.stream().map(SkuUpdateSo::getId).collect(Collectors.toList());
        List<SkuDto> skuDtos = skuDao.getDatas(ids);
        if (skuDtos.size() != list.size()) {
            throw new FamilyException("数据不匹配");
        }
        return skuDtos;
    }
}
