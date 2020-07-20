package com.family.enums;

/**
 * @author gcg
 * @create 2020-06-30 14:45
 **/
public enum SkuStatus {

    USE(0, "使用中"),
    EXPIRED(1, "失效");

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

}
