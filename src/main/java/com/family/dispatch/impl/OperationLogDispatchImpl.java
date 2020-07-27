package com.family.dispatch.impl;

import com.family.data.dao.OperationLogDao;
import com.family.data.entity.dto.OperationLogDto;
import com.family.data.entity.dto.SkuDto;
import com.family.dispatch.OperationLogDispatch;
import com.family.enums.SkuStatus;
import com.family.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author gcg
 * @create 2020-06-30 15:00
 **/
@Component("operationLogDispatch")
public class OperationLogDispatchImpl implements OperationLogDispatch {

    @Autowired
    private OperationLogDao operationLogDao;

    @Override
    public Page<OperationLogDto> list(long skuId, int limit, int offset) {
        int count = operationLogDao.count(skuId);
        if (count == 0) {
            return new Page(0, new ArrayList<SkuDto>(0));
        }
        List<OperationLogDto> list = operationLogDao.list(skuId, limit, offset);
        for (OperationLogDto operationLogDto : list) {
            operationLogDto.setBeforeStr(SkuStatus.getName(operationLogDto.getBeforeStatus()));
            operationLogDto.setAfterStr(SkuStatus.getName(operationLogDto.getAfterStatus()));
        }
        return new Page(count, list);
    }
}
