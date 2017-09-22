package com.zh.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;
@Data
@Component
public class UserDo {
    private Integer uId;

    private String uName;

    private String uPassword;

    private String uRealname;

    private String uPhone;

    private String uMail;

    private Integer uMold;

    private Byte state;

    private Long createId;

    private Date createDate;

    private Long updateId;

    private Date updateDate;


}