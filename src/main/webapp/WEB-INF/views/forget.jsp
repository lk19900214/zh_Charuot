<%@page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>空中网用户中心 - 密码找回</title>
    <link type="text/css" rel="stylesheet" href="./空中网用户中心 - 密码找回_files/register.css">
    <link type="text/css" rel="stylesheet" href="./空中网用户中心 - 密码找回_files/base.css">
    <script src="./空中网用户中心 - 密码找回_files/jquery.js"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div,span,img,li,a,p');
    </script>
    <![endif]-->
</head>
<body class="regbg">
<div class="reg_main">
    <div class="reg_main_header">
        <!--头部-->
        <div class="reg_logo fpwd_logo"></div>
        <div class="info"><a href="https://passport.kongzhong.com/login">登录</a>&nbsp;|&nbsp;<a href="https://passport.kongzhong.com/acc">注册</a>&nbsp;<a class="fh_jt" target="_blank" href="http://www.kongzhong.com/">返回首页</a></div>
    </div>
    <!--内容-->
    <div class="reg_main_content">
        <div class="reg_main_content">
            <!--主内容-->
            <div class="regter_main">

                <div class="right_wrapper">
                    <!--第一步-->
                    <div id="fpassStepone">
                        <div class="hd_prog">
                            <h2 class="h2_tit">请输入您要找回密码的账号</h2>
                        </div>
                        <!--//-->
                        <div class="bd">
                            <div class="t_line">
                                <div class="l_list wone_zc1">空中网账号：</div>
                                <div class="r_list wtwo_zc1">
                                    <div class="input_text">
                                        <input id="useraccount" maxlength="30" name="user" type="input" class="input_text">
                                    </div>
                                    <div id="useraccountTip" class="onShow" style="margin: 0px; padding: 0px; background: transparent;"></div>
                                </div>
                            </div>
                            <div class="t_line">
                                <div class="l_list wone_zc1">验证码：</div>
                                <div class="r_list wtwo_zc1">
                                    <input id="verif_code" maxlength="4" type="input" class="input_text" kztype="captcha">
                                    <div id="verif_codeTip" class="onShow" style="margin: 0px; padding: 0px; background: transparent;"></div>
                                </div>
                            </div>
                            <div class="t_line">
                                <div class="l_list wone_zc1">&nbsp;</div>
                                <div class="r_list wtwo_zc1">
                                    <a id="submit_first_btn" class="btn_10">
                                        <span class="btn_psd">下一步</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--底部信息-->

    <div class="reg_footbox">
        <p><span>COPYRIGHT&nbsp;©&nbsp;1998 – 2017 KONGZHONG. ALL RIGHTS RESERVED. </span>空中网版权所有</p>
        <p>京ICP证020001号&nbsp;京网文[2011]0467–160号&nbsp;经营许可证编号:B2–20090197</p>
    </div>

    <div style="display:none">
        <script type="text/javascript">
            var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F1287c2225a527abe3386233dd9316f99' type='text/javascript'%3E%3C/script%3E"));
            document.write(unescape("%3Cscript src='" + _bdhmProtocol + "s95.cnzz.com/z_stat.php%3Fid%3D1261752285%26web_id%3D1261752285' type='text/javascript'%3E%3C/script%3E"));
        </script><script src="./空中网用户中心 - 密码找回_files/h.js" type="text/javascript"></script><script src="./空中网用户中心 - 密码找回_files/z_stat.php" type="text/javascript"></script><script src="./空中网用户中心 - 密码找回_files/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1261752285" target="_blank" title="站长统计">站长统计</a>
    </div>




    <script type="text/javascript" src="./空中网用户中心 - 密码找回_files/kzpassport.js"></script>
    <script type="text/javascript" src="./空中网用户中心 - 密码找回_files/formValidator-4.1.3.js"></script>
    <script type="text/javascript">
        $.formValidator.initConfig({errorFocus:false,formID:"fpwduserinfo_frm",submitOnce:true,forcevalid:false,errorfocus:false,validatorGroup:"findpwd_userinfo"});
        $("#useraccount").formValidator({validatorGroup:"findpwd_userinfo",onFocus:tips.account.f_find}).regexValidator({regExp:"useraccount",dataType:"enum",onError:tips.account.err,onErrorEmpty:tips.account.err_null}).ajaxValidator({
            url:"/ajax/checkuser",
            dataType : "json",
            async : false,
            data:{"useraccount":function(){return $("#useraccount").val();}},
            success:function(data){
                if(data!="1"){
                    return "您填写的账号不存在";
                }
                return true;
            },
            onError:"您填写的账号不存在"
        });;
        $("#verif_code").formValidator({validatorGroup:"findpwd_userinfo",onFocus:tips.captcha.f}).inputValidator({min:4,max:4,onError:tips.captcha.err,onErrorEmpty:tips.captcha.err_null}).ajaxValidator({
            url:"/ajax/verificationcode",
            dataType:"json",
            type:"get",
            async : true,
            data:{"code":function(){return $("#verif_code").val();}},
            success:function(data){
                if(data!="1"){
                    return tips.captcha.err;
                }
                return true;
            },
            onError:tips.captcha.err
        });
        $("#submit_first_btn").bind("click",function(){
            if(!$.formValidator.pageIsValid("findpwd_userinfo")){
                return;
            }
            if(window.location.href.indexOf('?')>-1){
                window.location.href = window.location.href.split("?")[0]+"?useraccount="+encodeURIComponent($.trim($('#useraccount').val()).toLocaleLowerCase())+"&vcode="+$("#verif_code").val();
            }else{
                window.location.href = window.location.href+"?useraccount="+encodeURIComponent($.trim($('#useraccount').val()).toLocaleLowerCase())+"&vcode="+$("#verif_code").val();
            }

        });

    </script>


</div></body></html>