/**
 * Created by webrx on 2017-09-20.
 */
function closeTDiv(){ $("#maskLayer,#infoDiv,#address").hide();}

$(function(){


    var docH=$("body").height();

    function closeTDiv(){ $("#maskLayer,#infoDiv,#address").hide();}

    $(".close").bind("click",closeTDiv)
    $(".qd").bind("click",closeTDiv)

    $("#queding").unbind( "click" );
    $("#congzhi").unbind( "click" );

    payDiv=function(){
        var infoDivW=$(".infoPay").innerWidth()+2;
        var infoDivH=$(".infoPay").innerHeight()+7;
        var isIE=!!window.ActiveXObject;
        var isIE6=isIE&&!window.XMLHttpRequest;
        if(isIE6){infoDivH=0}
        $("#maskLayer").height(docH).show();
        $("#infoDiv").show().css({
            width:infoDivW+"px",
            height:infoDivH+"px",
            marginLeft:-(infoDivW/2),
            marginTop:-(infoDivH/2)})
    }

    tsDiv=function(){
        var infoDivW=$(".tsInfo").innerWidth()+2;
        var infoDivH=$(".tsInfo").innerHeight()+7;
        var isIE=!!window.ActiveXObject;
        var isIE6=isIE&&!window.XMLHttpRequest;
        if(isIE6){infoDivH=0}
        $("#maskLayer").height(docH).show();
        $("#infoDiv").show().css({
            width:infoDivW+"px",
            height:infoDivH+"px",
            marginLeft:-(infoDivW/2),
            marginTop:-(infoDivH/2)})
    }

    dhDiv=function(){
        var infoDivW=$(".infoDh").innerWidth()+2;
        var infoDivH=$(".infoDh").innerHeight()+7;
        var isIE=!!window.ActiveXObject;
        var isIE6=isIE&&!window.XMLHttpRequest;
        if(isIE6){infoDivH=0}
        $("#maskLayer").height(docH).show();
        $("#address").show().css({
            width:infoDivW+"px",
            height:infoDivH+"px",
            marginLeft:-(infoDivW/2),
            marginTop:-(infoDivH/2)})
    }

})




//----new




function getcartnum(){
    $.ajax({
        url : "../ajax/getcartnum.action",
        async : false,
        dataType : "json",
        cache : false,
        success : function(data) {
            $("#mycartnum").html(data);
        }
    });
}
//$(document).ready(function(){
//	$('#keywords').bind('keyup', function(event){
//		 if (event.keyCode=="13"){
//			searchkeyword();
//	   	 }
//	});
//});

