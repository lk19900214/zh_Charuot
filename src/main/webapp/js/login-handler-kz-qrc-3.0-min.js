eval(function(p, a, c, k, e, d) {
    e = function(c) {
        return (c < a ? "": e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
    };
    if (!''.replace(/^/, String)) {
        while (c--) d[e(c)] = k[c] || e(c);
        k = [function(e) {
            return d[e]
        }];
        e = function() {
            return '\\w+'
        };
        c = 1;
    };
    while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
    return p;
} ('e x={\'C\':\'q-B-A\',\'p\':\'D://G.q.F\',\'4\':\'\',\'f\':\'\',\'7\':6,\'b\':6,\'g\':d,\'m\':c,\'E\':a(){2.7=6;2.b=6;2.g=d},\'u\':a(9){5(2.g==c){r c};5(2.7!=6&&2.7["n"]=="1"){e 3={};3["h"]=2.7["h"];3["4"]=2.7["4"];3["k"]=d;2.b(3);r c};e i=2.p+"/z";l.y({w:c,i:i,H:\'R\',Q:\'o\',o:\'j\',3:9,P:"j",T:S,O:a(K){},J:a(I){}})},\'N\':a(8){2.7=8;5(2.b!=6){e 3={};5(8["n"]=="0"){3["4"]=8["4"];3["k"]=c}M 5(8["n"]=="1"){3["h"]=8["h"];3["4"]=8["4"];3["k"]=d};2.b(3)};2.g=d},\'L\':a(t){2.b=t;e 9="";5(2.4!=6&&l.s(2.4)!=""){9+="&4="+v(2.4)};5(2.f!=6&&l.s(2.f)!=""){9+="&f="+v(2.f)};5(2.m){9+="&m=1"};2.u(9)}};', 56, 56, '||this|data|service|if|null|j_data|vData|param|function|f_call_back|false|true|var|targetService|completed|user|url||logged|jQuery|renew|state|jsonp|loginServer|kongzhong|return|trim|call_back|exec_login|decodeURIComponent|async|KZQRCLoginHandler|ajax|qrcLogin|agent|qrclogin|id|https|init|com|sso|type|xhr|error|json|login|else|callKongZ|success|jsonpCallback|dataType|post|5000|timeout'.split('|'), 0, {}))