<%@page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>用户注册</title>
    <link type="text/css" rel="stylesheet" href="../../css/base.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/register.css"/>
    <script src="../../js/detectmobilebrowser.js"></script>
    <!--[if lte IE 6]>
   <script src="js/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div,span,img,li,.tabs a,.tabs p');
    </script>
    <![endif]-->
    <style>

        body,div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote,li,ul{margin:0;padding:0;}
        body{background:#FFF; font:12px;}
        a{text-decoration:none; font-size:12px;}
        ul li{ list-style-type:none}
        .cl{clear:both}
        .tc_sj{ width:265px; height:145px; background:#FFFFFF;position:absolute;z-index:100000;boverflow:hidden}
        .tc_sj h3{ height:16px; width:90%; position:absolute; z-index:9999; top:15px; right:20px;}
        .tc_sj h3 a.close{  float:right; background:url(https://stc2.kongzhong.com/passport/v2/img/ov1.png) no-repeat; width:10px; height:10px; display:block;}
        .ts_yy{ position:absolute; top:80px; left:36px; font-size:12px; color:#FF0000;}
        img{ display:block;}

        .login{padding:40px 0 0px; height:50px;  overflow:hidden; width:100%;}
        .login li{float:left; margin-top:5px; }
        .login li label,.login li input{ float:left; width:55px;}
        .login li label{ width:82px; font-family:"宋体"; font-size:12px; text-align:right; height:26px; line-height:26px; color:#666666;}
        .login li input{ border:1px solid #CCCCCC; height:24px; line-height:24px; margin-right:10px; display:inline-block;}
        .login li em{ float:left; margin-left:6px; display:inline-block; margin-top:6px; width:15px; height:15px;}
        .popbot{ margin:10px 0 0 34px; background:url(https://stc2.kongzhong.com/passport/v2/img/bt1.jpg) no-repeat; float:left; display:inline; width:198px; text-align:center; height:31px; line-height:31px; color:#fff;}
        .popbot a.bot{ display:block; width:100%; height:100%; background: none;}


    </style>
</head>
<body class="regbg">
<div class="reg_main">
    <!--头部-->
    <div class="reg_main_header">
        <div class="reg_logo"></div>
        <div class="info">已有空中网账号，立即<a href="/login">登录</a>&nbsp;|&nbsp;<a target="_blank" href="http://www.kongzhong.com/">返回首页</a></div>
    </div>
    <!--内容-->
    <div class="reg_main_content">
        <!--左侧-->
        <div class="left_main">
            <span class="reg_left_tip"></span>
            <div class="tabs">
                <a class="click" href="/acc?m=toregphone">
                    <p class="m_ico_click">手机账号注册</p>
                    <p class="p_link">独享手机靓号，安全有保障</p>
                </a>
              <%--  <a class="link"  href="/acc?m=toregemail">
                    <p class="e_ico_link">邮箱账号注册</p>
                    <p class="p_link">常用邮箱注册，方便易记忆</p>
                </a>--%>
            </div>
        </div>
        <!--右侧-->

        <form id="register_frm" method="post" action="/insert.do">
            <div class="rightMain">
                <div class="right_wrapper">
                    <div class="t_line">
                        <div class="l_list wone_zc1">用户名：</div>
                        <div class="r_list wtwo_zc1">
                            <div class="input_text">
                                <input id="useraccount" name="uName" type="input" maxlength="11" class="dis-ime-mode" onblur="userNname()">
                            </div>
                            <div id="useraccountTip"></div>
                        </div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">设置密码：</div>
                        <div class="r_list wtwo_zc1 init_lineheight">
                            <div class="input_text"><input id="password" name="uPassword"  maxlength="16" type="password" class="password_adv" onblur="userPassword()" ></div>
                        <div id="passwordTip"></div>
                        </div>
                    </div>

                    <div class="t_line">
                        <div class="l_list wone_zc1">确认密码：</div>
                        <div class="r_list wtwo_zc1">
                            <div class="input_text"><input id="password2" name="password2" maxlength="18" type="password" onblur="userPassword1()"></div>
                            <div id="password2Tip"></div>
                        </div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">验证码：</div>
                        <div class="r_list wtwo_zc1" style="position:relative;">
                            <div class="input_text">
                                <input id="vcode" name="vcode" type="text" class="dis-ime-mode" maxlength="4" style="width: 100px" onblur="yan()">
                            </div>
                             <img src="/checkm.do"  class="txtCenter getVali" title="看不清换一张" onclick="this.src='/checkm.do?'+new Date()">
                            <div id="vcodeTip"></div>
                        </div>
                    </div>
                    <div class="reg_line">
                        <p class="zc_sfz"><span class="fleft">根据《网络游戏管理暂行办法》关于实名注册的规定，请正确填写您的真实姓名与身份证号码</span></p>
                    </div>
                    <div id="Approve">
                        <div class="t_line">
                            <div class="l_list wone_zc1">真实姓名：</div>
                            <div class="r_list wtwo_zc1">
                                <div class="input_text"><input id="realname" type="text" maxlength="50" name="uRealname" onblur="realName()"></div>
                                <div id="realnameTip"></div>
                            </div>
                        </div>
                        <div class="t_line">
                            <div class="l_list wone_zc1">邮箱号：</div>
                            <div class="r_list wtwo_zc1">
                                <div class="input_text"><input id="mail" type="text" maxlength="18" name="uMail" onblur="userMail()"></div>
                                <div id="mailTip"></div>
                            </div>
                        </div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">&nbsp;</div>
                        <div class="r_list wtwo_zc2"><a href="javaScript:void(0)" id="submit_btn" class="btn_10" ><span>提交注册</span></a></div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">&nbsp;</div>
                        <div class="r_list wtwo succ_send">
                            <input id="agreement_chk" type="checkbox" checked class="fleft mr15">
                            <span>我接受</span><span class="fblue">《</span><a href="/rules.jsp" target="_blank" class="fblue">空中网用户注册协议</a><span class="fblue">》</span><div id="agreement_chkTip"></div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="original" id="original" value="1" />
            <input type="hidden" name="source" id="source" value="" />
            <input type="hidden" name="regType" id="regType"  value="phone"/>
            <input type="hidden" name="m" id="m"  value="toregphone"/>
        </form>
    </div>
</div>
<!--底部信息-->

<div class="reg_footbox">
    <p><span>COPYRIGHT&nbsp;&copy;&nbsp;1998 &ndash; 2017 ZHANCHE. ALL RIGHTS RESERVED. </span>空中网版权所有</p>
    <p>豫ICP证020001号&nbsp;豫网文[2011]0467&ndash;160号&nbsp;经营许可证编号:B2&ndash;20090197</p>
</div>

<div style="display:none">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F1287c2225a527abe3386233dd9316f99' type='text/javascript'%3E%3C/script%3E"));
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "s95.cnzz.com/z_stat.php%3Fid%3D1261752285%26web_id%3D1261752285' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>

<div id="tanc_sj" style="display: none;">
    <div class="pop_box tanc_pop">
        <div class="pop_box_con" >
            <h2><a  class="pop_close" href="javascript:$.KzShowForm.removeBox();"></a><span>请输入图片验证码</span></h2>
            <div class="biaobox">
                <div class="tablebox">
                    <div class="t_line">
                        <div class="r_list wtwo"><input type="text" kztype="captcha" class="input_text" maxlength="4" name="vcode" id="vcode_txt" style="color: rgb(153, 153, 153);"><img src="/ajax/imgcode/sms?w=80&amp;h=30&amp;t=0.9537201603974046" id="acc_imgcode" class="fleft">
                        </div>
                    </div>
                    <div class="ts_text" id="accimgcodeTip"></div>
                    <div class="t_line">
                        <a id="accimgcodebtn" style="cursor:pointer" class="btn_10" eln="next_btn_el"><span class="fsdx">获取验证码</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../js/jquery-3.2.1.min.js?version=2017091401"></script>
<script src="../../js/register.js"></script>
<script type="text/javascript">

</script>
</body>
</html>