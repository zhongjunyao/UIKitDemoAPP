define(function(){function a(a){var c=[];try{for(var v=0,g=C.length;g>v;v++)if(C[v]&&C[v].invoke_group){var k=JSON.parse(C[v].invoke_group);k[E]&&k[E]===a&&c.push(v)}}catch(_){}return c}function c(a){var c="",v=C[a].invoke_group,g={};if(v)try{g=JSON.parse(v)}catch(k){}return c=g[E]?g[E]:""}function v(v){var k=c(v);if(k){var _=a(k);_&&_.length&&_.forEach(function(a){g(a)})}else g(v)}function g(a){var c,v=B.cookie("SE_LAUNCH")||"",g=a+":[\\d]*",re=new RegExp(g,"g","i");if(5===a){if(re.test(v))return;c=v?v+"_5:"+w:"5:"+w}else c=re.test(v)?v.replace(re,a+":"+w):v?v+"_"+a+":"+w:a+":"+w;c&&B.cookie("SE_LAUNCH",c,{expires:864e5,domain:".baidu.com",path:"/"})}function k(a,c,v){var g,k=B.cookie(c)||"",_=a+":[\\d]*",re=new RegExp(_,"ig");g=re.test(k)?v?k.replace(re,a+":"+v):k.replace(re,""):k?k+"_"+a+":"+v:a+":"+v,g&&B.cookie(c,g,{expires:864e5,domain:".baidu.com",path:"/"})}function _(a,c){var c=c||"SE_LAUNCH",v=B.cookie(c)||"",g=new RegExp(a+":(\\d+)","ig").exec(v);return g?+g[1]:void 0}function h(a,c,v){if(!a)return!0;var g=_(a);if(!g||!c||0>=+c)return!0;if(v){var h=60*g*1e3;if(new Date(h).toDateString()!==(new Date).toDateString())return k(a,"SE_LAUNCH",""),!0}return parseInt(Date.now()/1e3/60,10)-S-g<+c?!1:!0}var w=parseInt(sSession.serverTime/60,10),S=parseInt(Date.now()/1e3/60,10)-w,E="shutdown_trigger_interval",C=window.sSession.invokeApps.control;return{setCookie:v,setPosValCookie:k,getCookieVal:_,checkInvokeHZ:h}});