//提交订单
function submitOrder(type) {
	//type=1购物车购买，type=2立即购买 
	var gameArea = $("#area").val();
	//console.log("gameArea = " + gameArea);
	if (gameArea == 0) {
		alertMsg("请选择游戏大区", "area");
		//alert("请选择游戏大区");
		return;
	}
	
	var payType = 0;
	$("input[type='radio'][name='payType']:checked").each(function(){
		payType = $(this).val();
	});
	//console.log("payType = " + payType);
	
	var isUseCoupon = 0;
	var temp = $("#checkUseCoupon").siblings("span").attr("class");
	//console.log("temp = " + temp);
	if (temp == "checked") {
		//选中
		isUseCoupon = 1;
		var couponNo = $("#couponNo").val();
		if (couponNo == "") {
			alertMsg("请选择优惠券", "checkUseCoupon");
			return;
		}
	} else {
		//未选中
		isUseCoupon = 0;
	}
	//console.log("isUseCoupon = " + isUseCoupon);
	
	var isUseIntegral = 0;
	var temp2 = $("#checkUseIntegral").siblings("span").attr("class");
	//console.log("temp2 = " + temp2);
	if (temp2 == "checked") {
		//选中
		isUseIntegral = 1;
	} else {
		//未选中
		isUseIntegral = 0;
	}
	//console.log("isUseIntegral = " + isUseIntegral);
	
	var integral = $("#useIntegral").val();
	//console.log("integral = " + integral);
	var isUseBinding = 0;
	var temp3 = $("#checkBindPhone").siblings("span").attr("class");
	//console.log("temp3 = " + temp3);
	if (temp3 == "checked") {
		//选中
		isUseBinding = 1;
		var isBindMobileFlag = $("#isBindMobileFlag").val();
		//console.log("isBindMobileFlag = " + isBindMobileFlag);
		if (isBindMobileFlag == "0") {
			//未绑定手机
			showTsInfo("smTs","提示","<p  class='center'>请输入手机号</p><div class='tsBtn btnMt'><a href='javascript:gotoBindingPhone();'>确 定</a></div>");
		}
	} else {
		//未选中
		isUseBinding = 0;
	}
	//console.log("isUseBinding = " + isUseBinding);
	disableSubmitButton();
	
	$("#gameArea").val(gameArea);
	$("#payType").val(payType);
	$("#isUseCoupon").val(isUseCoupon);
	$("#isUseIntegral").val(isUseIntegral);
	$("#integral").val(integral);
	$("#isUseBinding").val(isUseBinding);
	
	var realMoney = $(".sum span").text();
	var realMoneyNum = realMoney.substring(1, realMoney.length);
	if (type == 1 ||type == 2) {
		//购物车购买
		var verifyCode = $("#cartVerifiCode").val();
		var now = new Date();
		$.ajax({
			async: false, //设为false就是同步请求
	        type: "get",
	        url: "./ajax/checksubmitorder/" + verifyCode + "/" + now.getTime(),
	        //data: "code=" + verifyCode + "&ts=" + now.getTime(),
	        dataType: "json",
	        success: function(data){
				//console.log(data);
	            if(data != null) {
	            	//不等于null,有错误
	            	//console.log(data.errorCode + "===" + data.errorMsg);
	            	//购买商品异常
	            	if (data.errorCode == '-200000') {
	            		//系统异常
	            		productWarnAlertToCart(data.errorMsg);
	            	} else {
	            		productWarnAlertToCart(data.errorMsg);
            		}
	            	
	            } else {
	                if (payType == 1) {
	                	if (parseFloat(realMoneyNum) > 0) {
	                		showTsInfo("smTs","支付提示","<h4>您确定支付" + realMoney + "元进行本次购买吗？</h4><p class='pLeftM'>请注意：你需要在新打开的页面上完成剩余支付操作。支付完成前请不要关闭此窗口。完成支付后，您可以继续点选您希望进行的操作。</p><div class='tsBtn btnMt'><a href='javascript:submitOrderForm();'>确 定</a><a href='javascript:closeDiv();'>取 消</a></div>");
	                	} else {
	                		submitOrderForm();
	                	}
					} else {
						submitOrderForm();
					}
	            }
	        },
	        error: function() {
	            alert("请求失败,请稍后再试");
	        }
	    });
	} else {
		//立即购买
		//校验商品数量、用户VIP级别、标签用户
		var productId = $("#productId").val();
		var buyNum = $("#buyNum").val();
		var now = new Date();
		$.ajax({
			async: false, //设为false就是同步请求
	        type: "get",
	        url: "./ajax/checkquicksubmitorder",
	        data: "productId=" + productId + "&buyNum=" + buyNum + "&ts=" + now.getTime(),
	        dataType: "json",
	        success: function(data){
				//console.log(data);
	            if(data != null) {
	            	//不等于null,有错误
	            	//console.log(data.errorMsg);
	            	productWarnAlert(data.errorMsg);
	            } else {
	                if (payType == 1) {
						if (parseFloat(realMoneyNum) > 0) {
							showTsInfo("smTs","支付提示","<h4>您确定支付" + realMoney + "元进行本次购买吗？</h4><p class='pLeftM'>请注意：你需要在新打开的页面上完成剩余支付操作。支付完成前请不要关闭此窗口。完成支付后，您可以继续点选您希望进行的操作。</p><div class='tsBtn btnMt'><a href='javascript:submitOrderForm();'>确 定</a><a href='javascript:closeDiv();'>取 消</a></div>");
						} else {
			        		submitOrderForm();
			        	}
					} else {
						submitOrderForm();
					}
	            }
	        },
	        error: function() {
	            alert("请求失败,请稍后再试");
	        }
	    });
	}
}

