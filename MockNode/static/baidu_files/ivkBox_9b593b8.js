define(function(require){function a(a,c){var v=h(a,c);return v?v.strategy:null}function c(a){return a&&a!==D}function v(a,c){return a&&a[c]}function w(a){$.each(a,function(c){var v=window.sSession.invokeApps.control[c],w=v.carouselArr;if(w){var k=a[c];w.map(function(a){k[+a.sort]&&(a=$.extend(a,k[+a.sort]))})}else v=$.extend(v,a[c])})}function k(a,c){var v=h(a,c),w={};if(v&&v.title){var k=v.title.split("_"),b={};try{b="string"==typeof v.ext?JSON.parse(v.ext).flow:v.ext.flow}catch(e){}w=k.reduce(function(a,c){return c in b&&(a[c]=b[c]),a},{})}return w}function b(a,c){var v={};if(c instanceof Object)for(var w in c)if(c[w]instanceof Object&&w===a){v=c[w];break}return v}function g(a,c){var v=S.getLogData(a);return $.extend({union:v.from,browserid:v.browserid,qid:v.lid},a,c)}var S=require("@baidu/invoke-box"),A=require("@baidu/invoke-box-search"),B=S.invoke,h=S.getControlByPos,y=27,L=51,D="baiduboxapp",O=a(y,window.sSession.invokeApps),j=k(L,window.sSession.invokeApps);return w(j),S.sendLogByBeacon=function(a,c,v){void 0===v&&(v=!1),A.invokeBox.sendLog(a,c,v)},S.getLogData=function(a){var c=window.sSession.from,v=a.from||"",w=a.channel||"",k=c&&"0"!==c?c:"",b=window.sSession.mobileBrowserId,g=$("#commonBase").attr("data-lid"),S=(new Date).getTime();return{origin:v,from:k,channel:w,browserid:b,qid:g,timestamp:S}},S.invoke=function(a,w){var k=null;c(O)&&(a.protocolHeader=O),w&&v(j,w)&&(k=a.sort?b(a.sort,j[w]):j[w]),a=g(a,k),window.sSession&&sSession.invokeApps&&sSession.invokeApps.stoken&&(a.stoken=sSession.invokeApps.stoken),B(a)},S.invokeBoxSearch=A,S});