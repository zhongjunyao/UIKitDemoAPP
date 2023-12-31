/**
 * @file core.js 调起核心模块,用于静态引用
 * @author zhangjingfeng
 */
/*!
 * clipboard.js v2.0.0
 * https://zenorocha.github.io/clipboard.js
 * 
 * Licensed MIT © Zeno Rocha
 */
!function(t,e){"object"==typeof exports&&"object"==typeof module?module.exports=e():"function"==typeof define&&define.amd?define([],e):"object"==typeof exports?exports.ClipboardJS=e():t.ClipboardJS=e()}(this,function(){return function(t){function e(o){if(n[o])return n[o].exports;var r=n[o]={i:o,l:!1,exports:{}};return t[o].call(r.exports,r,r.exports,e),r.l=!0,r.exports}var n={};return e.m=t,e.c=n,e.i=function(t){return t},e.d=function(t,n,o){e.o(t,n)||Object.defineProperty(t,n,{configurable:!1,enumerable:!0,get:o})},e.n=function(t){var n=t&&t.__esModule?function(){return t.default}:function(){return t};return e.d(n,"a",n),n},e.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},e.p="",e(e.s=3)}([function(t,e,n){var o,r,i;!function(a,c){r=[t,n(7)],o=c,void 0!==(i="function"==typeof o?o.apply(e,r):o)&&(t.exports=i)}(0,function(t,e){"use strict";function n(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}var o=function(t){return t&&t.__esModule?t:{default:t}}(e),r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},i=function(){function t(t,e){for(var n=0;n<e.length;n++){var o=e[n];o.enumerable=o.enumerable||!1,o.configurable=!0,"value"in o&&(o.writable=!0),Object.defineProperty(t,o.key,o)}}return function(e,n,o){return n&&t(e.prototype,n),o&&t(e,o),e}}(),a=function(){function t(e){n(this,t),this.resolveOptions(e),this.initSelection()}return i(t,[{key:"resolveOptions",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};this.action=t.action,this.container=t.container,this.emitter=t.emitter,this.target=t.target,this.text=t.text,this.trigger=t.trigger,this.selectedText=""}},{key:"initSelection",value:function(){this.text?this.selectFake():this.target&&this.selectTarget()}},{key:"selectFake",value:function(){var t=this,e="rtl"==document.documentElement.getAttribute("dir");this.removeFake(),this.fakeHandlerCallback=function(){return t.removeFake()},this.fakeHandler=this.container.addEventListener("click",this.fakeHandlerCallback)||!0,this.fakeElem=document.createElement("textarea"),this.fakeElem.style.fontSize="12pt",this.fakeElem.style.border="0",this.fakeElem.style.padding="0",this.fakeElem.style.margin="0",this.fakeElem.style.position="absolute",this.fakeElem.style[e?"right":"left"]="-9999px";var n=window.pageYOffset||document.documentElement.scrollTop;this.fakeElem.style.top=n+"px",this.fakeElem.setAttribute("readonly",""),this.fakeElem.value=this.text,this.container.appendChild(this.fakeElem),this.selectedText=(0,o.default)(this.fakeElem),this.copyText()}},{key:"removeFake",value:function(){this.fakeHandler&&(this.container.removeEventListener("click",this.fakeHandlerCallback),this.fakeHandler=null,this.fakeHandlerCallback=null),this.fakeElem&&(this.container.removeChild(this.fakeElem),this.fakeElem=null)}},{key:"selectTarget",value:function(){this.selectedText=(0,o.default)(this.target),this.copyText()}},{key:"copyText",value:function(){var t=void 0;try{t=document.execCommand(this.action)}catch(e){t=!1}this.handleResult(t)}},{key:"handleResult",value:function(t){this.emitter.emit(t?"success":"error",{action:this.action,text:this.selectedText,trigger:this.trigger,clearSelection:this.clearSelection.bind(this)})}},{key:"clearSelection",value:function(){this.trigger&&this.trigger.focus(),window.getSelection().removeAllRanges()}},{key:"destroy",value:function(){this.removeFake()}},{key:"action",set:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"copy";if(this._action=t,"copy"!==this._action&&"cut"!==this._action)throw new Error('Invalid "action" value, use either "copy" or "cut"')},get:function(){return this._action}},{key:"target",set:function(t){if(void 0!==t){if(!t||"object"!==(void 0===t?"undefined":r(t))||1!==t.nodeType)throw new Error('Invalid "target" value, use a valid Element');if("copy"===this.action&&t.hasAttribute("disabled"))throw new Error('Invalid "target" attribute. Please use "readonly" instead of "disabled" attribute');if("cut"===this.action&&(t.hasAttribute("readonly")||t.hasAttribute("disabled")))throw new Error('Invalid "target" attribute. You can\'t cut text from elements with "readonly" or "disabled" attributes');this._target=t}},get:function(){return this._target}}]),t}();t.exports=a})},function(t,e,n){function o(t,e,n){if(!t&&!e&&!n)throw new Error("Missing required arguments");if(!c.string(e))throw new TypeError("Second argument must be a String");if(!c.fn(n))throw new TypeError("Third argument must be a Function");if(c.node(t))return r(t,e,n);if(c.nodeList(t))return i(t,e,n);if(c.string(t))return a(t,e,n);throw new TypeError("First argument must be a String, HTMLElement, HTMLCollection, or NodeList")}function r(t,e,n){return t.addEventListener(e,n),{destroy:function(){t.removeEventListener(e,n)}}}function i(t,e,n){return Array.prototype.forEach.call(t,function(t){t.addEventListener(e,n)}),{destroy:function(){Array.prototype.forEach.call(t,function(t){t.removeEventListener(e,n)})}}}function a(t,e,n){return u(document.body,t,e,n)}var c=n(6),u=n(5);t.exports=o},function(t,e){function n(){}n.prototype={on:function(t,e,n){var o=this.e||(this.e={});return(o[t]||(o[t]=[])).push({fn:e,ctx:n}),this},once:function(t,e,n){function o(){r.off(t,o),e.apply(n,arguments)}var r=this;return o._=e,this.on(t,o,n)},emit:function(t){var e=[].slice.call(arguments,1),n=((this.e||(this.e={}))[t]||[]).slice(),o=0,r=n.length;for(o;o<r;o++)n[o].fn.apply(n[o].ctx,e);return this},off:function(t,e){var n=this.e||(this.e={}),o=n[t],r=[];if(o&&e)for(var i=0,a=o.length;i<a;i++)o[i].fn!==e&&o[i].fn._!==e&&r.push(o[i]);return r.length?n[t]=r:delete n[t],this}},t.exports=n},function(t,e,n){var o,r,i;!function(a,c){r=[t,n(0),n(2),n(1)],o=c,void 0!==(i="function"==typeof o?o.apply(e,r):o)&&(t.exports=i)}(0,function(t,e,n,o){"use strict";function r(t){return t&&t.__esModule?t:{default:t}}function i(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}function a(t,e){if(!t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!e||"object"!=typeof e&&"function"!=typeof e?t:e}function c(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):t.__proto__=e)}function u(t,e){var n="data-clipboard-"+t;if(e.hasAttribute(n))return e.getAttribute(n)}var l=r(e),s=r(n),f=r(o),d="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},h=function(){function t(t,e){for(var n=0;n<e.length;n++){var o=e[n];o.enumerable=o.enumerable||!1,o.configurable=!0,"value"in o&&(o.writable=!0),Object.defineProperty(t,o.key,o)}}return function(e,n,o){return n&&t(e.prototype,n),o&&t(e,o),e}}(),p=function(t){function e(t,n){i(this,e);var o=a(this,(e.__proto__||Object.getPrototypeOf(e)).call(this));return o.resolveOptions(n),o.listenClick(t),o}return c(e,t),h(e,[{key:"resolveOptions",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};this.action="function"==typeof t.action?t.action:this.defaultAction,this.target="function"==typeof t.target?t.target:this.defaultTarget,this.text="function"==typeof t.text?t.text:this.defaultText,this.container="object"===d(t.container)?t.container:document.body}},{key:"listenClick",value:function(t){var e=this;this.listener=(0,f.default)(t,"click",function(t){return e.onClick(t)})}},{key:"onClick",value:function(t){var e=t.delegateTarget||t.currentTarget;this.clipboardAction&&(this.clipboardAction=null),this.clipboardAction=new l.default({action:this.action(e),target:this.target(e),text:this.text(e),container:this.container,trigger:e,emitter:this})}},{key:"defaultAction",value:function(t){return u("action",t)}},{key:"defaultTarget",value:function(t){var e=u("target",t);if(e)return document.querySelector(e)}},{key:"defaultText",value:function(t){return u("text",t)}},{key:"destroy",value:function(){this.listener.destroy(),this.clipboardAction&&(this.clipboardAction.destroy(),this.clipboardAction=null)}}],[{key:"isSupported",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:["copy","cut"],e="string"==typeof t?[t]:t,n=!!document.queryCommandSupported;return e.forEach(function(t){n=n&&!!document.queryCommandSupported(t)}),n}}]),e}(s.default);t.exports=p})},function(t,e){function n(t,e){for(;t&&t.nodeType!==o;){if("function"==typeof t.matches&&t.matches(e))return t;t=t.parentNode}}var o=9;if("undefined"!=typeof Element&&!Element.prototype.matches){var r=Element.prototype;r.matches=r.matchesSelector||r.mozMatchesSelector||r.msMatchesSelector||r.oMatchesSelector||r.webkitMatchesSelector}t.exports=n},function(t,e,n){function o(t,e,n,o,r){var a=i.apply(this,arguments);return t.addEventListener(n,a,r),{destroy:function(){t.removeEventListener(n,a,r)}}}function r(t,e,n,r,i){return"function"==typeof t.addEventListener?o.apply(null,arguments):"function"==typeof n?o.bind(null,document).apply(null,arguments):("string"==typeof t&&(t=document.querySelectorAll(t)),Array.prototype.map.call(t,function(t){return o(t,e,n,r,i)}))}function i(t,e,n,o){return function(n){n.delegateTarget=a(n.target,e),n.delegateTarget&&o.call(t,n)}}var a=n(4);t.exports=r},function(t,e){e.node=function(t){return void 0!==t&&t instanceof HTMLElement&&1===t.nodeType},e.nodeList=function(t){var n=Object.prototype.toString.call(t);return void 0!==t&&("[object NodeList]"===n||"[object HTMLCollection]"===n)&&"length"in t&&(0===t.length||e.node(t[0]))},e.string=function(t){return"string"==typeof t||t instanceof String},e.fn=function(t){return"[object Function]"===Object.prototype.toString.call(t)}},function(t,e){function n(t){var e;if("SELECT"===t.nodeName)t.focus(),e=t.value;else if("INPUT"===t.nodeName||"TEXTAREA"===t.nodeName){var n=t.hasAttribute("readonly");n||t.setAttribute("readonly",""),t.select(),t.setSelectionRange(0,t.value.length),n||t.removeAttribute("readonly"),e=t.value}else{t.hasAttribute("contenteditable")&&t.focus();var o=window.getSelection(),r=document.createRange();r.selectNodeContents(t),o.removeAllRanges(),o.addRange(r),e=o.toString()}return e}t.exports=n}])});;
(function () {
    var define = window.eslx_define || window.define;
    var require = window.eslx_require || window.require;
    /**
 * @file moduleKit 组装模块相关
 * @author zhangjingfeng
 * @date 2017-07-20
 */

var ROOT_MODULE_NAME = 'rmbGrowth';
var BRANCH_MODULE_NAME = '';

function defineBranchModule(mName) {
    if (mName) {
        BRANCH_MODULE_NAME = ROOT_MODULE_NAME + '/' + mName;
    }
    else {
        BRANCH_MODULE_NAME = '';
    }
}

function defineChildModule(defineModule, path, moduleNames) {
    var eslDefine = define;
    var fullModuleNames = moduleNames.map(function (n) {
        return path + '/' + n;
    });

    // 显式注入模块
    var cb = function (a, b, c, d, e, f) {
        var obj = {};
        Array.prototype.slice.call(arguments).forEach(function (n, index) {
            if (n && moduleNames && moduleNames[index]) {
                obj[moduleNames[index]] = n;
            }
        });
        return obj;
    };
    if (defineModule) {
        eslDefine(defineModule, fullModuleNames, cb);
    }
    else {
        eslDefine(fullModuleNames, cb);
    }
}

function defineLeafModules(moduleName) {
    if (!BRANCH_MODULE_NAME || !moduleName) {
        return;
    }
    defineChildModule(BRANCH_MODULE_NAME, BRANCH_MODULE_NAME, moduleName);
}

function defineExportModules(moduleNames) {
    if (!ROOT_MODULE_NAME || !moduleNames || !moduleNames.length) {
        return;
    }
    defineChildModule('', ROOT_MODULE_NAME, moduleNames);
}
;

    /**
 * @file test
 * @author zhangjingfeng
 */
!(function () {
    /**
 * @file boxjs 调起APP
 * @author zhangjingfeng
 */
define('rmbGrowth/tools/box', function () {
    var ua = navigator.userAgent;
    var ret = {
        isBox: / baiduboxapp\//i.test(ua),
        isAndroid: /(Android);?[\s\/]+([\d.]+)?/.test(ua),
        assureOpenBox: assureOpenBox
    };

    /**
     * 插入openBox.js
     *
     * @param {Object} opts 打开选项 @deprecated
     */
    function assureOpenBox(opts) {
        if (window.OpenBox) {
            return;
        }
        var script = document.createElement('script');
        var t = new Date();
        var formatNum = function (num) {
            return num.toString().replace(/^(\d)$/, '0$1');
        };
        var time = ''
            + t.getFullYear() + '-'
            + formatNum(t.getMonth() + 1) + '-'
            + formatNum(t.getDate()) + '-'
            + formatNum(t.getHours());
        script.src = '//s.bdstatic.com/common/openjs/openBox.js?_v=' + time;
        document.body.appendChild(script);
        if (window.OpenBox) {
            var b = window.OpenBox;
            var openBdBox = b(opts);
            openBdBox.open();
        }
    }

    return ret;
});

;
    /* globals defineBranchModule */
    defineBranchModule('tools');
    /* globals defineLeafModules */
    defineLeafModules(['box']);
})();
;
    /**
 * @file test
 * @author zhangjingfeng
 */
!(function () {
    /**
 * @file 轮播推广逻辑
 * @author zhangjingfeng
 */

/**
 *   var opt = [{"priority": "1", "show": "2", "click": "50", "action": "bdbox"},
 *              {"priority": "2", "show": "2", "click": "150", "action": "haokan"}];
 *
 *   var instance = new ExhManager(opt);
 *   instance.getAppInfo();
 *   instance.showed();
 *   instance.clicked();
 */

define('rmbGrowth/ext/exhibitionManager', function () {
    var ExhManager = (function () {
        var lsPrefix = 'bdVideoLaunchAppExh_';
        var key = 'action';
        var showKey = 'show';
        var clickKey = 'click';
        var instance = null;

        /**
         * 轮展管理类
         *
         * @class
         */
        function ExhManager() {
            if (instance) {
                return instance;
            }
            return this.update.apply(this, arguments);
        }

        ExhManager.prototype.update = function (opts) {
            this.opts = opts;
            if (!opts) {
                return '';
            }
            this.getAppInfo();
            instance = this;
            return this;
        };

        ExhManager.prototype.getAppInfo = function () {
            var self = this;
            if (this._currentAppInfo) {
                return this._currentAppInfo;
            }
            var optLength = this.opts.length;
            if (!optLength) {
                return '';
            }
            var currentAppName = this._getStorageAppName();
            // 获取不到保存的app信息,则认为是无痕模式或初次进入,取优先级最高的app
            if (!currentAppName) {
                this._currentAppInfo = this.opts[0];
            }

            // 如果获取到了保存的app信息, 则去优先级内寻找
            this.opts.forEach(function (item) {
                if (item[key] === currentAppName) {
                    self._currentAppInfo = item;
                    return false;
                }
            });

            // 优先级内找不到,那就直接取第一个了
            if (!this._currentAppInfo) {
                this._currentAppInfo = this.opts[0];
            }

            this._updateStorageApp(this._currentAppInfo);
            return this._currentAppInfo;
        };

        ExhManager.prototype.judgeShowClick = function (type, typeKey) {
            if (type === 'show' && this['_once_' + type]) {
                return;
            }

            if (!this.opts || !this._currentAppInfo) {
                // not inited
                return;
            }
            var currentAppName = this._currentAppInfo[key];
            var previousAppName = this._getStorageAppName();
            if ((currentAppName || previousAppName) && currentAppName !== previousAppName) {
            }
            else {
                this['_once_' + type] = true;
                var time = Math.floor(this._getStorage(type + 'Time')) || 0;
                time = time + 1;
                if (time >= Math.floor(this._currentAppInfo[typeKey])) {
                    this.changeApp();
                }
                else {
                    this._setStorage(type + 'Time', time);
                }
            }
        };

        ExhManager.prototype.changeApp = function () {
            var currentAppName = this._currentAppInfo[key];
            var newIndex = -1;
            this.opts.forEach(function (item, index) {
                if (item[key] === currentAppName) {
                    newIndex = index;
                    return false;
                }
            });
            newIndex = newIndex + 1;
            if (newIndex >= this.opts.length) {
                newIndex = 0;
            }
            this._updateStorageApp(this.opts[newIndex]);
        };

        ExhManager.prototype.showed = function () {
            this.judgeShowClick('show', showKey);
        };

        ExhManager.prototype.clicked = function () {
            this.judgeShowClick('click', clickKey);
        };

        ExhManager.prototype._updateStorageApp = function (currentAppInfo) {
            var previousAppName = this._getStorageAppName();
            if ((currentAppInfo[key] || previousAppName) && currentAppInfo[key] !== previousAppName) {
                this._setStorage('appName', currentAppInfo[key]);
                this._setStorage('clickTime', '0');
                this._setStorage('showTime', '0');
            }
        };

        ExhManager.prototype._getStorageAppName = function () {
            return this._getStorage('appName');
        };


        ExhManager.prototype._getStorage = function (name) {
            try {
                return localStorage.getItem(lsPrefix + name);
            }
            catch (e) {
                return '';
            }
        };

        ExhManager.prototype._setStorage = function (name, value) {
            try {
                localStorage.setItem(lsPrefix + name, '' + value);
            }
            catch (e) {
            }
        };
        return ExhManager;
    })();
    return ExhManager;
});
;
    /**
 * @file conf.js
 * @author zhangjingfeng
 *
 * 请严格按照以下顺序定义判断条件
 * 1. page  页面 按照上线模块区分
 * 2. pd    来源 按照入口区分
 * 3. isBox 手百 区分手百内外
 * 4. sid   小流量 区分不同小流量
 *
 * 1, 2, 4 的判断都请写在这里; 3的判断尽量写在本文件中
 *
 * 本文件用于临时干预, 任何diff都应该抽象为组件的配置, 请牢记组件化初衷!
 */
define('rmbGrowth/ext/conf', ['rmbGrowth/tools/box'], function (box) {
    var navigator = window.navigator || {};
    var opt = {
        page: '',
        pd: '',
        isBox: / baiduboxapp\//i.test(navigator.userAgent),
        sid: ''
    };

    var config = function (opts) {
        box.assureOpenBox();
        for (var index in opt) {
            if (opt.hasOwnProperty(index) && undefined !== opts[index]) {
                opt[index] = opts[index];
            }
        }
    };

    var PAGE = {
        VIDEOM: 'videom',
        VIDEOAE: 'videoae',
        WISEFEED: 'wisefeed',
        VIDEOUI: 'videoui',
        CHANNEL: 'channel',
        WISETAB: 'wisetab'
    };

    var PD = {
        WISENATURAL: 'wise_natural',
        SHARE: 'share'
    };

    var getWhiteList = function (funcName, funcArgs) {
        // 白名单, 不管其他条件, 满足即可生效, 不满足维持现状
        // eg. 1.videoui 手百下自然结果出红包模板 2.修改videoui轮展策略
        var whiteList = {
            // 'redPacket': opt.isBox && opt.pd === PD.WISENATURAL && opt.page === PAGE.VIDEOUI,
            // 'videouiShowAroundStrategy': function () {
            //     if (opt.page === PAGE.VIDEOUI) return {bdbox:0, haokan: 1};
            //     return '';
            // }
        };

        if (funcName && whiteList[funcName]) {
            return typeof whiteList[funcName] === 'function'
                ? whiteList[funcName](funcArgs)
                : whiteList[funcName];
        }
    };

    var getBlackList = function (funcName, funcArgs) {
        // 黑名单, 不管其他条件, 满足即应禁止, 不满足则维持现状
        var blackList = {
            // 'redPacket': opt.isBox && opt.pd === PD.WISENATURAL && opt.page === PAGE.VIDEOUI,
            // 'videouiShowAroundStrategy': function () {
            //     if (opt.page === PAGE.VIDEOUI) return {bdbox:0, haokan: 1};
            //     return '';
            // }
        };

        if (funcName && blackList[funcName]) {
            return typeof blackList[funcName] === 'function'
                ? blackList[funcName](funcArgs)
                : blackList[funcName];
        }
    };

    return {
        config: config,
        getWhiteList: getWhiteList,
        getBlackList: getBlackList
    };
});

;
    /* globals defineBranchModule */
    defineBranchModule('ext');
    /* globals defineLeafModules */
    defineLeafModules(['exhibitionManager', 'conf']);
})();
;
    /**
 * @file invoke/index
 * @author zhangjingfeng
 */

!(function () {
    /**
 * @file invokeApp 核心调起模块
 * @author pankeyu zhangjingfeng
 * @date 2017-07-24
 */

define('rmbGrowth/invoke/invokeApp', ['rmbGrowth/invoke/appAdDownload'], function (appAdDownload) {

    /**
     * 注入boxJS
     *
     * @private
     * @param {Object} injectBoxJSOption 整合boxjs与box
     * @param {Object} injectBoxJSOption.boxJS boxjs
     * @param {Object}injectBoxJSOption.box box
     * @return {Object} boxjs
     */
    function getBoxJS(injectBoxJSOption) {
        var boxJS = injectBoxJSOption && injectBoxJSOption.boxJS || window.BoxJS;
        var box = injectBoxJSOption && injectBoxJSOption.box || window.Box;
        if (!box && !boxJS) {
            return null;
        }
        return {
            isBox: function () {
                if (boxJS) {
                    return !!boxJS.isBox;
                }
                return !!box.isBox;
            },
            invokeAndroid: function () {
                if (boxJS) {
                    boxJS.invokeAndroid.apply(boxJS, arguments);
                }
                box && box.android && box.android.invokeApp
                    && (box.android.invokeApp.apply(box.android, arguments));
            },
            versionCompare: function (v1, v2) {
                if (boxJS) {
                    return boxJS.version_compare.apply(boxJS, arguments);
                }
                return box.version_compare.apply(boxJS, arguments) || 0;
            },
            getVersion: function () {
                if (boxJS) {
                    return boxJS.getVersion();
                }
                return box.version;
            }
        };
    }

    // var innerModules;

    var invokeApp = {

        errorUrl: 'https://m.baidu.com',
        opts: {
            // 初始到剪切板的选择器
            hasInitedClipboardSelectorList: []
        },

        /**
         * 手百新调起函数
         *
         * @param {Object} action 调起行为
         * @param {Object} params 调起参数
         * @param {Function} callback 回调
         */
        newInvoke: function (action, params, callback) {
            if (!action || !(window.Box && window.Box.isBox)) {
                return;
            }

            var url = [];
            if ($.isFunction(params)) {
                callback = params;
            }
            else {
                for (var i in params) {
                    if (params.hasOwnProperty(i)) {
                        url.push(i + '=' + params[i]);
                    }
                }
            }
            if ($.isFunction(callback)) {
                var funcName = '_bdbox_js_' + $.getId();
                window[funcName] = function () {
                    callback.apply(window, ([]).slice.call(arguments, 0));
                };
                url.push('callback=' + funcName);
            }
            else {
                if (callback) {
                    url.push('callback=' + callback);
                }
            }
            url = 'baiduboxapp://' + action + '?' + url.join('&');

            var $node = document.createElement('iframe');
            $node.style.display = 'none';
            $node.src = url;
            var body = document.body || document.getElementsByTagName('body')[0];
            body.appendChild($node);
            // 销毁 iframe
            setTimeout(function () {
                body.removeChild($node);
                $node = null;
            }, 0);
        },

        /**
         * 判断是否为safari浏览器
         *
         * @public
         * @return {boolean} 是否为safari浏览器
         */
        isSafari: function () {
            var ua = window.navigator.userAgent;
            /* eslint-disable max-len */
            var ret = ua.match(/(MSIE|(?!Gecko.+)Firefox|(?!AppleWebKit.+Chrome.+)Safari|(?!AppleWebKit.+)Chrome|AppleWebKit(?!.+Chrome|.+Safari)|Gecko(?!.+Firefox))(?: |\/)([\d\.apre]+)/);
            /* eslint-enable max-len */
            var likeSafari = false;
            if (ret && ret[1] && ret[1].toLowerCase() === 'safari') {
                likeSafari = true;
            }
            /* eslint-disable max-len */
            return likeSafari && !/CriOS|UCBrowser|fxiOS|QHBrowser|MQQBrowser|baidubrowser|MicroMessenger|SogouMobileBrowser/i.test(ua);
            /* eslint-enable max-len */
        },

        /**
         * 判断是否为手百浏览器
         *
         * @public
         * @return {boolean} 是否为手百浏览器
         */
        isBox: function () {
            return / baiduboxapp/.test(navigator.userAgent);
        },

        /**
         * 判断是否大于给出的手百版本号
         *
         * @param {string} base 基准版本号
         * @return {number} 1：大于等于 ，0：小于， -1：无法判断
         */
        boxVerCompare: function (base) {
            var boxUtils = window.Box || window.BoxJS;
            if (boxUtils) {
                return boxUtils.version_compare(boxUtils.version || boxUtils.getVersion(), base) >= 0 ? 1 : 0;
            }
            return -1;
        },

        /**
         * 判断是否为uc浏览器
         *
         * @public
         * @return {boolean} 是否为uc浏览器
         *
         * */
        isUc: function () {
            var ua = window.navigator.userAgent;
            return /UCBrowser|UCWeb/.test(ua);
        },


        /**
         * 有每日最大调起次数的限制。
         * 存入localStorage的格式为:当前日期_调起次数
         *
         * @private
         * @param {Object} option 调起次数相关配置
         * @param {string} option.lsKey localStorage的key
         * @param {string} option.cnt 每日调起次数的限制
         * @return {boolean} 为true是表示可以吊起
         */
        invokeCntPerDay: function (option) {

            var needInvokeLanding = true;
            var lsKey = option.lsKey + '_' + option.app;
            var cnt = option.cnt;

            var lsVal = '';
            var today = '';
            var todayCnt = '';

            var getDate = function (day) {
                return '' + day.getYear() + day.getMonth() + day.getDate();
            };

            try {
                if (lsVal = localStorage.getItem(lsKey)) {

                    today = lsVal.split('_')[0];
                    todayCnt = lsVal.split('_')[1];

                    if (cnt === 'MAX') {
                        needInvokeLanding = true;
                    }
                    else {
                        if (getDate(new Date()) === today) {
                            // 同一天进入
                            needInvokeLanding = parseInt(todayCnt, 10) < parseInt(cnt, 10);
                            todayCnt = parseInt(todayCnt, 10) + 1 + '';
                            localStorage.setItem(lsKey, today + '_' + todayCnt);

                        }
                        else {
                            // 第二天进入
                            localStorage.setItem(lsKey, getDate(new Date()) + '_' + '1');
                            needInvokeLanding = true;
                        }
                    }
                }
                else {
                    // 首次访问
                    localStorage.setItem(lsKey, getDate(new Date()) + '_' + '1');
                    needInvokeLanding = cnt !== '0';
                }
            }
            catch (err) {
                // 无痕模式
                needInvokeLanding = true;
            }

            return needInvokeLanding;
        },

        /**
         * 一天只吊起一次,外部可以直接使用。
         *
         * @public
         * @param {string} lskey localStorage的key
         * @return {boolean} needInvokeLanding 为true是表示可以吊起
         */
        onceEveryDay: function (lskey) {
            var needInvokeLanding = true;
            var lsKey = lskey;

            var getDate = function (day) {
                return '' + day.getYear() + day.getMonth() + day.getDate();
            };

            try {
                if (localStorage.getItem(lsKey)) {
                    if (getDate(new Date()) === localStorage.getItem(lsKey)) {
                        // 当天再次打开不调起
                        needInvokeLanding = false;
                    }
                    else {
                        // 第二天打开更新时间戳
                        localStorage.setItem(lsKey, getDate(new Date()));
                    }
                }
                else {
                    // 第一次进来新增时间戳
                    localStorage.setItem(lsKey, getDate(new Date()));
                }
            }
            catch (err) {
                // 无痕模式
                needInvokeLanding = false;
            }

            return needInvokeLanding;
        },

        /**
         * 获取url中的参数
         *
         * @private
         * @param {string} url 需要解析的url
         * @return {Object} args
         */
        getQuery: function (url) {
            url = url ? url : window.location.search;
            if (url.indexOf('?') < 0) {
                return {};
            }
            var queryParam = url.substring(url.indexOf('?') + 1, url.length).split('&');
            var args = {};
            for (var i = 0, j; j = queryParam[i]; i++) {
                args[j.substring(0, j.indexOf('='))] = decodeURIComponent(j.substring(j.indexOf('=') + 1, j.length));
            }
            return args;
        },

        /**
         * 更新一个对象的值,并返回一个新的对象
         *
         * @private
         * @param {Object} oldObj 被更新的对象
         * @param {Object} newObj 需要更新的值
         * @return {Object} finalObj 新对象
         */
        mergeObject: function (oldObj, newObj) {
            var finalObj = {};
            for (var i in oldObj) {
                if (oldObj.hasOwnProperty(i)) {
                    finalObj[i] = newObj[i] ? newObj[i] : oldObj[i];
                }
            }
            for (var j in newObj) {
                if (newObj.hasOwnProperty(j) && !oldObj[j]) {
                    finalObj[j] = newObj[j];
                }
            }
            return finalObj;
        },

        /**
         * 判断变量是否为一个对象
         *
         * @private
         * @param {Object} obj 需要进行判断的变量
         * @return  {boolean}
         */
        isObject: function (obj) {
            if (!obj) {
                return false;
            }
            return Object.prototype.toString.call(obj) === '[object Object]';
        },

        /**
         * 判断是否微信访问
         *
         * @private
         * @return  {boolean}
         */
        isWeChat: function () {
            return /MicroMessenger/i.test(navigator.userAgent.toLowerCase());
        },

        /**
         * 判断当前系统是否为iOS9以上(包括iOS9)
         *
         * @private
         * @return  {boolean}
         */
        isIos9: function () {
            if ((navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i))) {
                var version = parseInt((navigator.userAgent.replace(/^.*OS ([\d_]+) like.*$/, '$1')).split('_')[0], 10);
                return Boolean(version > 8);
            }
            return false;
        },

        /**
         * 判断是否为手机QQ
         *
         * @private
         * @return  {boolean}
         */
        isMobileQQ: function () {
            return /^(?!.*Safari).*QQ/.test(navigator.userAgent);
        },

        /**
         * 判断是否为QQ浏览器
         *
         * @private
         * @return  {boolean}
         */
        isQQBrowser: function () {
            return /MQQBrowser/i.test(navigator.userAgent);
        },


        /**
         * 判断是否为iOS
         *
         * @private
         * @return  {boolean}
         */
        isIos: function () {
            return /iphone|ipad|ipod/i.test(navigator.userAgent);
        },

        /**
         * 判断是否为Android
         *
         * @private
         * @return  {boolean}
         */
        isAndroid: function () {
            return /android/i.test(navigator.userAgent);
        },

        /**
         * 拼接手百视频落地页地址
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {Object} source 额外的参数,主要用于统计
         * @param {boolean} noInvokeVideo 是否调起播放器.用于安卓拼返回频道scheme
         * @return {string} landUrl 手百视频落地页地址
         */
        getBdLandUrl: function (id, source, noInvokeVideo) {
            var obj;
            if (id.indexOf('internal') > -1) {
                obj = {
                    /* eslint-disable fecs-camelcase */
                    internal_url: id
                    /* eslint-enable fecs-camelcase */
                };
            }
            else {
                obj = {
                    nid: id.indexOf('sv') > -1 ? id : ('sv_' + id)
                };
            }

            var extra = '&backflow=1';
            if (this.isObject(source)) {
                for (var i in source) {
                    if (source.hasOwnProperty(i)) {
                        extra += '&' + i + '=' + source[i];
                    }
                }
            }
            if (noInvokeVideo) {
                extra += '&no_invoke_video=1';
            }
            var landUrl = 'https://sv.baidu.com/videoui/page/videoland?'
                + 'context='
                + encodeURIComponent(JSON.stringify(obj))
                + extra;

            return landUrl;
        },

        /**
         * 拼接手百iOS吊起scheme,用于手百吊起组件
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {Object} source 额外的参数,主要用于统计
         * @return {string} iosScheme 传入手百组件的手百iOS吊起scheme
         */
        getBdIOSV80Scheme: function (id, source) {
            var landUrl = this.getBdLandUrl(id, source);
            var iosSheme = 'baiduboxapp://easybrowse?'
                + 'openurl=' + encodeURIComponent(landUrl)
                + '&opentype=1'
                + '&isla=0'
                + '&type=video'
                + '&page_type=empty'
                + '&newbrowser=1'
                + '&sfrom=feed'
                + '&append=1'
                + '&stay=1'
                + '&minver=6.0.0.0'
                + '&toolbaricons=%7B%22toolids%22%3A%5B%221%22%2C%222%22%2C%223%22%5D%7D'
                + '&menumode=2';

            return iosSheme;
        },

        /**
         * 拼接手百Android吊起cmd,用于手百吊起组件
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {Object} source 额外的参数,主要用于统计
         * @return {Object} andrCmd 传入手百组件的手百Android吊起cmd
         */
        getBdAndrCmd: function (id, source) {
            var landUrl = this.getBdLandUrl(id, source);
            /* eslint-disable max-len */
            var intent = 'intent:#Intent;component=com.baidu.searchbox/.home.feed.ShortVideoDetailActivity;B.bdsb_append_param=true;S.bdsb_light_start_url=' + encodeURIComponent(landUrl) + ';S.toolbaricons=%7B%22toolids%22%3A%5B%221%22%2C%222%22%2C%223%22%5D%7D;S.menumode=2;end';
            /* eslint-enable max-len */
            var andrCmd = {
                mode: '0',
                intent: intent,
                /* eslint-disable fecs-camelcase */
                min_v: '16787968'
                /* eslint-enable fecs-camelcase */
            };
            return andrCmd;
        },

        /**
         * 拼接手百双端吊起scheme,仅限8.2以上
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {Object} source 额外的参数,主要用于统计
         * @param {boolean} noInvokeVideo 是否禁止调起播放器.仅限android h5落地页->NA频道->NA落地页的方式使用
         * @return {string} iosScheme 传入手百组件的手百iOS吊起scheme
         */
        getBdV82Scheme: function (id, source, noInvokeVideo) {
            var landUrl = this.getBdLandUrl(id, source, noInvokeVideo);
            var scheme = 'baiduboxapp://v1/easybrowse/open?'
                + 'upgrade=1'
                + '&type=video'
                + '&url=' + encodeURIComponent(landUrl)
                + '&append=1'
                + '&slog=%7b%22from%22%3a%22feed%22%7d'
                /* eslint-disable max-len */
                + '&style=%7b%22toolbaricons%22%3a%7b%22toolids%22%3a%5b%221%22%2c%222%22%2c%223%22%5d%7d%2c+%22menumode%22%3a%222%22%7d'
                /* eslint-enable max-len */
                + '&newbrowser=1'
                + '&stay=1';

            return scheme;
        },

        /**
         * 拼接手百Android吊起cmd,可直接进行吊起
         *
         * @private
         * @param {Object} cmd 视频的id,可以为locid,或者为nid
         * @return {string} invokeCmd 手百Android吊起cmd
         */
        getBdAndrInvokeCmd: function (cmd) {
            /* eslint-disable max-len */
            var params = '{"intent":"intent:#Intent;action=com.baidu.searchbox.action.HOME;component=com.baidu.searchbox\/.MainActivity';
            params = params + ';S.targetCommand=' + encodeURIComponent(JSON.stringify(cmd)) + ';end"}';
            var invokeCmd = 'baiduboxapp://utils?action=sendIntent&minver=7.4&params=' + encodeURIComponent(params);
            return invokeCmd;
            /* eslint-enable max-len */
        },

        /**
         * 拼接NA落地页吊起scheme,双端9.1支持. 但是只支持id调起
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {string} playurl 视频的播放地址,安卓必需.注意防盗链风险
         * @param {string} pd 视频的来源渠道
         * @param {string} pagepd 视频的调起渠道
         * @return {string} invokeCmd 手百Android吊起cmd
         */
        getBdNALandScheme: function (id, playurl, pd, pagepd) {
            pd = pd || 'growth';
            var protocol = 'baiduboxapp://v8/video/invokeVideoLandingPage';
            var params = {
                vid: '' + id,
                videoInfo: {
                    /* eslint-disable fecs-camelcase */
                    ext_log: {
                        pd: pd || '',
                        pagepd: pagepd || ''
                    },
                    /* eslint-enable fecs-camelcase */
                    ext: {
                        clarityUrl: [{
                            key: 'sd',
                            rank: 0,
                            title: '标清',
                            url: playurl
                        }]

                    }
                },
                pd: pd
            };
            var tail = '&toolbaricons=%7B%22toolids%22%3A%5B%224%22%2C%221%22%2C%222%22%2C%223%22%5D%7D&menumode=2';
            return protocol + '?params=' + encodeURIComponent(JSON.stringify(params)) + tail;
        },

        /**
         * 拼接手百iOS调起H5落地页返回NA视频频道scheme
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {Object} source 额外的参数,主要用于统计
         * @return {string} scheme 手百iOS吊起scheme
         */
        getBdIOSBackChannelScheme: function (id, source) {
            var landScheme = this.getBdV82Scheme(id, source, false);
            var naChannelScheme = 'baiduboxapp://v11/appTab/select?item=video&upgrade=0&delaytime=0.6';
            return landScheme + '&prev=' + encodeURIComponent(naChannelScheme);
        },

        /**
         * 拼接手百android调起scheme, NA落地页返回NA视频频道,低版本调起h5落地页
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为nid
         * @param {Object} source 额外的参数,主要用于统计
         * @param {string} [playurl] 视频的url,视频播放地址
         * @return {string} scheme 手百iOS吊起scheme
         */
        getBdAndrBackChannelScheme: function (id, source, playurl) {
            // 手机百度在三星下有坑, 部分三星旧手机预装了8.1手百,会拦截高版本手百协议
            var isSamsung = /\(.*Android.*(SAMSUNG|SM-).*\)/.test(navigator.userAgent);
            if (isSamsung) {
                return this.getBdAndrCmd(id, source);
            }
            var naChannelScheme = 'baiduboxapp://v11/appTab/select?item=video&upgrade=0';
            var landScheme = this.getBdV82Scheme(id, source, true);
            var landSchemeInvoke = this.getBdV82Scheme(id, source, false);
            // var naLandScheme = this.getBdNALandScheme(id, playurl, 'growth', source && source.pagepd);
            return (landScheme
                + '&next='
                + encodeURIComponent(naChannelScheme + '&next=' + encodeURIComponent(landSchemeInvoke))
            );
        },

        /**
         * 拼接手百iOS调起scheme, H5落地页返回搜索页
         *
         * @private
         * @param {string} id 视频的id,可以为locid,或者为vid
         * @param {Object} source 额外的参数,主要用于统计
         * @param {string} query 搜索query
         * @return {string} scheme 手百iOS吊起scheme
         */
        getBdIOSBackSearchScheme: function (id, source, query) {
            var backSearchScheme = this.getBdIOSV80Scheme(id, source)
                + '&prev='
                + encodeURIComponent('baiduboxapp://v1/browser/search?query=' + encodeURIComponent(query));
            return backSearchScheme;
        },

        /**
         * 拼接好看iOS吊起通用链接,可直接进行吊起
         *
         * @private
         * @param {string} id 视频的locid
         * @param {Object} source 额外的参数,主要用于统计
         * @return {string} baseUrl 好看的吊起通链
         */
        getHkUrl: function (id, source, failUrl) {
            var baseUrl = 'https://hku.baidu.com/h5/share/detail?url_key=' + encodeURIComponent(id);
            if (failUrl) {
                baseUrl += '&target=' + encodeURIComponent(failUrl);
            }
            if (this.isObject(source)) {
                for (var i in source) {
                    if (source.hasOwnProperty(i)) {
                        baseUrl += '&' + i + '=' + source[i];
                    }
                }
            }
            return baseUrl;
        },

        getHkMiniUrl: function(id, source, failUrl, vi) {
            var scheme = encodeURIComponent('bdminivideo://video/details?source=guide-wisexspskpdq-0&params=%7B%22slog%22%3A%5B%5D%2C%22vid%22%3A%22' + id + '%22%2C%22hasMore%22%3A1%2C%22feedext%22%3A%22%7B%5C%22vid%5C%22%3A%5C%22' + id + '%5C%22%2C%5C%22source%5C%22%3A%5C%22guide-wisexspskpdq-0%5C%22%7D%22%7D&tab=guide&tag=wisexspskp');
            var taregtUrl = 'https%3A%2F%2Fitunes.apple.com%2Fcn%2Fapp%2F%25E5%2585%25A8%25E6%25B0%2591%25E5%25B0%258F%25E8%25A7%2586%25E9%25A2%2591%2Fid1329385145%3Fmt%3D8';
            if (failUrl) {
                taregtUrl =  encodeURIComponent(failUrl);
            }
            var baseUrl = 'https://vv.baidu.com/feedvideoui/ulink?scheme=' + scheme
                        + '&target=' + taregtUrl;
            return baseUrl;
        },

        /**
         * 拼接好看Android吊起scheme,可直接进行吊起
         *
         * @private
         * @param {string} id 视频的locid
         * @param {Object} source 额外的参数,主要用于统计
         * @return {string} baseUrl 好看的吊起scheme
         */
        getHkScheme: function (id, source) {
            var baseUrl = 'baiduhaokan://video/details/?url_key=' + encodeURIComponent(id);
            if (this.isObject(source)) {
                for (var i in source) {
                    if (source.hasOwnProperty(i)) {
                        baseUrl += '&' + i + '=' + source[i];
                    }
                }
            }
            return baseUrl;
        },

        getHkMiniScheme: function(id, source, vi) {
            var baseUrl = 'baiduhaokan://minivideo/videodetails/?vid=' + id
                + (vi ? '&videoInfo=' + encodeURIComponent(vi) : '');
            if (this.isObject(source)) {
                for (var i in source) {
                    if (source.hasOwnProperty(i)) {
                        baseUrl += '&' + i + '=' + source[i];
                    }
                }
            }
            return baseUrl;
        },

        /**
         * 拼接吊起universal link,可直接进行吊起
         *
         * @private
         * @param {string} app app类型
         * @param {Object} opts 拼接ulink时需要的参数,因app而已;
         * @return {string} ulink app的吊起通链。默认返回好看
         */
        getUniversalLink: function (app, opts) {
            switch (app) {
                case 'HaoKan':
                    return this.getHkUrl(opts.id, opts.source, opts.failUrl);
                default:
                    return this.getHkUrl(opts.id, opts.source, opts.failUrl);
            }
        },

        getMiniUniversalLink: function (app, opts) {
            switch (app) {
                case 'HaoKan':
                    return this.getHkMiniUrl(opts.id, opts.source, opts.failUrl, opts.vi);
                default:
                    return this.getHkMiniUrl(opts.id, opts.source, opts.failUrl, opts.vi);
            }
        },

        /**
         * 拼接吊起scheme, 可直接进行吊起
         *
         * @private
         * @param {string} app app类型
         * @param {Object} opts 拼接ulink时需要的参数,因app而已;
         * @return {string} scheme app的吊起scheme 。默认返回好看
         */
        getScheme: function (app, opts) {
            switch (app) {
                case 'HaoKan':
                    return this.getHkScheme(opts.id, opts.source);
                default:
                    return this.getHkUrl(opts.id, opts.source);
            }
        },

        getMiniScheme: function (app, opts) {
            var baseUrl = 'bdminivideo://video/details?source=guide-wisexspskpdq-0&params=%7B%22slog%22%3A%5B%5D%2C%22vid%22%3A%22' + opts.id + '%22%2C%22hasMore%22%3A1%2C%22feedext%22%3A%22%7B%5C%22vid%5C%22%3A%5C%22' + opts.id + '%5C%22%2C%5C%22source%5C%22%3A%5C%22guide-wisexspskpdq-0%5C%22%7D%22%7D&tab=guide&tag=wisexspskp';
            return baseUrl;
        },

        /**
         * 跳转到相应的app下载地址
         *
         * @private
         * @param {Object} downloadInfo 下载链接
         * @param {string} downloadInfo.ios appStore的下载链接
         * @param {string} downloadInfo.yybao 应用宝下的下载链接
         * @param {string} downloadInfo.pkgurl 安卓apk的下载链接
         * @param {string} downloadInfo.pkgName 安卓apk包名
         * @param {Object} [options] 下载参数
         * @param {Object} [options.isOpenBdAppSearch] 是否用手助下载,默认否
         * @param {Object} [data] 下载数据
         */
        jump: function (downloadInfo, options, data) {
            var self = this;
            if (!this.isObject(downloadInfo)) {
                console.warn('If you want to download the app, downloadinfo is required as an object');
                return;
            }

            if (this.isAndroid() && window.__vrandom &&  this.isBox() && parseFloat(window.BoxJS.getVersion()) >= 9.3) {
                appAdDownload.init(downloadInfo);
                return;
            }

            if (this.isWeChat() || this.isMobileQQ()) {
                setTimeout(function () {
                    window.location.href = downloadInfo.yybao || self.errorUrl;
                });
            }
            else if (this.isIos() && !((this.isWeChat() || this.isMobileQQ()))) {
                setTimeout(function () {
                    window.location.href = downloadInfo.ios || self.errorUrl;
                });
            }
            else if (this.isAndroid() && this.isBox() && options && options.isOpenBdAppSearch && downloadInfo.pkgName) {
                this.isBdAppSearchInstalled(function (isInstalled) {
                    if (isInstalled) {
                        self.openBdAppSearch({pkgName: downloadInfo.pkgName});
                    }
                    else {
                        setTimeout(function () {
                            window.location.href = downloadInfo.yybao || self.errorUrl;
                        });
                    }
                });
            }
            else if (this.isAndroid() && !this.isWeChat() && !this.isMobileQQ()) {
                if (downloadInfo.pkgName) {
                    self.goToAppStore(downloadInfo, data);
                    return;
                }
                setTimeout(function () {
                    window.location.href = downloadInfo.pkgurl || self.errorUrl;
                });
            }
            else {
                setTimeout(function () {
                    window.location.href = downloadInfo.pkgurl || self.errorUrl;
                });
            }
        },

        /**
         * 前端拼接吊起ulink,scheme等。data.action.id !==undefined 时,认为是前端自己拼接吊起参数,会进入到该函数逻辑。
         *
         * @private
         * @param {Object} data 吊起相关参数
         * @param {Object} data.action 吊起核心参数。
         * @param {Object} data.downloadInfo 下载信息。
         * @param {Object} data.pagepd 渠道相关信息。统计相关。
         */
        selfHandle: function (data) {
            var action = data.action;
            var pagepd = data.pagepd;
            var locid = action.id;
            var playurl = action.playurl;
            var ulink = '';
            var scheme = '';
            var obj = {};
            var source = {};
            var isMini = data.mini || false;

            if (action.app === 'BdBox') {
                source = {
                    backflow: '1'
                };
                pagepd && pagepd.pagepd && (source.pagepd = pagepd.pagepd) && (source.pagepdSid = pagepd.pagepdSid);
                if (action.searchQuery) {
                    scheme = this.isIos()
                        ? this.getBdIOSBackSearchScheme(locid, source, action.searchQuery)
                        : this.getBdAndrCmd(locid, source);
                }
                else if (/^\d+$/.test(locid)) {
                    scheme = this.isIos()
                        ? this.getBdIOSBackChannelScheme(locid, source)
                        : this.getBdAndrBackChannelScheme(locid, source, playurl);
                }
                else {
                    scheme = this.isIos() ? this.getBdIOSV80Scheme(locid, source) : this.getBdAndrCmd(locid, source);
                }


                obj = {
                    app: action.app,
                    type: action.type || 'invoke',
                    scheme: scheme
                };
            }
            else if (action.app === 'HaoKan' || !action.app) {
                source = {
                    tab: 'guide'
                };
                pagepd && pagepd.pagepd && (source.tag = pagepd.pagepd) && (source.source = pagepd.source);

                if (!isMini) {
                    ulink = this.getUniversalLink(action.app, {
                        id: locid,
                        source: source,
                        failUrl: action.failUrl || ''
                    });
                    scheme = this.getScheme(action.app, {
                        id: locid,
                        source: source
                    });
                }
                else {
                    // scheme增加可滑动参数
                    if (source) {
                        source.hasMore = 1;
                    }
                    ulink = this.getMiniUniversalLink(action.app, {
                        id: locid,
                        source: source,
                        failUrl: action.failUrl || '',
                        vi: action.videoInfo
                    });
                    scheme = this.getMiniScheme(action.app, {
                        id: locid,
                        source: source,
                        vi: action.videoInfo
                    });
                }
                obj = {
                    app: action.app,
                    type: action.type || 'invoke',
                    ulink: ulink,
                    scheme: scheme
                };
            }

            data.action = this.mergeObject(data.action, obj);

            this.autoHandle(data);
        },

        /**
         * 后端传的吊起信息。当 data.action.id === undefined时,认为是后端传的吊起参数,会进入到该函数逻辑。
         *
         * @private
         * @param {Object} data 吊起相关参数
         * @param {Object} data.action  吊起核心参数。
         * @param {Object} data.downloadInfo 下载信息。
         * @param {Object} data.pagepd 渠道相关信息。统计相关。
         */
        autoHandle: function (data) {
            var action = data.action;
            var appName = action.app;
            if (appName === 'channel') {
                this.invokeChannel();
            }
            else if (appName !== 'BdBox') {
                this.appInvoke(data);
            }
            else {
                this.bdInvoke(data);
            }
        },

        /**
         * 非手百APP吊起。最核心的吊起机制。
         *
         * @private
         * @param {Object} data 吊起的核心参数
         * @param {Object} data.downloadInfo app下载信息
         * @param {Object} data.downloadInfo app下载信息
         * @param {Object} data.action 吊起的核心参数
         * @param {string} data.action.scheme 吊起scheme。
         * @param {string} data.action.ulink 吊起universal link。
         * @param {string} data.action.type 值为: invoke 或 normalInvoke。type === 'invoke'时, 安卓下吊起失败会引导下载。
         * type === 'normalInvoke'时,安卓下吊起失败【不会】引导下载
         */
        appInvoke: function (data) {
            var self = this;
            var action = data.action;

            if (this.isIOSToGrowthByUlik(data)) {
                if (this.isBox()) {
                    window.location.href = action.scheme;
                    setTimeout(function () {
                        window.location.href = action.ulink;
                    }, 0);
                }
                else {
                    window.location.href = action.ulink;
                }
            }
            else {
                if (this.isWeChat() && action.type !== 'normalInvoke') {
                    window.location.href = 'http://a.app.qq.com/o/simple.jsp?pkgname='
                        + (action.pkgName || 'com.baidu.haokan')
                        + '&android_scheme='
                        + encodeURIComponent(action.scheme);
                }
                else {
                    var ifr = document.createElement('iframe');
                    ifr.src = action.scheme || action.command;
                    ifr.style.display = 'none';
                    document.body.appendChild(ifr);
                    window.setTimeout(function () {
                        document.body.removeChild(ifr);
                        if (action.type !== 'normalInvoke') {
                            if (action.failCallback && (typeof action.failCallback === 'function')) {
                                action.failCallback();
                            } else {
                                self.jump(data.downloadInfo, {
                                    // TODO 将 isOpenBdAppSearch 从downloadInfo中移到options中
                                    isOpenBdAppSearch: !!(data.downloadInfo && data.downloadInfo.isOpenBdAppSearch)
                                }, {
                                    goToAppStoreLogCb: action.goToAppStoreLogCb
                                });
                            }
                        }
                    }, 300);
                }
            }
        },

        /**
         * ios下是否使用ulink调起方式
         */
        isIOSToGrowthByUlik: function (data) {
            // ios调起方式：schema，ulink
            var iosGrowthType = data.iosGrowthType || '';

            if (/MQQBrowser/.test(window.navigator.userAgent)) {
                return false;
            }

            // 强制配置
            if (iosGrowthType === 'schema') {
                return false;
            }

            // ios9以上使用ulink方式
            if (this.isIos9()) {
                return true;
            }
        },

        /**
         * 手百APP吊起。最核心的吊起机制。
         *
         * @private
         * @param {Object} data 吊起相关参数
         * @param {Object} data.action 吊起核心参数
         * @param {string} data.action.type 值为:normalInvoke,表示不会引导下载;值为:invoke,表示正常吊起,吊起失败导下载。
         * @param {string} data.action.app 必须。值为:BdBox
         * @param {Object} data.pagepd 吊起渠道相关。统计需要
         * @param {Object} data.action.extra 额外配置
         * @param {Object} data.action.extra.failUrl data.action.type==='normalInvoke'时必须,传入手百组件的failUrl.
         * @param {Function} data.action.extra.failCallback data.action.type==='normalInvoke'时必须,传入手百组件的failCallback.
         *
         */
        bdInvoke: function (data) {
            var action = data.action;
            var pagepd = data.pagepd;
            var openBdBox = null;
            var opts = {
                showTip: false
            };

            if (action.app !== 'BdBox') {
                console.warn('Action.app is required for bdInvoke');
                return;
            }

            if (action.searchQuery) {
                opts.backQuery = action.searchQuery;
            }

            // 只进行手百的吊起,不进行下载
            if (action.type === 'normalInvoke') {
                if (!this.isObject(action.extra)) {
                    console.warn('Extra info is required for invokeNormal');
                    return;
                }
                var failUrl = action.extra.failUrl;
                var failCallback = action.extra.failCallback;
                opts.failUrl = failUrl;
                opts.failCallback = function () {
                    console.log('invoke app failed');
                    failCallback && failCallback();
                };
            }

            if (this.isIos()) {
                opts.iosScheme = action.scheme;
            }
            else {
                opts.androidCommand = action.scheme;
            }
            pagepd && pagepd.channel && (opts.channel = pagepd.channel);
            pagepd && pagepd.from && (opts.from = pagepd.from);

            var openbox = window.OpenBox;
            if (openbox) {
                openBdBox = openbox(opts);
                openBdBox.open();
            }
        },

        /**
         * 手百内调起视频频道
         */
        invokeChannel: function () {
            var highVersion91 = this.boxVerCompare('9.1');
            if (highVersion91 === 1) {
                this.newInvoke('v11/appTab/select', {
                    item: 'video',
                    upgrade: 0
                });
            }
            else if (highVersion91 === 0) {
                this.newInvoke('v1/easybrowse/open', {
                    append: 1,
                    newbrowser: 1,
                    upgrade: 1,
                    url: encodeURIComponent('https://sv.baidu.com')
                });
            }
        },

        /**
         * 安卓下获取应用商店地址
         *
         * @private
         * @param {Object} downloadInfo
         * @param {string} downloadInfo.pkgName 应用商店包地址, eg. com.baidu.haokan
         * @param {Function} [downloadInfo.goToAppStoreLogCb] 日志回调
         * @param {Array}  [downloadInfo.brandList] 数组,需要使用应用商店调起的品牌名称, 为空表示全部, 目前支持 oppo, huawei, xiaomi, samsung, vivo
         * @param {Object} [data] 调起数据
         */

        goToAppStore: function (downloadInfo, data) {
            var self = this;
            function gotoDownload(info) {
                window.location.href = info.pkgurl || self.errorUrl;
            }
            function invoke(scheme) {
                var ifr = document.createElement('iframe');
                ifr.src = scheme;
                ifr.style.display = 'none';
                document.body.appendChild(ifr);
                window.setTimeout(function () {
                    document.body.removeChild(ifr);
                }, 300);
            }
            if (!downloadInfo.pkgName || (downloadInfo.brandList && !downloadInfo.brandList.length)) {
                gotoDownload(downloadInfo);
            }
            var ua = navigator.userAgent;
            var scheme = '';
            var brand = '';
            var downloadFirst = false;

            var brandList = downloadInfo.brandList || ['xiaomi', 'samsung', 'huawei', 'oppo', 'vivo'];
            var supportedBrand = {
                xiaomi: {
                    reg: /\(.*Android.*(MI|Mi|Redmi|HM NOTE| 201\d{4} Build).*\)|Android.*XiaoMi/,
                    scheme: 'mimarket://details?id=${0}&back=true'
                },
                samsung: {
                    reg: /\(.*Android.*(SAMSUNG|SM-|GT-).*\)/,
                    scheme: 'samsungapps://ProductDetail/${0}'
                },
                huawei: {
                    reg: /\(.*Android.*(HUAWEI|HONOR|HW-|H60-).*\)|^HONOR|^HUAWEI/i,
                    scheme: 'appmarket://details?id=${0}'
                },
                oppo: {
                    reg: /Android.*(OPPO|A31.? Build|R\d+(Plus)? Build)|Android.*OppoBrowser|^OPPO/,
                    scheme: 'oppomarket://details?packagename=${0}',
                    downloadFirst: true
                },
                vivo: {
                    reg: /\(.*Android.*(vivo|VIVO).*\)/,
                    scheme: 'vivomarket://details?id=${0}'
                }
            };

            brandList.forEach(function (brandName) {
                if (supportedBrand.hasOwnProperty(brandName)) {
                    var setting = supportedBrand[brandName];
                    if (setting.reg.test(ua)) {
                        brand = brandName;
                        scheme = setting.scheme.replace('${0}', downloadInfo.pkgName);
                        downloadFirst = setting.downloadFirst || false;
                        return false;
                    }
                }
            });

            /** 不调起应用商店的浏览器 **/
            var forbidBrowserList = [
                /liebaofast/ig
            ];

            forbidBrowserList.forEach(function (reg) {
                if (reg.test(ua)) {
                    scheme = '';
                    brand = '';
                    return false;
                }
            });

            data && data.goToAppStoreLogCb && data.goToAppStoreLogCb({
                appName: downloadInfo.pkgName,
                brandName: brand || '',
                hitStore: brand === '' ? '0' : '1'
            });

            if (!scheme) {
                gotoDownload(downloadInfo);
                return;
            }

            if (!downloadFirst) {
                invoke(scheme);
                setTimeout(function () {
                    gotoDownload(downloadInfo);
                }, 300);
            }
            else {
                gotoDownload(downloadInfo);
                setTimeout(function () {
                    invoke(scheme);
                }, 300);
            }
        },

        /**
         * 是否安装手百手机助手插件
         *
         * @param {Function} cb 判断在手百内,并且安装手助插件的回调
         * @param {Object} [data] 调起数据
         * @param {Object} [data.injectBoxJSOption] 注入选项
         * @param {Object} [data.injectBoxJSOption.boxjs] 注入的boxjs
         * @param {Object} [data.injectBoxJSOption.box] 注入的box
         */
        isBdAppSearchInstalled: function (cb, data) {
            var boxJS = getBoxJS(data && data.injectBoxJSOption);
            if (!boxJS || !boxJS.isBox() || boxJS.versionCompare(boxJS.getVersion(), '8.0') < 0) {
                cb(false);
                return;
            }

            window.fecommonGetInstalledPluginVersionCallback = function (back) {
                if (back !== -1 && back !== '-1') {
                    cb(true);
                }
                else {
                    cb(false);
                }
            };

            boxJS.invokeAndroid('Bdbox_android_plugin',
                'getInstalledPluginVersion', [
                    JSON.stringify({
                        /* eslint-disable fecs-camelcase */
                        package_name: 'com.baidu.appsearch'
                        /* eslint-enable fecs-camelcase */
                    }), 'window.fecommonGetInstalledPluginVersionCallback']);
        },

        /**
         * 手机助手打开app
         *
         * @param {Function} data 调起数据
         * @param {string} data.pkgName 应用包名
         * @param {Function} [data.injectBoxJSOption] 注入的boxjs
         */
        openBdAppSearch: function (data) {
            var boxJS = getBoxJS(data && data.injectBoxJSOption);
            if (!boxJS || !boxJS.isBox() || !data.pkgName) {
                return;
            }
            var opt = {
                /* eslint-disable fecs-camelcase */
                package_name: 'com.baidu.appsearch',
                method_name: 'plugin_appsearch_invoker',
                by_user: 1,
                need_baidu_params: 0,
                /* eslint-enable fecs-camelcase */
                /* eslint-disable max-len */
                params: '{\"action\":\"com.baidu.searchbox.plugin.action.THIRD_INVOKE\",\"S.package_name\":\"com.baidu.appsearch\",\"S.method_name\":\"plugin_appsearch_invoker\",\"S.website_url\":\"\",\"S.by_user\":1,\"S.params\":\"{\\\"intent\\\":\\\"#Intent;action=com.baidu.appsearch.extinvoker.LITELAUNCH;S.backop=0;S.pkg=' + data.pkgName + ';S.quitop=1;S.func=10;B.download_immediatly=true;i.download_mode=1;end\\\"}\",\"S.need_baidu_params\":0}'
                /* eslint-enable max-len */
            };

            boxJS.invokeAndroid(
                'Bdbox_android_plugin',
                'invokePlugin',
                [JSON.stringify(opt), 'console.log']);
        },

        /**
         * 总处理函数。暴露给外层使用。
         *
         * @public
         * @param {Object} data 吊起的相关参数
         * @param {string} data.onceEveryDay 一天是否只吊起一次。如果需求一天只吊起一次,则为该字段赋值,值为localstorage的key.
         */
        go: function (data) {

            if (!this.isObject(data) || !this.isObject(data.action)) {
                console.warn('Object is required for invokeApp.go');
                return;
            }

            if (data.onceEveryDay) {
                var needInvoke = this.onceEveryDay(data.onceEveryDay);
                if (!needInvoke) {
                    return;
                }
            }

            // 有每日最大调起次数的限制
            if (data.invokeCntPerDay) {
                var needInvoke1 = this.invokeCntPerDay(data.invokeCntPerDay);
                if (!needInvoke1) {
                    return;
                }
            }

            data.logFn && data.logFn();

            // 组件被放入iframe内
            if (window.self !== window.top) {
                this.invokeInIframe(data);
            }
            else {
                // 将shema信息放入剪切板中
                this.schemaPutIntoClipboard(data);

                if (data.action.id && data.action.app === 'BdBox') {
                    // action传入id,手百由前端自己拼接吊起相关链接
                    this.selfHandle(data);
                }
                else if (data.action.id && data.action.isSelfHandle) {
                    this.selfHandle(data);
                } else {
                    // 后端传的调起scheme
                    this.autoHandle(data);
                }
            }
        },

         /**
         * 将shema信息放入剪切板中
         *
         * @public
         * @param {object} data
         */
        schemaPutIntoClipboard: function(data) {
            var self = this;

            /**
             * scheme调起主feed + 剪切板(插入视频)
             */
            var actionApp = (data.action && data.action.app) || '';
            actionApp = actionApp.toLowerCase();
            if (!(actionApp == 'haokan')) {
                return;
            }
            /**
             * 需要配置启用复制赞帖公共的参数
             */
            if (!(data
                && data.clipboard
                && data.clipboard.clipboardText
                && data.clipboard.clipboardDom
                && data.clipboard.clipboardDomSelector)
            ) {
                return;
            }

            var clipboardInfo = data.clipboard;
            // 点击复制的具体对象
            var clipboardDom = $(clipboardInfo.clipboardDom);
            // 绑定具有复制功能的选择器(可能对应多个对象)，传入具体节点不work，改为传入选择器
            var clipboardSelector = clipboardInfo.clipboardDomSelector;
            var hasInitedClipboardSelectorList = self.opts.hasInitedClipboardSelectorList;
            var clipboardObj = self.getClipboardObjBySelector(clipboardSelector, hasInitedClipboardSelectorList);

            if (!(clipboardObj && clipboardObj.instanceObj)) {         
                var instanceObj = new window.ClipboardJS(clipboardInfo.clipboardDomSelector);
                
                instanceObj.on('success', function (e) {
                    e.clearSelection();
                    console.log('copy success');
                });

                instanceObj.on('error', function (e) {
                    console.log('copy error');
                });

                clipboardObj = {
                    selector: clipboardSelector,
                    instanceObj: instanceObj
                };
                self.opts.hasInitedClipboardSelectorList.push(clipboardObj);
            }
            // 写入剪切板
            var clipboardText = '#' + clipboardInfo.clipboardText + '#';
            clipboardDom.data('clipboard-text', clipboardText);
        },

         /**
         * 通过选择器查找，对应已经初始化的复制实例
         *
         * @public
         * @param {string} clipboardSelector 复制功能对应的对象选择器
         * @param {Array} hasInitedClipboardSelectorList 选择器和对应的实例的数组
         * @return 对应选择器已经初始化过的对象
         */
        getClipboardObjBySelector: function (clipboardSelector, hasInitedClipboardSelectorList) {
            var result = hasInitedClipboardSelectorList.filter(function (obj, index) {
                return obj.selector == clipboardSelector;
            });

            if (result.length > 0) {
                return result[0];
            } else {
                return null;
            }
        },

        /**
         * 在iframe下吊起。通过postMessage与外层通信。主要用于wise_feed视频落地页
         *
         * @public
         * @param {Object} data 吊起的相关参数
         * @param {Object} data.mt 与wise 主feed通信的模块,采用注入形式
         */
        invokeInIframe: function (data) {

            var downloadInfo = data.downloadInfo;
            var action = data.action;
            var extra = data.pagepd;
            var mt = data.mt;
            var locid = action.id;
            var source;
            var self = this;

            var ulink = '';
            var scheme = '';

            if (!mt) {
                return;
            }

            // 拼接Scheme,ulink等
            if (action.id && action.app === 'BdBox') {
                if (action.app === 'BdBox') {
                    var backflow = '1';
                    source = {
                        backflow: backflow
                    };
                    extra && extra.pagepd && (source.pagepd = extra.pagepd) && (source.pagepdSid = extra.pagepdSid);
                    scheme = this.isIos()
                        ? this.getBdIOSV80Scheme(action.id, source)
                        : this.getBdAndrCmd(action.id, source);

                    if (/^\d+$/.test(locid)) {
                        scheme = this.isIos()
                            ? this.getBdIOSBackChannelScheme(locid, source)
                            : this.getBdAndrBackChannelScheme(locid, source);
                    }
                    else {
                        scheme = this.isIos()
                            ? this.getBdIOSV80Scheme(locid, source)
                            : this.getBdAndrCmd(locid, source);
                    }

                    console.log(scheme);

                }
                else {
                    source = {
                        tab: 'guide'
                    };
                    extra && extra.pagepd && (source.tag = extra.pagepd) && (source.source = extra.source);
                    ulink = this.getHkUrl(action.id, source, action.failUrl);
                    scheme = this.getHkScheme(action.id, source);
                }
            }
            else {
                ulink = action.ulink;
                scheme = action.scheme;
            }


            var postMessage = {
                event: 'videoInvokeApp',
                app: action.app || 'BdBox',
                action: {}
            };

            if (action.app === 'BdBox') {
                // overwrite,是否强制使用scheme
                var overwrite = '0';

                if (invokeApp.isAndroid()) {
                    postMessage.action = {
                        showTip: false,
                        androidCommand: JSON.stringify(scheme),
                        overwrite: overwrite
                    };

                    if (action.type === 'normalInvoke') {
                        mt.addRequestHandle('videoInvokeFail', function () {
                            console.log('videoInvokeFail');
                            action.extra.failCallback && action.extra.failCallback();
                        });
                        postMessage.action.failCallback = '1';
                    }

                }
                else {
                    postMessage.action = {
                        showTip: false,
                        iosScheme: scheme,
                        overwrite: overwrite
                    };

                    if (action.type === 'normalInvoke') {
                        postMessage.action.failUrl = action.extra.failUrl;
                    }
                }

                if (extra.channel || extra.from) {
                    postMessage.action.channel = extra.channel;
                    postMessage.action.from = extra.from;
                }

            }
            else {
                postMessage.action = {
                    HkUlink: ulink,
                    HkScheme: scheme,
                    HkDownloadurl: downloadInfo
                };
            }

            mt.sendMessage(window.parent, postMessage, false);

            (function () {
                var action = data.action;
                var appName = action.app;
                if (appName !== 'BdBox'
                    && action.type !== 'normalInvoke'
                    && self.isObject(data.downloadInfo)
                    && self.isAndroid()
                    && !self.isWeChat()
                    && !self.isMobileQQ()
                    && data.downloadInfo.pkgName
                ) {
                    console.log(1);
                    var ua = navigator.userAgent;
                    var brand = '';
                    var downloadInfo = data.downloadInfo;

                    var brandList = downloadInfo.brandList || ['xiaomi', 'samsung', 'huawei', 'oppo', 'vivo'];
                    var supportedBrand = {
                        xiaomi: {
                            reg: /\(.*Android.*(MI|Mi|Redmi|HM NOTE| 201\d{4} Build).*\)|Android.*XiaoMi/,
                            scheme: 'mimarket://details?id=${0}&back=true'
                        },
                        samsung: {
                            reg: /\(.*Android.*(SAMSUNG|SM-|GT-).*\)/,
                            scheme: 'samsungapps://ProductDetail/${0}'
                        },
                        huawei: {
                            reg: /\(.*Android.*(HUAWEI|HONOR|HW-|H60-).*\)|^HONOR|^HUAWEI/i,
                            scheme: 'appmarket://details?id=${0}'
                        },
                        oppo: {
                            reg: /Android.*(OPPO|A31.? Build|R\d+(Plus)? Build)|Android.*OppoBrowser|^OPPO/,
                            scheme: 'oppomarket://details?packagename=${0}',
                            downloadFirst: true
                        },
                        vivo: {
                            reg: /\(.*Android.*(vivo|VIVO).*\)/,
                            scheme: 'vivomarket://details?id=${0}'
                        }
                    };

                    brandList.forEach(function (brandName) {
                        if (supportedBrand.hasOwnProperty(brandName)) {
                            var setting = supportedBrand[brandName];
                            if (setting.reg.test(ua)) {
                                brand = brandName;
                                return false;
                            }
                        }
                    });

                    /** 不调起应用商店的浏览器 **/
                    var forbidBrowserList = [
                        /liebaofast/ig
                    ];

                    forbidBrowserList.forEach(function (reg) {
                        if (reg.test(ua)) {
                            brand = '';
                            return false;
                        }
                    });

                    data && data.action && data.action.goToAppStoreLogCb && data.action.goToAppStoreLogCb({
                        appName: downloadInfo.pkgName,
                        brandName: brand || '',
                        hitStore: brand === '' ? '0' : '1'
                    });
                }
            })();
        }
    };

    return invokeApp;
});
;
    /**
 * @file appAdDownload
 * Created by wuhan01 on 2018/2/9.
 */

define('rmbGrowth/invoke/appAdDownload', function () {
    var download = {};
    var logUrl = 'https://ls.baidu.com/s.gif';

    var appAdDwonload = {
        init: function (opts) {
            var self = this;
            this.downloadInfo = opts;

            // 进度
            var random = ~~(Math.random() * 20) + 40;

            window.reCallback = function (action, data) {
                var state = JSON.parse(data).data;
                var process = parseInt(state.process);
                if (process <= random) {
                    $('#process').css('width', random + '%');
                    $('#percent').text(random + '%');
                }
                else if (process < 100) {
                    $('#process').css('width', process + '%');
                    $('#percent').text(process + '%');
                }
                else if (process === 100) {
                    $('#process').css('width', '100%');
                    $('#percent').text('100%');
                    var t = setTimeout(function () {
                        clearTimeout(t);
                        $('.shade').hide();
                        $('html').removeClass('noscroll');
                        var unregisterScheme = 'baiduboxapp://v5/datachannel/unregister?action=com.baidu.channel.aladdin.downloadapk&page=haokandownload';
                        window.location.href = unregisterScheme;
                        self.installApk(state.uri, 'com.baidu.haokan');
                    }, 1000);
                }
            };

            var self = this;

            // 注册通道
            if (window.BoxJS.isBox) {
                // 检测callback
                window.__checkcallback__ = function (data) { };

                // 下载callback
                window.__downloadCallback__ = function (data) { };

                // 安装callback
                window.__installCallback__ = function (data) { };

                var registerScheme = 'baiduboxapp://v5/datachannel/register?action=com.baidu.channel.aladdin.downloadapk&page=haokandownload&jscallback=reCallback';
                window.location.href = registerScheme;

                // 开始
                if (this.downloadInfo && this.downloadInfo.pkgurl) {
                    setTimeout(function () {
                        self.go();
                    }, 0);

                }
            }
        },
        go: function () {
            var params = {
                type: 'startdownload',
                business: 'feed_video',
                url: encodeURI(this.downloadInfo.pkgurl),
                uri: '',
                file_id: '1021079n',
                callback: '__downloadCallback__'
            };
            this.dlscheme = 'baiduboxapp://v14/download/app?upgrade=1&params=' + encodeURIComponent(JSON.stringify(params));
            this.check();
        },
        check: function () {
            var self = this;
            var status = window.Box.android.invokeApp('bd_searchbox_interface', 'getNativeAppStatus',
                [encodeURIComponent('com.baidu.haokan'), '__checkcallback__']);
            if (!status.error) {
                if (JSON.parse(status.result).hasApp) {
                    download.installed = true;
                    this.sendDonwloadLog();
                    self.openApk();
                }
                else {
                    download.installed = false;
                    // 下载
                    self.donwload();
                }
            }
            else {
                download.installed = false;
                // 下载
                self.donwload();
            }
        },
        openApk: function () {
            /*invokeApp.go({
                action: {
                    id: locid || self.locid,
                    type: 'normalInvoke',
                    app: 'HaoKan'
                },
                pagepd: self.pagepd,
                downloadInfo: downloadInfo
            });*/
        },
        donwload: function () {
            download.type = 'shoubai';
            var self = this;
            if (!self.downloading) {
                self.downloading = true;
                $('#process').css('width', '0%');
                $('.shade').show();
                $('html').addClass('noscroll');
                window.location.href = self.dlscheme;
            }
        },
        installApk: function (uri, apk) {
            download.success = true;
            this.sendDonwloadLog();
            var installScheme = 'baiduboxapp://v14/download/app?params=';
            var params = {
                type: 'installapk',
                business: 'feed_video',
                uri: uri || '',
                packageName: apk,
                callback: '__installCallback__'
            };
            this.downloading = false;
            window.location.href = installScheme + encodeURIComponent(JSON.stringify(params));
        },
        sendDonwloadLog: function () {
            if (window.__vrandom) {
                var id = '_tm' + new Date().getTime();
                var req = window[id] = new Image();
                req.onload = req.onerror = req.onabort = function () {
                    window[id] = null;
                };

                var src = logUrl + (location.search
                        ? encodeURI(location.search) + '&fm=' + 'download'
                        : '?fm=' + 'download') + '&pageChannel=haokan' + '&show_id=' + window.__vrandom;

                if (Object.keys(download).length > 0) {
                    src += '&download=' + encodeURIComponent(JSON.stringify(download));
                }
                req.src = src;
            }
        }
    };

    return appAdDwonload;
});

;
    /* globals defineBranchModule */
    defineBranchModule('invoke');
    /* globals defineLeafModules */
    defineLeafModules(['invokeApp','appAdDownload']);
})();
;
    /**
 * @file test
 * @author zhangjingfeng
 */

!(function () {
    /**
 * @file feed视频落地页，新的日志用此打点.老的thunder仅供相关推荐点击使用
 * @author zhangjingfeng
 * @email zhangjingfeng@baidu.com
 * @date 2017/03/19
 */
define('rmbGrowth/log/thunder', function () {
    var global = window;
    var Conf = global.Conf || {};
    var cuid;

    /**
     * thunder日志类
     *
     * @class
     * @param {Object} opt 日志参数
     * @constructor
     */
    function Thunder(opt) {
        var self = this;
        self.opt = opt || {};
        self.baseParams = self.opt.baseParams || {};
        if (window.Box && window.Box.os) {
            var Box = window.Box;
            window.rmbvideogetcuid = function (ret) {
                cuid = ret;
            };
            cuid = Box.os.ios
                ? Box.ios.invokeApp('utils',
                    {
                        action: 'getcuid',
                        minver: '6.1.0.0'
                    }, 'window.rmbvideogetcuid'
                ) : Box.android.invokeApp('Bdbox_android_utils', 'getcuid', [])
            || '';
        }
        self.config(opt, true);
        if (opt.autoBind) {
            self.bind();
        }
    }

    function queryToJSON(url) {
        var locse = url.split('?');
        var search = locse[1] ? locse[1] : locse[0];
        var pairs = search.split('&');
        var result = {};

        pairs.forEach(function (pair) {
            pair = pair.split('=');
            if (pair[0].length > 0) {
                var resultPair = '';
                try {
                    resultPair = decodeURIComponent(pair[1]) || '';
                }
                catch (e) {}
                result[pair[0]] = resultPair;
            }
        });

        return result;
    }

    var URL = queryToJSON(location.search);

    var logId = (+new Date()).toString(36) + Math.random().toString(36).substr(2, 3);

    Thunder.prototype = {
        config: function (opt) {
            var self = this;
            for (var k in opt) {
                if (opt.hasOwnProperty(k)) {
                    self.opt[k] = opt[k];
                }
            }
            // 日志打印基础URL
            self.baseURL = self.opt.baseURL || '//hpd.baidu.com/v.gif';
            // 是否需要增加DOM钩子由基础库协助打印日志
            self.domHook = self.opt.domHook;
            // 点击日志，是否需要阻止跳转
            self.skipPrevent = !!self.opt.skipPrevent;
            // 如需解析DOM上的钩子参数，使用此正则表达式解析
            self.logRegx = self.opt.logRegx || '(.*?):(.*?);';
            // 需要混入日志打印的所有基础字段
            self.baseParams = simpleMerge(self.baseParams, opt.baseParams);
        },
        send: function (pobj, callback, url) {
            pobj.sid = Conf.psSidList && Conf.psSidList.length && Conf.psSidList.join('_') || '';
            pobj.cuid =  cuid || '';
            pobj.ssid =  '';
            pobj.cfrom = URL.cfrom || '';
            pobj.cua = URL.ua || '';
            pobj.cut = URL.ut || '';
            pobj.logid = logId;

            var self = this;
            self.__sendPreHook && self.__sendPreHook(pobj);
            var id = 'l' + Date.now();
            var req = window[id] = new Image();
            var params = '';
            var timer = null;
            url = url || self.baseURL;
            req.onload = req.onerror = req.onabort = function () {
                window[id] = null;
                if (timer) {
                    clearTimeout(timer);
                    timer = null;
                    callback && callback();
                    self.__sendAfrHook && self.__sendAfrHook(pobj, false);
                }
            };

            pobj = pobj || {};

            pobj.r = id;
            var baseParams = self.baseParams;
            pobj = simpleMerge(simpleMerge({}, baseParams), pobj);
            // 拼接字符串
            for (var i in pobj) {
                if (pobj.hasOwnProperty(i)) {
                    params += '&' + i + '=' + encodeURIComponent(pobj[i]);
                }
            }
            req.src = url + '?' + params.slice(1);
            // 防止回调被hold住
            if (typeof callback === 'function') {
                timer = setTimeout(function () {
                    timer = null;
                    callback();
                }, 500);
            }
            self.__sendAfrHook && self.__sendAfrHook(pobj, true);
        },
        bindLogHook: function (mainDom) {
            var self = this;
            mainDom
                .on(
                    'click',
                    self.domHook,
                    self.hookClick.bind(self)
                );
        },
        hookClick: function (dom, e) {
            var self = this;
            var dom = $(e.target).parents(self.domHook)[0];
            var dataLogStr = dom.getAttribute(self.domHook);
            var targetHref = dom.getAttribute('href');
            var callback = null;
            var logObj = {};
            var regx = new RegExp(self.logRegx);
            var output = null;
            while ((output = regx.exec(dataLogStr))) {
                logObj[output[1]] = output[2];
            }
            if (dom.tagName.toLowerCase() === 'a'
                && targetHref
            ) {
                e.preventDefault();
                callback = function () {
                    global.location.href = targetHref;
                };
            }
            self.send(self.baseURL, logObj, callback);
        }
    };
    function simpleMerge(obj1, obj2) {
        if (!obj2 || !obj1) {
            return obj1;
        }
        for (var i in obj2) {
            obj1[i] = obj2[i];
        }
        return obj1;
    }

    var thunderInstance = null;

    return {
        create: function (opt, cb) {
            return new Thunder(opt);
        },
        get: function (opt) {
            return thunderInstance || (thunderInstance = this.create(opt));
        }
    };
});
;
    /**
 * @file common 落地页中间的推广模板
 * @author pankeyu
 * Created by pankeyu on 17/5/19.
 */

/*通用推荐推广模板*/
define('rmbGrowth/log/appAdLog', [
    'rmbGrowth/log/thunder',
    'rmbGrowth/ext/exhibitionManager'
], function (thunderLog, ExhibitionManager) {
    /**
     * Created by pankeyu on 17/4/30.
     */

    var isObject = function (obj) {
        return Object.prototype.toString.call(obj) === '[object Object]';
    };

    var addAdLog = function (type, logInfo) {
        this.logLock = 0;
        this.tplType = type;

        /*初始化日志参数*/
        if (isObject(logInfo)) {
            this.logInfo = logInfo || {};
            this.logTid = this.logInfo.tid;
            delete this.logInfo.tid;
            if (this.logInfo.logExtra) {
                this.logExtra = this.logInfo.logExtra;
                if (this.logInfo.slideShowApp) {
                    this.logExtra.app = this.logInfo.slideShowApp;
                    delete this.logInfo.slideShowApp;
                }
                delete this.logInfo.logExtra;
            }
        }
    };


    addAdLog.prototype.init = function (logType, data) {

        if (this.tplType === 'Carousel') {
            if (logType === 'show') {
                if (data instanceof Array) {
                    this.carouselListData = data;
                    this.carouselListCache = {};
                    for (var i = 0; i < this.carouselListData.length; i++) {
                        var data = this.carouselListData[i];
                        var key = data.locid;

                        this.carouselListCache[key] = {
                            status: 'not_showed',
                            locid: data.locid,
                            nid: data.nid,
                            index: i + 1 + '',
                            extra: '',
                            /* eslint-disable fecs-camelcase */
                            source_from: data.source_from
                            /* eslint-enable fecs-camelcase */
                        };
                    }
                }
                // 轮播图展现日志。init的时候,需要先打一条首次轮播时候的展现日志;
                this.detectShow(0);
            }
        }


        else if (this.tplType === 'commonTpl') {
            if (logType === 'show') {
                this._commonTplHasShowed = false;
                var self = this;

                var commonTplOffsetTop = -100;
                if (data.$container.find('.appAdd-commonTpl').length) {
                    commonTplOffsetTop = data.$container.find('.appAdd-commonTpl').offset().top;
                }

                var windowHeight = parseFloat(window.innerHeight);
                var carouselHeight = $('.rmb-carsousel-position-top').length
                    ? $('.rmb-carsousel-position-top').height() : '0';
                var videoHeight = parseFloat(carouselHeight) + parseFloat($('video').height());
                var inView = (commonTplOffsetTop < windowHeight)
                    && (commonTplOffsetTop - window.scrollY) > videoHeight;
                if (inView && !this._commonTplHasShowed) {/*通用模板初始化时已展现*/
                    this._commonTplHasShowed = true;
                    this.sendLog('show', this.tplType, data);
                } else { /*通用模板初始化时未展现,监听滚动事件*/

                    document.addEventListener('scroll', function () {

                        if (this._commonTplHasShowed) {
                            return;
                        }

                        inView = (commonTplOffsetTop - window.scrollY) > videoHeight
                            && (commonTplOffsetTop - window.scrollY) < windowHeight;
                        if (inView) {
                            self.sendLog('show', self.tplType, data);
                            this._commonTplHasShowed = true;
                        }
                    });
                }
            }
        }

        /*相关推荐模板初始化*/
        else if (this.tplType === 'recRelateTpl') {
            if (logType === 'show') {
                var tplList = [].slice.call($('.appad-relate-rectpl'));
                this.$recRelateTplList = tplList;
                this.recRelateTplCache = this.recRelateTplCache || {};
                var self = this;
                this.$recRelateTplList.forEach(function (item, index) {
                    var key = item.getAttribute('data-locid');
                    if (!self.recRelateTplCache[key]) {
                        self.recRelateTplCache[key] = {
                            status: 'not_showed',
                            locid: key,
                            index: item.getAttribute('data-index'),
                            extra: '',
                            top: parseFloat($(item).offset().top)
                        };
                    }
                });
                var carouselHeight = $('.rmb-carsousel-position-top').length
                    ? $('.rmb-carsousel-position-top').height() : '0';
                this.videoHeight = parseFloat(carouselHeight) + parseFloat($('video').height());
                this.windowHeight = parseFloat(window.innerHeight);
                this.recRelateTplLogArr = [];
                this.detectShow();
                this.timer = null;
                this.logShowIdx = 0;
                document.addEventListener('scroll', function () {
                    self.detectShow();
                });
            }
        }
    };


    addAdLog.prototype.detectShow = function (index) {

        /*轮播判断展现*/
        if (this.tplType === 'Carousel') {
            var key = this.carouselListData[index].locid;
            if (this.carouselListCache[key].status === 'not_showed') {
                this.carouselListCache[key].status = 'showed';
                this.sendLog('show', this.tplType, this.carouselListCache[key]);
                this.carouselListCache[key].status = 'logged';
            }
        }

        /*相关推荐模板判断展现*/
        else if (this.tplType === 'recRelateTpl') {

            var self = this;

            this.$recRelateTplList.forEach(function (item) {
                var key = item.getAttribute('data-locid');
                var itemTop = self.recRelateTplCache[key].top;
                var inView = (itemTop - window.scrollY) > self.videoHeight
                    && (itemTop - window.scrollY) < self.windowHeight;
                if (self.recRelateTplCache[key].status === 'not_showed' && inView) {
                    self.recRelateTplCache[key].status = 'showed';
                    self.recRelateTplLogArr.push(self.recRelateTplCache[key]);
                }
            });

            self.timer = setTimeout(log, 300);


            function log() {

                var logArr = self.recRelateTplLogArr.slice(self.logShowIdx, self.logShowIdx + 3);

                if (logArr.length === 0) {
                    self.timer = null;
                    return;
                }

                self.logShowIdx += logArr.length;
                self.sendLog('show', self.tplType, logArr, function () {
                    logArr.forEach(function (item) {
                        self.recRelateTplCache[item.locid].status = 'logged';
                    });
                });
                setTimeout(log, 300);
            }
        }

    };


    addAdLog.prototype.sendLog = function (logtype, tpltype, data, callback) {

        if (isObject(data)) {
            /*日志基本参数*/
            var rid = data.nid ? 'sv_' + data.nid : '';
            var locid = data.locid || '';
            var sourceFrom = data.source_from || '';

            var logExtra = {
                rid: rid,
                extra: data.extra || '',
                sourcetype: sourceFrom,
                locid: encodeURIComponent(locid)
            };

            data.index && (logExtra.index = data.index);

            if (this.logExtra && isObject(this.logExtra)) {
                logExtra = $.extend(logExtra, this.logExtra);
            }

        } else {
            var oldLogExtra = this.logExtra;
            var logExtra = data.slice(0).map(function (item) {
                return $.extend({}, oldLogExtra, {
                    locid: encodeURIComponent(item.locid),
                    index: item.index
                });
            });
        }


        var logObj = {
            logFrom: 'video_landing'
        };

        if (this.logInfo) {
            logObj = $.extend(logObj, this.logInfo);
        }

        var thunder = null;
        /*根据不同日志设置参数*/
        if (logtype === 'show') { /*展现日志*/

            thunder = thunderLog.create({
                baseParams: $.extend({cst: 1}, logObj)
            });


            if (isObject(logExtra)) {
                logObj.logExtra = JSON.stringify([logExtra]);
            } else {
                logObj.logExtra = JSON.stringify(logExtra);
            }


            logObj = $.extend(logObj, {tid: this.logTid.show});
            window._exhibitionManager && window._exhibitionManager.showed();
            this.sendNoLock(thunder, logObj, callback);
        }

        else if (logtype === 'click') { /*点击日志*/
            thunder = thunderLog.create({
                baseParams: $.extend({cst: 2}, logObj)
            });

            if (tpltype === 'Carousel') {
                logExtra.index = data.index;
                logExtra.close = data.close;
            }

            if (tpltype === 'recRelateTpl') {
                logExtra.notext = data.notext;
            }

            logObj.logExtra = JSON.stringify(logExtra);
            logObj = $.extend(logObj, {tid: this.logTid.clk});
            this.send(thunder, logObj, callback);
        }
    };

    addAdLog.prototype.send = function (thunder, logObj, callback) {
        /*发送日志*/
        if (this.logLock === 0) {
            this.logLock = 1;
            var self = this;
            thunder.send(logObj, function () {
                self.logLock = 0;
                callback && callback();
            }, '');
            window._exhibitionManager && window._exhibitionManager.clicked();
        }
    };

    /*不加锁的发送日志。主要为展现日志使用*/
    addAdLog.prototype.sendNoLock = function (thunder, logObj, callback) {
        thunder.send(logObj, function () {
            callback && callback();
        }, '');
    };

    return addAdLog;
});

;
    /* globals defineBranchModule */
    defineBranchModule('log');
    /* globals defineLeafModules */
    defineLeafModules(['thunder', 'appAdLog']);
})();
;

    /* globals defineExportModules */
    define('rmb-growth-mod/core', [
        'rmbGrowth/tools',
        'rmbGrowth/invoke',
        'rmbGrowth/ext',
        'rmbGrowth/log'
    ], function (tools, invoke, ext, log) {
        var rmbGrowth = {
            tools: tools,
            invoke: invoke,
            ext: ext,
            log: log
        };

        return rmbGrowth;
    });

    /**
 * @file growthManager 管理growth相关模块
 * @author zhangjingfeng
 * @version 1.0.1
 */

!(function () {
    var define = window.eslx_define || window.define;
    define('rmb-growth/manager', function (eslxDefine) {
        var modules = {
            core: 'core'
        };
        return function (moduleName, cb) {
            var depArr = [];
            if (moduleName instanceof  Array) {
                if (moduleName.filter(function (name) {
                        return !modules[name];
                    }).length) {
                    return;
                }
                depArr = moduleName.map(function (name) {
                    return 'rmb-growth-mod/' + modules[name];
                });

            }
            else {
                if (!modules[moduleName]) {
                    return;
                }
                depArr = ['rmb-growth-mod/' + modules[moduleName]];
            }

            eslxDefine(depArr, function (module) {
                    cb && cb(module);
                }
            );
        };
    });
})();
;
    
    require && require(['rmb-growth/manager'], function (manager) {
        manager(['core'], function (coreModule) {
            window.rmbGrowth = coreModule || window.rmbGrowth;
        });
    });
})();