function disableSubmitButton() {
	$(".sum input").attr('disabled',"true");
}

function enableSubmitButton() {
	$(".sum input").removeAttr('disabled');
}

function gotoBindingPhone() {
	$("#bindPhone").focus();
	closeDiv();
}

function alertMsg(msg, objId) {
	//console.log("objId 1 = " + objId);
	showTsInfo("smTs","提示","<p class='center'>" + msg + "</p><div class='tsBtn btnMt'><a href='javascript:closeMsg(\"" + objId + "\");'>确 定</a></div>");
}

function closeMsg(objId) {
	//console.log("objId = " + objId);
	closeDiv();
	$("#" + objId).focus();
}

function productWarnAlert(msg) {
	showTsInfo("smTs","提示","<p class='center'>" + msg + "</p><div class='tsBtn btnMt'><a href='javascript:closeDiv();'>确 定</a></div>");
	enableSubmitButton();
}

function productWarnAlertToCart(msg) {
	showTsInfo("smTs","提示","<p class='center'>" + msg + "</p><div class='tsBtn btnMt'><a href='/cart/to'>确 定</a></div>");
	enableSubmitButton();
}

function submitOrderForm() {
	$("body").append("<div class='waitingLoading123'><span></span><b></b></div>");
	$("#orderForm").submit();
	//$(".waitingLoading123").remove();
}

$(".checkBtn").on("click",function(event){
	if(!$(this).parent().hasClass("on")){
		$(this).find("input").prop("checked",true);
		$(this).find("span").addClass("checked");
		$(this).parent().addClass("on").siblings("div").show();	
	}else{
		$(this).find("input").prop("checked",false);
		$(this).find("span").removeClass("checked");
		$(this).parent().removeClass("on").siblings("div").hide();
	}
});

function checkCoupon(obj, price) {
	//console.log(obj.value);
	$("#couponNo").val(obj.value);
	$("#couponSpareMoney").val(price);
	calCouponPrice();
}

function calCouponPrice() {
	var couponCheckFlag = $("#checkUseCoupon").is(":checked");
	if (couponCheckFlag) {
		//选中
	} else {
		//未选中
		$("#couponSpareMoney").val(0);
		$("#couponNo").val("");
		$("input:radio[name='coupon']").attr("checked", false);
	}
	calculateShowPrice();
}

