package com.family.data.dao;

import com.family.data.entity.Sku;
import com.family.data.entity.dto.SkuDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * 
 * @author gcg
 * @date 2018-03-24 24:53:08
 */
@Repository("skuDao")
public interface SkuDao {

    /**
     * 数据
     * @param name
     * @param startTime
     * @param endTime
     * @param categoryId
     * @param status
     * @return
     */
    int count(@Param("name") String name, @Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("categoryId") Integer categoryId, @Param("status") Integer status);

    /**
     * 列表
     * @param limit
     * @param offset
     * @param name
     * @param startTime
     * @param endTime
     * @param categoryId
     * @param status
     * @return
     */
    List<SkuDto> list(@Param("limit") Integer limit, @Param("offset") Integer offset, @Param("name") String name, @Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("categoryId") Integer categoryId, @Param("status") Integer status);

    /**
     * 添加
     * @param sku
     * @return
     */
    int insert(@Param("sku") Sku sku);

    /**
     * 修改
     * @param sku
     * @return
     */
    int update(@Param("sku") Sku sku);

    /**
     * 查询数据
     * @param id
     * @return
     */
    SkuDto getData(@Param("id") Long id);

    /**
     * 获取列表
     * @param ids
     * @return
     */
    List<SkuDto> getDatas(@Param("list") List<Long> ids);

    /**
     * 批量更新
     * @param skus
     */
    void batchUpdate(@Param("list") List<Sku> skus);
}