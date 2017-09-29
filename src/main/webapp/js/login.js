/**
 * Created by lk on 2017-09-28.
 * 登录判断
 */
var b = false;
function userAccount() {
    var shu = $('#user_id_txt');
    var count = $('#user_id_txt').val();
    var yan = /^[a-zA-z]\w{3,15}$/;
    if (yan.test(count) && count != null) {
        $.ajax({
            type: 'POST',
            url: '/userlogin.do',
            async: false,
            data: {uName: count},
            dataType: 'text',
            success: function (d) {
                if (d == 1) {
                    alert("该账号还未被注册赶紧去注册吧！");
                    b
                }
            }
        });

    } else if (count == "" && password == "") {
        shu.attr("placeholder", "不能为空");
        b
    } else {
        shu.attr("placeholder", "填写不正确请重新输入");
        b
    }
}

function userPassword() {
    var pas = $('#password_txt');
    var password = $('#password_txt').val();
    var zheng = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
    if (zheng.test(password) && password != null) {
        b = true;
    } else if (password == "") {
        pas.attr("placeholder", "不能为空");
        b
    } else {
        pas.attr("placeholder", "填写不正确请重新输入");
        b
    }

}

$(function () {
    $('#login').click(function () {
        if (b == true) {
            $.ajax({
                type: 'post',
                url: '/uLogin.action',
                async: false,
                data: {uName: $('#user_id_txt').val(), uPassword: $('#password_txt').val()},
                dataType: "text",
                success: function (d) {
                    if (d == 1) {
                        location.href = "/"
                    }
                }
            });
        } else {
            location.reload();
        }
    })

})