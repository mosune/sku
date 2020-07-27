package com.family.enums;

/**
 * @author gcg
 * @create 2020-06-30 14:45
 **/
public enum SkuStatus {

    UN_USE(0, "未使用"),
    USE(1, "正使用"),
    USED(2, "使用完"),
    EXPIRED(3, "已过期"),
    DROP(4, "已废弃");

    private Integer type;
    private String message;

    SkuStatus(Integer type, String message) {
        this.type = type;
        this.message = message;
    }

    public Integer getType() {
        return type;
    }

    public String getMessage() {
        return message;
    }

    public static String getName(Integer type) {
        for (SkuStatus skuStatus : SkuStatus.values()) {
            if (skuStatus.getType().equals(type)) {
                return skuStatus.getMessage();
            }
        }
        return "";
    }

}
