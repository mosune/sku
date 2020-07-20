package com.family.data.dao;

import com.family.data.entity.OperationLog;
import com.family.data.entity.dto.OperationLogDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gcg
 * @date 2018-03-24 24:53:08
 */
@Repository("operationLogDao")
public interface OperationLogDao {

    /**
     * 获取列表
     *
     * @param skuId
     * @param limit
     * @param offset
     * @return
     */
    List<OperationLogDto> list(@Param("skuId") long skuId, @Param("limit") int limit, @Param("offset") int offset);

    /**
     * 批量插入
     *
     * @param operationLogs
     */
    void batchInsert(@Param("list") List<OperationLog> operationLogs);

    /**
     * 获取数量
     *
     * @param skuId
     * @return
     */
    int count(@Param("skuId") long skuId);
}