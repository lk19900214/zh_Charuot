/**
 * Created by webrx on 2017-09-20.
 */
var sentlog = sentlog || {referrer:false};
var site_name = site_name || 'kongzhong';
var page_type = page_type || 'NA';
var post_count = post_count || -1;
var tgreg = tgreg || -1;
var _trackURL = _trackURL || 'NA';
var _trackParams = _trackParams || 'NA';
var referrer = encodeURIComponent((document.referrer).replace(/^\s+|\s+$/g,""));
var cpaid = getcookie_ads("cpaid") || 'NA';

var mucpa = ad_getUrlParam('cpaId');
if(mucpa==null || mucpa== 'NA'){
    mucpa = ad_getUrlParam('cpaid')||'NA';
    if(mucpa==null || mucpa== 'NA'){
        mucpa=GetUrlCpaId('cpaid')||'NA';
    }
}
var uargcpaid = mucpa||'NA';
if( uargcpaid != 'NA' && uargcpaid){
    cpaid  = uargcpaid;
    setcookie_ads('cpaid',cpaid,14);
}



if(!sentlog.referrer){
    if( referrer.indexOf("kongzhong.com")==-1 && referrer!=""){
        var cookieurl = "http://cps.kongzhong.com/referrer?urlpass="+referrer
        try{document.write(" <scr"+"ipt lanague=\"javascript\" src=\""+cookieurl+"\"> <\/scri"+"pt>")}catch(e){}
    }
    _trackParams = format_trackParams(_trackParams);
    _trackParams = encodeURIComponent(_trackParams);
    var logmsg = "tag=pvstatall&referrer="+referrer+"&type="+page_type+"&post_count="+post_count + "&_trackParams=" + _trackParams + "&cpaid=" + cpaid;
    //if(cpaid != "NA")logmsg =logmsg + "cpaid=" + cpaid;
    try{logmsg = logmsg + '&window_size='+document.documentElement.clientWidth+'x'+document.documentElement.clientHeight;}catch(e){}//反作弊用

    if (_trackURL != 'NA') logmsg = logmsg + '&trackURL='+_trackURL;//加监控代码
    //捕获GA监控标记
    try{
        var m_ga_utma = getcookie_ads('__utma');
        if(m_ga_utma && m_ga_utma != ''){
            logmsg = logmsg + '&_ga_utma=' + m_ga_utma;
        }
    }catch(e){}
    ajaxlog_new(logmsg);
    sentlog.referrer = true;//防止重复申请
}


function setcookie_ads(name,val,days){
    var exp = new Date();
    exp.setTime(exp.getTime() + days*86400000);
    document.cookie = name + '=' + escape(val) + ';expires=' + exp.toGMTString() + ';domain=.kongzhong.com'+';path=/';
}

function getcookie_ads(name){
    var arr, reg=new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if(arr = document.cookie.match(reg)){
        return unescape(arr[2]);
    }
    return '';
}

function ajaxsend(url){
    var img = new Image();
    img.src = url;
}

function ajaxlog(log){
    ajaxsend(document.location.protocol+"//track.kongzhong.com/empty_js.gif?site_name="+site_name+"&"+log+"&rand="+Math.random());
}

function ajaxlog2(log){
    ajaxlog(log);
    ajaxlog(log);
    ajaxlog(log);
    ajaxlog(log);
}

function ajaxlog_new(log){
    ajaxsend(document.location.protocol+"//track.kongzhong.com/empty_js.gif?site_name="+site_name+"&"+log+"&rand="+Math.random());
}

function format_trackParams(paramContent) {
    if(paramContent == "NA") {
        return paramContent;
    }
    try{
        var _trackArrParams = [];
        for(var i = 0, ln = paramContent.length; i < ln; i++){
            _trackArrParams.push(paramContent[i].I + ":" + paramContent[i].V.replace(/\|/g,"*"));
        }
        return _trackArrParams.join("@@");
    }catch(e){
        return "error";
    }
}

function ad_getUrlParam(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    //if(window.top != window.self && window.top.location.search!="" && window.top.location.search!='NA'){
    //	var r = window.top.location.search.substr(1).match(reg);
    //	if (r!=null) return unescape(r[2]);
    //}
    var r = window.location.search.substr(1).match(reg);
    if (r!=null) return unescape(r[2]);
    else{
        try{
            if(window.top != window.self && window.top.location.search!="" && window.top.location.search!='NA'){
                var r = window.top.location.search.substr(1).match(reg);
                if (r!=null) return unescape(r[2]);
            }
        }catch(err){}
        return null;
    }
}

function GetUrlCpaId(name){
    var query =window.location.search.substr(1);//get string
    var pos=query.indexOf(name+"=");//name=value
    if(pos==-1)   return null;//if not found return
    var argname=query.substring(0,pos);//fetch name
    var value=query.substring(pos);//fetch value

    var pos2= value.indexOf("&");
    if(pos2!=-1){
        value = value.substring(0,pos2);
    }
    var pos3=value.indexOf("=");
    if(pos3!=-1){
        value = value.substring(pos3+1);
    }
    return value;
}

//function bRtbAvail(cate,local){
//	var __rtbAvailCate = [96,156,125,14000,130,103,95,128,23065,168,609,611,212,207,8493,14502];
//	for(var i=0;i<__rtbAvailCate.length;i++){
//		if(__rtbAvailCate[i] == cate){
//			return true;
//		}
//	}
//	return false;
//}
