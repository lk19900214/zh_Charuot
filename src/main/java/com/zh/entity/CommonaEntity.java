package com.zh.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by webrx on 2017-09-20.
 */
@Data
public class CommonaEntity {
    private int state;
    private int create_id;
    private Date create_date;
    private int update_id;
    private Date update_date;
}