function searchkeyword(){
    var keyword = $('#keywords').attr("value");
    keyword = keyword.replace(/\ /g,'');
    if(keyword.length == 0) return;
    keyword = encodeURI(encodeURI(keyword));
    window.location.href= "search4Integral?keyword="+keyword+"&enc="+"utf-8";
}
//1 - 没有登录  2- 选择购买方式
function showDiv(flag){
    //document.getElementById('popDiv').style.display='block';
    //document.getElementById('popIframe').style.display='block';
    //document.getElementById('popIframe').style.height=document.body.clientHeight;
    //document.getElementById('bgdiv').style.display='block';
    //document.getElementById('bgdiv').style.height=document.body.clientHeight;
    tsDiv();
    var commName = $('#comm_name').text();
    switch (flag) {
        case 1:
            $('#payinfo').html('您尚未登录，请登录后再购买！');break;
        case 2:
            $('#payinfo').html('<p>请选择支付方式</p><dd><label class="label_radio"><input type="radio" hidefocus="true" name="sample-radio1" value="1" checked=""><b>点券购买</b></label><label class="label_radio"><input type="radio" hidefocus="true" name="sample-radio1" value="2"><b>网银购买</b></label>  </dd><dt><a href="javascript:wotbuytype();">确定</a></dt>');
            $(function(){
                $('body').addClass('has-js');
                $('.label_check,.label_radio').click(function(){
                    setupLabel();
                });
                setupLabel();
            });
            break;
        case 3:
            $('#payinfo').html('请您选择大区！');break;
        case 4:
            $('#payinfo').html('<dd><p>您的账号余额不足，请到空中网一号通会员中心进行<a href="http://passport.kongzhong.com/billing/buy.jsp" target="_blank">充值</a></p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 5:
            $('#payinfo').html('对不起，您的购买数量超过了个人限量！');$('#alertQd').attr("href","javascript:;");break;
        case 30:
            $('#payinfo').html('订单正在处理,请稍后!');$('#alertQd').attr("href","javascript:;");break;
        case 6:
            $('#payinfo').html('<dd><p>您所拥有的购物券余额不足，无法使用！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 7:
            $('#payinfo').html('该商品已经下架或者不存在！');break;
        case 8:
            $('#payinfo').html('<dd><p>请选择至少一样组合商品！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 9:
            $('#payinfo').html('此商品数量不足！');
            $('#alertQd').attr("href","javascript:;");
            break;
        case 10:
            $('#payinfo').html('<dd><p>此商品不在限时购买的时间内！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 11:
            $('#payinfo').html('<dd><p>此商品不能使用购物劵购买！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 12:
            $('#payinfo').html('<dd><p>购物劵使用异常！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 13:
            $('#payinfo').html('<dd><p>加入购物车异常！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 14:
            $('#payinfo').html('<dd><p>该套餐已加入购物车中，请查看购物车！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 15:
            $('#payinfo').html('<dd><p>该组合已加入购物车中，请查看购物车！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 16:
            $('#payinfo').html('参数异常！');
            $('#alertQd').attr("href","javascript:;");
            break;
        case 17:
            $('#payinfo').html('对不起 购买失败 如有疑问 请联系客服！');
            $('#alertQd').attr("href","javascript:;");
            break;
        case 18:
            $('#payinfo').html('<dd><p>请检查购物车 选择您所要购买的商品！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 19:
            $('#payinfo').html('<dd><p>价格异常，请检查购物车！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 20:
            $('#payinfo').html('套餐购买数量只能为1！">确定</a></dt>');break;
        case 21:
            $('#payinfo').html('<p>如果您支付成功，请点击已完成支付</p><dd><label class="label_radio"><a href="javascript:closeDiv();"><b>已完成支付</b></a></label><label class="label_radio"><a href="http://gmall.kongzhong.com/wotmall/homepage/help.html#a4"><b>支付遇到问题</b></a></label>  </dd>');break;
        case 22:
            $('#payinfo').html('<dd><p>您的订单不存在，请重新确认购买！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 23:
            $('#payinfo').html('请不要重复提交！');
            $('#alertQd').attr("href","javascript:;");
            break;
        case 24:
            $('#payinfo').html('<dd><p>金币商品请直接购买！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 25:
            $('#payinfo').html('<dd><p>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 26:
            $('#payinfo').html('<dd><p>您尚未登录，请先登录再修改昵称！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 27:
            $('#payinfo').html('<dd><p>很抱歉，您不符合购买'+ commName +'的条件，请您关注官网，谢谢！</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');break;
        case 28:
            $('#payinfo').html('很抱歉，您的积分不足，无法兑换！');
            $('#alertQd').attr("href","javascript:;");
            break;
        case 31:
            $('#payinfo').html("未激活坦克世界游戏,请速去<a target='_blank' href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!");
            $('#alertQd').attr("href","javascript:;");
            break;
        case 32:
            $('#payinfo').html("此商品不能购买！");
            $('#alertQd').attr("href","javascript:;");
            break;

    }
}
/**
 * 直接展示提示信息
 * @param {} info
 */
function showDivInfo(info){
    document.getElementById('popDiv').style.display='block';
    document.getElementById('popIframe').style.display='block';
    document.getElementById('popIframe').style.height=document.body.clientHeight;
    document.getElementById('bgdiv').style.display='block';
    document.getElementById('bgdiv').style.height=document.body.clientHeight;
    $('#payinfo').html(info);
}

function showInfo(info){
    document.getElementById('popDiv').style.display='block';
    document.getElementById('popIframe').style.display='block';
    document.getElementById('popIframe').style.height=document.body.clientHeight;
    document.getElementById('bgdiv').style.display='block';
    document.getElementById('bgdiv').style.height=document.body.clientHeight;
    $('#payinfo').html('<dd><p>'+info+'</p></dd><dt><a href="javascript:closeDiv();">确定</a></dt>');
}
/**
 * 展示选择购买方式
 * @param {} commodityid
 * @param {} commodityno
 * @param {} name
 */
function showbuytype(id,itemType){
    document.getElementById('popDiv').style.display='block';
    document.getElementById('popIframe').style.display='block';
    document.getElementById('popIframe').style.height=document.body.clientHeight;
    document.getElementById('bgdiv').style.display='block';
    document.getElementById('bgdiv').style.height=document.body.clientHeight;
    $('#payinfo').html("<p>请选择支付方式</p><dd><label class=\"label_radio\"><input type=\"radio\" hidefocus=\"true\" name=\"sample-radio1\" value=\"1\" checked=\"\">" +
        "<b>点券购买</b></label><label class=\"label_radio\"><input type=\"radio\" hidefocus=\"true\" name=\"sample-radio1\" value=\"2\">" +
        "<b>网银购买</b></label>  </dd><dt><a id=\"order_fastPay\" href=\"javascript:fastPayConfirm('"+id+"','"+itemType+"');\">确定</a></dt>");
    $(function(){
        $('body').addClass('has-js');
        $('.label_check,.label_radio').click(function(){
            setupLabel();
        });
        setupLabel();
    });
}

/**
 * 商品确认购买
 * @param {} name
 * @param {} num
 * @param {} areaName
 * @param {} commodityno
 */
function showDivSure(name,num,areaName,areaID,deductPoint,commodityID,commodityno,coupon,rid,packageId){
    document.getElementById('popDiv').style.display='block';
    document.getElementById('popIframe').style.display='block';
    document.getElementById('popIframe').style.height=document.body.clientHeight;
    document.getElementById('bgdiv').style.display='block';
    document.getElementById('bgdiv').style.height=document.body.clientHeight;
    $('#payinfo').html('<dd><p>购买 <span>'+name+' '+num+'件</span><br>本次购买物品将发送至 <span>'+areaName+'</span> 请确认！</p></dd><dt><a href="http://gmall.kongzhong.com/wotmall/accountcentre/immedybuy.action?areaID='+
        areaID+'&areaName='+encodeURI(encodeURI(areaName))+'&commodityID='+commodityID+'&buynum='+num+'&deductPoint='+deductPoint+'&commodityNo='+commodityno+'&coupon='+coupon+'&rid='+rid+'&packageId='+packageId+'" onclick="javascript:closeDiv();" >确定</a></dt>');
}
function closeDiv(){
    document.getElementById('popDiv').style.display='none';
    document.getElementById('bgdiv').style.display='none';
    document.getElementById('popIframe').style.display='none';
    //document.getElementById('loader').style.display='none';
}



$(window).load(function(){
    $(function(){
        $('body').addClass('has-js');
        $('.label_check,.label_radio').click(function(){
            setupLabel();
        });
        setupLabel();
    });
});
function setupLabel(){
    if($('.label_check input').length) {
        $('.label_check').each(function(){
            $(this).removeClass('c_on');
        });
        $('.label_check input:checked').each(function(){
            $(this).parent('label').addClass('c_on');
        });
    };
    if($('.label_radio input').length) {
        $('.label_radio').each(function(){
            $(this).removeClass('r_on');
        });
        $('.label_radio input:checked').each(function(){
            $(this).parent('label').addClass('r_on');
        });
    };
}



$(function(){
    var ks = $("#KinSlideshow");
    if(ks.length >0){
        $("#KinSlideshow").KinSlideshow({
            moveStyle:"down",
            intervalTime:5,
            mouseEvent:"mouseover",
            isHasTitleBar:false,
            isHasTitleFont:false,
            btn:{btn_bgColor:"#fbfbfb",btn_borderColor:"#480000",btn_fontColor:"#660000",btn_fontHoverColor:"#fff"}
        });
    }
});



$(document).ready(
    function(){
        $(".nav input").focus(function(){$(this).addClass("focus")})
        $(".nav input").blur(function(){$(this).removeClass("focus")})
    });



$(function(){
        $(".li_on").hover(
            function(){
                $(".li_on").css("background","url(http://wot.kongzhong.com/OnlineMall/images/menu_a_hover.jpg) repeat-x 0 0");
                $(".lei").css("display","block");
            },
            function(){
                $(".li_on").css("background","url(http://wot.kongzhong.com/OnlineMall/images/menu_a_on.jpg) repeat-x 0 0");
                $(".lei").css("display","none");
            }
        );
    }
);



$(function(){
        $(".list dl").hover(function(){
            $(this).addClass("curr")}, function(){
            $(this).removeClass("curr")}
        )
    }
);



$(document).ready(
    function(){
        var a = $(".lei p a");
        a.click(
            function(){
                $(this).addClass("now").siblings().removeClass("now");
                for(var i=0; i< a.length; i++){
                    if(a[i] == this) {
                        var pageindex= i;
                        $(".lei > ol").eq(pageindex).show().siblings("ol").hide();
                        return;
                    }
                }
            }
        );
    }
);



$(document).ready(
    function(){
        var a1 = $(".new .a_menu a");
        //a1.click(
        a1.hover(
            function(){
                $(this).addClass("on").siblings().removeClass("on");
                for(var i=0; i< a1.length; i++){
                    if(a1[i] == this) {
                        var pageindex= i;
                        $(".new .list > div").eq(pageindex).show().siblings("div").hide();
                        $(".new .list > a").eq(pageindex).show().siblings("a").hide();
                        return;
                    }
                }
            }
        );
    }
);




$(document).ready(
    function(){
        var a2 = $(".sp_js_menu a");
        a2.click(
            function(){
                $(this).addClass("sp_on").siblings().removeClass("sp_on");
                for(var i=0; i< a2.length; i++){
                    if(a2[i] == this) {
                        var pageindex= i;
                        $(".sp_inf > .spdiv").eq(pageindex).show().siblings(".spdiv").hide();
                        return;
                    }
                }
            }
        );
    }
);



$(document).ready(
    function(){
        var a3 = $(".plst_pt ul li a");
        a3.click(
            function(){
                $(this).parents(".plst_pt").find(this).toggleClass("sp_tc_on").parents(".plst_pt").find("a").not(this).removeClass("sp_tc_on");
            }
        );
    }
);



$(document).ready(
    function(){
        var a4 = $(".s_num a");
        a4.click(
            function(){
                $(this).toggleClass("a_num").children("i").parent().siblings().removeClass("a_num");
            }
        );
    }
);


//jQuery Script
$(function(){

    var ptListWrp = $('.jQ_ptLst');
    var valLstLiWth = $('.jQ_ptLst li').width();
    var valImgALth = 1;
    var valpLstMg = 0;
    var pLstLesMg = 5;

    var pLstRoLt = $('.jQ_plstRoLt');
    var pLstRoRt = $('.jQ_plstRoRt');
    var pLstImgALth = ptListWrp.find('a').length;


    function fnAutoWth(){

        $('.jQ_ptLst ul').css({'marginLeft':'0'});
        pLstRoLt.hide();
        pLstRoRt.show();

        var pLstWrpWth = ptListWrp.width();
        valImgALth = Math.floor(pLstWrpWth / valLstLiWth);

        function fnpLstMg(){

            valpLstMg = Math.ceil((pLstWrpWth - valImgALth * valLstLiWth) / (valImgALth + 1));
        };

        fnpLstMg();

        if(valpLstMg < pLstLesMg){
            valImgALth = valImgALth ;
            fnpLstMg();
        };

        if(valImgALth >= pLstImgALth){
            valImgALth = pLstImgALth;
            fnpLstMg();
            pLstRoRt.hide();
        };

    };

    fnAutoWth();

    $(window).resize(function(){
        fnAutoWth();
    });

    function fnPlstArr($this){
        var pLstRoWrp = ptListWrp.find('ul');
        var ptLstCssMg = parseInt(pLstRoWrp.css('margin-left'));
        var ptLstImgAMg = parseInt(pLstRoWrp.find('li:first').css('margin-left'));

        if($this.hasClass('jQ_plstRoRt')){

            pLstRoWrp.not(':animated').animate({marginLeft: ptLstCssMg - (ptLstImgAMg + valLstLiWth)},200,function(){

                var ptLstCurMg = parseInt(pLstRoWrp.css('margin-left'));
                var ptLstRoWth = (pLstImgALth - valImgALth) * (ptLstImgAMg + valLstLiWth);

                if(ptLstCurMg + ptLstRoWth == 0){
                    $this.hide();
                };
                pLstRoLt.show();
            });
        };

        if($this.hasClass('jQ_plstRoLt')){
            pLstRoWrp.not(':animated').animate({marginLeft: ptLstCssMg + (ptLstImgAMg + valLstLiWth)},200,function(){

                var ptLstCurMg = parseInt(pLstRoWrp.css('margin-left'));
                var ptLstRoWth = (pLstImgALth - valImgALth - 1) * (ptLstImgAMg + valLstLiWth);

                if(ptLstCurMg == 0){
                    $this.hide();
                };
                pLstRoRt.show();
            });
        };
    };

    $('.jQ_plstRoLt, .jQ_plstRoRt').click(function(){
        fnPlstArr($(this));
    });


});


function token(){
    $.ajax({
        url : "../common/getToken",
        async : false,
        dataType : "json",
        cache : false,
        success : function(data) {
            $("#token").val(data);
        }
    });
}
