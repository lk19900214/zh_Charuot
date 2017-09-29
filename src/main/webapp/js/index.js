/**
 * Created by webrx on 2017-09-29.
 */
$('#userlogin').click(function () {
    location.href = "/login.do";
});

function aa() {
    var user = $('#pan').val();
    if (user =="") {
        $('#nouser').css('display', 'block');
        $('#nol').css('display', 'block');
        $('#onuser').css('display', 'none');
        $('#onl').css('display', 'none');
    }else {
        $('#onuser').css('display', 'block');
        $('#onl').css('display', 'block');
        $('#nouser').css('display', 'none');
        $('#nol').css('display', 'none');
    }
}
$(function () {
    aa();
});