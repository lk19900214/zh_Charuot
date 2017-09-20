/**
 * Created by webrx on 2017-09-20.
 */
//动态生成JS或CSS
function delay_js(url) {
    var type = url.split("."),
        file = type[type.length - 1];
    if (file == "css") {
        var obj = document.createElement("link"),
            lnk = "href",
            tp = "text/css";
        obj.setAttribute("rel", "stylesheet");
    } else var obj = document.createElement("script"),
        lnk = "src",
        tp = "text/javascript";
    obj.setAttribute(lnk, url);
    obj.setAttribute("type", tp);
    file == "css" ? document.getElementsByTagName("head")[0].appendChild(obj) : document.body.appendChild(obj);
    return obj;
};
//延时加载并判断是否加载完毕
function loadjs(url, succ, v) {
    var elem = delay_js(url);
    if ((navigator.userAgent.indexOf('MSIE') == -1) ? false: true) {
        elem.onreadystatechange = function() {
            if (this.readyState && this.readyState == "loading") return;
            else succ(v);
        };
    } else elem.onload = function() {
        succ(v);
    };
    elem.onerror = function() {};
};

function nTabs(tabObj, obj, tag) {
    var tabList = document.getElementById(tabObj).getElementsByTagName("li");
    if (tag) {
        tabList = document.getElementById(tabObj).getElementsByTagName(tag);
    }
    for (i = 0; i < tabList.length; i++) {
        if (tabList[i].id == obj.id) {
            document.getElementById(tabObj + "_Title" + i).className = "active";
            document.getElementById(tabObj + "_Content" + i).style.display = "block";
        } else {
            document.getElementById(tabObj + "_Title" + i).className = "normal";
            document.getElementById(tabObj + "_Content" + i).style.display = "none";
        }
    }
}

//关闭
function closeDiv() {
    $("#maskLayer,#Info").stop(true, true).fadeOut(200,
        function() {
            $(this).remove()
        });
}

//遮罩
function maskLayer() {
    var maskLayer = "<div id='maskLayer'></div>";
    var info = "<div id='Info'><span class='close'></span></div>";
    $("body").append(maskLayer).append(info);
    $("#Info").removeClass();
    $("#maskLayer").height($(document).height()).show();
}
var _closeDiv = function() {};
//显示提示信息框
function showTsInfo(className, htmlTitle, html, closeCallback) {
    maskLayer();
    var tsInfo = "<div class='tsTitle'>" + htmlTitle + "</div><div class='tsContentTable'><div class='tsContentCell'><div class='tsContent'>" + html + "</div></div></div>";
    if (className != "phoneTs") {
        $("#Info").removeClass().addClass("smTs");
    } else {
        $("#Info").removeClass().addClass(className);
    }
    if (closeCallback) {
        _closeDiv = closeCallback;
    }
    $("#Info").show().html("<span class='close' onclick='_closeDiv()'></span>").append(tsInfo);
}

