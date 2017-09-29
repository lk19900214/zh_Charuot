<%@page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- saved from url=(0059)http://mall.kongzhong.com/helpController/helpCenter?hid=102 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>新手上路-军武游戏商城</title>
    <meta name="keywords" content="军武游戏商城,军武游戏,空中网,战争三部曲商城,特惠商城,坦克世界,战舰世界,装甲风暴">
    <meta name="description" content="军武游戏商城,空中网自营的军武游戏道具礼包销售商城，其中包括坦克世界、战舰世界等空中网旗下游戏产品">
    <meta name="format-detection" content="address=no">
    <meta name="format-detection" content="telephone=no">
    <link href="/css/com.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <style>
        .userCenter .left dl dd b{ transition:transform 0.1s ease-in 0s;}
        .userCenter .left dl dd.upIcon b{ -webkit-transform:rotate(-90deg); -moz-transform:rotate(-90deg); -ms-transform:rotate(-90deg); -o-transform:rotate(-90deg); transform:rotate(-90deg);}
    </style>
    <script type="text/javascript">
        $(function(){
            window.location.hash = "#";
            $(".left dt a").each(function(index){
                if($(this).hasClass("curr")){
                    $(this).parent().parent().siblings("dt").slideUp();
                    $(this).parent().parent().prev("dd").removeClass("upIcon").siblings("dd").addClass("upIcon");
                    $(this).parent().parent().show();
                };
            });
            $(".left dd a").click(function(event){
                $(this).parent().removeClass("upIcon").siblings("dd").addClass("upIcon");
                $(this).parent().next("dt").show().siblings("dt").hide();
            })
        })
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
                <td><a href="http://mall.kongzhong.com/"><img src="./新手上路-军武游戏商城_files/warsaga.png" width="142" height="70"></a></td>
                <td>|　军武游戏商城</td>
            </tr>
            </tbody></table>
    </div>
    <div class="search">
        <i class="css-sp"></i>
        <input class="l" style="outline:none" name="" id="productName" type="text" value="秒杀" onfocus="if(value==&#39;秒杀&#39;) {value=&#39;&#39;}" onblur="if (value==&#39;&#39;) {value=&#39;秒杀&#39;}"><input onkeydown="enterIn(event);" class="button" type="button" value="搜 索">
        <p>
            <a href="http://mall.kongzhong.com/searchController/searchProduct?productName=%E3%80%90%E6%B4%BB%E5%8A%A81%E3%80%91" target="_blank" style="font-weight:bold; color:#CC002B;">100元购8级金坦送4000金</a>
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
                <a href="http://wot.kongzhong.com/ztm/sc2017/index.html" target="_blank">超级满减</a>
            </div>
        </div>
    </div>
    <!--菜单导航 结束--> <!--帮助中心 开头-->
    <div class="userCenter">
        <div class="maxW">
            <div class="centerPath">帮助中心<span><i>&gt;</i>公告专区</span></div>
            <div class="left">
                <dl>
                    <dd class="upIcon"><a href="javascript:void(0);">公告专区<b class="css-sp"></b></a></dd>
                    <dt style="display: none;">
                        <p><a href="./新手上路-军武游戏商城_files/新手上路-军武游戏商城.html" class="curr">五一战舰商城活动</a></p>
                    </dt>
                    <dd class="upIcon"><a href="javascript:void(0);">新手指南<b class="css-sp"></b></a></dd>
                    <dt style="display: none;">
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=142">注册账号</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=143">激活游戏</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=141">购物流程</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=144">支付方式</a></p>
                    </dt>
                    <dd class="upIcon"><a href="javascript:void(0);">促销及优惠<b class="css-sp"></b></a></dd>
                    <dt style="display: none;">
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=147">优惠券</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=146">限时折扣</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=145">满额优惠</a></p>
                    </dt>
                    <dd class="upIcon"><a href="javascript:void(0);">账户及会员<b class="css-sp"></b></a></dd>
                    <dt style="display: none;">
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=148">账户信息</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=150">会员与积分</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=149">我的订单</a></p>
                    </dt>
                    <dd class=""><a href="javascript:void(0);">常见问题<b class="css-sp"></b></a></dd>
                    <dt style="">
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=161">购买须知</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=121">消费满额活动说明</a></p>
                        <p><a href="http://mall.kongzhong.com/helpController/helpCenter?hid=101">如何选择赠品？</a></p>
                    </dt>
                </dl>
            </div>
            <div class="right">
                <dl class="userCenterList">
                    <h1><span style="font-size:18px;font-family:微软雅黑, Microsoft YaHei"><strong>五一战舰商城活动</strong></span></h1><p>活动时间：4月28日12点-5月3日10点</p><p><br></p><p>活动规则：</p><p>1. 战舰商城全场消费满50元立返D系2级巡洋舰埃姆登；</p><p>2. 战舰商城全场消费满488元立减88元；</p><p>3. 本次活动按照最高消费金额计算对应奖励，即玩家消费小于488元可以获得埃姆登，若消费大于等于488元，将享受立减88元，活动奖励不能选择；</p><p>4. 大客户定制礼包不参与本次活动。</p>
                </dl>
            </div>
        </div>
    </div>
    <!--帮助中心 结束-->
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
            <a href="http://mall.kongzhong.com/helpController/helpCenter?hid=102#" target="_blank"><img src="./新手上路-军武游戏商城_files/kongzhong.png" width="117" height="50"></a>
            <a href="http://mall.kongzhong.com/helpController/helpCenter?hid=102#" target="_blank"><img src="./新手上路-军武游戏商城_files/wargaming.png" width="105" height="50"></a>
            <p><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP证020001号</a>　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10052.html" target="_blank">经营许可证编号:B2-20090197</a>　|　京公网安备1101080214622　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10050.html" target="_blank">互联网出版许可证新出网证(京)字046号</a><br>网络文化经营许可证 京网文[2011]0467-160号　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10046.html" target="_blank">广播电视节目制作经营许可证(京)字第880号</a> 　|　<a href="http://www.kongzhong.com/licence/2012-09-18/10219.html" target="_blank">信息网络传播视听节目许可证0109379号</a></p>
        </div>
    </div>
</div>
<!--页脚 结束--><script type="text/javascript" src="/js/style.js"></script>
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
    seajs.use('modules/help/help', function(app) {
    });
</script>
<span style="display:none">
    <script src="#" language="JavaScript"></script>
    <script src="#" charset="utf-8" type="text/javascript"></script>
    <a href="#" target="_blank" title="站长统计">站长统计</a>
</span>
</body>
</html>