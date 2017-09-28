<%@page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>空中网通行证</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <link type="text/css" rel="stylesheet" href="/css/base.css"/>
    <link type="text/css" rel="stylesheet" href="/css/register.css"/>
    <link rel="stylesheet" href="/css/css.css"/>
    <script src="/js/detectmobilebrowser.js"></script>
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
    <script type="text/javascript">
        DD_belatedPNG.fix('div,span,img,li,a,a.logo');
    </script>


    <![endif]-->
</head>
<body class="login_body">
<div class="login-bg">
    <div id="reg_main" class="reg_main" style='display: block;'>
        <div class="reg_main_cont">
            <!--头部-->
            <div class="reg_main_header login_header">
                <ul class="logotit">
                    <li><img src="https://stc2.kongzhong.com/passport/v2/img/login_logo.png"
                             class="mr10 fleft mt20"/>
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
                                    <input type="text" class="input" autocomplete="off" maxlength="30" id="user_id_txt" name="account"/>
                                    <span class="icoClean"></span>
                                </div>
                                <div class="pwdArea">
                                    <span class="icoPwd"></span> <label class="inputTip">请输入登录密码</label>
                                    <input type="password" class="input" autocomplete="off"
                                           oncontextmenu="return false" onpaste="return false"
                                           maxlength="16" id="password_txt"/>
                                    <span class="icoClean"></span>
                                </div>
                                <div id="vcode_area" class="yzimgArea" style='display: none;'>
                                    <span class="icoImg"></span> <label class="inputTip">请输入验证码</label>
                                    <input autocomplete="off" id="vcodetxt" maxlength="4"
                                           type="text" class="imgYzInput input" style="background: none">
                                    <div name="smsVCodeArea" class="yabox">
                                        <img id="verif_codeimg" src="" style="cursor:pointer">
                                    </div>
                                </div>
                                <a href="javascript:void(0)" class="btn btn-default load" id="login">登
                                    录<span class="dotting"><i></i><i></i><i></i> </span> </a>
                                <div class="nav-link clearfix">
                                    <p class="link-left">
                                        没有账号？<a href="/register.do" style="color:#ed6d00">立即注册</a>
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
                                动态密码： <input class="" placeholder='请输入6位数字'/> <span
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
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/js/login.js"></script>

<div style="display:none">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F1287c2225a527abe3386233dd9316f99' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>
</body>
</html>