$(function() {

    //分享
    if ($(".share").length >= 1) {
        var title = $(".pName").text();
        var url = window.location.href;
        var pic = $(".product dd").find("img").attr("src");
        //alert(title+","+pic)
        var title = "我发现了一个非常不错的商品：" + $(".pName h1").text() + "  优惠价：" + $(".price p:eq(1) span").text() + " （分享自空中网商城）";
        window._bd_share_config = {
            common: {
                bdText: title,
                bdDesc: title,
                bdUrl: url,
                bdPic: pic
            },
            share: [{
                //"bdSize" : 24,
                //"bdStyle":1,
                "bdCustomStyle": "css/style.css"
            }]
        }
        with(document) 0[(getElementById('shareId')).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~ ( - new Date() / 36e5)];
    }

    //tabBtn
    $(".tabBtn a").on("click",
        function(event) {
            event.preventDefault();
            if (!$(this).hasClass("curr")) {
                var _index = $(this).index();
                $(this).addClass("curr").siblings().removeClass("curr");
                $(this).parent().siblings(".tabContent").eq(_index).show().siblings(".tabContent").hide();
            }

        }), $(".sideTab a").on("click",
        function(event) {
            event.preventDefault();
            if (!$(this).hasClass("curr")) {
                var _index = $(this).index();
                $(this).addClass("curr").siblings().removeClass("curr");
                $(this).parent().siblings(".sideList").eq(_index).show().siblings(".sideList").hide();
            }

        })

    $(".checkBtn input").on("click",
        function() {
            //alert($(this).prop("checked"))
            if ($(this).prop("checked")) {
                $(this).siblings("span").addClass("checked");
                if ($(this).parent().attr("id") == "checkAll" || $(this).parent().attr("id") == "checkAllBottom") {
                    $(".cellCheckbox .checkBtn,.pTitle .checkBtn").find("input").prop("checked", true);
                    $(".cellCheckbox .checkBtn,.pTitle .checkBtn").find("span").addClass("checked");
                } else {
                    $("#checkAll,#checkAllBottom").find("input").prop("checked", false);
                    $("#checkAll,#checkAllBottom").find("span").removeClass("checked");
                }
            } else {
                $(this).siblings("span").removeClass("checked");
                if ($(this).parent().attr("id") == "checkAll" || $(this).parent().attr("id") == "checkAllBottom") {
                    $(".cellCheckbox .checkBtn,.pTitle .checkBtn").find("input").prop("checked", false);
                    $(".cellCheckbox .checkBtn,.pTitle .checkBtn").find("span").removeClass("checked");
                } else {
                    $("#checkAll,#checkAllBottom").find("input").prop("checked", false);
                    $("#checkAll,#checkAllBottom").find("span").removeClass("checked");
                }
            }
        });

    //菜单导航
    $(".menu").hover(function() {
            if ($(".menuTitle span").html() != "" && !$(this).hasClass("menuHover")) {
                $(this).addClass("menuHover");
                $(".menuTitle span").html("︿");
            }
        },
        function() {
            if ($(".menuTitle span").html() != "") {
                $(this).removeClass("menuHover");
                $(".menuTitle span").html("﹀");
            }
        });
    $(".menuFullList > div").hover(function() {
            $(this).addClass("hover");
        },
        function() {
            $(this).removeClass("hover");
        });
    $(".subpath").hover(function() {
            $(this).addClass("subpathHover");
        },
        function() {
            $(this).removeClass("subpathHover");
        });

    //结算页中使用优惠券tab
    $(".tabC a").on("click",
        function(event) {
            event.preventDefault();
            var _index = $(this).index();
            $(this).addClass("curr").siblings().removeClass("curr");
            $(this).parent().siblings(".tabCL").find(".tableD").eq(_index).show().siblings().hide();
        });
    $(".checkA .checkBtn input").prop("checked", false);
    $(".checkA").on("click",
        function(event) {
            event.preventDefault();
            if (!$(this).hasClass("on")) {
                $(this).find("input").prop("checked", true);
                $(this).find("span").addClass("checked");
                $(this).addClass("on").siblings("div").show();
            } else {
                $(this).find("input").prop("checked", false);
                $(this).find("span").removeClass("checked");
                $(this).removeClass("on").siblings("div").hide();
            }
        });

    //input选择
    $(".checkBtn input").each(function() {
        //alert($(this).prop("checked"))
        if ($(this).prop("checked")) {
            $(this).siblings("span").addClass("checked");
        }
        //console.log($(this).prop("checked"));
    });
})
//优惠券提示
$(function() {
    $(".coupontext dl").hover(function() {
            $(this).find('dd').show();
        },
        function() {
            $(this).find('dd').hide();
        });
});
$('.exChange').toggle(function() {
        $(this).addClass("active");
        $('.cline').show();
    },
    function() {
        $(this).removeClass("active");
        $('.cline').hide();
    });
