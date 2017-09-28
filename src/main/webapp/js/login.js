/**
 * Created by lk on 2017-09-28.
 */
function userAccount() {
    var count = $('#user_id_txt').val();
    var password = $('#password_txt').val();
    if (count != null && password != null) {
        $.ajax({
            type: 'POST',
            url: '/userlogin.do',
            async: false,
            data: {uName:count,uPassword:password},
            dataType: 'text',
            success: function (d) {
                if (d == 1) {
                   alert("该账号还未被注册请认真填写");
                }
            }
        });

    }
}
$(function () {
$('#login').click(function () {
    userAccount();
});
});
