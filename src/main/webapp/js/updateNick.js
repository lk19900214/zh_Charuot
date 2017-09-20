/**
 * Created by webrx on 2017-09-20.
 */
// 检查用户传入的昵称是否可用
function checkNick() {
    var newNickName = $("#newNikeName").val();
    var showStr = '';
    var csssps = "css-sp errorIcon";
    if (newNickName == 0) {
        showStr = showStr + '<em class=' + csssps + '></em>游戏昵称不能为空！';
        $("#showstateId").html(showStr);
        return;
    }
    if (newNickName.lastIndexOf(" ") != -1) {
        showStr = showStr + '<em class=' + csssps + '></em>游戏昵称不能为空！';
        $("#showstateId").html(showStr);
        return;
    }
    if (newNickName.length < 4 || newNickName.length > 14) {
        showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合';
        $("#showstateId").html(showStr);
        return;
    }

    if (!newNickName.match("^[a-zA-Z0-9-_\u4E00-\u9FA5]*$")) {
        showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合';
        $("#showstateId").html(showStr);
        return;
    }

    $.ajax({
        url: "../MemberController/checknick",
        async: true,
        dataType: "json",
        data: {
            newNickName: newNickName
        },
        cache: false,
        success: function(data) {
            if (data == "-4") {
                //alert('您尚未登录，请先登录再修改昵称！');
                showDiv(26);
                return false;
            } else if (data == "-3") {
                showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合';
                $("#showstateId").html(showStr);
                return;
            } else if (data == "-1") {
                showStr = showStr + '昵称被占用';
                $("#showstateId").html(showStr);
                return;
            } else if (data == "1") {
                showStr = showStr + '√昵称可用';
                $("#showstateId").html(showStr);
            } else if (data == "0") { //20150921新加入
                //showStr = showStr + '您已经修改过昵称，我们正在审核中！';
                //$("#showstateId").html(showStr);
                //return;
                showTsInfo("smTs", "提示", "<p class='center centerLine'><span><em class='css-sp errorIcon'></em>您已经修改过昵称，我们正在审核中...</span></p>");
                $(document).on("click", ".close", closeDiv);
            }
        }
    });

}

