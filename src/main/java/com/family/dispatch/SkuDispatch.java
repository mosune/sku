package com.family.dispatch;

import com.family.data.entity.Sku;
import com.family.data.entity.dto.SkuDto;
import com.family.data.so.SkuUpdateSo;
import com.family.exception.FamilyException;
import com.family.util.Page;

import java.util.Date;
import java.util.List;

/**
 * @author gcg
 * @create 2020-06-30 11:25
 **/
public interface SkuDispatch {

    /**
     * 列表
     * @param limit
     * @param offset
     * @param nameLike
     * @param startTime
     * @param endTime
     * @param categoryId
     * @param status
     * @return
     */
    Page<SkuDto> list(Integer limit, Integer offset, String nameLike, Date startTime, Date endTime, Integer categoryId, Integer status);

    /**
     * 添加或修改
     * @param sku
     * @return
     */
    Integer addOrUpdate(Sku sku);

    /**
     * 获取数据
     * @param id
     * @return
     */
    SkuDto getData(Long id);

    /**
     * 删除
     * @param list
     * @return
     */
    void delete(List<SkuUpdateSo> list) throws FamilyException;

    /**
     * 修改状态
     * @param list
     * @return
     */
    void updateStatus(List<SkuUpdateSo> list) throws FamilyException;
}
