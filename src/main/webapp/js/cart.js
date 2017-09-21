
$(document).ready(function(){
	$.ajax({
        type: "POST",
        url: "./ajax/loadCartForm",
        data: "pf=1",
        dataType: "json",
        success: function(data){
            if(data != "") {
            	//成功
            	if (data.totalProductCount == 0) {
            		//没有商品
            		if ($("#main .cartLoginInfo")[0] == null) {
            			appendCartIsNullPrompt();
            		}
            	} else {
            		$("#cartBody").html(data.cartHtml);
            		//console.log(data.cartHtml);
            	}
            } else {
                alert("加载购物车失败！");
            }
        },
        error: function() {
            //alert("请求失败,请稍后再试");
        }
    });
});

function appendCartIsNullPrompt() {
	$("#cartBody").html("");
	$(".cartTitle").after("<div class='cartLoginInfo'><p>您的购物车还是空的，快去挑选商品吧！<a href='/'>去购物</a></p></div>");
}

function waitingLoading() {
	//$("body").append("<div class='waitingLoading123'><span></span><b></b></div>");
}

function clearWaiting() {
	//$(".waitingLoading123").remove();
}

function waitingLoading2() {
	$("body").append("<div class='waitingLoading123'><span></span><b></b></div>");
}

function clearWaiting2() {
	$(".waitingLoading123").remove();
}