// 提交进行修改
function changMyNickName() {
    var showStr = '';
    //检查坦克是否激活了
    var isAct = true;
    $.ajax({
        url: "../MemberController/checkTankState",
        async: false,
        dataType: "json",
        data: {},
        cache: false,
        error: function() {},
        success: function(data) {

            if (data == '0') {
                //alert("您尚未激活《坦克世界》，请先激活《坦克世界》！");
                //window.location.href = "http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game";
                //showStr = showStr + '未激活坦克世界游戏,请速去<a target='_blank' href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!';
                $("#showstateId").html("未激活坦克世界游戏,请速去<a target='_blank' href='" + ___mall_passport_url + "/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!");
                isAct = false;
                return;
                //showDiv(31);
                //isAct=false;
                //return;
            } else if (data == '-4') {
                showStr = showStr + '您尚未登录，请先登录再修改昵称！';
                $("#showstateId").html(showStr);
                isAct = false;
                return false;
                //showDiv(26);
                //isAct=false;
                //return false;
            }
        }
    });

    if (isAct) {

        var csssps = "css-sp errorIcon";
        var newNickName = $.trim($("#newNikeName").val());
        var token = $("input[name='token']").val();

        if (newNickName == 0) {
            showStr = showStr + '<em class=' + csssps + '></em>游戏昵称不能为空！';
            $("#showstateId").html(showStr);
            return;
        }

        if (newNickName.lastIndexOf(" ") != -1) {
            showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合！';
            $("#showstateId").html(showStr);
            return;
            //showDiv(25);
            //return;
        }
        if (newNickName.length < 4 || newNickName.length > 14) {
            showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合！';
            $("#showstateId").html(showStr);
            return;
            //showDiv(25);
            //return;
        }
        if (!newNickName.match("^[a-zA-Z0-9-_\u4E00-\u9FA5]*$")) {
            showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合！';
            $("#showstateId").html(showStr);
            return;
            //showDiv(25);
            //return;
        }
        $.ajax({
            url: "../MemberController/checknick",
            async: true,
            dataType: "json",
            data: {
                newNickName: newNickName
            },
            cache: false,
            success: function(data) {
                if (data == "-4") {
                    showStr = showStr + '<em class=' + csssps + '></em>您尚未登录，请先登录再修改昵称！';
                    $("#showstateId").html(showStr);
                    return false;
                    //
                    //showDiv(26);
                    //return false;
                } else if (data == "-3") {
                    showStr = showStr + '<em class=' + csssps + '></em>游戏昵称必须符合：4-14位中文、英文、数字、减号和下划线组合！';
                    $("#showstateId").html(showStr);
                    return;
                    //showDiv(25);
                    //return;
                } else if (data == "-1") {
                    //alert("您的昵称已经被占用！");
                    showStr = showStr + '您的昵称已经被占用！';
                    $("#showstateId").html(showStr);
                    return;
                    //showDiv(32);
                    //return;
                } else if (data == "0") {
                    //							showTsInfo("smTs","修改昵称","<ul class='tsList'><li></li><li class='tsI'><span><em class='css-sp errorIcon'></em>您的修改昵称正在审核中...</span></li></ul>",function(){
                    //								location.reload();
                    //							});
                    showTsInfo("smTs", "提示", "<p class='center centerLine'><span><em class='css-sp errorIcon'></em>您已经修改过昵称，我们正在审核中...</span></p>");
                    $(document).on("click", ".close", closeDiv);
                    //alert("您已经修改过昵称，我们正在审核中！");
                    //showDiv(33);
                } else if (data == "1") {
                    showTsInfo("smTs", "提示", "<p class='center'>修改将扣除600点劵！<div class='tsBtn btnMt'><a href='javascript:enterNikename();'>确 定</a><a href='javascript:closeDiv();'>取 消</a><br/><span></span><input id='newNickNamevalue' value=" + newNickName + " type='hidden'></div></p>");
                    $(document).on("click", ".close", closeDiv);
                }
            }
        });

    }
}
function enterNikename() {
    var newNickName = $("#newNickNamevalue").val();
    var token = $("input[name='token']").val();
    var showStr = '';
    var csssps = "css-sp errorIcon";
    $.ajax({
        //url : "../ajax/updatenick.action",
        url: "../MemberController/updateNickName",
        type: "post",
        async: true,
        dataType: "json",
        data: {
            newNickName: newNickName,
            token: token
        },
        cache: false,
        error: function() {},
        success: function(datas) {
            if (datas == "0") {
                //				$("#upNikename").remove();
                //				$("#upNikename").html("未激活坦克世界游戏,请速去<a target='_blank' href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!");
                //				return;
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>新昵称为空！</p>");
                $(document).on("click", ".close", closeDiv);
                //				return;
                //alert("新昵称为空！");
            }
            if (datas == "3") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>未激活坦克世界游戏,请速去<a target='_blank' href='" + ___mall_passport_url + "/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!</p>");
                $(document).on("click", ".close", closeDiv);
                //				$("#updateNikeMsgS").html("未激活坦克世界游戏,请速去<a target='_blank' href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!");
                //				return;
                //alert("请先激活游戏再进行昵称修改");
                //showDiv(31);
            }
            if (datas == "-4") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>您尚未登录，请先登录再修改昵称！</p>");
                $(document).on("click", ".close", closeDiv);
                //				showStr = showStr + '<em class='+csssps+'></em>您尚未登录，请先登录再修改昵称！';
                //				$("#updateNikeMsgS").html(showStr);
                //				return false;
                //alert('您尚未登录，请先登录再修改昵称！');
                //showDiv(26);
            }
            if (datas == "2") {
                //				showTsInfo("smTs","修改昵称","<ul class='tsList'><li></li><li class='tsI'><span><em class='css-sp errorIcon'></em>您的修改昵称正在审核中...</span></li></ul>",function(){
                //					location.reload();
                //				});
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>您已经修改过昵称，我们正在审核中...</p>");
                $(document).on("click", ".close", closeDiv);
                //				showTsInfo("smTs","提示","<p class='center centerLine'><span><em class='css-sp errorIcon'></em>您已经修改过昵称，我们正在审核中...</span></p>");
                //				$(document).on("click",".close",closeDiv);
                //alert("您已经修改过昵称，我们正在审核中！");
                //showDiv(33);
            }
            if (datas == "-3") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>新昵称为空！</p>");
                $(document).on("click", ".close", closeDiv);
                //				showStr = showStr + '<em class='+csssps+'></em>新昵称为空！';
                //				$("#updateNikeMsgS").html(showStr);
                //				return;
                //alert("昵称修改失败");
                //showDiv(34);
            }
            if (datas == "-1") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>您的昵称已经被占用！</p>");
                $(document).on("click", ".close", closeDiv);
                //				showStr = showStr + '<em class='+csssps+'></em>您的昵称已经被占用！';
                //				$("#updateNikeMsgS").html(showStr);
                //				return;
                //alert("昵称已经被占用！");
                //showDiv(32);
            }
            if (datas == "1") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>昵称修改已成功提交，将在服务器维护后生效！</p>");
                $(document).on("click", ".close", closeDiv);
                //				showStr = showStr + '<em class='+csssps+'></em>昵称修改已成功提交，将在服务器维护后生效！';
                //				$("#updateNikeMsgS").html(showStr);
                //				return;
                //alert("昵称修改已成功提交，将在服务器维护后生效！");
                //showDiv(35);
                // window.location.reload();
            }
            if (datas == "-2") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>点劵不足！请充值后再修改！</p>");
                $(document).on("click", ".close", closeDiv);
                //				showStr = showStr + '<em class='+csssps+'></em>点劵不足！请充值后再修改！';
                //				$("#updateNikeMsgS").html(showStr);
                //				return;
                //alert("点劵不足！请充值后再修改！");
                //昵称修改失败
                //showDiv(34);
                //window.location.href = "http://passport.kongzhong.com/billing/pay/pay_bank.jsp";
            }
            if (datas == "-6") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>点劵不足！请充值后再修改！</p>");
                $(document).on("click", ".close", closeDiv);
                //				showStr = showStr + '<em class='+csssps+'></em>点劵不足！';
                //				$("#updateNikeMsgS").html(showStr);
                //				return;
                //alert("点券不足！");
                //showDiv(36);
                //return ;
            }
            if (datas == "-7") {
                showTsInfo("smTs", "提示", "<p class='center'><em class='+csssps+'></em>未激活坦克世界游戏,请速去<a target='_blank' href='" + ___mall_passport_url + "/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!</p>");
                $(document).on("click", ".close", closeDiv);
                //				$("#updateNikeMsgS").html("未激活坦克世界游戏,请速去<a target='_blank' href='http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game'>激活</a>!");
                //				return;
                //alert("您尚未激活《坦克世界》，请先激活《坦克世界》！");
                //showDiv(31);
                //window.location.href = "http://passport.kongzhong.com/v/activate/actgame?gameId=1500000&areatype=0&activateType=game";
                //return ;
            }
        }
    });
}
/**
 * 加载页面时获取用户修改昵称的状态
 */