//计算显示的金额
function calculateShowPrice() {
	//订单总金额
	var countMoney = $("#countMoney").val();
	//活动优惠金额
	var activitySpareMoney = $("#activitySpareMoney").val();
	//优惠券抵扣金额
	var couponSpareMoney = $("#couponSpareMoney").val();
	//使用的积分
	var integral = $("#integral").val();
	//使用积分折合的RMB数
	var rmbIntegral = 0;
	//首单绑定手机抵扣金额
	var bindMobileSpareMoney = $("#bindMobileSpareMoney").val();
	
	//使用积分的选中标示
	var integralCheckFlag = $("#checkUseIntegral").is(":checked");
	if (integralCheckFlag) {
		//选中
		var temp = parseInt(integral * 100) / 200;
		temp = parseInt(temp);
		rmbIntegral = temp / 100;
		$(".profile p:eq(3) b").text("-￥" + rmbIntegral.toFixed(2));
		$(".integralB p:eq(0) span").text("￥" + rmbIntegral.toFixed(2));
	} else {
		rmbIntegral = 0;
		$(".profile p:eq(3) b").text("-￥0.00");
	}
	//console.log("rmbIntegral = " + rmbIntegral);
	
	//使用优惠券的选中标示
	var couponCheckFlag = $("#checkUseCoupon").is(":checked");
	if (couponCheckFlag) {
		//选中
		$(".profile p:eq(2) b").text("-￥" + parseFloat(couponSpareMoney).toFixed(2));
	} else {
		$(".profile p:eq(2) b").text("-￥0.00");
	}
	
	//首单绑定手机立减5元选中标示
	var bindPhoneCheckFlag = $("#checkBindPhone").is(":checked");
	//console.log("bindPhoneCheckFlag = " + bindPhoneCheckFlag);
	var isBindMobileFlag = $("#isBindMobileFlag").val();
	//console.log("isBindMobileFlag = " + isBindMobileFlag);
	if (bindPhoneCheckFlag) {
		//选中
		if (isBindMobileFlag == 1) {
			//已经绑定手机
			$("#bindPhone_p b").text("-￥5.00");
		} else {
			$("#bindPhone_p b").text("-￥0.00");
		}
	} else {
		$("#bindPhone_p b").text("-￥0.00");
	}
	//console.log("countMoney = " + countMoney);
	//console.log("activitySpareMoney = " + activitySpareMoney);
	//console.log("couponSpareMoney = " + couponSpareMoney);
	//console.log("bindMobileSpareMoney = " + bindMobileSpareMoney);
	var realMoney = countMoney - activitySpareMoney - couponSpareMoney - rmbIntegral - bindMobileSpareMoney;
	//console.log("realMoney = " + realMoney);
	if (realMoney < 0) {
		realMoney = 0;
	} else {
		//realMoney = parseInt(realMoney * 100) / 100;
	}
	//console.log("realMoney = " + realMoney)
	$("#sum_p b").text("￥" + realMoney.toFixed(2));
	$(".sum span").text("￥" + realMoney.toFixed(2));
}

function calIntegral() {
	var integralCheckFlag = $("#checkUseIntegral").is(":checked");
	//console.log(integralCheckFlag);
	var enableIntegral = parseInt($("#enableIntegral").val());
	if (integralCheckFlag) {
		//选中
		var useIntegral = parseInt($("#useIntegral").val());
		var t1 = useIntegral / 20;
		//console.log("t1 = " + t1);
		var t2 = parseInt(t1) * 20;
		//console.log("t2 = " + t2);
		$("#useIntegral").val(t2);
		useIntegral = t2;
		//console.log("useIntegral = " + useIntegral);
		//console.log("enableIntegral = " + enableIntegral);
		if (useIntegral > enableIntegral) {
			useIntegral = enableIntegral;
			$("#useIntegral").val(enableIntegral);
		}
		$("#integral").val(useIntegral);
	} else {
		//未选中
		$("#integral").val(0);
	}
	calculateShowPrice();
}

function calBindPhonePrice() {
	var isBindMobileFlag = $("#isBindMobileFlag").val();
	var bindPhoneCheckFlag = $("#checkBindPhone").is(":checked");
	
	if (isBindMobileFlag == 1) {
		//已经绑定手机
		if (bindPhoneCheckFlag) {
			//选中
			$("#bindMobileSpareMoney").val(5);
			
		} else {
			$("#bindMobileSpareMoney").val(0);
		}
	} else {
		//未绑定手机
	}
	calculateShowPrice();
}

