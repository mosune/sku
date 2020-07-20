package com.family.enums;

/**
 * 删除标识
 *
 * @author gcg
 * @date 2018-11-05 20:02
 **/
public enum DeleteTag {

    NO(0, "未删"),
    YES(1, "已删");

    private Integer type;
    private String message;

    DeleteTag(Integer type, String message) {
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