//$(
//function checkUserNickState() {
//	$.ajax({
//				//url : "../ajax/checkNickState.action",
//				url : "../updatenick/checkNickState",
//				async : true,
//				dataType : "json",
//				cache : false,
//				success : function(data) {
//					if (data == "-4") {
//						//alert('请您先登录或者刷新本页面获取修改状态');
//						showDiv(26);
//
//					}
//					if (data == "1") {
//						document.getElementById('resultStateId').innerHTML = "修改成功";
//					}
//					if (data == "3") {
//						document.getElementById('resultStateId').innerHTML = "修改失败,请联系客服！";
//					}
//					if (data == "4") {
//						document.getElementById('resultStateId').innerHTML = "审核中...";
//					}
//				}
//			});
//}
//)

function showoldnickname() {
    /*

	$.ajax({
		url : "../ajax/checklogin.action",
		async : false,
		dataType : "json",
		cache : false,
		success : function(data) {
			if(data.indexOf("||")>-1){
				var info = data.split("||");
				showmalluserinfo(info[1],info[2],info[3],info[4],info[5],info[6]);
				document.getElementById('oldnickName').innerHTML =info[1];
			}
		}
	});
	*/

    $.ajax({
        //url : "../ajax/checklogin.action",
        url: "../login/wmChecklogin",
        async: false,
        dataType: "json",
        cache: false,
        success: function(data) {
            if (data.indexOf("||") > -1) {
                var info = data.split("||");
                //showmalluserinfo(info[1],info[2],info[3]);
                document.getElementById('oldnickName').innerHTML = info[1];

            }
        }
    });

}