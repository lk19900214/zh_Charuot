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
                <a class="link"  href="/acc?m=toregemail">
                    <p class="e_ico_link">邮箱账号注册</p>
                    <p class="p_link">常用邮箱注册，方便易记忆</p>
                </a>
            </div>
        </div>
        <!--右侧-->

        <form id="register_frm" method="post" action="/acc">
            <div class="rightMain">
                <div class="right_wrapper">
                    <div class="t_line">
                        <div class="l_list wone_zc1">手机号码：</div>
                        <div class="r_list wtwo_zc1">
                            <div class="input_text"><input id="useraccount" name="useraccount" value="" type="input" maxlength="11" class="dis-ime-mode"></div>
                            <div id="useraccountTip"></div>
                        </div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">设置密码：</div>
                        <div class="r_list wtwo_zc1 init_lineheight">
                            <div class="input_text"><input id="password" name="password" kztype="pwd" maxlength="16" type="password" class="password_adv" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false" autocomplete="off"></div>
                            <div id="passwordTip"></div>
                        </div>
                    </div>

                    <div class="t_line">
                        <div class="l_list wone_zc1">确认密码：</div>
                        <div class="r_list wtwo_zc1">
                            <div class="input_text"><input id="password2" name="password2" maxlength="18" type="password" onpaste="return false" oncontextmenu="return false" oncopy="return false" oncut="return false"></div>
                            <div id="password2Tip"></div>
                        </div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">验证码：</div>
                        <div class="r_list wtwo_zc1" style="position:relative;">
                            <div class="input_text"><input id="vcode" name="vcode" type="text" class="dis-ime-mode" maxlength="6"></div>
                            <input type="button" id="sms_code_btn" value="获取验证码" class="txtCenter getVali">
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
                                <div class="input_text"><input id="realname" type="text" maxlength="50" name="realname"></div>
                                <div id="realnameTip"></div>
                            </div>
                        </div>
                        <div class="t_line">
                            <div class="l_list wone_zc1">邮箱号：</div>
                            <div class="r_list wtwo_zc1">
                                <div class="input_text"><input id="personid" type="text" maxlength="18" name="personid"></div>
                                <div id="personidTip"></div>
                            </div>
                        </div>
                    </div>
                    <div class="t_line">
                        <div class="l_list wone_zc1">&nbsp;</div>
                        <div class="r_list wtwo_zc2"><a id="submit_btn" class="btn_10"><span>提交注册</span></a></div>
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
                        <a id="accimgcodebtn" style="cursor:pointer" class="btn_10" eln="next_btn_el"><span class="fsdx">发送短信验证码</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://stc2.kongzhong.com/passport/v2/js/jquery.js?version=2017091401"></script>