function bindMobile() {
	$("#msgbindPhone").html("");
	$("#msgbindPhone1").html("");
	$("#msgbindPhone2").html("");
	$("#msgbindPhone3").html("");
	var newMobileCode = $("#bindPhoneVerifyCode").val();
	var newMobile = $("#bindPhone").val();
    var showStr = '';
	var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
	var regs = /^\d{11}$/;
    var remobile = reg.test(newMobile);
    var resmobile = regs.test(newMobile);
    if(newMobile==0){
		showStr = showStr + '手机号码不能为空！';
		$("#msgbindPhone").html(showStr);
		return;
	}
    if(resmobile==false){
    	showStr = showStr + '手机号码格式不正确！';
		$("#msgbindPhone").html(showStr);
	    return;
	}
	if(remobile==false){
		showStr = showStr + '手机号码格式不正确！';
		$("#msgbindPhone").html(showStr);
		return;
	}
	//新手机验证码的验证
	var regcodes = /^\d{6}$/;
    var rescode = regcodes.test(newMobileCode);
	if (newMobileCode==0){
		showStr = showStr + '短信验证码不能为空！';
		$("#msgbindPhone2").html(showStr);
		return;
	}
    if(rescode==false){
    	showStr = showStr + '短信验证码格式不正确！';
		$("#msgbindPhone2").html(showStr);
		return;
    }
	var sdata = {
		'newMobileCode':newMobileCode,
	    'newMobile':newMobile
	};
	
	$.ajax({
		dataType:"json",
		type:"post",
		data:sdata,
		url: basePath + "/MemberController/newGetIsBindSmsCode",
		success:function(data){
			if(data==1){
				var sdata = {
					'mobile':newMobile,
					'validateCode':newMobileCode
				}
				$.ajax({
					dataType:"json",
				    type:"post",
					data:sdata,
					url: basePath + "/MemberController/updateNewMobile",
					success:function(data){
						if(data.mobileResult==1){
							//alert("您的联系手机" + data.mobile + "已经绑定成功！");
							$("#bindPhone").attr("disabled","disabled");
							$("#bindPhoneVerifyCode").attr("disabled","disabled");
							$("#verifyCodeBtn").attr("disabled","disabled");
							$("#bindMobileBtn").attr("disabled","disabled");
							$(".phoneInfo").hide();
							
							$(".phoneInfo").remove();//删除绑定手机区域
							$("#bindMobileSpareMoney").val(5);//设置绑定手机抵扣金额
							$("#isBindMobileFlag").val(1);//设置是否绑定手机标示为1
							$("#checkBindPhone").click(calBindPhonePrice);//首单绑定手机立减5元选择框加click事件
							calculateShowPrice();
							if(data.mobileResult==1){
								showStr = showStr + '您的联系手机' + data.mobile + '，已经绑定成功！';
								$("#msgbindPhone3").html(showStr);
								return;
							}
						}
						if(data.mobileResult==0){
							showStr = showStr + '您的联系手机' + data.mobile + '，已经绑定失败！';
							$("#msgbindPhone").html(showStr);
							return;
						}
					}
				});
			}
			if(data==3){
				showStr = showStr + '您的手机号已经绑定账号！';
				$("#msgbindPhone").html(showStr);
				return;
			}
			if(data==4){
				showStr = showStr + '短信验证码错误！';
				$("#msgbindPhone2").html(showStr);
				return;
			}
			if(data==5){
				showStr = showStr + '您的手机号已经绑定账号！';
				$("#msgbindPhone").html(showStr);
				return;
			}
			if(data==0){//如果失败则在原弹层
				showStr = showStr + '短信验证码错误！';
				$("#msgbindPhone2").html(showStr);
				return;
			}
	  }
   });
}
function getImgCode(){
	$("#msgbindPhone").html("");
	$("#msgbindPhone1").html("");
	$("#msgbindPhone2").html("");
	var bindPhone = $("#bindPhone").val();
	var showStr = "";
	if (bindPhone == "") {
		showStr = showStr + '手机号码不能为空！';
		$("#msgbindPhone").html(showStr);
		return;
    }
	var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
	var reg2 = /^\d{11}$/;
    var retMobile = reg.test(bindPhone);
    var retMobile2 = reg2.test(bindPhone);
    if(retMobile2==false){
    	showStr = showStr + '手机号码格式不正确！';
		$("#msgbindPhone").html(showStr);
		return;
	}
	if(retMobile==false){
		showStr = showStr + '手机号码格式不正确！';
		$("#msgbindPhone").html(showStr);
		return;
	}
	$(".getyzm").hide();
	$(".yzmImg").show();
	$(".yabox1").show();
	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
}
function replaceOff(){
	$(".yabox1").hide();
}
function replaceON(){
	$(".yabox1").show();
}
function newgetImgCode(){
	var bindPhone = $.trim($("#bindPhone").val());
	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
}
function getBindPhoneVerifyCode() {
	$("#msgbindPhone").html("");
	$("#msgbindPhone1").html("");
	$("#msgbindPhone2").html("");
    var bindPhone = $("#bindPhone").val();
    //console.log("bindPhone = " + bindPhone);
    var showStr = "";
    if (bindPhone == "") {
		showStr = showStr + '手机号码不能为空！';
		$("#msgbindPhone").html(showStr);
		return;
    }
    var newImgCode = $("#bindImgCode").val();
    var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
	var reg2 = /^\d{11}$/;
    var retMobile = reg.test(bindPhone);
    var retMobile2 = reg2.test(bindPhone);
    if(retMobile2==false){
    	showStr = showStr + '手机号码格式不正确！';
		$("#msgbindPhone").html(showStr);
	    return;
	}
	if(retMobile==false){
		showStr = showStr + '手机号码格式不正确！';
		$("#msgbindPhone").html(showStr);
		return;
	}
    if(newImgCode=="") {
    	showStr = showStr + '图片验证码不能为空！';
    	$("#msgbindPhone1").html(showStr);
		return;
	}
	if(newImgCode.lastIndexOf(" ") != -1) {
		showStr = showStr + '图片验证码不能为空！';
    	$("#msgbindPhone1").html(showStr);
		return;
	}
	var sdata = {
		'newMobile':bindPhone,
		'newImgCode':newImgCode
	};
	$.ajax({
        type: "POST",
        url: basePath + "/MemberController/newSnedSmsVerificationCode",
        data: sdata,
        dataType: "json",
        success: function(data){
            if(data == 1) {
            	//成功
            	//alert("手机验证码已发送！");
            	var time = 60;
				$('#verifyCodeBtn').html("");
				function timeCountDown() {
					if(time==0){
						clearInterval(timer);
						$("#verifyCodeBtn").attr("class",""); 
						$('#verifyCodeBtn').html("确定发送");
						$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
						$('#verifyCodeBtn').attr("href", "javascript:getBindPhoneVerifyCode();");
						return true;
					}
					$('#verifyCodeBtn').html(time+"s");
					$("#verifyCodeBtn").attr("class","noclick");
					$('#verifyCodeBtn').attr("href", "javascript:void(0);");
					time--;
					return false;
				}
				$('#verifyCodeBtn').html("");
				timeCountDown();
				var timer = setInterval(timeCountDown,1000);
				$(".yabox1").hide();
				if(data==1){
					showStr = showStr + '短信验证码已发送';
					$("#msgbindPhone1").html(showStr);
					return;
				}
            } else if (data == 5){
            	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
            	showStr = showStr + '您的手机号已经绑定账号！';
        		$("#msgbindPhone").html(showStr);
            	return;
            } else if(data==-1){
            	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
            	showStr = showStr + '图片验证码不正确！';//为空的时候
        		$("#msgbindPhone1").html(showStr);
            	return;
            } else if(data==6){
            	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
            	showStr = showStr + '图片验证码不正确！';
        		$("#msgbindPhone1").html(showStr);
            	return;
            } else if(data==2){
            	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
            	showStr = showStr + '此手机号操作频繁！';//60秒内
        		$("#msgbindPhone").html(showStr);
        		return;
            }	else if(data==10){
            	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
            	showStr = showStr + '此手机号操作频繁！';
        		$("#msgbindPhone").html(showStr);
        		return;
            } else{
            	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
            	showStr = showStr + '请求手机验证码失败！';
        		$("#msgbindPhone").html(showStr);
        		return;
            }
        },
        error: function() {
        	$(".newcodeImg").attr("src", ___mall_kongzhong_url+"/GetCodeController/imgcode/sms/{"+bindPhone+"}?w=80&h=30&"+Math.random());
        	showStr = showStr + '请求失败,请稍后再试';
    		$("#msgbindPhone").html(showStr);
    		return;
        }
    });
}


