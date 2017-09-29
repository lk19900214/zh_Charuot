<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>个人信息-军武游戏商城</title>
    <meta name="keywords" content="军武游戏商城,军武游戏,空中网,战争三部曲商城,特惠商城,坦克世界,战舰世界,装甲风暴">
    <meta name="description" content="军武游戏商城,空中网自营的军武游戏道具礼包销售商城，其中包括坦克世界、战舰世界等空中网旗下游戏产品">
    <meta name="format-detection" content="address=no">
    <meta name="format-detection" content="telephone=no">
    <link href="/css/com.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/config.js" charset="UTF-8"></script>
    <script type="text/javascript">

        $(function(){
            queryGifBags();//加载时候礼包领取记录查询
            //选中单选或复选框
            var checked = $("#sexs").val();//获取隐藏值得性别
            if(checked == 1){
                $("#sex_0").attr({
                    checked:"checked"
                });
            }
            if(checked == 0){
                $("#sex_1").attr({
                    checked:"checked"
                });
            }
            //获取省市区
            provinceChildren();
            $('#province').bind("change",cityChildren);
            $('#city').bind("change", countryChildren);
            //点击可移除原来的内容
            $("#city").click(function(){
                $("#Cid").remove();
            });
            $("#country").click(function(){
                $("#Qid").remove();
            });
            //生日的年月日
            $.ms_DatePicker();
            //编辑昵称弹层
            $(".alertNikeName").click(function(){
                var isAct=true;
                var showStr = '';
                $.ajax({
                    url : "../MemberController/checkTankState",//检查坦克激活状态
                    async : false,
                    dataType : "json",
                    cache : false,
                    success : function(data) {
                        if (data=='0'){
                            showTsInfo("smTs","修改昵称","<p class='center'><span><em class='css-sp errorIcon'></em>未激活坦克世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a> !</span></p>");
                            $(document).on("click",".close",closeDiv);
                            isAct=false;
                            return;
                            //showDiv(31);
                            //isAct=false;
                            //return;
                        }else if(data == '-4'){
                            showTsInfo("smTs","修改昵称","<ul class='tsList'><li></li><li class='tsI'><span><em class='css-sp errorIcon'></em>您尚未登录，请速去<a target='_blank' href='"+___mall_passport_url+"/login?backurl="+___mall_kongzhong_url+"'>登录</a>!</span></li></ul>",function(){
                                location.reload();
                            });
                            isAct=false;
                            return false;
                            //showDiv(26);
                            //isAct=false;
                            //return false;
                        }
                    }
                });
                if (isAct) {
                    $.ajax({
                        url : "../MemberController/checkNickState",//检查坦克昵称状态
                        async : true,
                        dataType : "json",
                        cache : false,
                        success : function(data) {
                            if (data == "4") {
                                //showTsInfo("smTs","修改昵称","<ul class='tsList'><li>当前昵称：灬爱你在眼前</li><li class='tsI'><span><em class='css-sp errorIcon'></em>您的修改昵称正在审核中...</span></li></ul>");
                                showTsInfo("smTs","修改昵称","<p class='center centerLine'>当前昵称：灬爱你在眼前<br/><span><em class='css-sp errorIcon'></em>您已经修改过昵称，我们正在审核中...</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else if (data == "-4") {
                                showTsInfo("smTs","修改昵称","<ul class='tsList'><li></li><li class='tsI'><span><em class='css-sp errorIcon'></em>您尚未登录，请先登录再修改昵称！</span></li></ul>",function(){
                                    location.reload();
                                });
                                //alert('请您先登录或者刷新本页面获取修改状态');
                                //showDiv(26);
                            }else if (data == "1") {
                                showTsInfo("smTs","修改昵称","<ul class='tsList'><li>当前昵称：灬爱你在眼前</li><li>　新昵称：<input name='newNikeName' id='newNikeName' onblur='checkNick();' type='text'></li><li class='tsI'><span id='showstateId'></span></li></ul><div class='tsBtn btnMts'><a href='javascript:changMyNickName();'>修改昵称</a></div>");
                                $(document).on("click",".close",closeDiv);
                                //document.getElementById('resultStateId').innerHTML = "昵称已经修改成功";
                            }else if (data == "3") {
                                showTsInfo("smTs","修改昵称","<ul class='tsList'><li>当前昵称：灬爱你在眼前</li><li class='tsI'><span><em class='css-sp errorIcon'></em>昵称修改失败,请联系客服！</span></li></ul>",function(){
                                    location.reload();
                                });
                                //document.getElementById('resultStateId').innerHTML = "修改失败,请联系客服！";
                            }
                        }
                    });
                }
            })
            //修改手机号
            $(".alertMobile").click(function(){
                showTsInfo("phoneTs","修改联系手机","<ul class='stepPhoneChange clearfloat'><li class='on on1'><span>1</span>验证手机<b></b><i></i></li><li><span>2</span>修改新手机号<b></b><i></i></li><li><span>3</span>更换完成</li></ul><ul class='tsList'><li class='pT'><span>系统提示：</span>更换新联系手机前，系统需要对您的手机号进行验证。</li><li><span class='sp_l2'>手机号码：</span></li><li class='yzm'><span class='sp_l'>短信验证码：</span><div class='get_r'><span name='showSMSCode' class='bot' style='cursor:pointer' onclick='javascript:getImg();'>获取验证码</span><p class='p_con'><input type='text' maxlength='4' class='oldImgCode' onfocus='replaceON()' name=''><a id='send1' href='javascript:getMobileCode();'>确定发送</a></p><div name='smsVCodeArea' class='yabox'><img onclick='getImgCode();' src='"+___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random()+"'><a onclick='replaceOff();'>关闭</a></div><p class='yzmcon'><input name='' id='Mobilekey' onblur='validateMobileCode();' maxlength='6' type='text'></p></div></li><li class='tsI'><span id='shuaxin'></span></li></ul><div class='tsBtn'><a class='nextMobileCode' href='javascript:nextMobileCode();'>下一步</a></div>");
                $(document).on("click",".close",closeDiv);
            })
            //是否绑定手机号
            $(".isBindMobile").click(function(){
                showTsInfo("phoneTs","绑定联系手机","<ul class='stepPhoneChange step2 clearfloat'><li class='on on1'><span>1</span>绑定手机号<b></b><i></i></li><li><span>2</span>绑定完成</li></ul><ul class='tsList'><li class='pT'><span>系统提示：</span>绑定新联系手机前，系统需要对您的手机号进行验证。</li><li><span class='sp_l2'>手机号码：</span><input name='' id='isNewMobile'  onblur='newBindValidate();' type='text' maxlength='11'></li><li class='yzm'><span class='sp_l'>短信验证码：</span><div class='get_r'><span name='showSMSCode' class='bot' style='cursor:pointer' onclick='javascript:newGetImg();'>获取验证码</span><p class='p_con'><input type='text' class='newImgCode' maxlength='4' onfocus='replaceON()' name=''><a id='send3' href='javascript:isNewSnedSmsVerificationCode();'>确定发送</a></p><div name='smsVCodeArea' class='yabox'><img id='newcodeImg' onclick='newgetImgCode();'><a onclick='replaceOff();'>关闭</a></div><p class='yzmcon'><input name='' id='isNewMobileKey' onblur='newBindMobile();' maxlength='6' type='text'></p></div></li><li class='tsI'><span id='isNewMoileMsg'></span></li></ul><div class='tsBtn'><a href='javascript:newGetIsBindSmsCode();'>下一步</a></div>");
                $(document).on("click",".close",closeDiv);
            })
        });
        //绑定手机时获得放入缓存中的验证码，并且判断手机的可用性
        function newGetIsBindSmsCode(){
            var newMobileCode = $.trim($("#isNewMobileKey").val());
            var newMobile = $.trim($("#isNewMobile").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var remobile = reg.test(newMobile);
            var resmobile = regs.test(newMobile);
            var newImgCode = $(".newImgCode").val();
            if(newMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(resmobile==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(remobile==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newImgCode=="") {
                showStr = showStr + '图片验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newImgCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '图片验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            //新手机验证码的验证
            var regcodes = /^\d{6}$/;
            var rescode = regcodes.test(newMobileCode);
            if(newMobileCode=="") {
                showStr = showStr + '短信验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newMobileCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '短信验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newMobileCode==0){
                showStr = showStr + '短信验证码错误！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(rescode==false){
                showStr = showStr + '短信验证码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            var sdata = {
                'newMobileCode':newMobileCode,
                'newMobile':newMobile
            };
            $.ajax({
                dataType:"json",
                type:"get",
                data:sdata,
                url:"/MemberController/newGetIsBindSmsCode",
                success:function(data){
                    if(data==1){
                        var sdata = {
                            'mobile':newMobile,
                            'validateCode':newMobileCode
                        }
                        $.ajax({
                            dataType:"json",
                            type:"get",
                            data:sdata,
                            url:"/MemberController/updateNewMobile",
                            success:function(data){
                                if(data.mobileResult==1){
                                    showTsInfo("phoneTs","绑定联系手机","<ul class='stepPhoneChange step2 clearfloat'><li class='on on1'><span>1</span>绑定手机号<b></b><i></i></li><li class='on on2'><span>2</span>绑定完成</li></ul><p class='pDone'>您的联系手机"+data.mobile+"，已经绑定成功！</p><div class='tsBtn'><a href='javascript:closeDivState();'>关&nbsp;&nbsp;闭</a></div>",function(){
                                        location.reload();
                                    });
                                }
                                if(data.mobileResult==0){
                                    showTsInfo("phoneTs","绑定联系手机","<ul class='stepPhoneChange step2 clearfloat'><li class='on on1'><span>1</span>绑定手机号<b></b><i></i></li><li class='on on2'><span>2</span>绑定完成</li></ul><p class='pDone'>您的联系手机"+data.mobile+"，绑定失败！</p><div class='tsBtn'><a href='javascript:closeDivState();'>关&nbsp;&nbsp;闭</a></div>",function(){
                                        location.reload();
                                    });
                                }
                            }
                        });
                    }
                    if(data==3){
                        showStr = showStr + '您的手机号已经绑定账号！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }
                    if(data==4){
                        showStr = showStr + '短信验证码错误！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }
                    if(data==5){
                        showStr = showStr + '您的手机号已经绑定账号！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }
                    if(data==0){//如果失败则在原弹层
                        showStr = showStr + '短信验证码错误！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }
                }
            });
        }
        //根据编号获得省
        function provinceChildren(){
            var provinces = 10000;//省份信息
            $.ajax({
                dataType:"json",
                type:"get",
                data:'parentid='+provinces,
                url:"/MemberController/directChildren",
                success:function(data){
                    for(var one in data){//循环放入省
                        var name = data[one].name;
                        var code = data[one].id;
                        $("#province").append("<option value="+code+">"+name+"</option>");
                    }
                }
            });
        }
        //根据省获得市
        function cityChildren(){
            $("#city").html("");//清空之前select列表的信息
            $("#country").html("");
            var province = $("#province").val();
            $.ajax({
                dataType:"json",
                type:"get",
                data:'parentid='+province,
                url:"/MemberController/directChildren",
                success:function(data){
                    for(var one in data){
                        var name = data[one].name;
                        var code = data[one].id;
                        $("#city").append("<option value="+code+">"+name+"</option>");
                    }
                    var selectize = $("#city").val();
                    countryChildren(selectize);
                }
            });
        }
        //根据市获得县
        function countryChildren(){
            $("#country").html("");//清空之前select列表的信息
            var city = $("#city").val();
            $.ajax({
                dataType:"json",
                type:"get",
                data:'parentid='+city,
                url:"/MemberController/directChildren",
                success:function(data){
                    for(var one in data){
                        var name = data[one].name;
                        var code = data[one].id;
                        $("#country").append("<option value="+code+">"+name+"</option>");
                    }
                }
            });
        }
        //jquery获取复选框值  获取男女值
        function jqchk(){
            var chk_value =[];
            $('input[name="sex"]:checked').each(function(){
                chk_value.push($(this).val());
            });
            return chk_value;
        }
        //保存个人信息
        function updatePerMsg(){
            var sexed = jqchk();
            var a = sexed[0];
            var name = $("#name").val();//真实姓名
            var checked = a;//男和女的值
            var province = $("#province").val();//省
            var city = $("#city").val();//市
            var country = $("#country").val();//区县
            var address = $("#address").val();//具体地址
            var sel_year = $("#sel_year").val();//生日年
            var sel_month = $("#sel_month").val();//生日月
            var sel_day = $("#sel_day").val();//生日天
            var sdata = {
                'name':name,
                'sex':checked,
                'province':province,
                'city':city,
                'country':country,
                'address':address,
                'birthdayYear':sel_year,
                'birthdayMonth':sel_month,
                'birthdayDay':sel_day
            };
            $.ajax({
                dataType:"json",
                type:"get",
                data:sdata,
                url:"/MemberController/updatePerMsg",
                success:function(data){
                    if(data==9999){
                        showTsInfo("smTs","提示","<p class='center'>保存个人信息成功！</p>",function(){location.reload();
                        });
                    }
                    if(data==-200000){
                        showTsInfo("smTs","提示","<p class='center'>保存个人信息失败！</p>",function(){location.reload();
                        });
                    }
                }
            });
        }
        //领取礼包插入数据库
        function saveGifBag(){
            $.ajax({
                dataType:"json",
                type:"get",
                url:"/MemberController/saveGifBag?t="+new Date().getTime(),
                success:function(data){
                    if(data.msgResult==0){
                        showTsInfo("smTs","提示","<p class='center'>礼包已经发送，请耐心等待到账</p>",function(){location.reload();
                        });
                    }
                    if(data.msgResult==1){
                        showTsInfo("smTs","提示","<p class='center'>礼包已经发送成功</p>",function(){location.reload();
                        });
                    }
                    if(data.msgResult==2){
                        showTsInfo("smTs","提示","<p class='center'>礼包已经发送失败</p>",function(){location.reload();
                        });
                    }
                }
            });
        }
        //加载首页查询礼包领取记录
        function queryGifBags(){
            $.ajax({
                dataType:"json",
                type:"get",
                url:"/MemberController/queryGifBags?t="+new Date().getTime(),
                success:function(data){
                    if(data.msgResult==9999){
                        var getGifBag = document.getElementById('getGifBag');
                        getGifBag.style.display = 'inline-block';
                    }
                }
            });
        }
        //获取新验证新手机号码
        function newGetImg(){
            var isNewMobile = $.trim($("#isNewMobile").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(isNewMobile);
            var res = regs.test(isNewMobile);
            if(isNewMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            $(".p_con").show();
            $(".yabox").show();
            $(".bot").hide();
            $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
        }
        function newGetImgS(){
            var newMobile = $.trim($("#newMobile").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(newMobile);
            var res = regs.test(newMobile);
            if(newMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==true){
                showStr = showStr+''
                $("#newMoileMsg").html(showStr);
            }
            $(".p_con").show();
            $(".yabox").show();
            $(".bot").hide();
            $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
        }
        //绑定手机点击从新获取图片验证码
        function newgetImgCode(){
            var isNewMobile = $.trim($("#isNewMobile").val());
            $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
        }
        //更换手机时候新手机获得新图片验证码
        function newgetImgCodeS(){
            var newMobile = $.trim($("#newMobile").val());
            $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
        }
        //旧手机获取图形验证码判断
        function getImg(){
            $(".p_con").show();
            $(".yabox").show();
            $(".bot").hide();
        }
        function replaceOff(){
            $(".yabox").hide();
        }
        function replaceON(){
            $(".yabox").show();
        }
        //更换手机点击从新获取图片验证码;
        function getImgCode(){
            $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
        }
        //修改时获取旧手机验证码
        function getMobileCode(){
            var oldImgCode = $(".oldImgCode").val();
            var showStr = '';
            if(oldImgCode=="") {
                showStr = showStr + '图片验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(oldImgCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '图片验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            $.ajax({
                dataType:"json",
                type:"get",
                data:'oldImgCode='+oldImgCode,
                url:"/MemberController/snedSmsVerificationCode?t="+new Date().getTime(),
                success:function(data){
                    if(data==1){
                        var time = 60;
                        $('#send1').html("");
                        function timeCountDown(){
                            if(time==0){
                                clearInterval(timer);
                                $("#send1").attr("class","");
                                $("#send1").attr("href","javascript:getMobileCode();");
                                $('#send1').html("确定发送");
                                $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
                                return true;
                            }
                            $("#send1").removeAttr("href");
                            $("#send1").attr("class","noclick");
                            $('#send1').html(time+"s");
                            time--;
                            return false;
                        }
                        $('#send1').html("");
                        timeCountDown();
                        var timer = setInterval(timeCountDown,1000);
                        $(".yabox").hide();
                        if(data==1){
                            showStr = showStr + '短信验证码已发送';
                            $("#shuaxin").html(showStr);
                            return;
                        }
                    }else if(data==-1){
                        $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
                        showStr = showStr + '图片验证码不正确！';
                        $("#shuaxin").html(showStr);
                        return;
                    }else if(data==6){
                        $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
                        showStr = showStr + '图片验证码不正确！';
                        $("#shuaxin").html(showStr);
                        return;
                    }else if(data==10){
                        $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
                        showStr = showStr + '此手机号操作频繁！';
                        $("#shuaxin").html(showStr);
                        return;
                    }else if(data==2){
                        $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
                        showStr = showStr + '此手机号操作频繁！';//60秒内
                        $("#shuaxin").html(showStr);
                        return;
                    }else{
                        $(".yabox img").attr("src", ___mall_kongzhong_url+"/GetCodeController/replace/imgcode/sms?w=80&h=30&"+Math.random());
                        showStr = showStr + '请稍后再试！';
                        $("#shuaxin").html(showStr);
                        return;
                    }
                }
            });
        }
        //修改时获取新手机验证码
        function newSnedSmsVerificationCode(){
            var newMobile = $.trim($("#newMobile").val());
            var showStr = '';
            //修改手机时候发送验证码
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(newMobile);
            var res = regs.test(newMobile);
            var newImgCode = $(".newImgCode").val();
            if(newImgCode=="") {
                showStr = showStr + '图片验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newImgCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '图片验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            var sdata = {
                'newMobile':newMobile,
                'newImgCode':newImgCode
            };
            $.ajax({
                dataType:"json",
                type:"get",
                data:sdata,
                url:"/MemberController/newSnedSmsVerificationCode?t="+new Date().getTime(),
                success:function(data){
                    if(data==1){
                        var time = 60;
                        $('#send2').html("");
                        function timeCountDown(){
                            if(time==0){
                                clearInterval(timer);
                                $("#send2").attr("class","");
                                $("#send2").attr("href","javascript:newSnedSmsVerificationCode();");
                                $('#send2').html("确定发送");
                                $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                                return true;
                            }
                            $("#send2").removeAttr("href");
                            $("#send2").attr("class","noclick");
                            $('#send2').html(time+"s");
                            time--;
                            return false;
                        }
                        $('#send2').html("");
                        timeCountDown();
                        var timer = setInterval(timeCountDown,1000);
                        $(".yabox").hide();
                        if(data==1){
                            showStr = showStr + '短信验证码已发送';
                            $("#newMoileMsg").html(showStr);
                            return;
                        }
                    }else if(data==2){
                        $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '此手机号操作频繁！';//60秒内
                        $("#newMoileMsg").html(showStr);
                        return;
                    }else if(data==5){
                        $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '您的手机号已经绑定账号！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }else if(data==-1){
                        $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '图片验证码不正确！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }else if(data==6){
                        $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '图片验证码不正确！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }else if(data==10){
                        $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '此手机号操作频繁！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }else{
                        $("#newcodeImgS").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+newMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '请稍后再试！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }
                }
            });
        }
        //绑定手机时候发送验证码
        function isNewSnedSmsVerificationCode(){
            $("#isNewMoileMsg").html("");
            var isNewMobile = $.trim($("#isNewMobile").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(isNewMobile);
            var res = regs.test(isNewMobile);
            var newImgCode = $(".newImgCode").val();
            if(newImgCode=="") {
                showStr = showStr + '图片验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(newImgCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '图片验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            var sdata = {
                'newMobile':isNewMobile,
                'newImgCode':newImgCode
            };
            $.ajax({
                dataType:"json",
                type:"get",
                data:sdata,
                url:"/MemberController/newSnedSmsVerificationCode?t="+new Date().getTime(),
                success:function(data){
                    if(data==1){
                        var time = 60;
                        $('#send3').html("");
                        function timeCountDown(){
                            if(time==0){
                                clearInterval(timer);
                                $("#send3").attr("class","");
                                $("#send3").attr("href","javascript:isNewSnedSmsVerificationCode();");
                                $('#send3').html("确定发送");
                                $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                                return true;
                            }
                            $("#send3").removeAttr("href");
                            $("#send3").attr("class","noclick");
                            $('#send3').html(time+"s");
                            time--;
                            return false;
                        }
                        $('#send3').html("");
                        timeCountDown();
                        var timer = setInterval(timeCountDown,1000);
                        $(".yabox").hide();
                        if(data==1){
                            showStr = showStr + '短信验证码已发送';
                            $("#isNewMoileMsg").html(showStr);
                            return;
                        }
                    }else if(data==2){
                        $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '此手机号操作频繁！';//60秒内
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }else if(data==5){
                        $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '您的手机号已经绑定账号！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }else if(data==-1){
                        $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '图片验证码不正确！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }else if(data==6){
                        $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '图片验证码不正确！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }else if(data==10){
                        $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '此手机号操作频繁！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }else{
                        $("#newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+isNewMobile+"}?w=80&h=30&"+Math.random());
                        showStr = showStr + '请稍后再试！';
                        $("#isNewMoileMsg").html(showStr);
                        return;
                    }
                }
            });
        }
        //修改时验证手机到下一步填写新手机
        function nextMobileCode(){
            validateMobileCode();
            var Mobilekey = $.trim($("#Mobilekey").val());
            var reg = /^\d{6}$/;
            var re = reg.test(Mobilekey);
            var showStr = '';
            var oldImgCode = $(".oldImgCode").val();
            if(oldImgCode=="") {
                showStr = showStr + '图片验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(oldImgCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '图片验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(Mobilekey=="") {
                showStr = showStr + '短信验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(Mobilekey.lastIndexOf(" ") != -1) {
                showStr = showStr + '短信验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if (Mobilekey==0) {
                showStr = showStr + '短信验证码错误！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '短信验证码格式不正确！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(re==true){
                showStr = showStr+''
                $("#shuaxin").html(showStr);
            }
            $.ajax({
                dataType:"json",
                type:"get",
                data:'Mobilekey='+Mobilekey,
                url:"/MemberController/getSmsVerificationCode",
                success:function(data){
                    if(data==1){//如果通过则到下一步
                        showTsInfo("phoneTs","修改联系手机","<ul class='stepPhoneChange clearfloat'><li class='on on1'><span>1</span>验证手机<b></b><i></i></li><li class='on on2'><span>2</span>修改新手机号<b></b><i></i></li><li><span>3</span>更换完成</li></ul><ul class='tsList'><li class='pT'><span>系统提示：</span>更换新联系手机前，系统需要对您的手机号进行验证。</li><li><span class='sp_l2'>手机号码：</span><input name='' id='newMobile' onblur='newValidateMobile();' type='text' maxlength='11'></li><li class='yzm'><span class='sp_l'>短信验证码：</span><div class='get_r'><span name='showSMSCode' class='bot' style='cursor:pointer' onclick='javascript:newGetImgS();'>获取验证码</span><p class='p_con'><input type='text' maxlength='4' class='newImgCode' onfocus='replaceON()' name=''><a id='send2' href='javascript:newSnedSmsVerificationCode();'>确定发送</a></p><div name='smsVCodeArea' class='yabox'><img id='newcodeImgS' onclick='newgetImgCodeS();'><a onclick='replaceOff();'>关闭</a></div><p class='yzmcon'><input name='' id='newMobilekey' onblur='newValidateMobileCode();' maxlength='6' type='text'></p><input name='' id='oldMobileKey' value='"+Mobilekey+"' style='display:none'></div></li><li class='tsI'><span id='newMoileMsg'></span></li></ul><div class='tsBtn'><a href='javascript:successMobileCode();'>下一步</a></div>",function(){
                            location.reload();
                        });
                    }
                    if(data==0){//如果失败则在原弹层
                        showStr = showStr + '短信验证码错误！';
                        $("#shuaxin").html(showStr);
                        return;
                    }
                }
            });
        }
        //修改时填写完新手机号码和验证码后执行下一步操作
        function successMobileCode(){
            var newMobile = $.trim($("#newMobile").val());
            var newMobilekey = $.trim($("#newMobilekey").val());
            var oldMobilekey = $.trim($("#oldMobileKey").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(newMobile);
            var res = regs.test(newMobile);
            var newImgCode = $(".newImgCode").val();
            if(newMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newImgCode=="") {
                showStr = showStr + '图片验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newImgCode.lastIndexOf(" ") != -1) {
                showStr = showStr + '图片验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==true){
                showStr = showStr+''
                $("#newMoileMsg").html(showStr);
            }
            //新手机验证码的验证
            var regcodes = /^\d{6}$/;
            var rescode = regcodes.test(newMobilekey);
            if(newMobilekey=="") {
                showStr = showStr + '短信验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobilekey.lastIndexOf(" ") != -1) {
                showStr = showStr + '短信验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if (newMobilekey==0) {
                showStr = showStr + '短信验证码错误！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(rescode==false){
                showStr = showStr + '短信验证码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(rescode==true){
                showStr = showStr+''
                $("#newMoileMsg").html(showStr);
            }
            var sdata = {
                'oldMobilekey':oldMobilekey,
                'newMobile':newMobile,
                'newMobileCode':newMobilekey
            };
            $.ajax({
                dataType:"json",
                type:"get",
                data:sdata,
                url:"/MemberController/newGetSmsVerificationCode",
                success:function(data){
                    if(data==1){
                        var sdata = {
                            'mobile':newMobile,
                            'validateCode':newMobilekey
                        };
                        $.ajax({
                            dataType:"json",
                            type:"get",
                            data:sdata,
                            url:"/MemberController/updateNewMobile",
                            success:function(data){
                                if(data.mobileResult==1){
                                    showTsInfo("phoneTs","修改联系手机","<ul class='stepPhoneChange clearfloat'><li class='on on1'><span>1</span>验证手机<b></b><i></i></li><li class='on on2'><span>2</span>修改新手机号<b></b><i></i></li><li class='on on3'><span>3</span>更换完成</li></ul><p class='pDone'>您的联系手机"+data.mobile+"，已经更换成功！</p><div class='tsBtn'><a href='javascript:closeDivState();'>关 闭</a></div>",function(){
                                        location.reload();
                                    });
                                }
                                if(data.mobileResult==0){
                                    showTsInfo("phoneTs","修改联系手机","<ul class='stepPhoneChange clearfloat'><li class='on on1'><span>1</span>验证手机<b></b><i></i></li><li class='on on2'><span>2</span>修改新手机号<b></b><i></i></li><li class='on on3'><span>3</span>更换完成</li></ul><p class='pDone'>您的联系手机"+data.mobile+"，更换失败！</p><div class='tsBtn'><a href='javascript:closeDivState();'>关 闭</a></div>",function(){
                                        location.reload();
                                    });
                                }
                            }
                        });
                    }
                    if(data==2){
                        showStr = showStr + '非法操作！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }
                    if(data==3){
                        showStr = showStr + '您的手机号已经绑定账号！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }
                    if(data==4){
                        showStr = showStr + '短信验证码错误！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }
                    if(data==5){
                        showStr = showStr + '您的手机号已经绑定账号！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }
                    if(data==0){//如果失败则在原弹层
                        showStr = showStr + '短信验证码错误！';
                        $("#newMoileMsg").html(showStr);
                        return;
                    }
                }
            });
        }
        //修改时验证旧手机验证码格式
        function validateMobileCode(){
            var Mobilekey = $.trim($("#Mobilekey").val());
            var reg = /^\d{6}$/;
            var re = reg.test(Mobilekey);
            var showStr = '';
            if (Mobilekey=="") {
                showStr = showStr + '短信验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if (Mobilekey.lastIndexOf(" ") != -1) {
                showStr = showStr + '短信验证码不能为空！';
                $("#shuaxin").html(showStr);
                return;
            }
            if (Mobilekey==0) {
                showStr = showStr + '短信验证码错误！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '短信验证码格式不正确！';
                $("#shuaxin").html(showStr);
                return;
            }
            if(re==true){
                showStr = showStr+''
                $("#shuaxin").html(showStr);
            }
        }
        //修改时验证新手机
        function newValidateMobile(){
            //验证新手机号码
            var newMobile = $.trim($("#newMobile").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(newMobile);
            var res = regs.test(newMobile);
            if(newMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
        }
        //修改时验证新手机验证码
        function newValidateMobileCode(){
            var newMobilekey = $.trim($("#newMobilekey").val());
            var reg = /^\d{6}$/;
            var re = reg.test(newMobilekey);
            var showStr = '';
            if(newMobilekey=="") {
                showStr = showStr + '短信验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobilekey.lastIndexOf(" ") != -1) {
                showStr = showStr + '短信验证码不能为空！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(newMobilekey==0) {
                showStr = showStr + '短信验证码错误！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '短信验证码格式不正确！';
                $("#newMoileMsg").html(showStr);
                return;
            }
            if(re==true){
                showStr = showStr + '';
                $("#newMoileMsg").html(showStr);
            }

        }
        //绑定手机时候验证手机号码
        function newBindValidate(){
            //验证新手机号码
            var isNewMobile = $.trim($("#isNewMobile").val());
            var showStr = '';
            var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            var regs = /^\d{11}$/;
            var re = reg.test(isNewMobile);
            var res = regs.test(isNewMobile);
            if(isNewMobile=="") {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile.lastIndexOf(" ") != -1) {
                showStr = showStr + '手机号码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(isNewMobile==0){
                showStr = showStr + '手机号码错误！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(res==false){
                showStr = showStr + '手机号码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
        }
        //绑定手机验证手机验证码
        function newBindMobile(){
            //验证码
            var isNewMobileKey = $.trim($("#isNewMobileKey").val());
            var reg = /^\d{6}$/;
            var re = reg.test(isNewMobileKey);
            var showStr = '';
            if (isNewMobileKey=="") {
                showStr = showStr + '短信验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if (isNewMobileKey.lastIndexOf(" ") != -1) {
                showStr = showStr + '短信验证码不能为空！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if (isNewMobileKey==0) {
                showStr = showStr + '短信验证码错误！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(re==false){
                showStr = showStr + '短信验证码格式不正确！';
                $("#isNewMoileMsg").html(showStr);
                return;
            }
            if(re==true){
                showStr = showStr + '';
                $("#isNewMoileMsg").html(showStr);
            }
        }
        function closeDivState(){
            $("#maskLayer,#Info").stop(true,true).fadeOut(200,function(){
                $(this).remove();
                window.location.reload();
            });
        }
    </script>
</head>
<body>
<!--[if lte IE 8]>
<p class="chromeframe">时代在进步，您使用的IE浏览器版本过低 :-( 请<a href="http://windows.microsoft.com/" target="_blank">升级您的IE浏览器</a>，或使用<a href="http://www.google.cn/intl/zh-CN/chrome/" target="_blank">Chrome</a>、<a href="http://www.firefox.com.cn/download/" target="_blank">Firefox</a>等高级浏览器！</p>
<![endif]-->
<!--页头 开头-->
<div id="topInfo">
    <div class="maxW topshortcut">
        <!--<p></p>-->
        <input type="hidden" value="${userLogin.uName}" id="pan">
        <p id="nouser" >您好，欢迎来到军武游戏商城！请 <a href="javascript:void(0)" id="userlogin">登录</a> / <a target="_blank" href="/login.do">免费注册</a></p>
        <p id="onuser" style="display: none">您好，欢迎<a href="javascript:void(0)" id="userlogin1" >${userLogin.uName}</a>来到军武游戏商城！<a href="/tuichu.do">退出</a></p>
        <p class="linkFloatRight" id="nol"><a href="/order.do" target="_blank">我的订单</a><a href="/nom.do" target="_blank">我的商城</a><a href="/help.do" target="_blank">帮助中心</a></p>
        <p class="linkFloatRight"  id="onl"><a href="/order.do" target="_blank">我的订单</a><a href="/nom.do" target="_blank">我的商城</a><a href="/help.do" target="_blank">帮助中心</a></p>
    </div>
</div>
<!--页头 结束--> <link rel="shortcut icon" type="image/x-icon" href="http://mall.kongzhong.com/resources/static/images/wsg3232.ico">
<!--topNav 开头-->
<div class="maxW topNav">
    <div class="logo">
        <table border="0" cellspacing="0" cellpadding="0">
            <tbody><tr>
                <td><a href="http://mall.kongzhong.com/"><img src="../../img/zhanche.png" width="142" height="70"></a></td>
                <td>|　军武游戏商城</td>
            </tr>
            </tbody></table>
    </div>
    <div class="search">
        <i class="css-sp"></i>
        <input class="l" style="outline:none" name="" id="productName" type="text" value="秒杀" onfocus="if(value==&#39;秒杀&#39;) {value=&#39;&#39;}" onblur="if (value==&#39;&#39;) {value=&#39;秒杀&#39;}"><input onkeydown="enterIn(event);" class="button" type="button" value="搜 索">
        <p>
            <a href="http://mall.kongzhong.com/searchController/searchProduct?productName=%E3%80%90%E6%B4%BB%E5%8A%A82%E3%80%91" target="_blank" style="font-weight:bold; color:#CC002B;">金坦9.9元</a>
            <a href="http://wows.kongzhong.com/ztm/2017ltj/" target="_blank" style="font-weight:bold; color:#0056FF;">战舰龙头节</a>
            <a href="http://t.cn/RI7LrB9" target="_blank" style="font-weight:bold; color:#0056FF;">库图佐夫</a>
            <a href="http://mall.kongzhong.com/searchController/searchProduct?productName=%E4%B8%AA%E4%BA%BA%E5%82%A8%E5%A4%87" target="_blank" style="font-weight:bold; color:#CC002B;">个人储备</a>
            <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23302,&sort=up_desc" target="_blank" style=" color:#ACACAC;">战舰战备包</a>
        </p>
    </div>
    <div class="shoppingCart"><i class="css-sp"></i><a href="http://mall.kongzhong.com/cart/to" target="_blank">我的购物车</a><span>1</span></div>
</div>
<!--topNav 结束-->
<!--主体 开头-->
<div id="main">
    <!--菜单导航 开头-->
    <div id="nav">
        <div class="maxW menuW">
            <!--菜单详细 开头-->
            <div class="menu">
                <div class="menuTitle">全部商品分类<span>﹀</span></div>
                <!--菜单分类细则 开始-->
                <div class="menuFullList">
                    <div class="wotList">
                        <a class="wotLink" href="http://mall.kongzhong.com/product/list?catID=,20000,21000,"><span class="css-sp"></span></a>
                        <div class="typeList">
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,">坦克</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21101,">C系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21102,">Y系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21103,">S系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21104,">D系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21105,">M系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21107,">R系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21106,">F系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21108,">J系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21100,21109,">V系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,">金币弹</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21201,">C系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21202,">Y系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21203,">S系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21204,">D系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21205,">M系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21207,">R系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21206,">F系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21208,">J系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21209,">V系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21500,">补给</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21500,21501,">通用补给</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21500,21509,">专属补给</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21400,">配件</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21400,21401,">通用配件</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21400,21407,">专属配件</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21300,">物资</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21300,21301,">金银专区</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21300,21304,">战备包</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21300,21302,">大客户专区</a>　　
                                </dt>
                            </dl>
                        </div>
                    </div>
                    <div class="wowpList">
                        <a class="wowpLink" href="http://mall.kongzhong.com/product/list?catID=,20000,23000,"><span class="css-sp"></span></a>
                        <div class="typeList">
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,">战舰</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23101,">C系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23102,">Y系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23103,">S系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23104,">D系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23105,">M系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23106,">B系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23107,">R系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23100,23108,">F系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23200,">外观</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23200,23202,">信号旗</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23200,23201,">涂装</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,">升级品</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,23501,">1号栏</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,23502,">2号栏</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,23503,">3号栏</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,23504,">4号栏</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,23505,">5号栏</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23500,23506,">6号栏</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23400,">消耗品</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23400,23401,">消耗品</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,">物资</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23301,">银币</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23304,">大客户专区</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23303,">高级账号</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23302,">战舰战备包</a>　　
                                </dt>
                            </dl>
                        </div>
                    </div>
                    <div class="wowsList">
                        <a class="wowsLink" href="http://mall.kongzhong.com/product/list?catID=,20000,22000,"><span class="css-sp"></span></a>
                        <div class="typeList">
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22100,">坦克</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22100,22101,">C系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22100,22105,">M系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22100,22104,">D系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22100,22103,">S系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22200,">直升机</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22200,22201,">C系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22200,22205,">M系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22200,22204,">D系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22200,22203,">S系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22300,">金币弹</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22300,22301,">C系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22300,22304,">M系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22300,22303,">D系</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22300,22302,">S系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22400,">组装</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22400,22402,">材料</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22400,22401,">图纸</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22500,">补给</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22500,22501,">成员补给</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22500,22502,">载具补给</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22500,22503,">载具配件</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22500,22504,">床位</a>　|　<a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22500,22505,">物资包</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22600,">高级账号</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="http://mall.kongzhong.com/product/list?catID=,20000,22000,22600,22601,">VIP</a>　　
                                </dt>
                            </dl>
                        </div>
                    </div>
                </div>
                <!--菜单分类细则 结束-->
            </div>
            <!--菜单详细 结束-->
            <div class="hotLink clearfloat">
                <a href="http://mall.kongzhong.com/">首页</a>
                <!-- <a href="http://wmall.kongzhong.com/groupon/groupon">坦克团购<span class="css-sp new"></span></a> -->
                <!--<a href="http://1.kongzhong.com">1元得宝<span class="css-sp hot2"></span></a>-->
                <a href="http://wmall.kongzhong.com/integral/index">积分商城<span class="css-sp hot"></span></a>
                <a href="http://wot.kongzhong.com/ztm/sc2017/index.html" target="_blank">AMX 105突击型 新车首发</a>
            </div>
        </div>
    </div>
    <!--菜单导航 结束--> <!--导航路径菜单 开头-->
    <!--
   <div class="maxW menuPath">

   </div>
    -->
    <!--导航路径菜单 结束-->

    <!--账户设置 开头-->
    <div class="userCenter setting">
        <div class="maxW">
            <div class="leftbox">
                <dl class="lnav">
                    <dt>个人中心</dt>
                    <dd>
                        <a href="http://mall.kongzhong.com/MemberController/myOrder">我的订单</a>
                        <a href="http://mall.kongzhong.com/MemberController/accountSettings_coupons?state=0">我的优惠券</a>
                    </dd>
                    <dd class="online">
                        <a href="./个人信息-军武游戏商城_files/个人信息-军武游戏商城.html" class="curr">个人信息</a>
                    </dd>
                </dl>
            </div>

            <div class="right rightbox">
                <dl class="userCenterList">
                    <dd><b></b>基本信息</dd>
                    <dt>
                        <div class="item clearfloat">
                            <div class="itemTitle">用户账号：</div>
                            <div id="userAccount" class="itemContent">1****17317@qq.com</div>
                        </div>
                        <!--
                        <div class="item clearfloat">
                            <div class="itemTitle">当前头像：</div>
                            <div class="itemContent"><img id="wang" src="/resources/static/images/photo.png" width="102" height="102"></div>
                        </div>
                        -->
                        <div class="item clearfloat">
                            <input id="userlevel" value="10" style="display:none">
                            <input id="giftbag" value="-1" style="display:none">
                            <div class="itemTitle">用户级别：</div>
                            <div class="itemContent" id="removeCsssplq">
                                <img src="./个人信息-军武游戏商城_files/vip1.png" width="17" height="19"> <cite>普通会员</cite>　<a class="css-sp lq" style="display:none" id="getGifBag" href="javascript:saveGifBag();"></a>
                                <b id="nextUserName"><i><em style="width:0%;"></em></i>下一级：铜牌会员</b>
                            </div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">我的成长值：</div>
                            <div class="itemContent">0</div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">昵称：</div>
                            <div class="itemContent" id="nikeName">灬爱你在眼前&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="alertNikeName"><span class="css-sp"></span>修改昵称</a></div>
                        </div>
                    </dt>
                    <dd><b></b>账户余额</dd>
                    <dt>
                        <div class="item clearfloat">
                            <div class="itemTitle">点券余额：</div><div class="itemContent">0</div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">积分余额：</div><div class="itemContent">10</div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">优惠券：</div>
                            <div class="itemContent"><a href="http://mall.kongzhong.com/MemberController/accountSettings_coupons?state=0">查看优惠券</a></div>
                        </div>
                    </dt>
                    <dd><b></b>个人信息</dd>
                    <dt>
                        <div class="item clearfloat">
                            <div class="itemTitle">真实姓名：</div>
                            <div class="itemContent"><input class="inputC" name="" id="name" maxlength="15" value="" autocomplete="off" type="text" onkeyup="value=value.replace(/[^\a-zA-Z\u4E00-\u9FA5]/g,&#39;&#39;)" onbeforepaste="clipboardData.setData(&#39;text&#39;,clipboardData.getData(&#39;text&#39;).replace(/[^\a-zA-Z\u4E00-\u9FA5]/g,&#39;&#39;))"></div>
                            <!-- <div class="itemContent"><input class="inputC" name="" id="name"  maxlength='6' autocomplete="off" value="" type="text"></div> -->
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">手机号：</div>
                            <div class="itemContent"><a class="isBindMobile" href="javascript:;">绑定手机号码</a></div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">性别：</div>
                            <div class="itemContent">
                                <input name="sexs" id="sexs" value="" style="display:none">
                                <label><input name="sex" type="radio" id="sex_0" value="1" checked="">男</label>　<label><input type="radio" name="sex" value="0" id="sex_1" checked="checked">女</label>
                            </div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">所在地：</div>
                            <div class="itemContent">
                                <select name="province" id="province">
                                    <option id="Pid" value="请选择">请选择</option>
                                    <option value="10001">北京</option><option value="10035">海外</option><option value="10003">河北</option><option value="10004">山西</option><option value="10005">内蒙古</option><option value="10006">辽宁</option><option value="10007">吉林</option><option value="10008">黑龙江</option><option value="10009">上海</option><option value="10010">江苏</option><option value="10011">浙江</option><option value="10012">安徽</option><option value="10013">福建</option><option value="10014">江西</option><option value="10015">山东</option><option value="10016">河南</option><option value="10017">湖北</option><option value="10018">湖南</option><option value="10019">广东</option><option value="10020">广西</option><option value="10021">海南</option><option value="10022">重庆</option><option value="10023">四川</option><option value="10024">贵州</option><option value="10025">云南</option><option value="10026">西藏</option><option value="10027">陕西</option><option value="10028">甘肃</option><option value="10029">青海</option><option value="10030">宁夏</option><option value="10031">新疆</option><option value="10032">台湾</option><option value="10033">香港</option><option value="10034">澳门</option><option value="10002">天津</option></select>
                                <select name="city" id="city">
                                    <option id="Cid" value="请选择">请选择</option>
                                </select>
                                <select name="country" id="country">
                                    <option id="Qid" value="请选择">请选择</option>
                                </select>
                                <input class="inputC address" name="" maxlength="50" id="address" type="text" value="" autocomplete="off">
                            </div>
                        </div>
                        <div class="item clearfloat">
                            <div class="itemTitle">生日：</div>
                            <div class="itemContent">
                                <select name="sel_year" id="sel_year" rel=""><option value="0" selected="true" disabled="true">请选择</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option><option value="1904">1904</option><option value="1903">1903</option><option value="1902">1902</option><option value="1901">1901</option><option value="1900">1900</option></select>
                                <select name="sel_month" id="sel_month" rel=""><option value="0" selected="true" disabled="true">请选择</option></select>
                                <select name="sel_day" id="sel_day" rel=""><option value="0" selected="true" disabled="true">请选择</option></select>
                            </div>
                        </div>
                        <div class="btnSetting"><a class="css-sp" onclick="updatePerMsg();"></a></div>
                    </dt>
                </dl>
            </div>
        </div>
    </div>
    <!--账户设置 结束-->
</div>
<!--主体 结束-->
<!--页脚 开头-->
<div id="footer">
    <div class="maxW">
        <div class="footHelp clearfloat">
            <dl>
                <dd><b class="css-sp b1"></b></dd>
                <dt>
                    <h4>新手指南</h4>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=142" target="_blank">注册账号</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=143" target="_blank">激活游戏</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=141" target="_blank">购物流程</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=144" target="_blank">支付方式</a></p>
                </dt>
            </dl>
            <dl class="bd">
                <dd><b class="css-sp b2"></b></dd>
                <dt>
                    <h4>促销及优惠</h4>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=147" target="_blank">优惠券</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=146" target="_blank">限时折扣</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=145" target="_blank">满额优惠</a></p>
                </dt>
            </dl>
            <dl>
                <dd><b class="css-sp b3"></b></dd>
                <dt>
                    <h4>账户及会员</h4>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=148" target="_blank">账户信息</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=150" target="_blank">会员与积分</a></p>
                    <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=149" target="_blank">我的订单</a></p>
                </dt>
            </dl>
        </div>
        <div class="copyright clearfloat">
            <a href="http://mall.kongzhong.com/MemberController/queryMember#" target="_blank"><img src="../../img/zhan.png" width="117" height="50"></a>
            <a href="http://mall.kongzhong.com/MemberController/queryMember#" target="_blank"><img src="../../img/wargaming.png" width="105" height="50"></a>
            <p><a href="http://www.miibeian.gov.cn/" target="_blank">豫ICP证020001号</a>　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10052.html" target="_blank">经营许可证编号:B2-20090197</a>　|　豫公网安备1101080214622　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10050.html" target="_blank">互联网出版许可证新出网证(豫)字046号</a><br>网络文化经营许可证 豫网文[2011]0467-160号　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10046.html" target="_blank">广播电视节目制作经营许可证(京)字第880号</a> 　|　<a href="http://www.kongzhong.com/licence/2012-09-18/10219.html" target="_blank">信息网络传播视听节目许可证0109379号</a></p>
        </div>
    </div>
</div>
<!--页脚 结束--><script type="text/javascript" src="/js/birthday.js"></script>
<script type="text/javascript" src="/js/updateNick.js"></script>
<script type="text/javascript" src="/js/style.js"></script>
<script type="text/javascript" src="/js/refer.js"></script>
<script type="text/javascript" src="/js/sea-debug.js"></script>
<script src="/js/index.js"></script>
<script type="text/javascript">
    seajs.config({
        base:'/resources/static/js/',
        // 配置别名
        alias: {
            'jquery':  'libs/jquery/1.10.1/jquery.js',
            'template':  'libs/artTemplate/template-min.js'
        }
    });
    seajs.use('modules/member/accountSettings_userInfo', function(app) {
    });
</script>
<span style="display:none">
    <script src="#" language="JavaScript"></script>
    <script src="#" charset="utf-8" type="text/javascript"></script>
    <a href="#" target="_blank" title="站长统计">站长统计</a>
</span>

</body>
</html>