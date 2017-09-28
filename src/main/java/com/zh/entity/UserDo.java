package com.zh.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "zh_username")
public class UserDo {
    /**
     * 用户ID
     */
    @Id
    @Column(name = "U_ID")
    private Integer uId;

    /**
     * 用户姓名
     */
    @Column(name = "U_NAME")
    private String uName;

    /**
     * 用户密码
     */
    @Column(name = "U_PASSWORD")
    private String uPassword;

    /**
     * 用户真实姓名
     */
    @Column(name = "U_REALNAME")
    private String uRealname;

    /**
     * 用户邮箱
     */
    @Column(name = "U_MAIL")
    private String uMail;

    /**
     * 用户类型
     */
    @Column(name = "U_MOLD")
    private Integer uMold;

    /**
     * 状态 1:可用状态  0:删除状态  2:锁定状态
     */
    @Transient
    private Byte state;

    /**
     * 创建人ID
     */
    @Transient
    private Long createId;

    /**
     * 创建时间
     */
    @Transient
    private Date createDate;

    /**
     * 修改人ID
     */
    @Transient
    private Long updateId;

    /**
     * 修改时间
     */
    @Transient
    private Date updateDate;

    /**
     * 获取用户ID
     *
     * @return U_ID - 用户ID
     */
    public Integer getuId() {
        return uId;
    }

    /**
     * 设置用户ID
     *
     * @param uId 用户ID
     */
    public void setuId(Integer uId) {
        this.uId = uId;
    }

    /**
     * 获取用户姓名
     *
     * @return U_NAME - 用户姓名
     */
    public String getuName() {
        return uName;
    }

    /**
     * 设置用户姓名
     *
     * @param uName 用户姓名
     */
    public void setuName(String uName) {
        this.uName = uName;
    }

    /**
     * 获取用户密码
     *
     * @return U_PASSWORD - 用户密码
     */
    public String getuPassword() {
        return uPassword;
    }

    /**
     * 设置用户密码
     *
     * @param uPassword 用户密码
     */
    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    /**
     * 获取用户真实姓名
     *
     * @return U_REALNAME - 用户真实姓名
     */
    public String getuRealname() {
        return uRealname;
    }

    /**
     * 设置用户真实姓名
     *
     * @param uRealname 用户真实姓名
     */
    public void setuRealname(String uRealname) {
        this.uRealname = uRealname;
    }

    /**
     * 获取用户邮箱
     *
     * @return U_MAIL - 用户邮箱
     */
    public String getuMail() {
        return uMail;
    }

    /**
     * 设置用户邮箱
     *
     * @param uMail 用户邮箱
     */
    public void setuMail(String uMail) {
        this.uMail = uMail;
    }

    /**
     * 获取用户类型
     *
     * @return U_MOLD - 用户类型
     */
    public Integer getuMold() {
        return uMold;
    }

    /**
     * 设置用户类型
     *
     * @param uMold 用户类型
     */
    public void setuMold(Integer uMold) {
        this.uMold = uMold;
    }

    /**
     * 获取状态 1:可用状态  0:删除状态  2:锁定状态
     *
     * @return STATE - 状态 1:可用状态  0:删除状态  2:锁定状态
     */
    public Byte getState() {
        return state;
    }

    /**
     * 设置状态 1:可用状态  0:删除状态  2:锁定状态
     *
     * @param state 状态 1:可用状态  0:删除状态  2:锁定状态
     */
    public void setState(Byte state) {
        this.state = state;
    }

    /**
     * 获取创建人ID
     *
     * @return CREATE_ID - 创建人ID
     */
    public Long getCreateId() {
        return createId;
    }

    /**
     * 设置创建人ID
     *
     * @param createId 创建人ID
     */
    public void setCreateId(Long createId) {
        this.createId = createId;
    }

    /**
     * 获取创建时间
     *
     * @return CREATE_DATE - 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取修改人ID
     *
     * @return UPDATE_ID - 修改人ID
     */
    public Long getUpdateId() {
        return updateId;
    }

    /**
     * 设置修改人ID
     *
     * @param updateId 修改人ID
     */
    public void setUpdateId(Long updateId) {
        this.updateId = updateId;
    }

    /**
     * 获取修改时间
     *
     * @return UPDATE_DATE - 修改时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置修改时间
     *
     * @param updateDate 修改时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}