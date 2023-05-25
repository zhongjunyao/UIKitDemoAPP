/**
 * @file 调起位轮播组件
 * @author lixiaoqing(lixiaoqing01@baidu.com)
 * @date 2019-04-01
 */

define(function (require) {
    var bannerConfig = require('wiseindex/lib/ivk/common/bannerConfig');

    // 轮播图默认参数
    var defaultOptions = {
        // 是否自动播放
        autoplay: true,
        // 是否循环播放
        loop: true,
        // 自动播放的情况每隔指定的时间进行切换
        delay: 5000,
        // 是否显示指示器
        showIndicator: true,
        // 指示器选中颜色
        indicatorActiveColor: 'rgba(255,255,255,0.7)',
        // 指示器默认颜色
        indicatorDefaultColor: 'rgba(255,255,255,0.4)',
        // 最小滑动距离切换
        minChangeWidth: 50,
        // 循环情况下：切换图片后，指定时间内修正位置
        waitTime: 300,
        // 切换图片动画
        transition: 'all .3s cubic-bezier(.42, 0, .58, 1)',
        // 背景图适应方式
        backgroundSize: 'cover'
    };

    /**
     * 移动方向
     *
     * @const
     * @type {Object}
     */
    var DIRECTION = {
        TOP: 1,
        BOTTOM: 2,
        LEFT: 3,
        RIGHT: 4
    };

    /**
     * 轮播图组件
     * 由于使用场景的特殊性（调起位轮播）考虑攻防因此不会使用固定class，并且是异步渲染dom；
     * 因此：
     * 1. 先init生成数据并异步渲染dom
     * 2. 传入需要操作的dom对象（整体外框、轮播框、指示器框、关闭按钮）以便后续绑定事件和操作
     *
     * 回调函数：
     * 1. 点击图片回调函数
     * 2. 切换图片回调函数，并区分自动切换和人工手动切换
     * 3. 关闭按钮回调函数
     *
     * @class
     * @param {Object} options 配置项
     * @param {Array} options.list 轮播数据
     * @param {boolean=} options.autoplay 是否自动播放
     * @param {boolean=} options.loop 是否循环播放
     * @param {number=} options.delay 自动播放的情况每隔指定的时间进行切换
     * @param {boolean=} options.showIndicator 是否显示指示器
     * @param {string=} options.indicatorActiveColor 指示器选中颜色
     * @param {string=} options.indicatorDefaultColor 指示器默认颜色
     * @param {number=} options.minChangeWidth 最小滑动距离切换
     * @param {number=} options.waitTime 循环情况下：切换图片后，指定时间内修正位置
     * @param {string=} options.transition 切换图片动画
     * @param {string=} options.backgroundSize 背景图适应方式
     * @param {Function} options.onClickItem 点击轮播图触发回调函数
     * @param {Function=} options.onChange 当轮播图切换的时候触发回调函数
     */
    function Carousel(options) {
        // 整合默认参数、传入参数
        $.extend(this, defaultOptions, options);

        this.listData = [];
        // 记录原始数据的长度
        this.originNum = this.list.length;
        // 当前轮播图index
        this.activeIndex = 0;
        // 当前指示器index
        this.indicatorActiveIndex = 1;
        // 上一次活动指示器index
        this.originIndicatorActiveIndex = 0;
        // 自动轮播定时器
        this.autoPlayInterval = null;
        // 轮播器宽度
        this.width = 0;
        // 滑动保护
        this.slideProtect = false;
        // 滑动保护延时执行句柄
        this.slideProtectTimeout = null;
        // 修复循环的延时执行句柄
        this.fixLoopTimeout = null;

        // 轮播图的dom对象
        // 最外框对象
        this.slideWrapperDom;
        // 主要轮播对象
        this.slideMainDom;
        // 指示器对象
        this.slideIndicatorDom;
        // 关闭按钮
        this.closeDom;

        // 是否只有一张图片
        this.isSingle = this.list.length === 1;

        this.preProcess();
    }

    Carousel.prototype = {
        constructor: Carousel,

        /**
         * 预处理数据相关
         *
         * @private
         */
        preProcess: function () {
            // 深复制数组
            this.listData = JSON.parse(JSON.stringify(this.list));

            this.getExtOption(this.listData);

            // 如果需要循环
            if (this.loop) {
                // 当 listData 存在时并且数据大于 1 时(1张图片不轮播)；将头和尾重新拼接
                if (this.listData && this.listData.length > 1) {
                    var firstItem = Object.assign(this.listData[0]);
                    var lastItem = Object.assign(this.listData[this.originNum - 1]);

                    this.listData.push(firstItem);
                    this.listData.unshift(lastItem);
                }
                // 修改索引为默认索引再 + 1
                this.activeIndex = 1;
            }
        },

        /**
         * 处理每项的 ext 字段配置
         * 
         * @private
         */
        getExtOption: function (listData) {
            for (var i = 0; i < listData.length; i++) {
                var item = listData[i];
                var extOption = {};
                if (item.ext) {
                    try {
                        extOption = typeof item.ext === 'string'
                            ? JSON.parse(item.ext)
                            : item.ext;
                    } catch (e) {}
                }
                item.bg_color = extOption.bgColor 
                    && bannerConfig.bgColor[extOption.bgColor.toUpperCase()] 
                    || bannerConfig.bgColor.BLUE;
                item.marker_color = extOption.markerColor
                    && bannerConfig.markerColor[extOption.markerColor.toUpperCase()]
                    || bannerConfig.markerColor.RED;
                item.marker_text = extOption.markerText;
                item.titleText = extOption.titleText;
                item.isXcx = extOption.isXcx;
            }
        },

        /**
         * 传入dom 并绑定滑动和点击事件
         *
         * @public
         * @param {Object} params 传入的轮播dom对象（此处为zepto对象）
         * @param {HTMLElement} params.slideWrapperDom 整体dom对象
         * @param {HTMLElement} params.slideMainDom 轮播主体对象
         * @param {HTMLElement} params.slideIndicatorDom 指示器对象
         * @param {HTMLElement} params.closeDom 关闭按钮对象
         */
        init: function (params) {
            // 整合默认参数、传入参数
            $.extend(this, params);

            this.slideMainDom.bind('click', this.handleImgItemClick.bind(this));
            this.closeDom.bind('click', this.handleImgClose.bind(this));
            // 如果配置不显示则隐藏指定dom
            if (this.showIndicator && !this.isSingle) {
                this.slideIndicatorDom.show();
            }

            // 如果一张图就不轮播了 返回
            if (this.isSingle) {
                return;
            }

            var isNewSearchStyleV3 = window.sSession.isNewSearchStyleV3 || false;
            // 计算横滑的宽度
            if (isNewSearchStyleV3) {
                this.width = this.getSlideMainWidth() + 8;
            }
            else{
                this.width = this.getSlideMainWidth();
            }

            // 绑定事件
            this.bindEvents();

            // 自动轮播
            this.setAutoPlayInterval();

            // 指定轮播主体位置
            this.setSlideMainPositionX(-this.activeIndex * this.width);

            // 指定指示器active显示
            this.changeIndicatorActiveIndex();
        },


        /**
         * 绑定事件
         *
         * @private
         */
        bindEvents: function () {
            // 横竖屏变化监听
            // 媒体查询 js api；参考：https://developer.mozilla.org/zh-CN/docs/Web/API/Window/matchMedia, https://aotu.io/notes/2017/01/31/detect-orientation/index.html, https://caniuse.com/#search=matchmedia
            this.mediaQueryList = window.matchMedia('(orientation: portrait)');
            this.mediaQueryList.addListener(this.mediaQueryOrientationListener.bind(this));

            // 监听各种事件
            this.slideMainDom.bind('touchstart', this.touchStartHandler.bind(this));
            this.slideMainDom.bind('touchmove', this.touchMoveHandler.bind(this));
            this.slideMainDom.bind('touchend', this.touchEndHandler.bind(this));
        },

        /**
         * 触摸开始回调函数
         *
         * @private
         * @param {Object} e 事件
         */
        touchStartHandler: function (e) {
            // 滑动保护
            if (this.slideProtect) {
                return;
            }
            // 清除自动播放
            this.clearAutoPlayInterval();

            // tounches 类数组，等于1时表示此时有只有一只手指在触摸屏幕
            if (e.changedTouches.length !== 1) {
                return;
            }

            // 注意 timeout
            if (this.fixLoopTimeout) {
                clearTimeout(this.fixLoopTimeout);
                this.fixLoopTimeout = null;
            }

            // 记录开始位置
            this.startX = e.touches[0].clientX;
            this.startY = e.touches[0].clientY;
        },

        /**
         * 触摸过程中回调函数
         *
         * @private
         * @param {Object} e 事件
         * @return {boolean}
         */
        touchMoveHandler: function (e) {
            // 滑动保护
            if (this.slideProtect) {
                e.cancelable && e.preventDefault();
                e.stopPropagation();
                return true;
            }

            // tounches 类数组，等于1时表示此时有只有一只手指在触摸屏幕
            if (e.changedTouches.length !== 1) {
                return true;
            }

            // 滑动时距离浏览器左侧实时距离
            this.moveX = e.touches[0].clientX;
            this.moveY = e.touches[0].clientY;

            // 起始位置减去 实时的滑动的距离，得到手指实时偏移距离
            var disX = this.moveX - this.startX;
            var disY = this.moveY - this.startY;

            // 增加不循环时对手势的判断
            if (this.noLoopTouchJudgement(disX)) {
                return true;
            }

            // 每次滑动的时候都计算方向
            var direction = this.getDirection(disX, disY);

            // 水平滑动时阻止点击事件透传
            if (direction === DIRECTION.LEFT || direction === DIRECTION.RIGHT) {
                e.cancelable && e.preventDefault();
                e.stopPropagation();

                this.removeTransition();
                this.setSlideMainPositionX(disX - this.activeIndex * this.width);
            }

            return true;
        },

        /**
         * 触摸结束回调函数
         *
         * @private
         * @param {Object} e 事件
         * @return {boolean}
         */
        touchEndHandler: function (e) {
            // 滑动保护
            if (this.slideProtect) {
                return;
            }

            // 设置自动播放
            this.setAutoPlayInterval();
            this.addTransition();

            // tounches 类数组，等于1时表示此时有只有一只手指在触摸屏幕
            if (e.changedTouches.length !== 1) {
                return;
            }

            this.endX = e.changedTouches[0].clientX;
            this.endY = e.changedTouches[0].clientY;

            var disX = this.endX - this.startX;

            // 增加不循环时对手势的判断
            if (this.noLoopTouchJudgement(disX)) {
                return true;
            }

            // 移动的距离大于最小距离
            if (Math.abs(disX) > this.minChangeWidth) {
                // 如果有滑动距离，防止触发点击事件
                e.preventDefault();
                e.stopPropagation();

                this.originIndicatorActiveIndex = this.indicatorActiveIndex;

                // 往左移
                if (disX > 0) {
                    this.modifyActiveIndex(-1);

                    // 如果等于0 并且 是循环
                    if (this.activeIndex === 0 && this.loop) {
                        // 设置指示器的索引为总数
                        this.indicatorActiveIndex = this.originNum + this.activeIndex;
                    }
                    // 如果不等于0并且循环
                    else if (this.loop) {
                        // 设置指示器的索引为当前索引
                        this.indicatorActiveIndex = this.activeIndex;
                    }
                    // 如果不循环
                    else {
                        // 设置指示器的索引为当前索引+1
                        this.indicatorActiveIndex = this.activeIndex + 1;
                    }
                }
                // 往右移
                else {
                    this.modifyActiveIndex(1);
                    // 如果超出最大数量 并且 是循环
                    if (this.activeIndex === this.originNum + 1 && this.loop) {
                        // 设置指示器的索引
                        this.indicatorActiveIndex = this.activeIndex - this.originNum;
                    }
                    // 如果循环
                    else if (this.loop) {
                        // 设置指示器的索引
                        this.indicatorActiveIndex = this.activeIndex;
                    }
                    // 如果不循环
                    else {
                        // 设置指示器的索引为当前索引+1
                        this.indicatorActiveIndex = this.activeIndex + 1;
                    }
                }

                // 触发事件
                this.emitChange(true);
            }

            // 打开动画保护
            this.slideProtect = true;
            if (this.slideProtectTimeout) {
                clearTimeout(this.slideProtectTimeout);
                this.slideProtectTimeout = null;
            }

            var self = this;
            // 延迟动画时间清除滑动保护
            this.slideProtectTimeout = setTimeout(function () {
                self.slideProtect = false;
            }, this.waitTime);

            this.setSlideMainPositionX(-this.activeIndex * this.width);
        },

        /**
         * 设置自动播放 interval
         *
         * @private
         */
        setAutoPlayInterval: function () {
            // 如果不是自动播放或者不是循环
            if (!this.autoplay || !this.loop) {
                return;
            }

            // 在设置前要清空
            this.clearAutoPlayInterval();

            var self = this;
            // 设置轮询器
            this.autoPlayInterval = setInterval(function () {
                self.modifyActiveIndex(1);
                self.originIndicatorActiveIndex = self.indicatorActiveIndex;

                // 如果超出最大数量
                if (self.activeIndex === self.originNum + 1) {
                    // 设置指示器的索引
                    self.indicatorActiveIndex = self.activeIndex - self.originNum;
                }
                else {
                    // 设置指示器的索引
                    self.indicatorActiveIndex = self.activeIndex;
                }

                // 选择皮肤时会隐藏整个页面，导致获取宽度为 0，这里尝试获取实际宽度
                if (!self.width) {
                    self.width = self.getSlideMainWidth();
                }

                // 开启动效
                self.addTransition();

                // 设置 X
                self.setSlideMainPositionX(-self.activeIndex * self.width);

                // 触发事件
                self.emitChange();
            }, this.delay);
        },

        /**
         * 清除自动播放 interval
         *
         * @private
         */
        clearAutoPlayInterval: function () {
            if (this.autoPlayInterval) {
                clearInterval(this.autoPlayInterval);
                this.autoPlayInterval = null;
            }
        },

        /**
         * 暂停自动播放
         *
         * @private
         * @param {boolean} isAutoPlay 是否暂停
         */
        freezeAutoPlay(isAutoPlay) {
            if (isAutoPlay) {
                !this.autoPlayInterval && this.setAutoPlayInterval();
            } else {
                this.clearAutoPlayInterval();
            }
        },

        /**
         * 设置轮播的滚动位置
         *
         * @private
         * @param {number} slideWidth 滚动的宽度
         */
        setSlideMainPositionX: function (slideWidth) {
            this.slideMainDom.css('transform', 'translateX(' + slideWidth + 'px) scale(1)');
        },

        /**
         * 切换指示激活坐标
         *
         * @private
         */
        changeIndicatorActiveIndex: function () {
            var indicatorArr = this.slideIndicatorDom.children();

            $(indicatorArr[this.originIndicatorActiveIndex - 1]).css('background-color', this.indicatorDefaultColor);
            $(indicatorArr[this.indicatorActiveIndex - 1]).css('background-color', this.indicatorActiveColor);
        },

        /**
         * 修改轮播图当前index，并修正位置
         *
         * @private
         * @param {number} value 修改值
         */
        modifyActiveIndex: function (value) {
            this.activeIndex = this.activeIndex + value;
            this.loop && this.fixLoop();
        },

        /**
         * 去除轮播主体动画
         *
         * @private
         */
        removeTransition: function () {
            this.slideMainDom.css('transition', '');
        },

        /**
         * 增加轮播主体动画
         *
         * @private
         * @param {string} value 动画值（transition的值）
         */
        addTransition: function (value) {
            this.slideMainDom.css('transition', value || this.transition);
        },

        /**
         * 触发切换时回调函数
         *
         * @private
         * @param {boolean} isManual 是否是手动触发的滑动
         */
        emitChange: function (isManual) {
            this.changeIndicatorActiveIndex();

            var index = this.activeIndex - 1;

            if (index < 0) {
                index = this.originNum + index;
            }
            else if (index >= this.originNum) {
                index = this.originNum - index;
            }

            /**
             * 轮播改变的时候触发
             *
             * @event change
             * @property {number} index 当前轮播项的索引
             */
            this.onChange(index, isManual);
        },

        /**
         * 清除定时器和监听事件
         *
         * @public
         */
        destroy: function () {
            // 如果只有一张则没有下面绑定的事件
            if (this.isSingle) {
                return;
            }

            // 移除自动轮播
            this.clearAutoPlayInterval();
            // 移除横竖屏变化监听
            this.mediaQueryList.removeListener(this.mediaQueryOrientationListener);
        },

        /**
         * 横竖屏监听
         *
         * @private
         * @param {string} mediaQueryList 值
         */
        mediaQueryOrientationListener: function (mediaQueryList) {
            var self = this;
            // 重新计算横滑的宽度；这里的延迟是为了计算出准确的翻转手机后的 width
            // 这里有测试 vm.$nextTick 和 setTimeout(fn,0) 都会有问题，所以加了延时和动效
            setTimeout(function () {
                self.addTransition();
                self.width = self.getSlideMainWidth();
                self.setSlideMainPositionX(-self.activeIndex * self.width);
            }, 200);
        },

        /**
         * 获取轮播图的宽度
         *
         * @return {number}
         */
        getSlideMainWidth: function () {
            return this.slideMainDom.width();
        },

        /**
         * 不循环时对手势的判断
         *
         * @private
         * @param {number} disX 手指滑动的距离
         * @return {boolean}
         */
        noLoopTouchJudgement: function (disX) {
            // 如果不循环
            if (!this.loop) {
                // 如果 dix 为负（代表往右划）并且 当前划动项的索引+1后与原始长度相等
                if (disX < 0 && this.activeIndex + 1 === this.originNum) {
                    // 直接返回
                    return true;
                }
                // 如果 dix 为正（代表往左划）并且 当前划动项的索引为0
                if (disX > 0 && this.activeIndex === 0) {
                    // 直接返回
                    return true;
                }
            }
            // 不直接 return
            return false;
        },

        /**
         * 根据起点终点返回方向 1向上 2向下 3向左 4向右 0未滑动
         *
         * @private
         * @param {number} angx x方向移动距离
         * @param {number} angy y方向移动距离
         * @return {numnber}
         */
        getDirection: function (angx, angy) {
            var result = 0;
            // 如果滑动距离太短
            if (Math.abs(angx) < 2 && Math.abs(angy) < 2) {
                return result;
            }
            var angle = this.getAngle(angx, angy);
            if (angle >= -135 && angle <= -45) {
                result = DIRECTION.TOP;
            }
            else if (angle > 45 && angle < 135) {
                result = DIRECTION.BOTTOM;
            }
            else if ((angle >= 135 && angle <= 180) || (angle >= -180 && angle < -135)) {
                result = DIRECTION.LEFT;
            }
            else if (angle >= -45 && angle <= 45) {
                result = DIRECTION.RIGHT;
            }
            return result;
        },

        /**
         * 计算角度
         *
         * @private
         * @param {number} angx x方向移动距离
         * @param {number} angy y方向移动距离
         * @return {number}
         */
        getAngle: function (angx, angy) {
            return Math.atan2(angy, angx) * 180 / Math.PI;
        },

        /**
         * 循环时需要修复位置
         *
         * @private
         */
        fixLoop: function () {
            var self = this;

            // 动画时间过后
            this.fixLoopTimeout = setTimeout(function () {
                // 关闭动画
                self.removeTransition();
                // 第 0 个，即为在左侧对最后一个的补全
                if (self.activeIndex === 0) {
                    // 设置 activeIndex 为实际的 index
                    self.activeIndex = self.originNum;
                }
                // 第 num + 1 个，即为在右侧对第一个的补全
                else if (self.activeIndex === self.originNum + 1) {
                    // 设置 activeIndex 为实际的 index
                    self.activeIndex = self.activeIndex - self.originNum;
                }
                // 改变 translate 的距离
                self.setSlideMainPositionX(-self.activeIndex * self.width);
            }, this.waitTime);
        },

        /**
         * 图片点击事件
         *
         * @private
         * @param {Object} e 点击捕获事件
         */
        handleImgItemClick: function (e) {
            var slideChild = this.slideMainDom.children();
            var clickIndex = slideChild.indexOf(e.target);

            // 有可能传入的不是图片，因此点击的时候就不能直接点击到子元素，
            // 因此需要向上寻找符合的元素
            if (clickIndex <= -1) {
                var parents = $(e.target).parents();
                for (var i in parents) {
                    if (slideChild.indexOf(parents[i]) > -1) {
                        clickIndex = slideChild.indexOf(parents[i]);
                        break;
                    }
                }
            }

            var index;

            if (clickIndex > -1) {
                // 图片大于一张并且循环会前后增加图片，所以要修正下点击index
                index = this.loop && this.originNum > 1 ? --clickIndex : clickIndex;
            }
            /**
             * 点击图片项时候触发
             *
             * @event onClickItem
             * @property {number} clickIndex 点击下标
             * @property {Object} Object 选中信息
             * @property {Object} e 点击事件
             */
            this.onClickItem(index, this.listData[clickIndex], e);

        },

        /**
         * 点击关闭事件
         *
         * @private
         * @param {Object} e 点击捕获事件
         */
        handleImgClose: function (e) {
            e.preventDefault();
            e.stopPropagation();
            this.destroy();

            /**
             * 点击关闭按钮触发回调
             *
             * @event onClickItem
             * @property {Object} e 点击事件
             */
            this.onClickClose(e);
        }
    };

    return Carousel;

});