function addBuynum(productId, type) {
    //console.log("add = " + productId);
    var num = $("#buyNum_" + productId).val();
    if (num < 99) {
        num++;
    }
    if (num > 99) {
        num = 99;
    }
    if (num < 1) {
    	num = 1;
    }
    $("#buyNum_" + productId).val(num);
    waitingLoading();
	$.ajax({
        type: "POST",
        url: "./ajax/changeNum",
        data: "productId=" + productId + "&buyNum=" + num + "&type=" + type + "&pf=1",
        dataType: "json",
        //async: false, //设为false就是同步请求
        success: function(data){
			clearWaiting();
            if(data != null) {
            	//成功
            	$("#cartBody").html(data.cartHtml);
            	//console.log(data.cartHtml);
            } else {
                alert("修改商品数量失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
	
}

function decBuynum(productId, type) {
    //console.log("dec = " + productId);
    var num = $("#buyNum_" + productId).val();
    if (num > 1) {
        num--;
    }
    if (num > 99) {
        num = 99;
    }
    $("#buyNum_" + productId).val(num);
    waitingLoading();
	$.ajax({
        type: "POST",
        url: "./ajax/changeNum",
        data: "productId=" + productId + "&buyNum=" + num + "&type=" + type + "&pf=1",
        dataType: "json",
        //async: false, //设为false就是同步请求
        success: function(data){
			clearWaiting();
            if(data != null) {
            	//成功
            	$("#cartBody").html(data.cartHtml);
            	//console.log(data.cartHtml);
            } else {
                alert("修改商品数量失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

function changeBuynum(productId, type) {
    //console.log("dec = " + productId);
    var num = $("#buyNum_" + productId).val();
    if (num > 99) {
        num = 99;
    }
    if (num < 1) {
    	num = 1;
    }
    $("#buyNum_" + productId).val(num);
    waitingLoading();
	$.ajax({
        type: "POST",
        url: "./ajax/changeNum",
        data: "productId=" + productId + "&buyNum=" + num + "&type=" + type + "&pf=1",
        dataType: "json",
        async: false, //设为false就是同步请求
        success: function(data){
			clearWaiting();
            if(data != null) {
            	//成功
            	$("#cartBody").html(data.cartHtml);
            	//console.log(data.cartHtml);
            } else {
                alert("修改商品数量失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

//全选
function checkAll(obj){
	waitingLoading();
    //console.log("1. " +obj.checked);
    var ckBox = $("#cartBody").find("input[type='checkbox']");
    if (obj.checked == true) {
        ckBox.attr("checked",true);
        $(".cellCheckbox .checkBtn, .pTitle .checkBtn").find("span").addClass("checked");
        
        $.ajax({
	        type: "POST",
	        url: "./ajax/cartSelectAllItem",
	        data: "pf=1",
	        dataType: "json",
	        success: function(data){
        		clearWaiting();
	            if(data != null) {
	            	//成功
	            	$("#cartBody").html(data.cartHtml);
	            	//console.log(data.cartHtml);
	            } else {
	                alert("选择购物车商品失败！");
	                window.location = window.location.href;
	            }
	        },
	        error: function() {
	        	clearWaiting();
	            alert("请求失败,请稍后再试");
	            window.location = window.location.href;
	        }
	    });
    } else {
        //ckBox.attr("checked",false);
        ckBox.removeAttr("checked");
        $(".cellCheckbox .checkBtn,.pTitle .checkBtn").find("span").removeClass("checked");
        
        $.ajax({
	        type: "POST",
	        url: "./ajax/cartCancelAllItem",
	        data: "pf=1",
	        dataType: "json",
	        success: function(data){
        		clearWaiting();
	            if(data != null) {
	            	//成功
	            	$("#cartBody").html(data.cartHtml);
	            	//console.log(data.cartHtml);
	            } else {
	                alert("选择购物车商品失败！");
	                window.location = window.location.href;
	            }
	        },
	        error: function() {
	        	clearWaiting();
	            alert("请求失败,请稍后再试");
	            window.location = window.location.href;
	        }
	    });
    }
}

//单选
function checkSingle(obj) {
	waitingLoading();
    //console.log("2. " + obj.checked);
	var url = "";
    if(obj.checked == false){
        url = "./ajax/cartcancelItem";
    } else {
    	url = "./ajax/cartselectItem";
    }

    var productId = $(obj).val();
    //console.log("productId = " + productId);
    $.ajax({
        type: "POST",
        url: url,
        data: "productId=" + productId,
        dataType: "json",
        async: false, //设为false就是同步请求
        success: function(data){
    		clearWaiting();
            if(data != null) {
            	//成功
            	if (data.totalProductCount == 0) {
            		//没有商品
            		if ($("#main .cartLoginInfo")[0] == null) {
            			appendCartIsNullPrompt();
            		}
            	} else {
            		$("#cartBody").html(data.cartHtml);
            		//console.log(data.cartHtml);
            	}
            } else {
                alert("选择商品失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

//活动单选
function checkActivity(obj, type, productId) {
	waitingLoading();
	var url = "";
	var param = "";
	var activityId = $(obj).val();
	if (type == 4) {
		//套餐
		if(obj.checked == false){
	        url = "./ajax/cartcancelpackageitem";
	    } else {
	    	url = "./ajax/cartselectpackageitem";
	    }
		param = "packageId=" + activityId;
	} else {
		//活动
		if(obj.checked == false){
	        url = "./ajax/cartcancelactivityitem";
	    } else {
	    	url = "./ajax/cartselectactivityitem";
	    }
		param = "activityId=" + activityId + "&productId=" + productId;
	}
    //console.log("activityId = " + activityId);
    //console.log("param = " + param);
    $.ajax({
        type: "POST",
        url: url,
        data: param,
        dataType: "json",
        async: false, //设为false就是同步请求
        success: function(data){
    		clearWaiting();
            if(data != null) {
            	//成功
            	$("#cartBody").html(data.cartHtml);
            	//console.log(data.cartHtml);
            } else {
                alert("选择商品失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

//仅限选择多买优惠活动商品
function checkActivityProduct(obj, type, activityId) {
	waitingLoading();
	
	var url = "";
	var param = "";
	var productId = $(obj).val();
	//活动
	if(obj.checked == false){
        url = "./ajax/cartcancelactivityitem";
    } else {
    	url = "./ajax/cartselectactivityitem";
    }
	param = "activityId=" + activityId + "&productId=" + productId;
    //console.log("activityId = " + activityId);
    //console.log("param = " + param);
    $.ajax({
        type: "POST",
        url: url,
        data: param,
        dataType: "json",
        async: false, //设为false就是同步请求
        success: function(data){
    		clearWaiting();
            if(data != null) {
            	//成功
            	$("#cartBody").html(data.cartHtml);
            	//console.log(data.cartHtml);
            } else {
                alert("选择商品失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

function deleteSelectProduct() {
	var ids = "";
	var types = "";
	$(".normal").each(function() {
		if (this.checked) {
			ids += this.value + ",";
			types += "1,";
		}
	});
	$(".pack[name='boxPack']").each(function() {
        if (this.checked) {
            ids += this.value + ",";
            types += "2,";
        }
    });
	if (ids == ""){
        alert("请选择要删除的商品！");
        return;
    }
	
	waitingLoading();
	//console.log("id = " + ids);
	//console.log("types = " + types);
	$.ajax({
        type: "POST",
        url: "./ajax/batchRemoveProduct",
        data: "productId=" + ids.substring(0, ids.length-1) + "&type=" + types.substring(0, types.length-1) + "&pf=1",
        dataType: "json",
        success: function(data){
			clearWaiting();
			if(data != null) {
            	//成功
            	if (data.totalProductCount == 0) {
            		//没有商品
            		if ($("#main .cartLoginInfo")[0] == null) {
            			appendCartIsNullPrompt();
            		}
            	} else {
            		$("#cartBody").html(data.cartHtml);
            		//console.log(data.cartHtml);
            	}
            } else {
                alert("删除商品失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

function get(name){
    return decodeURIComponent(getCookiesObj()[name]) || null;
}

//获取cookie对象，以对象表示
function getCookiesObj(){
    var cookies = {};
    if(document.cookie){
        var objs = document.cookie.split('; ');
        for(var i in objs){
            var index = objs[i].indexOf('='),
                name = objs[i].substr(0, index),
                value = objs[i].substr(index + 1, objs[i].length);  
            cookies[name] = value;
        }
    }
    return cookies;
}

function deleteProduct(productId) {
	waitingLoading();

	var useraccount = get("UDT-KZG");
	var isLogin =false;
	
	if (useraccount !='undefined')
	{
		isLogin=true;
	}
	
 	$.ajax({
        type: "POST",
        url: "./ajax/deleteProduct",
        data: "productId=" + productId + "&type=1&pf=1",
        dataType: "json",
        success: function(data){
        	
			clearWaiting();
            if(data != null) {
            	//成功
            	if (data.totalProductCount == 0) {
            		//没有商品
            		//已经登陆的情况下
            		if (isLogin)
            		{
            			if ($("#main .cartLoginInfo")[0] == null) {
                			appendCartIsNullPrompt();
                		}	
            		}
            		else  //未登录的情况下
            		{
            			$("#cartBody").html("");
            		}
            		
            	} else {
            		$("#cartBody").html(data.cartHtml);
            		//console.log(data.cartHtml);
            	}
            } else {
                alert("删除商品失败！");
                window.location = window.location.href;
            }
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}




function deletePackageProduct(productId, packageId, buyNum) {
	waitingLoading();
	
	$.ajax({
        type: "POST",
        url: "./ajax/deletePackageProduct",
        data: "packageId=" + packageId + "&delProductId=" + productId + "&buyNum=" + buyNum + "&pf=1",
        dataType: "json",
        success: function(data){
			clearWaiting();
            if(data != null) {
            	//成功
            	$("#cartBody").html(data.cartHtml);
            	//console.log(data.cartHtml);
            } else {
                alert("删除套餐内商品失败！");
                window.location = window.location.href;
            }  
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

function deletePackage(packageId) {
	waitingLoading();
	
	$.ajax({
        type: "POST",
        url: "./ajax/deleteProduct",
        data: "productId=" + packageId + "&type=2&pf=1",
        dataType: "json",
        success: function(data){
			clearWaiting();
            if(data != null) {
            	//成功
            	if (data.totalProductCount == 0) {
            		//没有商品
            		if ($("#main .cartLoginInfo")[0] == null) {
            			appendCartIsNullPrompt();
            		}
            	} else {
            		$("#cartBody").html(data.cartHtml);
            		//console.log(data.cartHtml);
            	}
            } else {
                alert("删除套餐失败！");
                window.location = window.location.href;
            }  
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

function toSettle(code) {
	var ids = "";
	var types = "";
	$(".normal").each(function() {
		if (this.checked) {
			ids += this.value + ",";
			types += "1,";
		}
	});
	$(".pack[name='boxPack']").each(function() {
        if (this.checked) {
            ids += this.value + ",";
            types += "2,";
        }
    });
	
	waitingLoading2();
	$.ajax({
		async: false, //设为false就是同步请求
        type: "POST",
        url: "./ajax/checksettle",
        data: "productIds=" + ids.substring(0, ids.length-1) + "&types=" + types.substring(0, types.length-1) + "&ts=" + new Date().getTime(),
        dataType: "json",
        success: function(data){
			//console.log(data);
            if(data != null) {
            	clearWaiting2();
            	//不等于null,有错误
            	//console.log(data.errorCode + "===" + data.errorMsg);
            	if (data.errorCode == '-100000') {
            		//未登录
            		loginAlert();
                    //window.location = "./toSettle?pf=1&code=" + code;
            	} else if (data.errorCode == '-100100') {
            		//未激活游戏
            		noActivedAlert();
            	} 
            	else if (data.errorCode == '-100900') {
            		//未激活游戏装甲风暴
            		noActivedAlert1();
            	} else if (data.errorCode == '-101') {
            		//购买商品异常
            		productWarnAlert(data.errorMsg);
            	} else {
            		productWarnAlert(data.errorMsg);
            	}
            } else {
                window.location = "./toSettle?code=" + code;
            }  
        },
        error: function() {
        	clearWaiting();
            alert("请求失败,请稍后再试");
            window.location = window.location.href;
        }
    });
}

function loginAlert(){
	var backurl = window.location.href;
	var url = ___mall_passport_url + "/login?backurl=" + encodeURIComponent(backurl);
	showTsInfo("smTs","提示","<p class='center'>您尚未登录，请登录后再提交订单。</p><div class='tsBtn btnMt'><a href='" + url + "'>登 录</a></div>", closeAndRefresh);
}

function noActivedAlert(){
	//showTsInfo("smTs","提示","<p class='center'>您尚未激活游戏，请激活游戏后再进行结算。</p><div class='tsBtn btnMt'><a href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game' target='_blank'>去激活</a></div>", closeAndRefresh);
	showTsInfo("smTs","提示","<p class='center'>您尚未激活游戏，请激活游戏后再进行结算。</p><div class='tsBtn btnMt'><a href='" + ___mall_passport_url + "/v/activate/actgame?gameId=1500000&areatype=0&activateType=game' target='_blank'>去激活</a></div>", closeAndRefresh);
}

function noActivedAlert1(){
	//showTsInfo("smTs","提示","<p class='center'>您尚未激活游戏，请激活游戏后再进行结算。</p><div class='tsBtn btnMt'><a href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game' target='_blank'>去激活</a></div>", closeAndRefresh);
	showTsInfo("smTs","提示","<p class='center'>您尚未激活游戏，请激活游戏后再进行结算。</p><div class='tsBtn btnMt'><a href='" + ___mall_passport_url + "/v/activate/actgame?gameId=9100000&areatype=0&activateType=istorm' target='_blank'>去激活</a></div>", closeAndRefresh);
}

function productWarnAlert(msg) {
	showTsInfo("smTs","提示","<p class='center'>" + msg + "</p><div class='tsBtn btnMt'><a href='javascript:closeAndRefresh();'>确 定</a></div>");
}

function closeAndRefresh() {
	closeDiv();
	window.location.href = window.location.href;
}

$(document).on("click",".close",closeDiv);//关闭窗口*/

$("input[name='buyNum']").on("keyup", function(){
    $(this).val($(this).val().replace(/[^\d]/g,''));
    //console.log("keyup = " + $(this).val());
});


function choosePromotion(obj, productId) {
	waitingLoading();
	
	//console.log("=== " + $(obj).parent().html());
	var promotionId = 0;
	$(obj).parent().find("input[type='radio']").each(function(i) {
		//console.log(i + " ---- " + $(this).val());
		if (this.checked) {
			//console.log(this.value);
			promotionId = this.value;
		}
	});
	//console.log(promotionId + "---" + productId);
	if (promotionId != 0) {
		$.ajax({
			async: false, //设为false就是同步请求
	        type: "POST",
	        url: "./ajax/cartChangePromotion",
	        data: "productId=" + productId + "&activityId=" + promotionId,
	        dataType: "json",
	        success: function(data){
				clearWaiting();
	            if(data != null) {
	            	//成功
	            	$("#cartBody").html(data.cartHtml);
	            	//console.log(data.cartHtml);
	            } else {
	                alert("优惠活动选择失败！");
	                window.location = window.location.href;
	            }  
	        },
	        error: function() {
	        	clearWaiting();
	            alert("请求失败,请稍后再试");
	            window.location = window.location.href;
	        }
	    });
	}
}