//关闭
function closeDiv(){
	$("#maskLayer,#Info").stop(true,true).fadeOut(200,function(){
		$(this).remove()
	});
	enableSubmitButton();
}

//遮罩
function maskLayer(){
	var maskLayer="<div id='maskLayer'></div>";
	var info="<div id='Info'><span class='close'></span></div>";
	$("body").append(maskLayer).append(info);
	$("#Info").removeClass();
	$("#maskLayer").height($(document).height()).show();
}
var _closeDiv = function(){};
//显示提示信息框
function showTsInfo(className,htmlTitle,html,closeCallback){
	maskLayer();
	var tsInfo="<div class='tsTitle'>"+htmlTitle+"</div><div class='tsContentTable'><div class='tsContentCell'><div class='tsContent'>"+html+"</div></div></div>";
	if(className!="phoneTs"){
		$("#Info").removeClass().addClass("smTs");
	}else{
		$("#Info").removeClass().addClass(className);
	}
	if(closeCallback){
		_closeDiv = closeCallback;
	}
	$("#Info").show().html("<span class='close' onclick='closeDiv();'></span>").append(tsInfo);
}

//结算页中使用优惠券tab
$(".tabC a").on("click",function(event){
	event.preventDefault();
	var _index=$(this).index();	
	$(this).addClass("curr").siblings().removeClass("curr");
	$(this).parent().siblings(".tabCL").find(".tableD").eq(_index).show().siblings().hide();			
});