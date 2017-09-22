<%@page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>空中网通行证</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link type="text/css" rel="stylesheet"
          href="css/base.css" />
    <link type="text/css" rel="stylesheet"
          href="css/register.css" />
    <link rel="stylesheet"
          href="css/css.css">
    <script
            src="js/detectmobilebrowser.js">

    </script>
    <style type="text/css">
        /*二维码登录*/
        a.btnLogin {
            padding-left: 106px
        }
        .item_two {
            width: 253px;
            overflow: hidden;
            height: auto;
            margin: 0 auto;
        }
        .twocode {
            height: auto;
            width: 100%;
        }
        .twocode .t_title {
            text-align: center;
            color: #333;
            padding-top: 10px;
        }
        .twocode .t_title strong {
            color: #ff9900;
            margin-right: 6px;
        }
        .twocode .t_title a {
            display: inline-block;
            width: 37px;
            height: 22px;
            background: url(https://stc2.kongzhong.com/passport/v2/img/anzhuang.jpg) no-repeat;
            text-align: center;
            line-height: 22px;
            color: #333;
            margin-left: 9px;
        }
        .twocode .t_title a:hover {
            color: #3333;
            text-decoration: none
        }
        .twocode .ewk {
            width: 167px;
            height: 167px;
            margin: 0 auto;
            background: url(https://stc2.kongzhong.com/passport/v2/img/ewmkbg.jpg) no-repeat;
            text-align: center;
            margin-top: 10px;
            margin-bottom: 9px;
        }
        .twocode .ewk img {
            margin-top: 10px;
        }
    </style>
    <!--[if lte IE 6]>
    <script src="https://stc2.kongzhong.com/passport/v2/js/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div,span,img,li,a,a.logo');
    </script>
    <![endif]-->
</head>
<body class="login_body">
<div class="login-bg">
    <div id="reg_main" class="reg_main" style='display: none;'>
        <div class="reg_main_cont">
            <!--头部-->
            <div class="reg_main_header login_header">
                <ul class="logotit">
                    <li><img src="https://stc2.kongzhong.com/passport/v2/img/login_logo.png"
                             class="mr10 fleft mt20" />
                    </li>
                </ul>
            </div>
            <!--内容-->
            <div class="login_main login-center">
                <!--登录部分-->
                <div class="loginbg">
                    <div id="zcbox" style='display: block;'>
                        <ul class="tabs" id="login_type_tabs">
                            <li id="commontab" class="active">账号登录</li>
                            <li id="erweitab">扫码登录</li>
                        </ul>
                        <div class="cons">
                            <div class="loginBox">
                                <div class="errorTip dnone" id="error_name">
                                    <span class="icoTip"></span><span class="errorM">请填写正确的信息</span>
                                </div>
                                <div class="nameArea tips-top">
                                    <span class="icoName"></span> <label class="inputTip">请输入账号</label>
                                    <input type="text" class="input" autocomplete="off"
                                           maxlength="30" id="user_id_txt" /> <span class="icoClean"></span>
                                </div>
                                <div class="pwdArea">
                                    <span class="icoPwd"></span> <label class="inputTip">请输入登录密码</label>
                                    <input type="password" class="input" autocomplete="off"
                                           oncut="return false" oncopy="return false"
                                           oncontextmenu="return false" onpaste="return false"
                                           maxlength="16" id="password_txt" /> <span class="icoClean"></span>
                                </div>
                                <div id="vcode_area" class="yzimgArea" style='display: none;'>
                                    <span class="icoImg"></span> <label class="inputTip">请输入验证码</label>
                                    <input autocomplete="off" id="vcodetxt" maxlength="4"
                                           type="text" class="imgYzInput input" style="background: none">
                                    <div name="smsVCodeArea" class="yabox">
                                        <img id="verif_codeimg" src="" style="cursor:pointer">
                                    </div>
                                </div>
                                <a href="javascript:" class="btn btn-default load" id="login">登
                                    录<span class="dotting"><i></i><i></i><i></i> </span> </a>
                                <div class="nav-link clearfix">
                                    <p class="link-left">
                                        没有账号？<a href="/acc" style="color:#ed6d00">立即注册</a>
                                    </p>
                                    <p class="link-right">
                                        <a href="/pwdback/pwdemailback/pwdback_email">忘记密码</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="cons wx-login" style="display:none">
                            <div class="wx-img">
                                <img src="https://sso.kongzhong.com/createQRCode" alt="" class="wximg">
                            </div>
                            <div class="wx-shade " style="display:none">
                                <p>
                                    二维码失效<br> 点击刷新
                                </p>
                            </div>
                            <p class="wx-tips">
                                使用<a href="http://k.kongzhong.com" style="color:#ed6d00">口袋密令</a>扫描二维码安全登录
                            </p>
                            <p class="wx-tips-win">
                                <i></i> <span>扫描成功</span><br> 请在口袋密令中点击确认即可登录
                            </p>
                        </div>
                        <div class="thirdparty-login scan-code">
                            <div class="thirdparty-login-main">
                                <span>第三方登录：</span> <a id="wb_connect_btn" data-cmd="tsina" class="bds_tsina"
                                                       href="https://api.weibo.com/oauth2/authorize?client_id=1949226531&response_type=code&state=0f1ce9e2881d90f0&redirect_uri=https%3A%2F%2Fpassport.kongzhong.com%2Fwblogin" title="新浪微博登录"></a> <a data-cmd="sqq"
                                                                                                                                                                                                                                                       class="bds_sqq" href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101413494&scope=get_user_info&state=0f1ce9e2881d90f0&redirect_uri=http%3A%2F%2Fpassport.kongzhong.com%2Fqqlogin" title="qq登录"></a> <a
                                    data-cmd="weixin" class="bds_weixin" href="https://open.weixin.qq.com/connect/qrconnect?appid=wx5b7da7335edff3a2&response_type=code&scope=snsapi_login&state=0f1ce9e2881d90f0&redirect_uri=https%3A%2F%2Fpassport.kongzhong.com%2Fwxlogin"
                                    title="微信登录"></a>
                            </div>
                        </div>
                    </div>
                    <!--空中密令动态密码-->
                    <div class="dynamic-password" style='display:none;'>
                        <h3>您正在使用空中密令动态密码验证身份</h3>
                        <div class="input-box">
                            <div class="username">
                                账号：<span>130****5400</span>
                            </div>
                            <div class="password">
                                动态密码： <input class="" placeholder='请输入6位数字' /> <span
                                    class="icoClean"></span>
                            </div>
                            <div class="errorTip">
                                <span class="icoTip"></span><span class="errorM">动态密码错误</span>
                            </div>
                        </div>
                        <a href="javascript:;" class="btn btn-default load">确 定<span
                                class="dotting"><i></i><i></i><i></i> </span> </a>
                    </div>
                </div>
            </div>
            <!--底部-->
            <div class="reg_footbox">
                <p>
						<span>COPYRIGHT&nbsp;&copy;&nbsp;1998 &ndash; 2017
							ZHANCHE. ALL RIGHTS RESERVED. </span>战车网版权所有
                </p>
                <p>豫ICP证020001号&nbsp;豫网文[2011]0467&ndash;160号&nbsp;经营许可证编号:B2&ndash;20090197</p>
            </div>
        </div>
    </div>
</div>
<script
        src="js/jquery-3.2.1.min.js"></script>
<script
        src="js/login-handler-kz-ums-3.0-min.js"></script>
<script
        src="js/login-handler-kz-qrc-3.0-min.js"></script>
<script type="text/javascript">
    KZLoginHandler.loginServer = KZQRCLoginHandler.loginServer = "https://sso.kongzhong.com";
    KZLoginHandler.service = KZQRCLoginHandler.service = "https://passport.kongzhong.com/";
    (function($,window){
        "use strict";

        var qrclogin_exec_flag_gls = false,
            reLoginCnt_glo = 5,
            vdcode=0,//正常流程
            useraccount,
            logintype=1,//1通用 2短信 3密保卡
            backurl ="http://mall.kongzhong.com/";

        $(function(){
            if(backurl.indexOf('validate')==-1){
                if(backurl.indexOf('?')>-1){
                    backurl+="&validate=true";
                }else{
                    backurl+="?validate=true";
                }
            };
            KZLoginHandler.check(function(data){
                if(data.logged){
                    window.location.href = backurl;
                }else{
                    $('#reg_main').show();
                    //需要验证码
                    if(data["requirevcode"]){
                        $("#vcode_area").show();
                        $("#vcode_area").find("img").attr("src","https://sso.kongzhong.com/createVCode?w=80&h=30&"+Math.random());
                    }
                }
            });
            //登录方式切换效果
            var dts = $("#login_type_tabs li");
            var tabCons = $(".cons");
            var i = tabCons.length;
            dts.click(function() {
                i = $(this).index();
                dts.removeClass("active").eq(i).addClass("active");
                if(i===0){
                    loginForm.account(tabCons,i);
                }else{
                    loginForm.qrcode(tabCons,i);
                }
            });

            $("label").focus(function(){
                $(this).hide();
                $(this).next("input").focus();
            })
            $("input").keydown(function(){$(this).css("background","#fff");$(this).next(".icoClean").show();}).focus(function(){
                if(this.id==="password_txt"){
                    $(this).val("");
                }
                if($(this).val()===''){$(this).prev().hide();}
                $(this).parent("div").addClass("focus");
            }).blur(function(){
                if($(this).val()===""){$(this).css("background","none");$(this).prev().show();$(this).parent("div").removeClass("focus");}
            });
            $(".icoClean").click(function(){$(this).prev("input").val("").css("background","none");$(this).prev("label").show();$(this).hide();});
            //验证码图片换一张
            $("#verif_codeimg").click(function(){$('#verif_codeimg').attr("src", "https://sso.kongzhong.com/createVCode?w=80&h=30&"+Math.random());});

            //绑定登录事件
            $("#login").click(login.account);
            //回车登录事件
            $("#CommonLogin").delegate("input","keydown",function(event){if(event.keyCode==13){$("#login").click();}});
        });

        window.f_qrcLoginKZ = function (){
            KZQRCLoginHandler.login(function(data){
                if(data.logged){
                    window.location.href = backurl;
                }else{
                    var qrclogin_timeoutid_gls = null;
                    if(data.errors != null && data.errors != ""){
                        alert(data.errors["text"]);
                        qrclogin_exec_flag_gls = false;
                        clearTimeout(qrclogin_timeoutid_gls);
                    }else{
                        if(qrclogin_exec_flag_gls){
                            qrclogin_timeoutid_gls = window.setTimeout("f_qrcLoginKZ()", 5000);
                        }else{
                            clearTimeout(qrclogin_timeoutid_gls);
                        }
                    }
                }
            });
        };
        var ssoLogin = function(vcode){
            $("#login").removeClass().addClass("btn btn-default load loading");
            KZLoginHandler.login(encodeURIComponent($.trim($('#user_id_txt').val()).toLocaleLowerCase()), encodeURIComponent($.trim($('#password_txt').val())), false, vcode, function(data){
                if(!data.logged){
                    if(data.errors != null
                        && data.errors != ""
                        && data.errors[0] != null){
                        if(data.errors[0].code === "INVALID_TICKET2" || data.errors[0].code === "INVALID_TICKET"){
                            //如果因为验证码cookie登录失败，则自动重新登录
                            if(reLoginCnt_glo > 0){
                                reLoginCnt_glo--;
                                ssoLogin(b, vcode);
                                return ;
                            }
                        }
                    }
                    $("#login").removeClass().addClass("btn btn-default load");
                    if(data["requirevcode"]){
                        $("#vcode_area").show();
                        $("#vcode_area").find("img").attr("src","https://sso.kongzhong.com/createVCode?w=80&h=30&"+ Math.random());
                    }
                    var errs = data.errors&& data.errors[0].text|| "登录失败";
                    loginForm.account($(".cons"), 0);
                    loginTips.showTips(errs);
                } else {
                    window.location.href = backurl;
                }
            });
            return false;
        };

        //登录提示
        var loginTips = {
            showTips : function(msg) {
                $("#error_name").show().find("span").eq(1).html(msg);
                $("#user_id_txt").parent().removeClass("tips-top");
            },
            removeTips : function(obj) {
                $("#error_name").hide();
                $("input").parent(".error").removeClass("error");
                $("#user_id_txt").parent().removeClass("tips-top")
                    .addClass("tips-top");
            }
        };
        //登录校验
        var login_vd = {
            account : function(str) {
                if ($.trim(str) == "" || str == "请输入账号") {
                    return "请输入账号";
                }
                var regtest = new RegExp(
                    '(^[a-zA-Z0-9_-][a-zA-Z0-9_+-]{3,15}$)|(^[a-zA-Z0-9_.-]{2,20}\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*(\\.[A-Za-z]{2,5})+$)|(^1[34578][0-9]{9}$)',
                    'gi');
                if (!regtest.test($.trim(str))) {
                    return "账号格式有误";
                }
                return "";
            },
            pwd : function(str) {
                if (str == "") {
                    return "请输入密码";
                }
                if ($.trim(str).length < 6) {
                    return "密码不能小于6位";
                }
                return "";
            },
            icode : function(code) {
                if (code == "" || code == "请您输入下面的验证码") {
                    return "请输入验证码";
                }
                return "";
            }
        };
        //登录窗口切换
        var loginForm = {
            account : function(tabCons, i) {
                tabCons.hide().eq(i).show();
                //绑定登录按钮事件
                $("#login").unbind("click").bind("click", login.account);
                logintype = 1;
                loginTips.removeTips();
                //设置二维码登录执行标注
                qrclogin_exec_flag_gls = false;
            },
            qrcode : function(tabCons, i) {
                tabCons.hide().eq(i).show();
                //绑定登录按钮事件
                logintype = 4;
                loginTips.removeTips();
                //执行二维码登录
                qrclogin_exec_flag_gls = true;
                window.setTimeout("f_qrcLoginKZ()", 5000);
            }
        };

        var login = {
            account : function() {
                //初始化错误提示
                loginTips.removeTips();
                //校验用户名密码
                var result = login_vd.account($("#user_id_txt").val());
                if (result != "") {
                    $("#user_id_txt").parent().addClass("error");
                    loginTips.showTips(result);
                    return false;
                }
                result = login_vd.pwd($("#password_txt").val());
                if (result != "") {
                    $("#password_txt").parent().addClass("error");
                    loginTips.showTips(result);
                    return false;
                }
                if (vdcode === 1) {
                    result = login_vd.icode($("#vcodetxt").val());
                    if (result != "") {
                        $("#vcodetxt").parent().addClass("error");
                        loginTips.showTips(result);
                        return false;
                    }
                }
                ssoLogin($("#vcodetxt").val());
            }
        };
    }(jQuery, window));
</script>
<div style="display:none">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='"+_bdhmProtocol+ "hm.baidu.com/h.js%3F1287c2225a527abe3386233dd9316f99' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>
</body>
</html>