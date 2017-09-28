/**
 * Created by webrx on 2017-09-28.
 */

    var b=false;
function userNname() {
    var user=$('#useraccount').val();
    var yan=/^[a-zA-z]\w{3,15}$/;
    var div=$('#useraccountTip');
    if(yan.test(user)&&user!=""){
            $.ajax({
                type:'POST',
                url:'../userlogin.do',
                data:{uName:$('#useraccount').val()},
                async:false,
                dataType:'text',
                success:function (d) {
                    if(d==0){
                        $('#useraccountTip').html("该用户已被注册").css({color:"red"});

                    }else {
                        $('#useraccountTip').html("该账号可以使用").css({color:"green"});
                       b=true;
                    }
                }
            });
        return b;
    }else if(user==""){
        div.html("不能为空").css({color:"red"});
        return false;
    }else {
        div.html("输入有误请重新输入").css({color:"red"});
        return false;
    }
}
function userPassword() {
    var pass=$('#password').val();
    var yan=/^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
    var div=$('#passwordTip');
    if(yan.test(pass)&&pass!=""){
        div.html("输入正确").css({color:"green"});
        return true;
    }else if(pass==""){
        div.html("不能为空").css({color:"red"});
        return false;
    }else {
        div.html("输入有误请重新输入").css({color:"red"});
        return false;
    }

}
function userPassword1() {
    var pass1=$('#password2').val();
    var pass=$('#password').val();
    var div=$('#password2Tip');
    if(pass1==pass&&pass1!=""){
        div.html("输入正确").css({color:"green"});
        return true;
    }else{
        div.html("输入不一致").css({color:"red"});
        return false;
    }
}
function realName() {
    var real=$('#realname').val();
    var yan=/^[\u4E00-\u9FA5A-Za-z]+$/;
    var div=$('#realnameTip');
    if(yan.test(real)&&real!=""){
        div.html("输入正确").css({color:"green"});
        return true;
    }else if(real==""){
        div.html("不能为空").css({color:"red"});
        return false;
    }else {
        div.html("输入有误请重新输入").css({color:"red"});
        return false;
    }

}
function userMail() {
    var mail=$('#mail').val();
    var yan=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    var div=$('#mailTip');
    if(yan.test(mail)&&mail!=""){
        div.html("输入正确").css({color:"green"});
        return true;
    }else if(mail==""){
        div.html("不能为空").css({color:"red"});
        return false;
    }else {
        div.html("输入有误请重新输入").css({color:"red"});
        return false;
    }

}

$('#submit_btn').click(function () {
    if ((userNname() && userPassword() && userPassword1() && realName() && userMail()&&b)==true) {
        $('#register_frm').submit();
    }else {
        location.reload();
    }
});
function yan() {
    $.ajax({
        type:'GET',
        url:'/verify.do',
        data:{vcode:$('#vcode').val()},
        async:false,
        dataType:'text',
        success:function (d) {
            if(d=="输入正确") {
                $('#vcodeTip').html(d).css({color:"green"});
                b = true;
            }else {
                $('#vcodeTip').html(d).css({color:"red"});
            }
        }
    });
}