<script type="text/javascript" src="https://stc2.kongzhong.com/passport/v2/js/formValidator-4.1.3.js?version=2017091401"></script>
<script type="text/javascript" src="https://stc2.kongzhong.com/passport/v2/js/kzpassport.js?version=2017091401"></script>
<script type="text/javascript">
    /*$("#acc_imgcode").click(function(){
        $("#acc_imgcode").attr("src","/ajax/imgcode/sms?timesamp="+Math.random());
    });*/
    $("#sms_code_btn").click(function(){
        //kztype="fsyzm phone reg useraccount"
        var phone=$("#useraccount").val();
        if(phone!=""){
            if($("#useraccountTip").find(".info_cur_erro").length>0){
                return false;
            }
        }else{
            $.formValidator.showTips($("#useraccountTip"),"err",tips.phone.err_null);
            return false;
        }
     /*   $("#vcode_txt").val("");
        //$("#accimgcodeTip").text("请填写验证码");
        $("#acc_imgcode").click();
        $.KzShowForm({
            url:"tanc_sj",
            width:265,
            height:145,
            contentType:"div"
        })*/
    });
    $("#accimgcodebtn").click(function(){
        var phone=$("#useraccount").val();
        var imgcode=$("#vcode_txt").val();
        if(imgcode==""){
            $("#accimgcodeTip").text("图片验证码未填写");
        }
        //异步发送
        $.ajax({
            type:'get',
            url:"/ajax/regsmscode?t="+Math.random(),
            data:{imgcode:imgcode,phone:phone,bdFlag:"0"},
            dataType : 'json',
            success:function(data){
                switch(data.result){
                    case "imgcodeerr":{
                        $("#accimgcodeTip").text("图片验证码错误！");
                        $("#acc_imgcode").click();
                    }break;
                    case "phoneerr":{
                        $.KzShowForm.removeBox();
                        $.formValidator.showTips($("#useraccountTip"),"err","手机号码格式错误");
                    }break;
                   /* case "onblack":case "error":{
                    $.KzShowForm.removeBox();
                    $.formValidator.showTips($("#useraccountTip"),"err","发送失败");
                }break;*/
                    /*case "reged":{
                        $.KzShowForm.removeBox();
                        $.formValidator.showTips($("#useraccountTip"),"err","此手机号操作频繁");
                    }break;
                    case "success":{
                        $.KzShowForm.removeBox();
                        var obj=$("#sms_code_btn");
                        obj.attr("disabled","disabled").attr("send","ok");
                        obj.val("(59秒)后重新获取");
                        var s=58;
                        var Interval= setInterval(function(){

                            obj.val("("+s+"秒)后重新获取");
                            s--;
                            if(s==0){
                                obj.val("重新获取验证码").removeAttr("disabled");
                                clearInterval(Interval);
                            }
                        },1000);
                        $.formValidator.showTips($("#vcodeTip"),"focus","短信验证码已发送");
                    }break;*/
                }
            },
            error:function(){
                $.KzShowForm.removeBox();
                $.formValidator.showTips($("#vcodeTip"),"err",tips.smscode.err_send);
            }
        });

    });

    $.formValidator.initConfig({errorFocus:false,formID:"register_frm",submitOnce:true,forcevalid:false,errorfocus:false,buttonID:"submit_btn"});
    $("#useraccount").formValidator({onFocus:tips.phone.f}).inputValidator({empty:{leftEmpty:false,rightEmpty:false,emptyError:tips.account.err_kongge}}).regexValidator({regExp:"mobile",dataType:"enum",onError:tips.phone.err,onErrorEmpty:tips.phone.err_null}).ajaxValidator({
        url:"/ajax/regcheckphone",
        dataType : "json",
        async : true,
        data:{bdFlag:"0", "phone":function(){return $("#useraccount").val();}},
        success:function(data){
            if(data!="1"){
                return "此手机号码已被注册，<a target=\"_blank\" class=\"fblue\" href=\"/pwdback/pwdmobileback/pwdback_mobile\">点击这里找回密码</a>";
            }
            return true;
        },
        onError:tips.phone.err_reg
    });
    $("#password").formValidator({onFocus:tips.pwd.f}).inputValidator({min:6,max:16,empty:{leftEmpty:false,rightEmpty:false,emptyError:tips.pwd.err_kongge},onError:tips.pwd.err,onErrorEmpty:tips.pwd.err_null}).regexValidator({regExp:"pwd",dataType:"enum",onError:tips.pwd.err,onErrorEmpty:tips.pwd.err_null});
    $("#password2").formValidator({onFocus:tips.rpwd.f}).inputValidator({min:6,max:16,empty:{leftEmpty:false,rightEmpty:false,emptyError:tips.rpwd.err_kongge},onError:tips.pwd.err,onErrorEmpty:tips.rpwd.err_null}).regexValidator({regExp:"pwd",dataType:"enum",onError:tips.rpwd.err,onErrorEmpty:tips.rpwd.err_null}).compareValidator({desID:"password",operateor:"=",onError:tips.rpwd.err});

    $("#vcode").formValidator({onFocus:function(){
        if($("#sms_code_btn").attr("send")){
            return tips.smscode.f_after;
        }else{
            return tips.smscode.f_befor;
        }
    }}).inputValidator({min:6,max:6,onError:tips.smscode.err,onErrorEmpty:tips.smscode.err_null}).ajaxValidator({
        url:"/ajax/chksmscode/reg",
        dataType : "json",
        async : false,
        data:{"phone":function(){return $("#useraccount").val();},"code":function(){return $("#vcode").val();}},
        success:function(data){
            if(data!="1"){
                return tips.smscode.err;
            }
            return true;
        },
        onError:tips.smscode.err
    });
    $("#realname").formValidator({onFocus:tips.realname.f}).regexValidator({regExp:"realname",dataType:"enum",onError:tips.realname.err,onErrorEmpty:tips.realname.err_null});
    $("#personid").formValidator({onFocus:tips.identityNum.f}).functionValidator({fun:function(){
        if($("#realname").val()!=""&&$("#personid").val()==""){
            return tips.identityNum.err_null;
        }
        if($("#personid").val()!=""){
            return isCardID($("#personid").val());
        }
        return "null";
    }}).ajaxValidator({
        dataType : "text",
        data:{"idcard":function(){return $("#personid").val();}},
        url:"/ajax/checkIdCard",
        success:function(d){
            switch(d){
                case "-15":
                    tips.msg="邮箱帐号已经被占用，请换一个邮箱帐号进行重试！";
                    break;
                case "-16":
                    tips.msg="邮箱格式不正确！";
                    break;
                default:
                    return true;
                    break;
            }
            return tips.msg;
        },
        onError:function(){return tips.msg||"服务器校验失败"}
    });
    $("#agreement_chk").formValidator({onFocus:"null",onCorrect:"null"}).functionValidator({fun:function(){
        if(!$("#agreement_chk").attr("checked")){
            return tips.rule.err;
        }
        return true;
    }});
    var err_fieldjs = "";
    var err_val_js = "";
    if(err_fieldjs != ""){
        $.formValidator.showTips ($("#"+err_fieldjs),"err",err_val_js);

        //显示实名认证区域
        $("#Approve").removeClass().addClass("block");
        $("#sfzTab").addClass("open");
    }
    $("#sfzTab").live("click",function(){
        if($("#Approve").attr("class")=="dnone"){
            $("#Approve").removeClass().addClass("block");
            $("#sfzTab").addClass("open");
        }else{
            $("#Approve").removeClass().addClass("dnone");
            $("#sfzTab").removeClass("open");
        }
    });
    var isSubmit = false;
    $(function(){
        $('#submit_btn').click(function(){
            if(isSubmit == false){
                isSubmit = true;
                window.setTimeout("f_setSubmitFlag(false)", 3000);
                $('#register_frm').submit();
            }
        });
    });

    function f_setSubmitFlag(flag){
        isSubmit = flag;
    }
</script>
</body>
</html>