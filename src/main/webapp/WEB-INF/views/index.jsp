<%@page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>军武游戏商城</title>
    <meta name="keywords" content="军武游戏商城,军武游戏,空中网,战争三部曲商城,特惠商城,坦克世界,战舰世界,装甲风暴">
    <meta name="description" content="军武游戏商城,空中网自营的军武游戏道具礼包销售商城，其中包括坦克世界、战舰世界等空中网旗下游戏产品">
    <meta name="format-detection" content="address=no">
    <meta name="format-detection" content="telephone=no">
    <link href="../../css/com.css" rel="stylesheet" type="text/css">
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <link href="../../css/jquery.e-calendar.css" rel="stylesheet" type="text/css">
    <script src="../../js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/config.js" charset="UTF-8"></script>
    <script type="text/javascript" src="../../js/updateNick.js"></script>
    <script type="text/javascript" src="../../js/onlinemall.js"></script>
    <script type="text/javascript" src="../../js/calendar.js"></script>
    <script type="text/javascript">
        var ifLogInAndAct = 0;
        var userAccountss = '';
        var dataNikeName = 0;
        function queryUserAccount(){
            var loginUser = document.getElementById('loginUser');
            var noLoginUser = document.getElementById('noLoginUser');
            $.ajax({
                dataType:"json",
                type:"get",
                url:"/u/info?t="+new Date().getTime(),
                success:function(data){
                    if(data.code==9999){
                        ifLogInAndAct = 9999;
                        userAccountss = data.data.userAccount;
                        loginUser.style.display = "block";
                        noLoginUser.style.display = "none";
                        if(data.nikeName==-100100){
                            $("#nickNamed").html("<i>当前昵称：未激活游戏</i> <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>去激活</a>");
                            dataNikeName = -100100;
                        }else{
                            $('#nickNamed').html("<i>当前昵称："+data.nikeName+"</i>");
                            $.ajax({
                                url : "/MemberController/checkNickState?t="+new Date().getTime(),//检查坦克昵称状态
                                async : true,
                                dataType : "json",
                                cache : false,
                                success : function(data) {
                                    if (data == "4") {
                                        var newNikeNameS = document.getElementById('newNikeNameS');
                                        var updateNikeNameS = document.getElementById('updateNikeNameS');
                                        var nikeState = document.getElementById('nikeState');
                                        newNikeNameS.style.display = "none";
                                        updateNikeNameS.style.display = "none";
                                        nikeState.style.display = "block";
                                        $('#nikeState').html("<em class='css-sp errorIcon'></em>您的修改昵称正在审核中...");
                                    }else if (data == "3") {
                                        var newNikeNameS = document.getElementById('newNikeNameS');
                                        var updateNikeNameS = document.getElementById('updateNikeNameS');
                                        var nikeState = document.getElementById('nikeState');
                                        newNikeNameS.style.display = "none";
                                        updateNikeNameS.style.display = "none";
                                        nikeState.style.display = "block";
                                        $('#nikeState').html("<em class='css-sp errorIcon'></em>修改失败,请联系客服！");
                                    }
                                }
                            });
                        }
                    }
                    if(data.code==-200000){
                        ifLogInAndAct = -200000;
                        loginUser.style.display = "none";
                        noLoginUser.style.display = "block";
                        if(loginUser.style.display == "block"){
                            //$("#loginUser").hide();
                            //$("#noLoginUser").show();
                            loginUser.style.display = "none";
                            noLoginUser.style.display = "block";
                        }
                    }
                }
            });
        }
        function ifUserLogin(){
            $.ajax({
                dataType:"json",
                type:"get",
                url:"/u/info",
                success:function(data){
                    if(data.code==-200000){
                        window.location.href=___mall_passport_url+"/login?backurl="+window.location.href;
                    }
                }
            });
        }
        function querySigns(){
            $.ajax({
                dataType:"json",
                type:"get",
                url:"/signClickController/querySignState?t="+new Date().getTime(),
                success:function(data){
                    if(data==1){
                        $("#signState").attr("class","qdBtn canNot");
                    }
                    if(data==3){
                        $("#signState").attr("class","qdBtn canNot");
                    }
                }
            })
        }
        //点击游戏直充tab标签
        function switchDiv0(){
            $("#state1").removeClass("curr");//移除原来的class样式
            var oDiv1 = document.getElementById('switchDiv1');
            var oDiv2 = document.getElementById('switchDiv2');
            if(oDiv2.style.display == 'block'){
                oDiv2.style.display = 'none';
                oDiv1.style.display = 'block';
                $("#state0").attr("class","curr");//赋值样式
            }
        }
        //点击修改游戏昵称tab标签
        function switchDiv1(){
            $("#state0").removeClass("curr");//移除原来的class样式
            var oDiv1 = document.getElementById('switchDiv1');
            var oDiv2 = document.getElementById('switchDiv2');
            if(oDiv1.style.display == 'block'){
                oDiv1.style.display = 'none';
                oDiv2.style.display = 'block';
                $("#state1").attr("class","curr");//赋值样式
            }
        }
        //验证选择游戏大区
        function changeGameArea(){
            var gameArea = $("#gameArea").val();
            var showStr = '';
            if(gameArea==1){
                showStr = showStr + '请选择大区！';
                $("#gameAreaMsg").html(showStr);
                return;
            }else{
                showStr = showStr + '';
                $("#gameAreaMsg").html(showStr);
            }
        }


        function changeGame()
        {
            var gameId  =  $("#gameId").val();
            if (gameId==3)
            {
                $("#gameAreaShow").hide();
            }else
            {
                $("#gameAreaShow").show();
            }
        }

        //请求游戏充值
        function instantlyRecharge(){
            if(ifLogInAndAct == 9999){
                var gameArea = $("#gameArea").val();
                var gameId = $("#gameId").val();
                var showStr = '';
                var b = new Base64();
                var userAccount = b.encode(userAccountss);
                if(gameArea==1 && (gameId==1 || gameId==2|| gameId==4)){
                    showStr = showStr + '请选择大区！';
                    $("#gameAreaMsg").html(showStr);
                    return ;
                }else{
                    var id = 'paygames';
                    showStr = showStr + '';
                    $("#gameAreaMsg").html(showStr);
                    var gameId = $("#gameId").val();
                    if(gameId==1){
                        if(gameArea==2){
                            if(dataNikeName==-100100){
                                showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活坦克世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else{
                                window.open (''+___mall_passport_url+'/billing/pay/gameinchar/pay_wot?useraccount='+userAccount+'&gameareaid=1500200');
                            }
                        }
                        if(gameArea==3){
                            if(dataNikeName==-100100){
                                showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活坦克世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else{
                                window.open (''+___mall_passport_url+'/billing/pay/gameinchar/pay_wot?useraccount='+userAccount+'&gameareaid=1500100');
                            }
                        }
                    }
                    if(gameId==2){
                        if(gameArea==2){
                            if(dataNikeName==-100100){
                                showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活战舰世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=6700000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else{
                                window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_wows?useraccount='+userAccount+'&gameareaid=6700200');
                            }
                        }
                        if(gameArea==3){
                            if(dataNikeName==-100100){
                                showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活战舰世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=6700000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else{
                                window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_wows?useraccount='+userAccount+'&gameareaid=6700100');
                            }
                        }
                    }


                    if (gameId==4){
                        if(gameArea==2){
                            if(dataNikeName==-100100){
                                showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活战机世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=4800000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else{
                                window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_wowp?useraccount='+userAccount+'&gameareaid=4800200');
                            }
                        }
                        if(gameArea==3){
                            if(dataNikeName==-100100){
                                showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活战机世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=4800000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                $(document).on("click",".close",closeDiv);
                            }else{
                                window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_wowp?useraccount='+userAccount+'&gameareaid=4800100');
                            }
                        }
                    }

                    if(gameId==3){
                        /*
                            if(gameArea==2){
                                if(dataNikeName==-100100){
                                    showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活战机世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=4800000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                    $(document).on("click",".close",closeDiv);
                                }else{
                                    window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_wowp?useraccount='+userAccount+'&gameareaid=4800200');
                                }
                            }
                            if(gameArea==3){
                                if(dataNikeName==-100100){
                                    showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活战机世界游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=4800000&areatype=0&activateType=game'>激活</a> !</span></p>");
                                    $(document).on("click",".close",closeDiv);
                                }else{
                                    window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_wowp?useraccount='+userAccount+'&gameareaid=4800100');
                                }
                            }
                            */


                        $.ajax({
                            type:'get',
                            url : "/u/checkGameAreaActivated",
                            dataType : 'json',
                            data:{gameId:9100000,areaId:9100100,t:new Date().getTime()},
                            error: function () {//请求失败处理函数
                                //alert('请求失败!');
                            },
                            success : function(data) {
                                if (data=='0')
                                {
                                    window.open(''+___mall_passport_url+'/billing/pay/gameinchar/pay_zj?useraccount='+userAccount+'&gameareaid=9100100');
                                }else
                                {
                                    showTsInfo("smTs","提示","<p class='center'><span><em class='css-sp errorIcon'></em>未激活装甲风暴游戏，请速去 <a style='color:#ff6600' target='_blank' href='"+___mall_passport_url+"/v/activate/actgame?gameId=9100000&areatype=0&activateType=istorm'>激活</a> !</span></p>");
                                    $(document).on("click",".close",closeDiv);
                                }
                            }
                        });


                    }
                }
            }
            if(ifLogInAndAct == -200000){
                window.location.href=___mall_passport_url+"/login?backurl="+___mall_kongzhong_url;
            }
        }
        //点击签到
        function clickTheSign(){
            $.ajax({
                dataType:"json",
                type:"get",
                url:"/signClickController/clickTheSign?t="+new Date().getTime(),
                success:function(data){
                    if(data.resultValue=='-100000'){
                        window.location.href=___mall_passport_url+"/login?backurl="+___mall_kongzhong_url;
                    }else if(data.resultValue=='2'){
                        showTsInfo("smTs","提示","<p class='center centerLine'>签到失败,您已经签过到</p>");
                        $(document).on("click",".close",closeDiv);
                    }else if(data=='0'){
                        showTsInfo("smTs","提示","<p class='center centerLine'>签到失败</p>");
                        $(document).on("click",".close",closeDiv);
                    }else{
                        showTsInfo("smTs","提示","<p class='center centerLine'>签到成功！<br>您获得<i>"+data.signIntegral+"</i>积分</p>");
                        $("#signState").attr("class","qdBtn canNot");
                        $("#signState").removeAttr("href");
                        $(document).on("click",".close",closeDiv);
                        $.ajax({
                            dataType:"json",
                            type:"get",
                            url:"/signClickController/querySign?t="+new Date().getTime(),
                            success:function(data){
                                var a = null;
                                var year = null;
                                var month = null;
                                var date = null;
                                var events =[];
                                for (var one in data)
                                {//循环放入
                                    year = data[one].year;
                                    month = data[one].month;
                                    date = data[one].date;
                                    events.push({
                                        title:'Event Title',
                                        start:'Description',
                                        datetime:new Date(year,month-1,date)
                                    });
                                }
                                $('#calendar').eCalendar({
                                    weekDays: ['日', '一','二', '三', '四', '五', '六'],
                                    months: ['01月', '02月', '03月', '04月', '05月', '06月', '07月', '08月', '09月', '10月', '11月', '12月'],
                                    events: events
                                });
                            }
                        });
                    }
                }
            })
        }
    </script>
</head>
<body class="indexBg">
<!--[if lte IE 8]>
<p class="chromeframe">时代在进步，您使用的IE浏览器版本过低 :-( 请<a href="http://windows.microsoft.com/" target="_blank">升级您的IE浏览器</a>，或使用<a href="http://www.google.cn/intl/zh-CN/chrome/" target="_blank">Chrome</a>、<a href="http://www.firefox.com.cn/download/" target="_blank">Firefox</a>等高级浏览器！</p>
<![endif]-->
<!--页头 开头-->
<div id="topInfo">
    <div class="maxW topshortcut">
        <!--<p></p>-->
        <p>您好，欢迎来到军武游戏商城！请 <a href="javascript:void(0)">登录</a> / <a target="_blank" href="http://passport.kongzhong.com/acc">免费注册</a></p>
        <p class="linkFloatRight"><a href="/MemberController/myOrder" target="_blank">我的订单</a><a href="/MemberController/queryMember" target="_blank">我的商城</a><a href="/helpController/helpCenter" target="_blank">帮助中心</a></p>
    </div>
</div>
<!--页头 结束-->
<!--主体 开头-->
<div id="main">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/static/images/wsg3232.ico" />
    <!--topNav 开头-->
    <div class="maxW topNav">
        <div class="logo">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><a href="/"><img src="../../img/zhanche.png" width="142" height="70"></a></td>
                    <td>|　军武游戏商城</td>
                </tr>
            </table>
        </div>
        <div class="search">
            <i class="css-sp"></i>
            <input class="l" style="outline:none" name="" id="productName" type="text"  value="秒杀" onfocus="if(value=='秒杀') {value=''}" onblur="if (value=='') {value='秒杀'}"><input onkeydown="enterIn(event);" class="button" type="button" value="搜 索">
            <p>
                <a href="http://mall.kongzhong.com/searchController/searchProduct?productName=【活动2】" target="_blank" style="font-weight:bold; color:#CC002B;" >金坦9.9元</a>
                <a href="http://wows.kongzhong.com/ztm/2017ltj/" target="_blank" style="font-weight:bold; color:#0056FF;" >战舰龙头节</a>
                <a href="http://t.cn/RI7LrB9" target="_blank" style="font-weight:bold; color:#0056FF;" >库图佐夫</a>
                <a href="http://mall.kongzhong.com/searchController/searchProduct?productName=个人储备" target="_blank" style="font-weight:bold; color:#CC002B;" >个人储备</a>
                <a href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23302,&sort=up_desc" target="_blank" style=" color:#ACACAC;" >战舰战备包</a>
            </p>
        </div>
        <div class="shoppingCart"><i class="css-sp"></i><a href="/cart/to" target="_blank">我的购物车</a></div>
    </div>
    <!--topNav 结束-->

    <!--菜单导航 开头-->
    <div id="nav">
        <div class="maxW menuW">
            <!--菜单详细 开头-->
            <div class="menu menuHover">
                <div class="menuTitle">全部商品分类<span></span></div>
                <!--菜单分类细则 开始-->
                <div class="menuFullList">

                    <div class="wotList">
                        <a class="wotLink" href="/product/list?catID=,20000,21000,"><span class="css-sp"></span></a>
                        <div class="typeList">
                            <dl>
                                <dd><a href="/product/list?catID=,20000,21000,21100,">坦克</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,21000,21100,21101,">C系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21102,">Y系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21103,">S系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21104,">D系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21105,">M系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21107,">R系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21106,">F系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21108,">J系</a>　|　<a href="/product/list?catID=,20000,21000,21100,21109,">V系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,21000,21200,">金币弹</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,21000,21200,21201,">C系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21202,">Y系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21203,">S系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21204,">D系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21205,">M系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21207,">R系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21206,">F系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21208,">J系</a>　|　<a href="/product/list?catID=,20000,21000,21200,21209,">V系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,21000,21500,">补给</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,21000,21500,21501,">通用补给</a>　|　<a href="/product/list?catID=,20000,21000,21500,21509,">专属补给</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,21000,21400,">配件</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,21000,21400,21401,">通用配件</a>　|　<a href="/product/list?catID=,20000,21000,21400,21407,">专属配件</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,21000,21300,">物资</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,21000,21300,21301,">金银专区</a>　|　<a href="/product/list?catID=,20000,21000,21300,21304,">战备包</a>　|　<a href="/product/list?catID=,20000,21000,21300,21302,">大客户专区</a>　|　<a href="/product/list?catID=,20000,21000,21300,21305,">任务物品</a>　　
                                </dt>
                            </dl>
                        </div>
                    </div>
                    <div class="wowpList">
                        <a class="wowpLink" href="/product/list?catID=,20000,23000,"><span class="css-sp"></span></a>
                        <div class="typeList">
                            <dl>
                                <dd><a href="/product/list?catID=,20000,23000,23100,">战舰</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,23000,23100,23103,">S系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23107,">R系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23106,">B系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23101,">C系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23102,">Y系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23104,">D系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23105,">M系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23108,">F系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23109,">L系</a>　 |　<a href="/product/list?catID=,20000,23000,23100,23110,">I系</a>　 　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,23000,23200,">外观</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,23000,23200,23202,">信号旗</a>　 |　<a href="/product/list?catID=,20000,23000,23200,23201,">涂装</a>　 　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,23000,23500,">升级品</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,23000,23500,23501,">1号栏</a>　 |　<a href="/product/list?catID=,20000,23000,23500,23502,">2号栏</a>　 |　<a href="/product/list?catID=,20000,23000,23500,23503,">3号栏</a>　 |　<a href="/product/list?catID=,20000,23000,23500,23504,">4号栏</a>　 |　<a href="/product/list?catID=,20000,23000,23500,23505,">5号栏</a>　 |　<a href="/product/list?catID=,20000,23000,23500,23506,">6号栏</a>　 　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,23000,23400,">消耗品</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,23000,23400,23401,">消耗品</a>　 　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,23000,23300,">物资</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,23000,23300,23301,">银币</a>　 |　<a href="/product/list?catID=,20000,23000,23300,23304,">大客户专区</a>　 |　<a href="/product/list?catID=,20000,23000,23300,23303,">高级账号</a>　 |　<a href="/product/list?catID=,20000,23000,23300,23302,">战舰战备包</a>　 　
                                </dt>
                            </dl>
                        </div>
                    </div>
                    <div class="wowsList">
                        <a class="wowsLink" href="/product/list?catID=,20000,24000,"><span class="css-sp"></span></a>
                        <div class="typeList">
                            <dl>
                                <dd><a href="/product/list?catID=,20000,24000,24100,">战机</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,24000,24100,24101,">C系</a>　|　<a href="/product/list?catID=,20000,24000,24100,24102,">Y系</a>　|　<a href="/product/list?catID=,20000,24000,24100,24103,">S系</a>　|　<a href="/product/list?catID=,20000,24000,24100,24105,">M系</a>　|　<a href="/product/list?catID=,20000,24000,24100,24104,">D系</a>　|　<a href="/product/list?catID=,20000,24000,24100,24106,">F系</a>　|　<a href="/product/list?catID=,20000,24000,24100,24107,">R系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,24000,24300,">银币</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,24000,24300,24302,">银币+机位</a>　|　<a href="/product/list?catID=,20000,24000,24300,24303,">银币+VIP</a>　|　<a href="/product/list?catID=,20000,24000,24300,24301,">银币</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,24000,24200,">金币弹</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,24000,24200,24206,">F系</a>　|　<a href="/product/list?catID=,20000,24000,24200,24207,">R系</a>　|　<a href="/product/list?catID=,20000,24000,24200,24204,">D系</a>　|　<a href="/product/list?catID=,20000,24000,24200,24202,">Y系</a>　|　<a href="/product/list?catID=,20000,24000,24200,24201,">C系</a>　|　<a href="/product/list?catID=,20000,24000,24200,24203,">S系</a>　|　<a href="/product/list?catID=,20000,24000,24200,24205,">M系</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,24000,24400,">配件</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,24000,24400,24403,">重型战斗机</a>　|　<a href="/product/list?catID=,20000,24000,24400,24405,">多用途战斗机</a>　|　<a href="/product/list?catID=,20000,24000,24400,24402,">战斗机</a>　|　<a href="/product/list?catID=,20000,24000,24400,24404,">攻击机</a>　|　<a href="/product/list?catID=,20000,24000,24400,24401,">通用配件</a>　　
                                </dt>
                            </dl>
                            <dl>
                                <dd><a href="/product/list?catID=,20000,24000,24500,">补给</a><span>&gt;</span></dd>
                                <dt>
                                    <a href="/product/list?catID=,20000,24000,24500,24503,">Y系</a>　|　<a href="/product/list?catID=,20000,24000,24500,24504,">S系</a>　|　<a href="/product/list?catID=,20000,24000,24500,24505,">D系</a>　|　<a href="/product/list?catID=,20000,24000,24500,24508,">R系</a>　|　<a href="/product/list?catID=,20000,24000,24500,24506,">M系</a>　|　<a href="/product/list?catID=,20000,24000,24500,24502,">C系</a>　|　<a href="/product/list?catID=,20000,24000,24500,24501,">通用补给</a>　|　<a href="/product/list?catID=,20000,24000,24500,24507,">F系</a>　　
                                </dt>
                            </dl>
                        </div>
                    </div>
                </div>
                <!--菜单分类细则 结束-->
            </div>
            <!--菜单详细 结束-->
            <div class="hotLink clearfloat">
                <a href="/">首页</a>
                <!-- <a href="http://wmall.kongzhong.com/groupon/groupon">坦克团购<span class="css-sp new"></span></a> -->
                <!--<a href="http://1.kongzhong.com">1元得宝<span class="css-sp hot2"></span></a>-->
                <a href="http://wmall.kongzhong.com/integral/index">积分商城<span class="css-sp hot"></span></a>
                <a href="http://wot.kongzhong.com/ztm/sc2017/index.html" target="_blank" >AMX 105突击型 新车首发</a>
            </div>  </div>
    </div>
    <!--菜单导航 结束-->
    <!--首页主体 开头-->
    <div class="indexMain">
        <div class="maxW">
            <div class="focusSide">
                <!--首频焦点图 开头-->
                <div class="focus">
                    <a id="FS_arr_left" class="arr arr_left" href="javascript:void(0);"></a>
                    <a id="FS_arr_right" class="arr arr_right" href="javascript:void(0);"></a>
                    <div id="FS_Cont" class="clearfloat">
                        <div class="imgB"><a href="http://t.cn/R0vktNT" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/c54b153e-f92e-4d91-b4ef-64824ce9de87.jpg"></a></div>
                        <div class="imgB"><a href="http://wot.kongzhong.com/ztm/sc2017/index.html" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/266fc375-abd2-4ca0-8d52-d1813eccdc24.jpg"></a></div>
                        <div class="imgB"><a href="http://mall.kongzhong.com/MemberController/coupon_productList?discountId=2193&sort=up_desc" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/daea7682-a5b4-4da9-a6f9-8d66c9b10b39.jpg"></a></div>
                        <div class="imgB"><a href="http://xf.kongzhongjr.com" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/7f137c77-dc7b-401d-9cfb-40e1498bf3c3.jpg"></a></div>

                    </div>
                    <div class="numList" id="FS_numList"></div>
                </div>
                <!--首频焦点图 结束-->
                <!--首频侧边栏 开头-->
                <div class="side">
                    <div class="calendarB">
                        <div id="calendar"></div>
                        <a id="signState" class="" href="javascript:clickTheSign();">点击签到</a>
                    </div>
                    <div class="sideB">
                        <div class="sideTab"><a id="state0" href="javascript:switchDiv0();">游戏直充</a><a id="state1" href="javascript:switchDiv1();">修改游戏昵称</a></div>
                        <div class="sideList" style="display:block;" id="switchDiv1">
                            <ul class="clearfloat">
                                <li>选择游戏：<select id="gameId" onchange="changeGame()"><option selected value="1">坦克世界</option><option value="2">战舰世界</option><option value="4">战机世界</option></select></li>
                                <li id="gameAreaShow">选择大区：<select id="gameArea" onblur="changeGameArea()"><option selected value="1">-请选择大区-</option><option value="2">电信南方区</option><option value="3">联通北方区</option></select></li>
                                <li class="tsLi"><span id="gameAreaMsg"></span><a id="nowRecharge" class="sideBtn" href="javascript:instantlyRecharge();">立即充值</a></li>
                            </ul>
                        </div>
                        <div class="sideList" style="display:none;" id="switchDiv2">
                            <div class="nickName">
                                <p id="noLoginUser">您尚未登录，请登录后再修改昵称。<a class="sideBtn" href="javascript:ifUserLogin();">登录</a></p>
                                <ul class="clearfloat" id="loginUser" style="display:none">
                                    <li class="nickNameT" id="nickNamed"></li>
                                    <li id="newNikeNameS">　新昵称：<input name="" id="newNikeName" onblur="checkNick();" type="text"></li>
                                    <li id="nikeState" style="display:none"></li>
                                    <li class="tsLi" id="updateNikeNameS"><span id="showstateId"></span><a class="sideBtn" href="javascript:changMyNickName();">修改昵称</a></li>
                                </ul>
                                <!--<p class="suc"><em class="css-sp"></em><b>昵称修改成功</b><br>新昵称将在每周二、五的11点更新生效。</p>-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--首频侧边栏 结束-->
            </div>
            <!--推荐 开头-->
            <div class="rec">
                <ul class="clearfloat">
                    <li><a href="http://nbx.kongzhong.com/r/i/170410155416" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/fa0a12d2-fa82-4fc3-a704-e8387f9a77ed.jpg" width="237" height="149"></a></li>
                    <li><a href="http://nbx.kongzhong.com/r/i/160322142616" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/0341e47e-da33-4b9d-9830-37d075d9bc3f.jpg" width="237" height="149"></a></li>
                    <li><a href="http://nbx.kongzhong.com/r/i/160608142538?aside" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/ef69e488-ac4c-440b-a415-37832813c8c6.jpg" width="237" height="149"></a></li>
                    <li><a href="http://nbx.kongzhong.com/r/i/170419170850" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/9cc8c01c-35ff-46e9-97cb-50d2a0f2904f.jpg" width="237" height="149"></a></li>
                    <li><a href="http://nbx.kongzhong.com/r/i/160411121516" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/d2c8ef38-d346-4673-8644-2e6d5016d333.jpg" width="237" height="149"></a></li>

                </ul>
            </div>
            <!--推荐 结束-->
            <!--坦克世界 开始-->
            <div class="wot">
                <a name="001" id="001" ></a>
                <h4 class="gameTitle"><b class="css-sp"></b>坦克世界</h4>
                <div class="tab">
                    <a class="curr" href="javascript:;">
                        热门</a><span></span><a href="javascript:;">
                    坦克</a><span></span><a href="javascript:;">
                    金币弹</a><span></span><a href="javascript:;">
                    补给</a><span></span><a href="javascript:;">
                    银币</a>
                </div>
                <div class="content">
                    <!--热门开始-->
                    <div class="list">
                        <div class="proListFloat">
                            <a href="http://mall.kongzhong.com/searchController/searchProduct?productName=【本周热荐】&sort=up_desc" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/4a48fdf9-12d4-45eb-ba65-8910d7bb6e24.jpg"></a>
                        </div>


                        <div class="proListFloat proListFloatFocus">
                            <div id="FS_Cont_wot" class="focusG clearfloat">
                                <div class="imgB"><a href="http://mall.kongzhong.com/product/detail?pid=3839" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/f54bf559-a03b-4338-b473-2c704fe1cb54.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/searchController/searchProduct?productName=【活动1】" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/6e958f67-9351-4b68-8348-7470f55188ad.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/searchController/searchProduct?productName=【活动3】" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/45f08d37-5d31-4a9a-99aa-6b34e5209b3d.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/searchController/searchProduct?productName=【活动2】" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/3ce41b21-09dd-4f93-8b53-74bacfefaf9b.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/searchController/searchProduct?productName=【活动4】" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/0540999d-6536-4098-be8c-6bd0f7cb629e.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/searchController/searchProduct?productName=分期购&sort=up_desc" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/7ec83d66-53b4-49c8-ab89-93d366231d83.jpg"></a></div>
                            </div>
                            <div class="numList" id="FS_numList_wot"></div>
                        </div>
                        <!--无此广告位-->
                        <div class="proListFloat">
                            <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21300," target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/f92b1806-12ea-4f47-b946-c4af2345c2f5.png"></a>
                        </div>
                        <div class="proListFloat">
                            <a href="http://mall.kongzhong.com/product/list?catID=,20000,21000,21200,21201," target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/f8af74e3-98ee-4086-b10c-4b70f5c5050c.png"></a>
                        </div>
                        <!--无此广告位-->
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3381" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-28/20170628140349_29390.jpg"></a>
                            <h4><a href="/product/detail?pid=3381" target="_blank">【活动2】【标准】M4A3E8雷电VII（含M系兄弟连乘员）</a></h4>
                            <p>￥100.00<!--<span>￥150.00（3000点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/4a8ab692-1dc1-4d4c-82cf-a91409beb857.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3955" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-09-19/20170919093635_00673.jpg"></a>
                            <h4><a href="/product/detail?pid=3955" target="_blank">【本周热荐】【新车首发】AMX 105 突击型</a></h4>
                            <p>￥218.00<!--<span>￥295.00（5900点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/89a0463d-69e1-464d-80ba-cdecc166b5af.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=596" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-03-09/20170309111708_81478.jpg"></a>
                            <h4><a href="/product/detail?pid=596" target="_blank">【活动1】天蝎完全体礼包</a></h4>
                            <p>￥128.00<!--<span>￥579.00（11580点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/09162b0a-11be-4a34-a28a-1df37b8b59c7.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=313" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-02-28/20170228151720_30040.jpg"></a>
                            <h4><a href="/product/detail?pid=313" target="_blank">【活动3】【标准】E-25标准坦克礼包</a></h4>
                            <p>￥50.00<!--<span>￥220.00（4400点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/166a08be-7bb1-4961-a2e6-93c960edb0d8.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3914" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-09-11/20170911165927_73985.jpg"></a>
                            <h4><a href="/product/detail?pid=3914" target="_blank">【本周热荐】金银月卡礼包</a></h4>
                            <p>￥99.00<!--<span>￥99.00（1980点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/89a0463d-69e1-464d-80ba-cdecc166b5af.png') no-repeat 0 0;"></cite>
                        </div>
                    </div>
                    <!--热门结束-->
                    <!-- 坦克开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3516" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-17/20170717111419_12380.jpg"></a>
                            <h4><a href="/product/detail?pid=3516" target="_blank">【标准】WZ120G 版本新车</a></h4>
                            <p>￥428.00<!--<span>￥456.00（9120点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=2381" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-03-09/20170309111626_93868.jpg"></a>
                            <h4><a href="/product/detail?pid=2381" target="_blank">【活动2】【标准】天蝎G</a></h4>
                            <p>￥188.00<!--<span>￥388.00（7760点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/4a8ab692-1dc1-4d4c-82cf-a91409beb857.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=2428" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-03-09/20170309115734_08305.jpg"></a>
                            <h4><a href="/product/detail?pid=2428" target="_blank">【活动2】【标准】WZ111 T型</a></h4>
                            <p>￥238.00<!--<span>￥396.00（7920点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/4a8ab692-1dc1-4d4c-82cf-a91409beb857.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3381" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-28/20170628140349_29390.jpg"></a>
                            <h4><a href="/product/detail?pid=3381" target="_blank">【活动2】【标准】M4A3E8雷电VII（含M系兄弟连乘员）</a></h4>
                            <p>￥100.00<!--<span>￥150.00（3000点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/4a8ab692-1dc1-4d4c-82cf-a91409beb857.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3515" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-17/20170717110751_19489.jpg"></a>
                            <h4><a href="/product/detail?pid=3515" target="_blank">【标准】WZ120-1G 版本新车</a></h4>
                            <p>￥288.00<!--<span>￥328.00（6560点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=2895" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-03-15/20170315155144_62033.jpg"></a>
                            <h4><a href="/product/detail?pid=2895" target="_blank">【活动4】【标准】STRV S1  版本新车</a></h4>
                            <p>￥148.00<!--<span>￥300.00（6000点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 坦克结束-->
                    <!-- 金币弹开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=275" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123162200_13653.jpg"></a>
                            <h4><a href="/product/detail?pid=275" target="_blank">WZ111/112/T-34-3金币弹</a></h4>
                            <p>￥34.00<!--<span>￥225.00（4500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=266" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123154121_42138.jpg"></a>
                            <h4><a href="/product/detail?pid=266" target="_blank">AMX 50B/AMX 50 120金币弹</a></h4>
                            <p>￥45.00<!--<span>￥300.00（6000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=267" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123154345_77106.jpg"></a>
                            <h4><a href="/product/detail?pid=267" target="_blank">FV4005 FV215B(183) 金币弹</a></h4>
                            <p>￥75.00<!--<span>￥500.00（10000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=271" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123160249_24345.jpg"></a>
                            <h4><a href="/product/detail?pid=271" target="_blank">T26E4超级潘兴金币弹.</a></h4>
                            <p>￥42.00<!--<span>￥275.00（5500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=274" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123161426_27041.jpg"></a>
                            <h4><a href="/product/detail?pid=274" target="_blank">59式/黄金59式金币弹</a></h4>
                            <p>￥42.00<!--<span>￥275.00（5500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=538" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-19/20160119144108_22998.jpg"></a>
                            <h4><a href="/product/detail?pid=538" target="_blank">FV215B/征服者金币弹</a></h4>
                            <p>￥42.00<!--<span>￥275.00（5500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=527" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-18/20160118155909_08433.jpg"></a>
                            <h4><a href="/product/detail?pid=527" target="_blank">T110E5/M103金币弹</a></h4>
                            <p>￥45.00<!--<span>￥275.00（5500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=264" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123152929_73336.jpg"></a>
                            <h4><a href="/product/detail?pid=264" target="_blank">IS-7金币弹</a></h4>
                            <p>￥45.00<!--<span>￥300.00（6000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=256" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123145902_49386.jpg"></a>
                            <h4><a href="/product/detail?pid=256" target="_blank">E-100/VK7201金币弹</a></h4>
                            <p>￥57.00<!--<span>￥375.00（7500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=273" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-11-23/20151123161122_38776.jpg"></a>
                            <h4><a href="/product/detail?pid=273" target="_blank">62式金币弹</a></h4>
                            <p>￥19.00<!--<span>￥125.00（2500点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 金币弹结束-->
                    <!-- 补给开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=472" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113172909_06931.jpg"></a>
                            <h4><a href="/product/detail?pid=472" target="_blank">大修理箱</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=474" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113173626_30296.jpg"></a>
                            <h4><a href="/product/detail?pid=474" target="_blank">自动灭火器</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=485" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-14/20160114113907_40430.jpg"></a>
                            <h4><a href="/product/detail?pid=485" target="_blank">红烧肉</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=483" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-14/20160114113417_53609.jpg"></a>
                            <h4><a href="/product/detail?pid=483" target="_blank">餐包</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=473" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113173304_59172.jpg"></a>
                            <h4><a href="/product/detail?pid=473" target="_blank">大急救箱</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=475" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113174117_23051.jpg"></a>
                            <h4><a href="/product/detail?pid=475" target="_blank">小修理箱</a></h4>
                            <p>￥7.50<!--<span>￥18.75（375点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=477" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113174546_31417.jpg"></a>
                            <h4><a href="/product/detail?pid=477" target="_blank">手动灭火器</a></h4>
                            <p>￥7.50<!--<span>￥18.75（375点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=478" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113174844_90912.jpg"></a>
                            <h4><a href="/product/detail?pid=478" target="_blank">S军口粮</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=480" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113175326_56413.jpg"></a>
                            <h4><a href="/product/detail?pid=480" target="_blank">提神咖啡</a></h4>
                            <p>￥5.00<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=476" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-13/20160113174341_71042.jpg"></a>
                            <h4><a href="/product/detail?pid=476" target="_blank">小急救包</a></h4>
                            <p>￥7.50<!--<span>￥18.75（375点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 补给结束-->
                    <!-- 银币开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1882" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-24/20161024182522_70203.jpg"></a>
                            <h4><a href="/product/detail?pid=1882" target="_blank">10车位补给礼包</a></h4>
                            <p>￥45.00<!--<span>￥75.00（1500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1885" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-24/20161024182456_45965.jpg"></a>
                            <h4><a href="/product/detail?pid=1885" target="_blank">【个人储备】乘员经验加成200%补给礼包</a></h4>
                            <p>￥10.00<!--<span>￥38.00（760点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1886" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-24/20161024182440_85497.jpg"></a>
                            <h4><a href="/product/detail?pid=1886" target="_blank">【个人储备】全局经验加成100%补给礼包</a></h4>
                            <p>￥10.00<!--<span>￥38.00（760点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1887" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-24/20161024182111_75442.jpg"></a>
                            <h4><a href="/product/detail?pid=1887" target="_blank">【个人储备】战斗经验加成100%补给礼包</a></h4>
                            <p>￥10.00<!--<span>￥38.00（760点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1883" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-21/20161021172614_59439.jpg"></a>
                            <h4><a href="/product/detail?pid=1883" target="_blank">218元金银礼包（8000金+500万银）</a></h4>
                            <p>￥218.00<!--<span>￥513.00（10260点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1877" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-24/20161024182624_63589.jpg"></a>
                            <h4><a href="/product/detail?pid=1877" target="_blank">610万银币礼包</a></h4>
                            <p>￥70.00<!--<span>￥381.00（7620点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1878" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-25/20161025093913_85091.jpg"></a>
                            <h4><a href="/product/detail?pid=1878" target="_blank">1500万银币礼包</a></h4>
                            <p>￥150.00<!--<span>￥938.00（18760点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1880" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-25/20161025093927_18403.jpg"></a>
                            <h4><a href="/product/detail?pid=1880" target="_blank">1亿银币礼包</a></h4>
                            <p>￥875.00<!--<span>￥6250.00（125000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1879" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-25/20161025093900_54995.jpg"></a>
                            <h4><a href="/product/detail?pid=1879" target="_blank">6100万银币礼包</a></h4>
                            <p>￥580.00<!--<span>￥3818.00（76360点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1884" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-10-21/20161021172601_16358.jpg"></a>
                            <h4><a href="/product/detail?pid=1884" target="_blank">388元金银礼包（16000金+1000万银）</a></h4>
                            <p>￥388.00<!--<span>￥1025.00（20500点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 银币结束-->
                </div>
            </div>
            <!--坦克世界 结束-->

            <!--战舰世界 开始-->
            <div class="wows">
                <a name="002" id="002" ></a>
                <h4 class="gameTitle"><b class="css-sp"></b>战舰世界</h4>
                <div class="tab">
                    <a class="curr" href="javascript:;">
                        热门</a><span></span><a href="javascript:;">
                    战舰</a><span></span><a href="javascript:;">
                    外观</a><span></span><a href="javascript:;">
                    物资</a><span></span><a href="javascript:;">
                    升级品</a>
                </div>
                <div class="content">
                    <!--热门开始-->
                    <div class="list">
                        <div class="proListFloat">
                            <a href="http://t.cn/R6cxfUt" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/52c11815-71c7-4304-b4dc-725748975ce3.jpg"></a>
                        </div>

                        <div class="proListFloat proListFloatFocus">
                            <div id="FS_Cont_wows" class="focusG clearfloat">
                                <div class="imgB"><a href="http://t.cn/R6cxfUt" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/208374e5-920c-457a-9c00-d6cb2e994518.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/product/detail?pid=2430" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/0b09c5ed-dac6-4bd6-94be-1216329fa858.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/product/detail?pid=3517" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/9af96b8e-767f-4dd7-a709-c20c44cf6990.jpg"></a></div>
                                <div class="imgB"><a href="http://t.cn/RfItJ4V" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/eb6b5c26-e8e7-4c35-b3b8-c1f10b3bb343.jpg"></a></div>
                                <div class="imgB"><a href="http://t.cn/RfdxMLF" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/eedc4079-a8da-4723-a888-c4c04412c2cc.jpg"></a></div>
                            </div>
                            <div class="numList" id="FS_numList_wows"></div>
                        </div>
                        <!--无此广告位 -->
                        <div class="proListFloat">
                            <a  href="http://t.cn/RNIGBbm" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/317a3f25-d173-46ca-b6b3-f55bd3ea5880.jpg"></a>
                        </div>
                        <div class="proListFloat">
                            <a  href="http://mall.kongzhong.com/product/list?catID=,20000,23000,23300,23302,&sort=sale_desc" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/559551a9-c84f-4709-b764-a7575a65ae92.jpg"></a>
                        </div>
                        <!--无此广告位 -->
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3517" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-18/20170718105458_52311.jpg"></a>
                            <h4><a href="/product/detail?pid=3517" target="_blank">企业周中底价惠战舰包（手机下单再减20）</a></h4>
                            <p>￥238.00<!--<span>￥454.00（9080点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1727" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-11-15/20161115173144_59610.jpg"></a>
                            <h4><a href="/product/detail?pid=1727" target="_blank">欧根亲王周中底价惠战舰特惠包（手机下单再减20元）</a></h4>
                            <p>￥108.00<!--<span>￥386.00（7720点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=2903" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-09-07/20170907153645_19288.jpg"></a>
                            <h4><a href="/product/detail?pid=2903" target="_blank">191元周中底价惠战舰舰长经验外观战备包</a></h4>
                            <p>￥191.00<!--<span>￥1008.00（20160点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1655" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-11-15/20161115180844_40015.jpg"></a>
                            <h4><a href="/product/detail?pid=1655" target="_blank">敦刻尔克周中底价惠战舰特惠包（手机下单再减20元）</a></h4>
                            <p>￥108.00<!--<span>￥303.00（6060点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=1580" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-11-15/20161115182215_29146.jpg"></a>
                            <h4><a href="/product/detail?pid=1580" target="_blank">亚特兰大周中底价惠战舰特惠包（手机下单再减20元）</a></h4>
                            <p>￥108.00<!--<span>￥340.00（6800点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                    </div>
                    <!--热门结束-->
                    <!-- 战舰开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3517" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-18/20170718105458_52311.jpg"></a>
                            <h4><a href="/product/detail?pid=3517" target="_blank">企业周中底价惠战舰包（手机下单再减20）</a></h4>
                            <p>￥238.00<!--<span>￥454.00（9080点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3354" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-23/20170623151445_87970.jpg"></a>
                            <h4><a href="/product/detail?pid=3354" target="_blank">格拉斯周中底价惠战舰新品特惠包（手机下单再减20）</a></h4>
                            <p>￥188.00<!--<span>￥304.00（6080点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3334" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-14/20170614111830_04076.jpg"></a>
                            <h4><a href="/product/detail?pid=3334" target="_blank">胡德周中底价惠战舰新品特惠包（手机下单再减20）</a></h4>
                            <p>￥188.00<!--<span>￥475.00（9500点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3215" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-05-22/20170522165902_96739.jpg"></a>
                            <h4><a href="/product/detail?pid=3215" target="_blank">加贺（雕）周中底价惠战舰新品特惠包（手机下单再减20）</a></h4>
                            <p>￥188.00<!--<span>￥404.00（8080点券）</span>--></p>
                            <cite class="ico ico-rt" style="background:url('http://stc.mall.kongzhong.com/upload/iconpic/1d6dc5ac-b454-42fa-a973-255a6b1c767a.png') no-repeat 0 0;"></cite>
                        </div>
                    </div>
                    <!-- 坦克结束-->
                    <!-- 外观开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=344" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-17/20151217143910_54566.jpg"></a>
                            <h4><a href="/product/detail?pid=344" target="_blank">涂装2</a></h4>
                            <p>￥20.00<!--<span>￥20.00（400点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=610" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-21/20160121160510_93484.jpg"></a>
                            <h4><a href="/product/detail?pid=610" target="_blank">JWU旗*10</a></h4>
                            <p>￥13.00<!--<span>￥13.00（260点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=606" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-21/20160121152840_67427.jpg"></a>
                            <h4><a href="/product/detail?pid=606" target="_blank">NES旗*10</a></h4>
                            <p>￥8.00<!--<span>￥8.00（160点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=605" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-21/20160121152409_22191.jpg"></a>
                            <h4><a href="/product/detail?pid=605" target="_blank">NF旗*10</a></h4>
                            <p>￥8.00<!--<span>￥8.00（160点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=352" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-17/20151217153835_04742.jpg"></a>
                            <h4><a href="/product/detail?pid=352" target="_blank">HY旗</a></h4>
                            <p>￥7.50<!--<span>￥7.50（150点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=345" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-17/20151217144235_99257.jpg"></a>
                            <h4><a href="/product/detail?pid=345" target="_blank">涂装3</a></h4>
                            <p>￥45.00<!--<span>￥45.00（900点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=348" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-17/20151217151651_35390.jpg"></a>
                            <h4><a href="/product/detail?pid=348" target="_blank">IY旗</a></h4>
                            <p>￥12.50<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=351" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-17/20151217153537_18557.jpg"></a>
                            <h4><a href="/product/detail?pid=351" target="_blank">SM旗</a></h4>
                            <p>￥7.50<!--<span>￥7.50（150点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=347" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-17/20151217151331_17302.jpg"></a>
                            <h4><a href="/product/detail?pid=347" target="_blank">JC旗</a></h4>
                            <p>￥12.50<!--<span>￥12.50（250点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=607" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-01-21/20160121142547_62829.jpg"></a>
                            <h4><a href="/product/detail?pid=607" target="_blank">VL旗*10</a></h4>
                            <p>￥8.00<!--<span>￥8.00（160点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 金币弹结束-->
                    <!-- 物资开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3422" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706171009_57449.jpg"></a>
                            <h4><a href="/product/detail?pid=3422" target="_blank">1098元周中底价惠战舰战备包（手机下单再减220元）</a></h4>
                            <p>￥1098.00<!--<span>￥2390.00（47800点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3421" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706170803_19109.jpg"></a>
                            <h4><a href="/product/detail?pid=3421" target="_blank">798元周中底价惠战舰战备包（手机下单再减128元）</a></h4>
                            <p>￥798.00<!--<span>￥1658.00（33160点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3420" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706170441_20635.jpg"></a>
                            <h4><a href="/product/detail?pid=3420" target="_blank">498元周中底价惠战舰战备包（手机下单再减75元）</a></h4>
                            <p>￥498.00<!--<span>￥1025.00（20500点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3418" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706165652_98951.jpg"></a>
                            <h4><a href="/product/detail?pid=3418" target="_blank">298元周中底价惠战舰战备包（手机下单再减39元）</a></h4>
                            <p>￥298.00<!--<span>￥564.00（11280点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=848" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-03-03/20160303163241_88795.jpg"></a>
                            <h4><a href="/product/detail?pid=848" target="_blank">200元直充超值返还物资包</a></h4>
                            <p>￥200.00<!--<span>￥279.00（5580点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3416" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706164755_44474.jpg"></a>
                            <h4><a href="/product/detail?pid=3416" target="_blank">98元周中底价惠战舰战备包（手机下单再减11元）</a></h4>
                            <p>￥98.00<!--<span>￥168.00（3360点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3417" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706164938_72905.jpg"></a>
                            <h4><a href="/product/detail?pid=3417" target="_blank">198元周中底价惠战舰战备包（手机下单再减24元）</a></h4>
                            <p>￥198.00<!--<span>￥361.00（7220点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3415" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-07-06/20170706164503_58994.jpg"></a>
                            <h4><a href="/product/detail?pid=3415" target="_blank">48元周中底价惠战舰战备包（手机下单再减5元）</a></h4>
                            <p>￥48.00<!--<span>￥80.00（1600点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=847" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2016-03-03/20160303163114_06002.jpg"></a>
                            <h4><a href="/product/detail?pid=847" target="_blank">100元直充超值返还物资包</a></h4>
                            <p>￥100.00<!--<span>￥133.00（2660点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 补给结束-->
                    <!-- 升级品开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=417" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230133121_15335.jpg"></a>
                            <h4><a href="/product/detail?pid=417" target="_blank">鱼雷发射管修改型3</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=423" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230155927_55023.jpg"></a>
                            <h4><a href="/product/detail?pid=423" target="_blank">损害控制系统修改型2</a></h4>
                            <p>￥16.67<!--<span>￥16.67（333点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=419" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230141148_20946.jpg"></a>
                            <h4><a href="/product/detail?pid=419" target="_blank">飞航控制修改型2</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=418" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230134935_16477.jpg"></a>
                            <h4><a href="/product/detail?pid=418" target="_blank">航空大队修改型3</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=419" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230141148_20946.jpg"></a>
                            <h4><a href="/product/detail?pid=419" target="_blank">飞航控制修改型2</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=416" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230132431_84418.jpg"></a>
                            <h4><a href="/product/detail?pid=416" target="_blank">主炮组修改型3</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=415" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230131857_23760.jpg"></a>
                            <h4><a href="/product/detail?pid=415" target="_blank">防空炮修改型3</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=414" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230131154_06210.jpg"></a>
                            <h4><a href="/product/detail?pid=414" target="_blank">副炮组修改型3</a></h4>
                            <p>￥50.00<!--<span>￥50.00（1000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=405" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-25/20151225164528_28164.jpg"></a>
                            <h4><a href="/product/detail?pid=405" target="_blank">航空大队修改型2</a></h4>
                            <p>￥8.33<!--<span>￥8.33（167点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=420" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2015-12-30/20151230142855_89507.jpg"></a>
                            <h4><a href="/product/detail?pid=420" target="_blank">损害控制系统修改型1</a></h4>
                            <p>￥4.17<!--<span>￥4.17（83点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 银币结束-->
                </div>
            </div>
            <!--战舰世界 结束-->



            <!--战机世界 开始-->
            <div class="wowp">
                <h4 class="gameTitle"><b class="css-sp"></b>战机世界</h4>
                <div class="tab">
                    <a class="curr" href="javascript:;">
                        热门</a><span></span><a href="javascript:;">
                    战机</a><span></span><a href="javascript:;">
                    金币弹</a><span></span><a href="javascript:;">
                    补给</a><span></span><a href="javascript:;">
                    银币</a>
                </div>
                <div class="content">
                    <!--热门开始-->
                    <div class="list">
                        <div class="proListFloat">
                            <a href="http://mall.kongzhong.com/product/detail?pid=3868" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/7981ccfb-69ff-42f0-9638-3b268f771cad.jpg"></a>
                        </div>
                        <div class="proListFloat proListFloatFocus">
                            <div id="FS_Cont_wowp" class="focusG clearfloat">
                                <div class="imgB"><a href="http://t.cn/RCwWYKw" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/4545694a-6e48-44cb-9b7f-92f7c13e0e1e.jpg"></a></div>
                                <div class="imgB"><a href="http://mall.kongzhong.com/MemberController/coupon_productList?discountId=2193&sort=up_desc" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/hppic/7a77492f-daec-442e-95e0-a94e963f35f0.jpg"></a></div>
                            </div>
                            <div class="numList" id="FS_numList_wowp"></div>
                        </div>
                        <!-- 无此广告位-->
                        <div class="proListFloat">
                            <a href="http://mall.kongzhong.com/product/detail?pid=3867" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/16acc395-4871-4b03-b7c8-09abf99944c8.jpg"></a>
                        </div>
                        <div class="proListFloat">
                            <a href="http://mall.kongzhong.com/product/detail?pid=3866" target="_blank"><img class="imgPaddingNone" src="http://stc.mall.kongzhong.com/upload/hppic/b9edc194-f28b-4d76-9db6-f9892b0c2340.jpg"></a>
                        </div>

                        <!-- 无此广告位-->
                    </div>
                    <!--热门结束-->
                    <!-- 坦克开始-->
                    <div class="list" style="display:none">
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3398" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-30/20170630153205_35156.jpg"></a>
                            <h4><a href="/product/detail?pid=3398" target="_blank">ME109TL含机位</a></h4>
                            <p>￥198.00<!--<span>￥283.00（5660点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3397" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-30/20170630153110_88839.jpg"></a>
                            <h4><a href="/product/detail?pid=3397" target="_blank">FW.190A-8含机位</a></h4>
                            <p>￥140.00<!--<span>￥200.00（4000点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3394" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-30/20170630151715_91974.jpg"></a>
                            <h4><a href="/product/detail?pid=3394" target="_blank">敦刻尔克战机高账金币礼包</a></h4>
                            <p>￥50.00<!--<span>￥62.00（1240点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3395" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-30/20170630152130_48826.jpg"></a>
                            <h4><a href="/product/detail?pid=3395" target="_blank">流星I礼包含机位</a></h4>
                            <p>￥178.00<!--<span>￥255.00（5100点券）</span>--></p>
                        </div>
                        <div class="proListFloat">
                            <a href="/product/detail?pid=3396" target="_blank"><img src="http://stc.mall.kongzhong.com/upload/product/2017-06-30/20170630152248_81831.jpg"></a>
                            <h4><a href="/product/detail?pid=3396" target="_blank">海毒牙含机位</a></h4>
                            <p>￥215.00<!--<span>￥308.00（6160点券）</span>--></p>
                        </div>
                    </div>
                    <!-- 坦克结束-->
                    <!-- 金币弹开始-->
                    <div class="list" style="display:none">
                    </div>
                    <!-- 金币弹结束-->
                    <!-- 补给开始-->
                    <div class="list" style="display:none">
                    </div>
                    <!-- 补给结束-->
                    <!-- 银币开始-->
                    <div class="list" style="display:none">
                    </div>
                    <!-- 银币结束-->
                </div>
            </div>
            <!--战机世界 结束-->


        </div>
    </div>

    <!--首页主体 结束-->
</div>
<!--主体 结束-->
<!--意见反馈、回到顶部-->
<div class="fixed">
    <a href="/MemberController/user_feedback" target="_blank" class="yjfk">
        <i></i><span>反馈</span>
    </a>
    <a id="gT" class="goTop">
        <i></i>
    </a>
</div>

<script>
    $("#gT").on("click",function(){
        $("html,body").stop(true,true).animate({scrollTop:0},200);
    })
</script>

<!--页脚 开头-->
<div id="footer">
    <div class="maxW">
        <div class="footHelp clearfloat">
            <dl>
                <dd><b class="css-sp b1"></b></dd>
                <dt>
                    <h4>新手指南</h4>
                    <p><a href="/helpController/helpCenter?hid=142" target="_blank">注册账号</a></p>
                    <p><a href="/helpController/helpCenter?hid=143" target="_blank">激活游戏</a></p>
                    <p><a href="/helpController/helpCenter?hid=141" target="_blank">购物流程</a></p>
                    <p><a href="/helpController/helpCenter?hid=144" target="_blank">支付方式</a></p>
                </dt>
            </dl>
            <dl class="bd">
                <dd><b class="css-sp b2"></b></dd>
                <dt>
                    <h4>促销及优惠</h4>
                    <p><a href="/helpController/helpCenter?hid=147" target="_blank">优惠券</a></p>
                    <p><a href="/helpController/helpCenter?hid=146" target="_blank">限时折扣</a></p>
                    <p><a href="/helpController/helpCenter?hid=145" target="_blank">满额优惠</a></p>
                </dt>
            </dl>
            <dl>
                <dd><b class="css-sp b3"></b></dd>
                <dt>
                    <h4>账户及会员</h4>
                    <p><a href="/helpController/helpCenter?hid=148" target="_blank">账户信息</a></p>
                    <p><a href="/helpController/helpCenter?hid=150" target="_blank">会员与积分</a></p>
                    <p><a href="/helpController/helpCenter?hid=149" target="_blank">我的订单</a></p>
                </dt>
            </dl>
        </div>
        <div class="copyright clearfloat">
            <a href="#" target="_blank"><img src="../../img/zhan.png" width="117" height="50"></a>
            <a href="#" target="_blank"><img src="../../img/wargaming.png" width="105" height="50"></a>
            <p><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP证020001号</a>　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10052.html" target="_blank">经营许可证编号:B2-20090197</a>　|　京公网安备1101080214622　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10050.html" target="_blank" >互联网出版许可证新出网证(京)字046号</a><br>网络文化经营许可证 京网文[2011]0467-160号　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10046.html" target="_blank">广播电视节目制作经营许可证(京)字第880号</a> 　|　<a href="http://www.kongzhong.com/licence/2012-09-18/10219.html" target="_blank">信息网络传播视听节目许可证0109379号</a></p>
        </div>
    </div>
</div>
<!--页脚 结束--><script type="text/javascript" src="../../js/jquery.e-calendar.js"></script>
<script type="text/javascript" src="../../js/base64.js"></script>
<script type="text/javascript" src="../../js/sea-debug.js" ></script>
<script type="text/javascript">
    seajs.config({
        base:'/resources/static/js/',
        // 配置别名
        alias: {
            'jquery':  'libs/jquery/1.10.1/jquery.js',
            'template':  'libs/artTemplate/template-min.js',
            'echo' : 'libs/lazyload/echo'
        }
    });
    seajs.use('modules/index', function(app) {

    });
</script>
<script type="text/javascript" src="../../js/style.js"></script>
<script type="text/javascript" src="../../js/refer.js"></script>
<span style="display:none"><script src="https://s4.cnzz.com/z_stat.php?id=1256834993&web_id=1256834993" language="JavaScript"></script></span></body>
</html>
