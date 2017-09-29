<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type">

    <title>购物车-军武游戏商城</title>
    <meta name="keywords" content="军武游戏商城,军武游戏,空中网,战争三部曲商城,特惠商城,坦克世界,战舰世界,装甲风暴">
    <meta name="description" content="军武游戏商城,空中网自营的军武游戏道具礼包销售商城，其中包括坦克世界、战舰世界等空中网旗下游戏产品">
    <meta name="format-detection" content="address=no">
    <meta name="format-detection" content="telephone=no">
    <link href="/css/com.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/config.js" charset="UTF-8"></script>

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
<!--页头 结束-->
<!--主体 开头-->
<div id="main">
    <!--topNav 开头-->
    <div class="maxW topNav">
        <div class="logo">
            <table border="0" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td><a href="http://mall.kongzhong.com/" target="_blank"><img src="../../img/zhanche.png" width="142" height="70"></a></td>
                    <td>|　购物车</td>
                </tr>
                </tbody></table>
        </div>
        <ul class="step clearfloat">
            <li class="on"><span>1</span><em>我的购物车</em><b></b><i></i></li>
            <li><span>2</span><em>核对订单信息</em><b></b><i></i></li>
            <li><span>3</span><em>成功提交订单</em></li>
        </ul>
    </div>
    <!--<div id="nav"></div>-->
    <!--topNav 结束-->

    <div class="maxW cartMain">
        <div class="cartTitle">我的购物车</div>



        <!--cart 开头-->
        <div id="cartBody"><div class="cartThead">
            <div class="cell cellCheckbox">
                <div id="checkAll" class="checkBtn">
                    <input id="allCheckBox" onclick="javascript:checkAll(this);" type="checkbox" value="" checked="checked"><span class="checked"></span>
                </div>全选
            </div>
            <div class="cell cellProName">商品名称</div>
            <div class="cell cellPrice">单价(人民币/点券)</div>
            <div class="cell cellQuantity">数量</div>
            <div class="cell cellSum">小计(人民币/点券)</div>
            <div class="cell cellAction">操作</div>
            <div class="line"><div class="lineV"></div></div>
        </div>

            <!-- 普通商品 -->
            <!-- 活动商品 -->

            <!-- 失效商品 -->
            <div class="cartItem clearfloat unUse">
                <div class="proBox clearfloat">
                    <div class="cell cellCheckbox">
                        <p>
                            <span>失效</span>
                        </p>
                    </div>
                    <div class="cell cellProName">
                        <div class="proImg">
                            <a href="javascript:"><img alt="" src="./购物车-军武游戏商城_files/20170712105757_44524.jpg"></a>
                            <p>
                                <a href="javascript:">企业钜惠金秋战舰特价（手机下单再减20元）</a>
                            </p>
                            <p>所属游戏：战舰世界</p>
                            <p class="note">
                                已下架
                            </p>
                        </div>
                    </div>
                    <div class="cell cellPrice">￥288.00/5,760点券</div>
                    <div class="cell cellQuantity buyNum">
                        <p>
                            <a href="javascript:;" class="btnReduce">－</a><input type="text" value="1" name=""><a href="javascript:;" class="btnAdd">＋</a>
                        </p>
                        有货
                    </div>
                    <div class="cell cellSum">
                        ￥288.00/
                        5,760
                        点券
                    </div>
                    <div class="cell cellAction">
                        <a href="javascript:deleteProduct(3437);">删除</a>
                    </div>
                </div>
            </div>

            <div class="cartTotal">
                <div class="cell cellCheckbox">
                    <div id="checkAllBottom" class="checkBtn">
                        <input id="allCheckBox2" onclick="javascript:checkAll(this);" type="checkbox" value="" checked="checked"><span class="checked"></span>
                    </div>全选
                </div>
                <div class="cell cellProName"><a href="javascript:deleteSelectProduct();">删除选中商品</a></div>
                <div class="cell cellPrice">&nbsp;</div>
                <div class="cell cellQuantity">已选商品：<span>0</span>件</div>
                <div class="cell cellSum">总计：<span>￥0.0</span><br>已节省-￥0.00</div>
                <div class="cell cellAction"><a class="css-sp" href="javascript:toSettle('43c85');">去结算<b></b></a></div>
            </div>
        </div>
        <!--cart 结束-->

    </div>
</div>
<!--主体 结束-->

<script type="text/javascript">
    //优惠活动
    $(".preEvent").live("hover",function(){
        if($(this).parent().hasClass("preEventOn")){
            $(this).parent().removeClass("preEventOn");
            $(this).find("span").html("ˇ");
        }else{
            $(this).parent().addClass("preEventOn");
            $(this).find("span").html("^");
        }
    });


    $(".cartLoginInfo p a:eq(0)").on('click',function(){
        var backurl = window.location.href;
        window.location.href = ___mall_passport_url + "/login?backurl="+encodeURIComponent(backurl);
    });

</script>
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
            <a href="http://mall.kongzhong.com/cart/to#" target="_blank"><img src="../../img/zhan.png" width="117" height="50"></a>
            <a href="http://mall.kongzhong.com/cart/to#" target="_blank"><img src="../../img/wargaming.png" width="105" height="50"></a>
            <p><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP证020001号</a>　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10052.html" target="_blank">经营许可证编号:B2-20090197</a>　|　京公网安备1101080214622　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10050.html" target="_blank">互联网出版许可证新出网证(京)字046号</a><br>网络文化经营许可证 京网文[2011]0467-160号　|　<a href="http://www.kongzhong.com/licence/2012-05-14/10046.html" target="_blank">广播电视节目制作经营许可证(京)字第880号</a> 　|　<a href="http://www.kongzhong.com/licence/2012-09-18/10219.html" target="_blank">信息网络传播视听节目许可证0109379号</a></p>
        </div>
    </div>
</div>
<!--页脚 结束--><script type="text/javascript" src="/js/style.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/cart.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/common.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/refer.js"></script>
<script src="/js/index.js"></script>
<script type="text/javascript" src="/js/sea-debug.js"></script>
<script type="text/javascript">
    seajs.config({
        base:'/resources/static/js/',
        // 配置别名
        alias: {
            'jquery':  'libs/jquery/1.10.1/jquery.js',
            'template':  'libs/artTemplate/template-min.js'
        }
    });
    seajs.use('modules/top', function(app) {

    });
</script>

<span style="display:none">
    <script src="#" language="JavaScript"></script>
    <script src="#" charset="utf-8" type="text/javascript"></script>
    <a href="#" target="_blank" title="站长统计">站长统计</a>
</span>
</body>
</html>