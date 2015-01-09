/* 
 * Boxer v3.3.0 - 2014-11-25 
 * A jQuery plugin for displaying images, videos or content in a modal overlay. Part of the Formstone Library. 
 * http://formstone.it/boxer/ 
 * 
 * Copyright 2014 Ben Plum; MIT Licensed 
 */

;(function ($, window) {
	"use strict";

	var $body = null,
		data = {},
		trueMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test((window.navigator.userAgent||window.navigator.vendor||window.opera)),
		transitionEvent,
		transitionSupported;

	/**
	 * @options
	 * @param callback [function] <$.noop> "Funciton called after opening instance"
	 * @param customClass [string] <''> "Class applied to instance"
	 * @param extensions [array] <"jpg", "sjpg", "jpeg", "png", "gif"> "Image type extensions"
	 * @param fixed [boolean] <false> "Flag for fixed positioning"
	 * @param formatter [function] <$.noop> "Caption format function"
	 * @param labels.close [string] <'Close'> "Close button text"
	 * @param labels.count [string] <'of'> "Gallery count separator text"
	 * @param labels.next [string] <'Next'> "Gallery control text"
	 * @param labels.previous [string] <'Previous'> "Gallery control text"
	 * @param margin [int] <50> "Margin used when sizing (single side)"
	 * @param minHeight [int] <100> "Minimum height of modal"
	 * @param minWidth [int] <100> "Minimum width of modal"
	 * @param mobile [boolean] <false> "Flag to force 'mobile' rendering"
	 * @param opacity [number] <0.75> "Overlay target opacity"
	 * @param retina [boolean] <false> "Use 'retina' sizing (half's natural sizes)"
	 * @param requestKey [string] <'boxer'> "GET variable for ajax / iframe requests"
	 * @param top [int] <0> "Target top position; over-rides centering"
	 * @param videoRadio [number] <0.5625> "Video height / width ratio (9 / 16 = 0.5625)"
	 * @param videoWidth [int] <600> "Video target width"
	 */
	var options = {
		callback: $.noop,
		customClass: "",
		extensions: [ "jpg", "sjpg", "jpeg", "png", "gif" ],
		fixed: false,
		formatter: $.noop,
		labels: {
			close: "Close",
			count: "of",
			next: "Next",
			previous: "Previous"
		},
		margin: 50,
		minHeight: 100,
		minWidth: 100,
		mobile: false,
		opacity: 0.75,
		retina: false,
		requestKey: "boxer",
		top: 0,
		videoRatio: 0.5625,
		videoWidth: 600
	};

	/**
	 * @events
	 * @event open.boxer "Modal opened; triggered on window"
	 * @event close.boxer "Modal closed; triggered on window"
	 */

	var pub = {

		/**
		 * @method
		 * @name close
		 * @description Closes active instance of plugin
		 * @example $.boxer("close");
		 */
		close: function() {
			if (typeof data.$boxer !== "undefined") {
				data.$boxer.off(".boxer");
				data.$overlay.trigger("click");
			}
		},

		/**
		 * @method
		 * @name defaults
		 * @description Sets default plugin options
		 * @param opts [object] <{}> "Options object"
		 * @example $.boxer("defaults", opts);
		 */
		defaults: function(opts) {
			options = $.extend(options, opts || {});
			return (typeof this === 'object') ? $(this) : false;
		},

		/**
		 * @method
		 * @name destroy
		 * @description Removes plugin bindings
		 * @example $(".target").boxer("destroy");
		 */
		destroy: function() {
			return $(this).off(".boxer");
		},

		/**
		 * @method
		 * @name resize
		 * @description Triggers resize of instance
		 * @example $.boxer("resize");
		 * @param height [int | false] "Target height or false to auto size"
		 * @param width [int | false] "Target width or false to auto size"
		 */
		resize: function(e) {
			if (typeof data.$boxer !== "undefined") {
				if (typeof e !== "object") {
					data.targetHeight = arguments[0];
					data.targetWidth  = arguments[1];
				}

				if (data.type === "element") {
					sizeContent(data.$content.find(">:first-child"));
				} else if (data.type === "image") {
					sizeImage();
				} else if (data.type === "video") {
					sizeVideo();
				}
				size();
			}

			return $(this);
		}
	};

	/**
	 * @method private
	 * @name init
	 * @description Initializes plugin
	 * @param opts [object] "Initialization options"
	 */
	function init(opts) {
		options.formatter = formatCaption;

		$body = $("body");
		transitionEvent = getTransitionEvent();
		transitionSupported = (transitionEvent !== false);

		// no transitions :(
		if (!transitionSupported) {
			transitionEvent = "transitionend.boxer";
		}

		return $(this).on("click.boxer", $.extend({}, options, opts || {}), build);
	}

	/**
	 * @method private
	 * @name build
	 * @description Builds target instance
	 * @param e [object] "Event data"
	 */
	function build(e) {
		if (typeof data.$boxer === "undefined") {
			// Check target type
			var $target = $(this),
				$object = e.data.$object,
				source = ($target[0].href) ? $target[0].href || "" : "",
				hash = ($target[0].hash) ? $target[0].hash || "" : "",
				sourceParts = source.toLowerCase().split(".").pop().split(/\#|\?/),
				extension = sourceParts[0],
				type = $target.data("boxer-type") || "",
				isImage	= ( (type === "image") || ($.inArray(extension, e.data.extensions) > -1 || source.substr(0, 10) === "data:image") ),
				isVideo	= ( source.indexOf("youtube.com/embed") > -1 || source.indexOf("player.vimeo.com/video") > -1 ),
				isUrl	  = ( (type === "url") || (!isImage && !isVideo && source.substr(0, 4) === "http" && !hash) ),
				isElement  = ( (type === "element") || (!isImage && !isVideo && !isUrl && (hash.substr(0, 1) === "#")) ),
				isObject   = ( (typeof $object !== "undefined") );

			if (isElement) {
				source = hash;
			}

			// Check if boxer is already active, retain default click
			if ($("#boxer").length > 1 || !(isImage || isVideo || isUrl || isElement || isObject)) {
				return;
			}

			// Kill event
			killEvent(e);

			// Cache internal data
			data = $.extend({}, {
				$window: $(window),
				$body: $("body"),
				$target: $target,
				$object: $object,
				visible: false,
				resizeTimer: null,
				touchTimer: null,
				gallery: {
					active: false
				},
				isMobile: (trueMobile || e.data.mobile),
				isAnimating: true,
				oldContentHeight: 0,
				oldContentWidth: 0
			}, e.data);

			// Double the margin
			data.margin *= 2;

			if (isImage) {
				data.type = "image";
			} else if (isVideo) {
				data.type = "video";
			} else {
				data.type = "element";
			}

			if (isImage || isVideo) {
				// Check for gallery
				var id = data.$target.data("gallery") || data.$target.attr("rel"); // backwards compatibility

				if (typeof id !== "undefined" && id !== false) {
					data.gallery.active = true;
					data.gallery.id = id;
					data.gallery.$items = $("a[data-gallery= " + data.gallery.id + "], a[rel= " + data.gallery.id + "]"); // backwards compatibility
					data.gallery.index = data.gallery.$items.index(data.$target);
					data.gallery.total = data.gallery.$items.length - 1;
				}
			}

			// Assemble HTML
			var html = '';
			if (!data.isMobile) {
				html += '<div id="boxer-overlay" class="' + data.customClass + '"></div>';
			}
			html += '<div id="boxer" class="loading animating ' + data.customClass;
			if (data.fixed) {
				html += ' fixed';
			}
			if (data.isMobile) {
				html += ' mobile';
			}
			if (isUrl) {
				html += ' iframe';
			}
			if (isElement || isObject) {
				html += ' inline';
			}
			html += '">';
			html += '<span class="boxer-close">' + data.labels.close + '</span>';
			html += '<span class="boxer-loading"></span>';
			html += '<div class="boxer-container">';
			html += '<div class="boxer-content">';
			if (isImage || isVideo) {
				html += '<div class="boxer-meta">';

				if (data.gallery.active) {
					html += '<div class="boxer-control previous">' + data.labels.previous + '</div>';
					html += '<div class="boxer-control next">' + data.labels.next + '</div>';
					html += '<p class="boxer-position"';
					if (data.gallery.total < 1) {
						html += ' style="display: none;"';
					}
					html += '>';
					html += '<span class="current">' + (data.gallery.index + 1) + '</span> ' + data.labels.count + ' <span class="total">' + (data.gallery.total + 1) + '</span>';
					html += '</p>';
					html += '<div class="boxer-caption gallery">';
				} else {
					html += '<div class="boxer-caption">';
				}

				html += data.formatter.apply(data.$body, [data.$target]);
				html += '</div></div>'; // caption, meta
			}
			html += '</div></div></div>'; //container, content, boxer

			// Modify Dom
			data.$body.append(html);

			// Cache jquery objects
			data.$overlay = $("#boxer-overlay");
			data.$boxer = $("#boxer");
			data.$container = data.$boxer.find(".boxer-container");
			data.$content = data.$boxer.find(".boxer-content");
			data.$meta = data.$boxer.find(".boxer-meta");
			data.$position = data.$boxer.find(".boxer-position");
			data.$caption = data.$boxer.find(".boxer-caption");
			data.$controls = data.$boxer.find(".boxer-control");

			data.paddingVertical = (!data.isMobile) ? (parseInt(data.$boxer.css("paddingTop"), 10) + parseInt(data.$boxer.css("paddingBottom"), 10)) : (data.$boxer.find(".boxer-close").outerHeight() / 2);
			data.paddingHorizontal = (!data.isMobile) ? (parseInt(data.$boxer.css("paddingLeft"), 10) + parseInt(data.$boxer.css("paddingRight"), 10)) : 0;
			data.contentHeight = data.$boxer.outerHeight() - data.paddingVertical;
			data.contentWidth = data.$boxer.outerWidth()   - data.paddingHorizontal;
			data.controlHeight = data.$controls.outerHeight();

			// Center
			center();

			// Update gallery
			if (data.gallery.active) {
				updateControls();
			}

			// Bind events
			data.$window.on("resize.boxer", pub.resize)
						.on("keydown.boxer", onKeypress);

			data.$body.on("touchstart.boxer click.boxer", "#boxer-overlay, #boxer .boxer-close", onClose)
					  .on("touchmove.boxer", killEvent);

			if (data.gallery.active) {
				data.$boxer.on("touchstart.boxer click.boxer", ".boxer-control", advanceGallery);
			}

			data.$boxer.on(transitionEvent, function(e) {
				killEvent(e);

				if ($(e.target).is(data.$boxer)) {
					data.$boxer.off(transitionEvent);

					if (isImage) {
						loadImage(source);
					} else if (isVideo) {
						loadVideo(source);
					} else if (isUrl) {
						loadURL(source);
					} else if (isElement) {
						cloneElement(source);
					} else if (isObject) {
						appendObject(data.$object);
					} else {
						$.error("BOXER: '" +  source + "' is not valid.");
					}
				}
			});

			$body.addClass("boxer-open");

			if (!transitionSupported) {
				data.$boxer.trigger(transitionEvent);
			}

			if (isObject) {
				return data.$boxer;
			}
		}
	}

	/**
	 * @method private
	 * @name onClose
	 * @description Closes active instance
	 * @param e [object] "Event data"
	 */
	function onClose(e) {
		killEvent(e);

		if (typeof data.$boxer !== "undefined") {
			data.$boxer.on(transitionEvent, function(e) {
				killEvent(e);

				if ($(e.target).is(data.$boxer)) {
					data.$boxer.off(transitionEvent);

					data.$overlay.remove();
					data.$boxer.remove();

					// reset data
					data = {};
				}
			}).addClass("animating");

			$body.removeClass("boxer-open");

			if (!transitionSupported) {
				data.$boxer.trigger(transitionEvent);
			}

			clearTimer(data.resizeTimer);

			// Clean up
			data.$window.off("resize.boxer")
						.off("keydown.boxer");

			data.$body.off(".boxer")
					  .removeClass("boxer-open");

			if (data.gallery.active) {
				data.$boxer.off(".boxer");
			}

			if (data.isMobile) {
				if (data.type === "image" && data.gallery.active) {
					data.$container.off(".boxer");
				}
			}

			data.$window.trigger("close.boxer");
		}
	}

	/**
	 * @method private
	 * @name open
	 * @description Opens active instance
	 */
	function open() {
		var position = calculatePosition(),
			durration = data.isMobile ? 0 : data.duration;

		if (!data.isMobile) {
			data.$controls.css({
				marginTop: ((data.contentHeight - data.controlHeight - data.metaHeight) / 2)
			});
		}

		if (!data.visible && data.isMobile && data.gallery.active) {
			data.$content.on("touchstart.boxer", ".boxer-image", onTouchStart);
		}

		if (data.isMobile || data.fixed) {
			data.$body.addClass("boxer-open");
		}

		data.$boxer.on(transitionEvent, function(e) {
			killEvent(e);

			if ($(e.target).is(data.$boxer)) {
				data.$boxer.off(transitionEvent);

				data.$container.on(transitionEvent, function(e) {
					killEvent(e);

					if ($(e.target).is(data.$container)) {
						data.$container.off(transitionEvent);

						data.$boxer.removeClass("animating");

						data.isAnimating = false;
					}
				});

				data.$boxer.removeClass("loading");

				if (!transitionSupported) {
					data.$content.trigger(transitionEvent);
				}

				data.visible = true;

				// Fire callback + event
				data.callback.apply(data.$boxer);
				data.$window.trigger("open.boxer");

				// Start preloading
				if (data.gallery.active) {
					preloadGallery();
				}
			}
		});

		if (!data.isMobile) {
			data.$boxer.css({
				height: data.contentHeight + data.paddingVertical,
				width:  data.contentWidth  + data.paddingHorizontal,
				top:    (!data.fixed) ? position.top : 0
			});
		}

		// Trigger event in case the content size hasn't changed
		var contentHasChanged = (data.oldContentHeight !== data.contentHeight || data.oldContentWidth !== data.contentWidth);

		if (data.isMobile || !transitionSupported || !contentHasChanged) {
			data.$boxer.trigger(transitionEvent);
		}

		// Track content size changes
		data.oldContentHeight = data.contentHeight;
		data.oldContentWidth  = data.contentWidth;
	}

	/**
	 * @method private
	 * @name size
	 * @description Sizes active instance
	 */
	function size() {
		if (data.visible && !data.isMobile) {
			var position = calculatePosition();

			data.$controls.css({
				marginTop: ((data.contentHeight - data.controlHeight - data.metaHeight) / 2)
			});

			data.$boxer.css({
				height: data.contentHeight + data.paddingVertical,
				width:  data.contentWidth  + data.paddingHorizontal,
				top:    (!data.fixed) ? position.top : 0
			});
		}
	}

	/**
	 * @method private
	 * @name center
	 * @description Centers instance
	 */
	function center() {
		var position = calculatePosition();

		data.$boxer.css({
			top: (!data.fixed) ? position.top : 0
		});
	}

	/**
	 * @method private
	 * @name calculatePosition
	 * @description Calculates positions
	 * @return [object] "Object containing top and left positions"
	 */
	function calculatePosition() {
		if (data.isMobile) {
			return {
				left: 0,
				top: 0
			};
		}

		var pos = {
			left: (data.$window.width() - data.contentWidth - data.paddingHorizontal) / 2,
			top: (data.top <= 0) ? ((data.$window.height() - data.contentHeight - data.paddingVertical) / 2) : data.top
		};

		if (data.fixed !== true) {
			pos.top += data.$window.scrollTop();
		}

		return pos;
	}

	/**
	 * @method private
	 * @name formatCaption
	 * @description Formats caption
	 * @param $target [jQuery object] "Target element"
	 */
	function formatCaption($target) {
		var title = $target.attr("title");
		return (title !== undefined && title.trim() !== "") ? '<p class="caption">' + title.trim() + '</p>' : "";
	}

	/**
	 * @method private
	 * @name loadImage
	 * @description Loads source image
	 * @param source [string] "Source image URL"
	 */
	function loadImage(source) {
		// Cache current image
		data.$image = $("<img />");

		data.$image.load(function() {
			data.$image.off("load, error");

			var naturalSize = calculateNaturalSize(data.$image);

			data.naturalHeight = naturalSize.naturalHeight;
			data.naturalWidth  = naturalSize.naturalWidth;

			if (data.retina) {
				data.naturalHeight /= 2;
				data.naturalWidth  /= 2;
			}

			data.$content.prepend(data.$image);

			if (data.$caption.html() === "") {
				data.$caption.hide();
			} else {
				data.$caption.show();
			}

			// Size content to be sure it fits the viewport
			sizeImage();
			open();
		}).error(loadError)
		  .attr("src", source)
		  .addClass("boxer-image");

		// If image has already loaded into cache, trigger load event
		if (data.$image[0].complete || data.$image[0].readyState === 4) {
			data.$image.trigger("load");
		}
	}

	/**
	 * @method private
	 * @name sizeImage
	 * @description Sizes image to fit in viewport
	 * @param count [int] "Number of resize attempts"
	 */
	function sizeImage() {
		var count = 0;

		data.windowHeight = data.viewportHeight = data.$window.height() - data.paddingVertical;
		data.windowWidth  = data.viewportWidth  = data.$window.width()  - data.paddingHorizontal;

		data.contentHeight = Infinity;
		data.contentWidth = Infinity;

		data.imageMarginTop  = 0;
		data.imageMarginLeft = 0;

		while (data.contentHeight > data.viewportHeight && count < 2) {
			data.imageHeight = (count === 0) ? data.naturalHeight : data.$image.outerHeight();
			data.imageWidth  = (count === 0) ? data.naturalWidth  : data.$image.outerWidth();
			data.metaHeight  = (count === 0) ? 0 : data.metaHeight;

			if (count === 0) {
				data.ratioHorizontal = data.imageHeight / data.imageWidth;
				data.ratioVertical   = data.imageWidth  / data.imageHeight;

				data.isWide = (data.imageWidth > data.imageHeight);
			}

			// Double check min and max
			if (data.imageHeight < data.minHeight) {
				data.minHeight = data.imageHeight;
			}
			if (data.imageWidth < data.minWidth) {
				data.minWidth = data.imageWidth;
			}

			if (data.isMobile) {
				// Get meta height before sizing
				data.$meta.css({
					width: data.windowWidth
				});
				data.metaHeight = data.$meta.outerHeight(true);

				// Content match viewport
				data.contentHeight = data.viewportHeight - data.paddingVertical;
				data.contentWidth  = data.viewportWidth  - data.paddingHorizontal;

				fitImage();

				data.imageMarginTop  = (data.contentHeight - data.targetImageHeight - data.metaHeight) / 2;
				data.imageMarginLeft = (data.contentWidth  - data.targetImageWidth) / 2;
			} else {
				// Viewport should match window, less margin, padding and meta
				if (count === 0) {
					data.viewportHeight -= (data.margin + data.paddingVertical);
					data.viewportWidth  -= (data.margin + data.paddingHorizontal);
				}
				data.viewportHeight -= data.metaHeight;

				fitImage();

				data.contentHeight = data.targetImageHeight;
				data.contentWidth  = data.targetImageWidth;
			}

			// Modify DOM

			data.$meta.css({
				width: data.contentWidth
			});

			data.$image.css({
				height: data.targetImageHeight,
				width:  data.targetImageWidth,
				marginTop:  data.imageMarginTop,
				marginLeft: data.imageMarginLeft
			});

			if (!data.isMobile) {
				data.metaHeight = data.$meta.outerHeight(true);
				data.contentHeight += data.metaHeight;
			}

			count ++;
		}
	}

	/**
	 * @method private
	 * @name fitImage
	 * @description Calculates target image size
	 */
	function fitImage() {
		var height = (!data.isMobile) ? data.viewportHeight : data.contentHeight - data.metaHeight,
			width  = (!data.isMobile) ? data.viewportWidth  : data.contentWidth;

		if (data.isWide) {
			//WIDE
			data.targetImageWidth  = width;
			data.targetImageHeight = data.targetImageWidth * data.ratioHorizontal;

			if (data.targetImageHeight > height) {
				data.targetImageHeight = height;
				data.targetImageWidth  = data.targetImageHeight * data.ratioVertical;
			}
		} else {
			//TALL
			data.targetImageHeight = height;
			data.targetImageWidth  = data.targetImageHeight * data.ratioVertical;

			if (data.targetImageWidth > width) {
				data.targetImageWidth  = width;
				data.targetImageHeight = data.targetImageWidth * data.ratioHorizontal;
			}
		}

		// MAX
		if (data.targetImageWidth > data.imageWidth || data.targetImageHeight > data.imageHeight) {
			data.targetImageHeight = data.imageHeight;
			data.targetImageWidth  = data.imageWidth;
		}

		// MIN
		if (data.targetImageWidth < data.minWidth || data.targetImageHeight < data.minHeight) {
			if (data.targetImageWidth < data.minWidth) {
				data.targetImageWidth  = data.minWidth;
				data.targetImageHeight = data.targetImageWidth * data.ratioHorizontal;
			} else {
				data.targetImageHeight = data.minHeight;
				data.targetImageWidth  = data.targetImageHeight * data.ratioVertical;
			}
		}
	}

	/**
	 * @method private
	 * @name loadVideo
	 * @description Loads source video
	 * @param source [string] "Source video URL"
	 */
	function loadVideo(source) {
		data.$videoWrapper = $('<div class="boxer-video-wrapper" />');
		data.$video = $('<iframe class="boxer-video" seamless="seamless" />');

		data.$video.attr("src", source)
				   .addClass("boxer-video")
				   .prependTo(data.$videoWrapper);

		data.$content.prepend(data.$videoWrapper);

		sizeVideo();
		open();
	}

	/**
	 * @method private
	 * @name sizeVideo
	 * @description Sizes video to fit in viewport
	 */
	function sizeVideo() {
		// Set initial vars
		data.windowHeight = data.viewportHeight = data.contentHeight = data.$window.height() - data.paddingVertical;
		data.windowWidth  = data.viewportWidth  = data.contentWidth  = data.$window.width()  - data.paddingHorizontal;
		data.videoMarginTop = 0;
		data.videoMarginLeft = 0;

		if (data.isMobile) {
			data.$meta.css({
				width: data.windowWidth
			});
			data.metaHeight = data.$meta.outerHeight(true);
			data.viewportHeight -= data.metaHeight;

			data.targetVideoWidth  = data.viewportWidth;
			data.targetVideoHeight = data.targetVideoWidth * data.videoRatio;

			if (data.targetVideoHeight > data.viewportHeight) {
				data.targetVideoHeight = data.viewportHeight;
				data.targetVideoWidth  = data.targetVideoHeight / data.videoRatio;
			}

			data.videoMarginTop = (data.viewportHeight - data.targetVideoHeight) / 2;
			data.videoMarginLeft = (data.viewportWidth - data.targetVideoWidth) / 2;
		} else {
			data.viewportHeight = data.windowHeight - data.margin;
			data.viewportWidth  = data.windowWidth - data.margin;

			data.targetVideoWidth  = (data.videoWidth > data.viewportWidth) ? data.viewportWidth : data.videoWidth;
			if (data.targetVideoWidth < data.minWidth) {
				data.targetVideoWidth = data.minWidth;
			}
			data.targetVideoHeight = data.targetVideoWidth * data.videoRatio;

			data.contentHeight = data.targetVideoHeight;
			data.contentWidth  = data.targetVideoWidth;
		}

		// Update dom

		data.$meta.css({
			width: data.contentWidth
		});

		data.$videoWrapper.css({
			height: data.targetVideoHeight,
			width: data.targetVideoWidth,
			marginTop: data.videoMarginTop,
			marginLeft: data.videoMarginLeft
		});

		if (!data.isMobile) {
			data.metaHeight = data.$meta.outerHeight(true);
			data.contentHeight = data.targetVideoHeight + data.metaHeight;
		}
	}

	/**
	 * @method private
	 * @name preloadGallery
	 * @description Preloads previous and next images in gallery for faster rendering
	 * @param e [object] "Event Data"
	 */
	function preloadGallery(e) {
		var source = '';

		if (data.gallery.index > 0) {
			source = data.gallery.$items.eq(data.gallery.index - 1).attr("href");
			if (source.indexOf("youtube.com/embed") < 0 && source.indexOf("player.vimeo.com/video") < 0) {
				$('<img src="' + source + '">');
			}
		}
		if (data.gallery.index < data.gallery.total) {
			source = data.gallery.$items.eq(data.gallery.index + 1).attr("href");
			if (source.indexOf("youtube.com/embed") < 0 && source.indexOf("player.vimeo.com/video") < 0) {
				$('<img src="' + source + '">');
			}
		}
	}

	/**
	 * @method private
	 * @name advanceGallery
	 * @description Advances gallery base on direction
	 * @param e [object] "Event Data"
	 */
	function advanceGallery(e) {
		killEvent(e);

		var $control = $(this);
		if (!data.isAnimating && !$control.hasClass("disabled")) {
			data.isAnimating = true;

			data.gallery.index += ($control.hasClass("next")) ? 1 : -1;
			if (data.gallery.index > data.gallery.total) {
				data.gallery.index = data.gallery.total;
			}
			if (data.gallery.index < 0) {
				data.gallery.index = 0;
			}

			data.$container.on(transitionEvent, function(e) {
				killEvent(e);

				if ($(e.target).is(data.$container)) {
					data.$container.off(transitionEvent);

					if (typeof data.$image !== 'undefined') {
						data.$image.remove();
					}
					if (typeof data.$videoWrapper !== 'undefined') {
						data.$videoWrapper.remove();
					}
					data.$target = data.gallery.$items.eq(data.gallery.index);

					data.$caption.html(data.formatter.apply(data.$body, [data.$target]));
					data.$position.find(".current").html(data.gallery.index + 1);

					var source = data.$target.attr("href"),
						isVideo = ( source.indexOf("youtube.com/embed") > -1 || source.indexOf("player.vimeo.com/video") > -1 );

					if (isVideo) {
						loadVideo(source);
					} else {
						loadImage(source);
					}
					updateControls();
				}
			});

			data.$boxer.addClass("loading animating");

			if (!transitionSupported) {
				data.$content.trigger(transitionEvent);
			}
		}
	}

	/**
	 * @method private
	 * @name updateControls
	 * @description Updates gallery control states
	 */
	function updateControls() {
		data.$controls.removeClass("disabled");
		if (data.gallery.index === 0) {
			data.$controls.filter(".previous").addClass("disabled");
		}
		if (data.gallery.index === data.gallery.total) {
			data.$controls.filter(".next").addClass("disabled");
		}
	}

	/**
	 * @method private
	 * @name onKeypress
	 * @description Handles keypress in gallery
	 * @param e [object] "Event data"
	 */
	function onKeypress(e) {
		if (data.gallery.active && (e.keyCode === 37 || e.keyCode === 39)) {
			killEvent(e);

			data.$controls.filter((e.keyCode === 37) ? ".previous" : ".next").trigger("click");
		} else if (e.keyCode === 27) {
			data.$boxer.find(".boxer-close").trigger("click");
		}
	}

	/**
	 * @method private
	 * @name cloneElement
	 * @description Clones target inline element
	 * @param id [string] "Target element id"
	 */
	function cloneElement(id) {
		var $clone = $(id).find(">:first-child").clone();
		appendObject($clone);
	}

	/**
	 * @method private
	 * @name loadURL
	 * @description Load URL into iframe
	 * @param source [string] "Target URL"
	 */
	function loadURL(source) {
		source = source + ((source.indexOf("?") > -1) ? "&"+options.requestKey+"=true" : "?"+options.requestKey+"=true");
		var $iframe = $('<iframe class="boxer-iframe" src="' + source + '" />');
		appendObject($iframe);
	}

	/**
	 * @method private
	 * @name appendObject
	 * @description Appends and sizes object
	 * @param $object [jQuery Object] "Object to append"
	 */
	function appendObject($object) {
		data.$content.append($object);
		sizeContent($object);
		open();
	}

	/**
	 * @method private
	 * @name sizeContent
	 * @description Sizes jQuery object to fir in viewport
	 * @param $object [jQuery Object] "Object to size"
	 */
	function sizeContent($object) {
		data.windowHeight	  = data.$window.height() - data.paddingVertical;
		data.windowWidth	  = data.$window.width() - data.paddingHorizontal;
		data.objectHeight	  = $object.outerHeight(true);
		data.objectWidth	  = $object.outerWidth(true);
		data.targetHeight	  = data.targetHeight || data.$target.data("boxer-height");
		data.targetWidth	  = data.targetWidth  || data.$target.data("boxer-width");
		data.maxHeight		  = (data.windowHeight < 0) ? options.minHeight : data.windowHeight;
		data.isIframe		  = $object.is("iframe");
		data.objectMarginTop  = 0;
		data.objectMarginLeft = 0;

		if (!data.isMobile) {
			data.windowHeight -= data.margin;
			data.windowWidth  -= data.margin;
		}

		data.contentHeight = (data.targetHeight !== undefined) ? data.targetHeight : (data.isIframe || data.isMobile) ? data.windowHeight : data.objectHeight;
		data.contentWidth  = (data.targetWidth !== undefined)  ? data.targetWidth  : (data.isIframe || data.isMobile) ? data.windowWidth  : data.objectWidth;

		if ((data.isIframe || data.isObject) && data.isMobile) {
			data.contentHeight = data.windowHeight;
			data.contentWidth  = data.windowWidth;
		} else if (data.isObject) {
			data.contentHeight = (data.contentHeight > data.windowHeight) ? data.windowHeight : data.contentHeight;
			data.contentWidth  = (data.contentWidth > data.windowWidth)   ? data.windowWidth  : data.contentWidth;
		}
	}

	/**
	 * @method private
	 * @name loadError
	 * @description Error when resource fails to load
	 * @param e [object] "Event data"
	 */
	function loadError(e) {
		var $error = $('<div class="boxer-error"><p>Error Loading Resource</p></div>');

		// Clean up
		data.type = "element";
		data.$meta.remove();

		data.$image.off("load, error");

		appendObject($error);
	}

	/**
	 * @method private
	 * @name onTouchStart
	 * @description Handle touch start event
	 * @param e [object] "Event data"
	 */
	function onTouchStart(e) {
		killEvent(e);
		clearTimer(data.touchTimer);

		if (!data.isAnimating) {
			var touch = (typeof e.originalEvent.targetTouches !== "undefined") ? e.originalEvent.targetTouches[0] : null;
			data.xStart = (touch) ? touch.pageX : e.clientX;
			data.leftPosition = 0;

			data.touchMax = Infinity;
			data.touchMin = -Infinity;
			data.edge = data.contentWidth * 0.25;

			if (data.gallery.index === 0) {
				data.touchMax = 0;
			}
			if (data.gallery.index === data.gallery.total) {
				data.touchMin = 0;
			}

			data.$boxer.on("touchmove.boxer", onTouchMove)
					   .one("touchend.boxer", onTouchEnd);
		}
	}

	/**
	 * @method private
	 * @name onTouchMove
	 * @description Handles touchmove event
	 * @param e [object] "Event data"
	 */
	function onTouchMove(e) {
		var touch = (typeof e.originalEvent.targetTouches !== "undefined") ? e.originalEvent.targetTouches[0] : null;

		data.delta = data.xStart - ((touch) ? touch.pageX : e.clientX);

		// Only prevent event if trying to swipe
		if (data.delta > 20) {
			killEvent(e);
		}

		data.canSwipe = true;

		var newLeft = -data.delta;
		if (newLeft < data.touchMin) {
			newLeft = data.touchMin;
			data.canSwipe = false;
		}
		if (newLeft > data.touchMax) {
			newLeft = data.touchMax;
			data.canSwipe = false;
		}

		data.$image.css({ transform: "translate3D("+newLeft+"px,0,0)" });

		data.touchTimer = startTimer(data.touchTimer, 300, function() { onTouchEnd(e); });
	}

	/**
	 * @method private
	 * @name onTouchEnd
	 * @description Handles touchend event
	 * @param e [object] "Event data"
	 */
	function onTouchEnd(e) {
		killEvent(e);
		clearTimer(data.touchTimer);

		data.$boxer.off("touchmove.boxer touchend.boxer");

		if (data.delta) {
			data.$boxer.addClass("animated");
			data.swipe = false;

			if (data.canSwipe && (data.delta > data.edge || data.delta < -data.edge)) {
				data.swipe = true;
				if (data.delta <= data.leftPosition) {
					data.$image.css({ transform: "translate3D("+(data.contentWidth)+"px,0,0)" });
				} else {
					data.$image.css({ transform: "translate3D("+(-data.contentWidth)+"px,0,0)" });
				}
			} else {
				data.$image.css({ transform: "translate3D(0,0,0)" });
			}

			if (data.swipe) {
				data.$controls.filter( (data.delta <= data.leftPosition) ? ".previous" : ".next" ).trigger("click");
			}
			startTimer(data.resetTimer, data.duration, function() {
				data.$boxer.removeClass("animated");
			});
		}
	}

	/**
	 * @method private
	 * @name calculateNaturalSize
	 * @description Determines natural size of target image
	 * @param $img [jQuery object] "Source image object"
	 * @return [object | boolean] "Object containing natural height and width values or false"
	 */
	function calculateNaturalSize($img) {
		var node = $img[0],
			img = new Image();

		if (typeof node.naturalHeight !== "undefined") {
			return {
				naturalHeight: node.naturalHeight,
				naturalWidth:  node.naturalWidth
			};
		} else {
			if (node.tagName.toLowerCase() === 'img') {
				img.src = node.src;
				return {
					naturalHeight: img.height,
					naturalWidth:  img.width
				};
			}
		}

		return false;
	}

	/**
	 * @method private
	 * @name killEvent
	 * @description Prevents default and stops propagation on event
	 * @param e [object] "Event data"
	 */
	function killEvent(e) {
		if (e.preventDefault) {
			e.stopPropagation();
			e.preventDefault();
		}
	}

	/**
	 * @method private
	 * @name startTimer
	 * @description Starts an internal timer
	 * @param timer [int] "Timer ID"
	 * @param time [int] "Time until execution"
	 * @param callback [int] "Function to execute"
	 */
	function startTimer(timer, time, callback) {
		clearTimer(timer);
		return setTimeout(callback, time);
	}

	/**
	 * @method private
	 * @name clearTimer
	 * @description Clears an internal timer
	 * @param timer [int] "Timer ID"
	 */
	function clearTimer(timer) {
		if (timer) {
			clearTimeout(timer);
			timer = null;
		}
	}

	/**
	 * @method private
	 * @name getTransitionEvent
	 * @description Retuns a properly prefixed transitionend event
	 * @return [string] "Properly prefixed event"
	 */
	function getTransitionEvent() {
		var transitions = {
				'WebkitTransition': 'webkitTransitionEnd',
				'MozTransition':    'transitionend',
				/* 'MSTransitionEnd':  'msTransition', */
				/* 'msTransition':     'MSTransitionEnd' */
				'OTransition':      'oTransitionEnd',
				'transition':       'transitionend'
			},
			test = document.createElement('div');

		for (var type in transitions) {
			if (transitions.hasOwnProperty(type) && type in test.style) {
				return transitions[type];
			}
		}

		return false;
	}

	$.fn.boxer = function(method) {
		if (pub[method]) {
			return pub[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return init.apply(this, arguments);
		}
		return this;
	};

	$.boxer = function($target, opts) {
		if (pub[$target]) {
			return pub[$target].apply(window, Array.prototype.slice.call(arguments, 1));
		} else {
			if ($target instanceof $) {
				return build.apply(window, [{ data: $.extend({
					$object: $target
				}, options, opts || {}) }]);
			}
		}
	};
})(jQuery, window);
/*
 * Naver v3.1.2 - 2014-11-25
 * A jQuery plugin for responsive navigation. Part of the Formstone Library.
 * http://formstone.it/naver/
 *
 * Copyright 2014 Ben Plum; MIT Licensed
 */

;(function ($, window) {
	"use strict";

	/**
	 * @options
	 * @param customClass [string] <''> "Class applied to instance"
	 * @param label [boolean] <true> "Display handle width label"
	 * @param labels.closed [string] <'Navigation'> "Closed state text"
	 * @param labels.open [string] <'Close'> "Open state text"
	 * @param maxWidth [string] <'980px'> "Width at which to auto-disable plugin"
	 */
	var options = {
		customClass: "",
		label: true,
		labels: {
			closed: "Additional Navigation",
			open: "Close"
		},
		maxWidth: "980px"
	};

	/**
	 * @events
	 * @event open.naver "Navigation opened"
	 * @event close.naver "Navigation closed"
	 */

	var pub = {

		/**
		 * @method
		 * @name close
		 * @description Closes instance
		 * @example $(".target").naver("close");
		 */
		close: function(e) {
			return $(this).each(function(i, nav) {
				var data = $(nav).data("naver");

				if (data && data.$nav.hasClass("enabled")) {
					data.$wrapper.css({
						height: 0
					});
					if (data.label) {
						data.$handle.html(data.labels.closed);
					}
					data.$nav.removeClass("open")
							 .trigger("close.naver");
				}
			});
		},

		/**
		 * @method
		 * @name defaults
		 * @description Sets default plugin options
		 * @param opts [object] <{}> "Options object"
		 * @example $.naver("defaults", opts);
		 */
		defaults: function(opts) {
			options = $.extend(true, options, opts || {});
			return (typeof this === 'object') ? $(this) : true;
		},

		/**
		 * @method
		 * @name disable
		 * @description Disables instance
		 * @example $(".target").naver("disable");
		 */
		disable: function() {
			return $(this).each(function(i, nav) {
				var data = $(nav).data("naver");

				if (data) {
					data.$nav.removeClass("enabled");
					data.$wrapper.css({ height: "" });
				}
			});
		},

		/**
		 * @method
		 * @name destroy
		 * @description Destroys instance
		 * @example $(".target").naver("destroy");
		 */
		destroy: function() {
			return $(this).each(function(i, nav) {
				var data = $(nav).data("naver");

				if (data) {
					data.$handle.remove();
					data.$container.contents()
								   .unwrap()
								   .unwrap();

					data.$nav.removeClass("enabled disabled naver " + data.customClass)
							 .off(".naver")
							 .removeData("naver");
				}
			});
		},

		/**
		 * @method
		 * @name enable
		 * @description Enables instance
		 * @example $(".target").naver("enable");
		 */
		enable: function() {
			return $(this).each(function(i, nav) {
				var data = $(nav).data("naver");

				if (data) {
					data.$nav.addClass("enabled");
					pub.close.apply(data.$nav);
				}
			});
		},

		/**
		 * @method
		 * @name open
		 * @description Opens instance
		 * @example $(".target").naver("open");
		 */
		open: function() {
			return $(this).each(function(i, nav) {
				var data = $(nav).data("naver");

				if (data && data.$nav.hasClass("enabled")) {
					data.$wrapper.css({
						height: data.$container.outerHeight(true)
					});
					if (data.label) {
						data.$handle.html(data.labels.open);
					}
					data.$nav.addClass("open")
							 .trigger("open.naver");
				}
			});
		}
	};

	/**
	 * @method private
	 * @name _init
	 * @description Initializes plugin
	 * @param opts [object] "Initialization options"
	 */
	function _init(opts) {
		// Settings
		opts = $.extend(true, {}, options, opts);

		// Apply to each element
		var $items = $(this);
		for (var i = 0, count = $items.length; i < count; i++) {
			_build($items.eq(i), opts);
		}
		return $items;
	}

	/**
	 * @method private
	 * @name _build
	 * @description Builds each instance
	 * @param $nav [jQuery object] "Target jQuery object"
	 * @param opts [object] <{}> "Options object"
	 */
	function _build($nav, opts) {
		if (!$nav.data("naver")) {
			// Extend Options
			opts = $.extend(true, {}, opts, $nav.data("naver-options"));

			var $handle = $nav.find(".naver-handle").length ? $nav.find(".naver-handle").detach() : $('<span class="naver-handle"></span>');

			$nav.addClass("naver " + opts.customClass)
				.wrapInner('<div class="naver-container"></div>')
				.wrapInner('<div class="naver-wrapper"></div>')
				.prepend($handle);

			var data = $.extend(true, {
				$nav: $nav,
				$container: $nav.find(".naver-container"),
				$wrapper: $nav.find(".naver-wrapper"),
				$handle: $nav.find(".naver-handle")
			}, opts);

			data.$handle.text((opts.label) ? opts.labels.closed : '');
			data.$nav.on("touchstart.naver", ".naver-handle", data, _onTouchStart)
					 .on("click.naver", ".naver-handle", data, _onClick)
					 .data("naver", data);


			// Navtive MQ Support
			if (window.matchMedia !== undefined) {
				data.mediaQuery = window.matchMedia("(max-width:" + (data.maxWidth === Infinity ? "100000px" : data.maxWidth) + ")");
				// Make sure we stay in context
				data.mediaQuery.addListener(function() {
					_onRespond.apply(data.$nav);
				});
				_onRespond.apply(data.$nav);
			}
		}
	}

	/**
	 * @method private
	 * @name _onTouchStart
	 * @description Handles touchstart to selected item
	 * @param e [object] "Event data"
	 */
	function _onTouchStart(e) {
		e.stopPropagation();

		var data = e.data;

		data.touchStartEvent = e.originalEvent;

		data.touchStartX = data.touchStartEvent.touches[0].clientX;
		data.touchStartY = data.touchStartEvent.touches[0].clientY;

		data.$nav.on("touchmove.naver", ".naver-handle", data, _onTouchMove)
				 .on("touchend.naver", ".naver-handle", data, _onTouchEnd);
	}

	/**
	 * @method private
	 * @name _onTouchMove
	 * @description Handles touchmove to selected item
	 * @param e [object] "Event data"
	 */
	function _onTouchMove(e) {
		var data = e.data,
			oe = e.originalEvent;

		if (Math.abs(oe.touches[0].clientX - data.touchStartX) > 10 || Math.abs(oe.touches[0].clientY - data.touchStartY) > 10) {
			data.$nav.off("touchmove.naver touchend.naver");
		}
	}

	/**
	 * @method private
	 * @name _onTouchEnd
	 * @description Handles touchend to selected item
	 * @param e [object] "Event data"
	 */
	function _onTouchEnd(e) {
		e.preventDefault();
		e.stopPropagation();

		var data = e.data;

		data.touchStartEvent.preventDefault();

		data.$nav.off("touchmove.naver touchend.naver click.naver");

		_onClick(e);
	}

	/**
	 * @method private
	 * @name _onClick
	 * @description Handles click nav click
	 * @param e [object] "Event data"
	 */
	function _onClick(e) {
		e.preventDefault();
		e.stopPropagation();

		var $target = $(e.currentTarget),
			data = e.data;

		// Close other open instances
		$(".naver").not(data.$nav)
				   .naver("close");

		if (data.$nav.hasClass("open")) {
			pub.close.apply(data.$nav);
		} else {
			pub.open.apply(data.$nav);
		}
	}

	/**
	 * @method private
	 * @name _onRespond
	 * @description Handles media query match change
	 */
	function _onRespond() {
		var data = $(this).data("naver");

		if (data.mediaQuery.matches) {
			pub.enable.apply(data.$nav);
		} else {
			pub.disable.apply(data.$nav);
		}
	}

	$.fn.naver = function(method) {
		if (pub[method]) {
			return pub[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return _init.apply(this, arguments);
		}
		return this;
	};

	$.naver = function(method) {
		if (method === "defaults") {
			pub.defaults.apply(this, Array.prototype.slice.call(arguments, 1));
		}
	};
})(jQuery, window);
/* 
 * Roller v3.2.5 - 2014-11-24 
 * A jQuery plugin for simple content carousels. Part of the Formstone Library. 
 * http://formstone.it/roller/ 
 * 
 * Copyright 2014 Ben Plum; MIT Licensed 
 */

;(function ($, window) {
	"use strict";

	/**
	 * @options
	 * @param autoAdvance [boolean] <false> "Flag to auto advance items"
	 * @param autoTime [int] <8000> "Auto advance time"
	 * @param autoWidth [boolean] <false> "Flag to fit items to viewport width"
	 * @param controls [boolean] <true> "Flag to draw controls"
	 * @param customClass [string] <''> "Class applied to instance"
	 * @param infinite [boolean] <false> "Flag for looping items"
	 * @param labels.next [string] <'Next'> "Control text"
	 * @param labels.previous [string] <'Previous'> "Control text"
	 * @param maxWidth [string] <'Infinity'> "Width at which to auto-disable plugin"
	 * @param minWidth [string] <'0'> "Width at which to auto-disable plugin"
	 * @param paged [boolean] <false> "Flag for paged items"
	 * @param pagination [boolean] <true> "Flag to draw pagination"
	 * @param single [boolean] <false> "Flag for single items"
	 * @param touchPaged [boolean] <true> "Flag for paged touch interaction"
	 * @param useMargin [boolean] <false> "Use margins instead of css transitions (legacy browser support)"
	 */
	var options = {
		autoAdvance: false,
		autoTime: 8000,
		autoWidth: false,
		controls: true,
		customClass: "",
		extraMargin: 0,
		infinite: false,
		labels: {
			next: "Next",
			previous: "Previous"
		},
		maxWidth: Infinity,
		minWidth: '0px',
		paged: false,
		pagination: true,
		single: false,
		touchPaged: true,
		useMargin: false
	};

	/**
	 * @events
	 * @event update.roller "Canister position updated"
	 */

	var pub = {

		/**
		 * @method
		 * @name defaults
		 * @description Sets default plugin options
		 * @param opts [object] <{}> "Options object"
		 * @example $.roller("defaults", opts);
		 */
		defaults: function(opts) {
			options = $.extend(options, opts || {});
		},

		/**
		 * @method
		 * @name destroy
		 * @description Removes instance of plugin
		 * @example $(".target").roller("destroy");
		 */
		destroy: function() {
			return $(this).each(function() {
				var data = $(this).data("roller");

				if (data) {
					_clearTimer(data.autoTimer);

					if (!data.single) {
						if (data.viewport) {
							data.$items.unwrap();
						}
						if (data.canister) {
							data.$items.unwrap();
						} else {
							data.$canister.attr("style", null);
						}
					}

					data.$items.removeClass("visible first");

					if (data.pagination) {
						data.$pagination.remove();
					}
					if (data.controls) {
						data.$controls.remove();
					}

					data.$roller.removeClass("roller enabled " + (data.single ? "single " : "") + data.customClass)
								.off(".roller")
								.data("roller", null);
				}
			});
		},

		/**
		 * @method
		 * @name disable
		 * @description Disables instance of plugin
		 * @example $(".target").roller("disable");
		 */
		disable: function() {
			return $(this).each(function() {
				var data = $(this).data("roller");

				if (data && data.enabled) {
					_clearTimer(data.autoTimer);

					data.enabled = false;

					data.$roller.removeClass("enabled")
								.off("touchstart.roller click.roller");

					data.$canister.attr("style", "")
								  .css( _prefix("transition", "none") )
								  .off("touchstart.roller");

					data.$controls.removeClass("visible");
					data.$pagination.removeClass("visible")
									.html("");

					if (data.useMargin) {
						data.$canister.css({ marginLeft: "" });
					} else {
						data.$canister.css( _prefix("transform", "translate3d(0px, 0, 0)") );
					}

					data.index = 0;
				}
			});
		},

		/**
		 * @method
		 * @name enable
		 * @description Enables instance of plugin
		 * @example $(".target").roller("enable");
		 */
		enable: function() {
			return $(this).each(function() {
				var data = $(this).data("roller");

				if (data && !data.enabled) {
					data.enabled = true;

					data.$roller.addClass("enabled")
								.on("touchstart.roller click.roller", ".roller-control", data, _onAdvance)
								.on("touchstart.roller click.roller", ".roller-page", data, _onSelect);

					data.$canister.css( _prefix("transition", "") );

					pub.resize.apply(data.$roller);

					if (!data.single) {
						data.$canister.on("touchstart.roller", data, _onTouchStart);
					}
				}
			});
		},

		/**
		 * @method
		 * @name jump
		 * @description Jump instance of plugin to specific page
		 * @example $(".target").roller("jump", 1);
		 */
		jump: function(index) {
			return $(this).each(function() {
				var data = $(this).data("roller");

				if (data && data.enabled) {
					_clearTimer(data.autoTimer);
					_position(data, index-1);
				}
			});
		},

		/**
		 * @method
		 * @name resize
		 * @description Resizes each instance
		 * @example $(".target").roller("resize");
		 */
		resize: function() {
			return $(this).each(function() {
				var data = $(this).data("roller"),
					i,
					$i;

				if (data && data.enabled) {
					data.count = data.$items.length;

					if (data.count < 1) { // avoid empty rollers
						return;
					}

					data.$roller.removeClass("animated");
					data.$items.removeClass("visible first");

					data.viewportWidth = data.$viewport.outerWidth(false);

					// auto width
					if (data.autoWidth) {
						// autowidth = paged
						data.paged = true;
						data.$items.css({ width: data.viewportWidth });
					}

					// Cache items
					data.items = [];
					for (i = 0; i < data.count; i++) {
						$i = data.$items.eq(i);
						data.items.push({
							$item:    $i,
							width:    $i.outerWidth(true),
							position: $i.position()
						});
					}

					if (data.single) {
						// single
						data.perPage = 1;
						data.pageCount = data.count - 1;
					} else {

						data.canisterWidth = 0;
						for (i = 0; i < data.count; i++) {
							data.canisterWidth += data.items[i].width;
						}

						if (data.paged) {
							// paged
							data.perPage = 1;
							data.pageCount = (data.canisterWidth > data.viewportWidth) ? data.count - 1 : 0;
						} else {
							data.perPage = 1;
							data.pageCount = 0;
							// initial page
							data.pages = [{
								left: 0
							}];

							var totalWidth = data.extraMargin,
								pageWidth = totalWidth,
								pageStart = 0,
								pageEnd = 0;

							for (i = 0; i < data.count; i++) {
								pageWidth += data.items[i].width;

								// if this item won't fit, reset
								if (pageWidth > data.viewportWidth) {
									// create new page
									data.pages.push({
										left: totalWidth
									});

									// cache page items
									data.pages[ data.pageCount ].$items = data.$items.slice(pageStart, pageEnd);
									data.pageCount++;

									// current page width
									pageWidth = data.extraMargin + data.items[i].width;
									pageStart = i;
								}
								pageEnd++;

								totalWidth += data.items[i].width;
							}

							// cache last page items
							data.pages[ data.pageCount ].$items = data.$items.slice(pageStart, pageEnd);
						}
					}

					// NEW
					data.canisterWidth += data.extraMargin;

					if (data.single || data.paged) {
						data.maxMove = -data.canisterWidth + data.viewportWidth - data.extraMargin;
					} else {
						data.maxMove = -data.pages[ data.pageCount ].left;
					}

					console.log(data);

					if (data.maxMove >= 0) {
						data.maxMove = 0;
						data.pageCount = 0; // hope this works :P
					}

					// Reset Page Count
					if (data.pageCount !== Infinity) {
						var html = '';
						for (var j = 0; j <= data.pageCount; j++) {
							html += '<span class="roller-page">' + (j + 1) + '</span>';
						}
						data.$pagination.html(html);
					}

					// update pagination
					if (data.pageCount < 1) {
						data.$controls.removeClass("visible");
						data.$pagination.removeClass("visible");
					} else {
						data.$controls.addClass("visible");
						data.$pagination.addClass("visible");
					}
					data.$paginationItems = data.$roller.find(".roller-page");

					// update canister
					if (!data.single) {
						data.$canister.css({ width: data.canisterWidth });
					}

					// update item positions
					for (i = 0; i < data.count; i++) {
						data.items[i].position = data.$items.eq(i).position();
					}

					_position(data, _calculateIndex(data), false);

					data.$roller.addClass("animated");
				}
			});
		},

		/**
		 * @method
		 * @name reset
		 * @description Resets instance after item change
		 * @example $(".target").roller("reset");
		 */
		reset: function() {
			return $(this).each(function() {
				var data = $(this).data("roller");

				if (data && data.enabled) {
					data.$items = data.$roller.find(".roller-item");
					pub.resize.apply(data.$roller);
				}
			});
		},

		/**
		 * @method private (for now)
		 * @name set
		 * @description Set option for instances
		 * @example $(".target").roller("set", "option", "value");
		 */
		set: function(option, value) {
			return $(this).each(function() {
				var data = $(this).data("roller");

				if (data && data[option]) {
					data[option] = value;
				}
			});
		}
	};

	/**
	 * @method private
	 * @name _init
	 * @description Initializes plugin
	 * @param opts [object] "Initialization options"
	 */
	function _init(opts) {
		// Settings
		opts = $.extend({}, options, opts);

		// Apply to each element
		var $items = $(this);
		for (var i = 0, count = $items.length; i < count; i++) {
			_build($items.eq(i), opts);
		}

		return $items;
	}

	/**
	 * @method private
	 * @name _build
	 * @description Builds each instance
	 * @param $roller [jQuery object] "Target jQuery object"
	 * @param opts [object] <{}> "Options object"
	 */
	function _build($roller, opts) {
		if (!$roller.data("roller")) {
			opts = $.extend({}, opts, $roller.data("roller-options"));

			// Legacy browser support
			if (!opts.useMargin && !_getTransform3DSupport()) {
				opts.useMargin = true;
			}

			if (!opts.single) {
				// Verify viewport and canister are available
				if (!$roller.find(".roller-viewport").length) {
					$roller.wrapInner('<div class="roller-viewport"></div>');
					opts.viewport = true;
				}
				if (!$roller.find(".roller-canister").length) {
					$roller.find(".roller-viewport")
						   .wrapInner('<div class="roller-canister"></div>');
					opts.canister = true;
				}
			}

			// Build controls and pagination
			var html = '';
			if (opts.controls && !$roller.find(".roller-controls").length) {
				html += '<div class="roller-controls">';
				html += '<span class="roller-control previous">' + opts.labels.previous + '</span>';
				html += '<span class="roller-control next">' + opts.labels.next + '</span>';
				html += '</div>';
			}
			if (opts.pagination && !$roller.find(".roller-pagination").length) {
				html += '<div class="roller-pagination">';
				html += '</div>';
			}

			// Modify target
			$roller.addClass("roller " + (opts.single ? "single " : "") + opts.customClass)
				   .append(html);

			var data = $.extend({}, {
				$roller: $roller,
				$viewport: $roller.find(".roller-viewport").eq(0),
				$canister: $roller.find(".roller-canister").eq(0),
				$captions: $roller.find(".roller-captions").eq(0),
				$controls: $roller.find(".roller-controls").eq(0),
				$pagination: $roller.find(".roller-pagination").eq(0),
				index: 0,
				deltaX: null,
				deltaY: null,
				leftPosition: 0,
				xStart: 0,
				yStart: 0,
				enabled: false,
				touchstart: 0,
				touchEnd: 0,
				touchTimer: null,
				hasTouched: false
			}, opts);

			data.$items = (data.single) ? data.$roller.find(".roller-item") : data.$canister.children(".roller-item");
			data.$captionItems = data.$captions.find(".roller-caption");
			data.$controlItems = data.$controls.find(".roller-control");
			data.$paginationItems = data.$pagination.find(".roller-page");
			data.$images = data.$canister.find("img");

			data.totalImages = data.$images.length;

			$roller.data("roller", data);

			// Navtive MQ Support
			if (window.matchMedia !== undefined) {
				data.maxWidth = data.maxWidth === Infinity ? "100000px" : data.maxWidth;
				data.mediaQuery = window.matchMedia("(min-width:" + data.minWidth + ") and (max-width:" + data.maxWidth + ")");
				// Make sure we stay in context
				data.mediaQuery.addListener(function() {
					_onRespond.apply(data.$roller);
				});
				_onRespond.apply(data.$roller);
			}

			// Watch images
			if (data.totalImages > 0) {
				data.loadedImages = 0;
				for (var i = 0; i < data.totalImages; i++) {
					var $img = data.$images.eq(i);
					$img.one("load.roller", data, _onImageLoad);
					if ($img[0].complete || $img[0].height) {
						$img.trigger("load.roller");
					}
				}
			}

			// Auto timer
			if (data.autoAdvance || data.auto) { // backwards compatibility
				data.autoTimer = _startTimer(data.autoTimer, data.autoTime, function() {
					_autoAdvance(data);
				}, true);
			}
		}
	}

	/**
	 * @method private
	 * @name _onImageLoad
	 * @description Handles child image load
	 * @param e [object] "Event data"
	 */
	function _onImageLoad(e) {
		var data = e.data;
		data.loadedImages++;
		if (data.loadedImages === data.totalImages) {
			pub.resize.apply(data.$roller);
		}
	}

	/**
	 * @method private
	 * @name _onTouchStart
	 * @description Handles touchstart event
	 * @param e [object] "Event data"
	 */
	function _onTouchStart(e) {
		e.stopPropagation();

		var data = e.data;

		_clearTimer(data.autoTimer);

		data.touchStart = new Date().getTime();
		data.$canister.css( _prefix("transition", "none") );

		var touch = (typeof e.originalEvent.targetTouches !== "undefined") ? e.originalEvent.targetTouches[0] : null;
		data.xStart = (touch) ? touch.pageX : e.clientX;
		data.yStart = (touch) ? touch.pageY : e.clientY;

		data.$canister.on("touchmove.roller", data, _onTouchMove)
					  .one("touchend.roller touchcancel.roller", data, _onTouchEnd);
	}

	/**
	 * @method private
	 * @name _onTouchMove
	 * @description Handles touchmove event
	 * @param e [object] "Event data"
	 */
	function _onTouchMove(e) {
		e.stopPropagation();

		var data = e.data,
			touch = (typeof e.originalEvent.targetTouches !== "undefined") ? e.originalEvent.targetTouches[0] : null;

		data.deltaX = data.xStart - ((touch) ? touch.pageX : e.clientX);
		data.deltaY = data.yStart - ((touch) ? touch.pageY : e.clientY);

		if (data.deltaX < -10 || data.deltaX > 10) {
			e.preventDefault();
		}

		data.touchLeft = data.leftPosition - data.deltaX;
		if (data.touchLeft > 0) {
			data.touchLeft = 0;
		}
		if (data.touchLeft < data.maxMove) {
			data.touchLeft = data.maxMove;
		}

		if (data.useMargin) {
			data.$canister.css({ marginLeft: data.touchLeft });
		} else {
			data.$canister.css( _prefix("transform", "translate3d("+data.touchLeft+"px, 0, 0)") );
		}
	}

	/**
	 * @method private
	 * @name _onTouchEnd
	 * @description Handles touchend event
	 * @param e [object] "Event data"
	 */
	function _onTouchEnd(e) {
		var data = e.data;

		data.touchEnd = new Date().getTime();
		data.leftPosition = data.touchLeft;
		data.$canister.css( _prefix("transition", "") );

		data.$canister.off("touchmove.roller touchend.roller touchcancel.roller");

		// only update index if we actually moved
		var index = (data.deltaX > -10 && data.deltaX < 10) ? data.index : _calculateIndex(data);

		if (data.touchPaged && !data.swipe) {
			_position(data, index);
		} else {
			data.index = index;
			_updateControls(data);
		}
		data.deltaX = null;
		data.touchStart = 0;
		data.touchEnd = 0;
	}

	/**
	 * @method private
	 * @name _autoAdvance
	 * @description Handles auto advancement
	 * @param data [object] "Instance data"
	 */
	function _autoAdvance(data) {
		var index = data.index + 1;
		if (index > data.pageCount) {
			index = 0;
		}
		_position(data, index);
	}

	/**
	 * @method private
	 * @name _onAdvance
	 * @description Handles item advancement
	 * @param e [object] "Event data"
	 */
	function _onAdvance(e) {
		e.preventDefault();
		e.stopPropagation();

		var data = e.data,
			index = data.index + (($(e.currentTarget).hasClass("next")) ? 1 : -1);

		if (!data.hasTouched) {
			_clearTimer(data.autoTimer);
			_position(data, index);
		}

		if (e.type === "touchstart") {
			data.hasTouched = true;
			data.touchTimer = _startTimer(data.touchTimer, 500, function() {
				data.hasTouched = false;
			});
		}
	}

	/**
	 * @method private
	 * @name _onSelect
	 * @description Handles item select
	 * @param e [object] "Event data"
	 */
	function _onSelect(e) {
		e.preventDefault();
		e.stopPropagation();

		var data = e.data,
			index = data.$paginationItems.index($(e.currentTarget));

		_clearTimer(data.autoTimer);
		_position(data, index);
	}

	/**
	 * @method private
	 * @name _position
	 * @description Handles updating instance position
	 * @param data [object] "Instance data"
	 * @param index [int] "Item index"
	 */
	function _position(data, index, animate) {
		if (index < 0) {
			index = (data.infinite) ? data.pageCount : 0;
		}
		if (index > data.pageCount) {
			index = (data.infinite) ? 0 : data.pageCount;
		}

		if (data.single) {
			data.$items.removeClass("active")
					   .eq(index)
					   .addClass("active");
		} else {
			if (data.paged) {
				data.leftPosition = -data.items[index].position.left;
			} else {
				data.leftPosition = -data.pages[index].left + data.extraMargin;
			}

			if (data.leftPosition < data.maxMove) {
				data.leftPosition = data.maxMove;
			}

			if (data.leftPosition > 0) {
				data.leftPosition = 0;
			}

			if (isNaN(data.leftPosition)) {
				data.leftPosition = 0;
			}

			if (data.useMargin) {
				data.$canister.css({ marginLeft: data.leftPosition });
			} else {
				if (animate === false) {
					data.$canister.css( _prefix("transition", "none") )
								  .css( _prefix("transform", "translate3d("+data.leftPosition+"px, 0, 0)") );

					// Slight delay before adding transitions backs
					data.resizeTimer = _startTimer(data.resizeTimer, 5, function() {
						data.$canister.css( _prefix("transition", "") );
					}, false);
				} else {
					data.$canister.css( _prefix("transform", "translate3d("+data.leftPosition+"px, 0, 0)") );
				}
			}

			// Update classes
			data.$items.removeClass("visible first");
			if (data.paged) {
				data.$items.eq(index).addClass("visible");
			} else {
				data.pages[index].$items.addClass("visible");
			}
			data.$items.filter(".visible").eq(0).addClass("first");
		}

		if (animate !== false && index !== data.index && (data.infinite || (index > -1 && index <= data.pageCount)) ) {
			data.$roller.trigger("update.roller", [ index ]);
			data.index = index;
		}

		_updateControls(data);
	}

	/**
	 * @method private
	 * @name _updateControls
	 * @description Handles updating instance controls
	 * @param data [object] "Instance data"
	 */
	function _updateControls(data) {
		data.$captionItems.filter(".active").removeClass("active");
		data.$captionItems.eq(data.index).addClass("active");

		data.$paginationItems.filter(".active").removeClass("active");
		data.$paginationItems.eq(data.index).addClass("active");

		if (data.infinite) {
			data.$controlItems.addClass("enabled");
		} else if (data.pageCount < 1) {
			data.$controlItems.removeClass("enabled");
		} else {
			data.$controlItems.addClass("enabled");
			if (data.index <= 0) {
				data.$controlItems.filter(".previous").removeClass("enabled");
			} else if (data.index >= data.pageCount || data.leftPosition === data.maxMove) {
				data.$controlItems.filter(".next").removeClass("enabled");
			}
		}
	}

	/**
	 * @method private
	 * @name _onRespond
	 * @description Handles media query match change
	 */
	function _onRespond() {
		var data = $(this).data("roller");

		if (data.mediaQuery.matches) {
			pub.enable.apply(data.$roller);
		} else {
			pub.disable.apply(data.$roller);
		}
	}

	/**
	 * @method private
	 * @name _calculateIndex
	 * @description Determines new index based on current position
	 * @param data [object] "Instance data"
	 * @return [int] "New item index"
	 */
	function _calculateIndex(data) {
		if (data.single) {
			return data.index;
		} if ((data.deltaX > 20 || data.deltaX < -20) && (data.touchStart && data.touchEnd) && data.touchEnd - data.touchStart < 200) {
			// Swipe
			return data.index + ((data.deltaX > 0) ? 1 : -1);
		} else if (data.paged) {
			// Find page
			var goal = Infinity;
			if (data.leftPosition === data.maxMove) {
				return data.$items.length - 1;
			} else {
				var index = 0;
				data.$items.each(function(i) {
					var offset = $(this).position(),
						check = offset.left + data.leftPosition;

					if (check < 0) {
						check = -check;
					}

					if (check < goal) {
						goal = check;
						index = i;
					}
				});
				return index;
			}
		} else {
			// Free scrolling
			return Math.round( -data.leftPosition / data.viewportWidth);
		}
	}

	/**
	 * @method private
	 * @name _prefix
	 * @description Builds vendor-prefixed styles
	 * @param property [string] "Property to prefix"
	 * @param value [string] "Property value"
	 * @return [string] "Vendor-prefixed styles"
	 */
	function _prefix(property, value) {
		var r = {};

		r["-webkit-" + property] = value;
		r[   "-moz-" + property] = value;
		r[    "-ms-" + property] = value;
		r[     "-o-" + property] = value;
		r[             property] = value;

		return r;
	}

	/**
	 * @method private
	 * @name _startTimer
	 * @description Starts an internal timer
	 * @param timer [int] "Timer ID"
	 * @param time [int] "Time until execution"
	 * @param callback [int] "Function to execute"
	 * @param interval [boolean] "Flag for recurring interval"
	 */
	function _startTimer(timer, time, func, interval) {
		_clearTimer(timer, interval);
		if (interval === true) {
			return setInterval(func, time);
		} else {
			return setTimeout(func, time);
		}
	}

	/**
	 * @method private
	 * @name _clearTimer
	 * @description Clears an internal timer
	 * @param timer [int] "Timer ID"
	 */
	function _clearTimer(timer) {
		if (timer !== null) {
			clearInterval(timer);
			timer = null;
		}
	}

	/**
	 * @method private
	 * @name _getTransform3DSupport
	 * @description Determines if transforms are support
	 * @return [boolean] "True if transforms supported"
	 */
	function _getTransform3DSupport() {
		/* http://stackoverflow.com/questions/11628390/how-to-detect-css-translate3d-without-the-webkit-context */
		/*
		var prop = "transform",
			val = "translate3d(0px, 0px, 0px)",
			test = /translate3d\(0px, 0px, 0px\)/g,
			$div = $("<div>");

		$div.css(_prefix(prop, val));
		var check = $div[0].style.cssText.match(test);

		return (check !== null && check.length > 0);
		*/

		/* http://stackoverflow.com/questions/5661671/detecting-transform-translate3d-support/12621264#12621264 */
		var el = document.createElement('p'),
			has3d,
			transforms = {
				'webkitTransform':'-webkit-transform',
				'OTransform':'-o-transform',
				'msTransform':'-ms-transform',
				'MozTransform':'-moz-transform',
				'transform':'transform'
			};

		document.body.insertBefore(el, null);
		for (var t in transforms) {
			if (el.style[t] !== undefined) {
				el.style[t] = "translate3d(1px,1px,1px)";
				has3d = window.getComputedStyle(el).getPropertyValue(transforms[t]);
			}
		}
		document.body.removeChild(el);

		return (has3d !== undefined && has3d.length > 0 && has3d !== "none");
	}


	$.fn.roller = function(method) {
		if (pub[method]) {
			return pub[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return _init.apply(this, arguments);
		}
		return this;
	};

	$.roller = function(method) {
		if (method === "defaults") {
			pub.defaults.apply(this, Array.prototype.slice.call(arguments, 1));
		}
	};
})(jQuery, window);
/* 
 * Shifter v3.1.2 - 2014-10-28 
 * A jQuery plugin for simple slide-out mobile navigation. Part of the Formstone Library. 
 * http://formstone.it/shifter/ 
 * 
 * Copyright 2014 Ben Plum; MIT Licensed 
 */

;(function ($, window) {
	"use strict";

	var namespace = "shifter",
		initialized = false,
		hasTouched = false,
		data = {},
		classes = {
			handle: "shifter-handle",
			page: "shifter-page",
			header: "shifter-header",
			navigation: "shifter-navigation",
			isEnabled: "shifter-enabled",
			isOpen: "shifter-open"
		},
		events = {
			click: "touchstart." + namespace + " click." + namespace
		};

	/**
	 * @options
	 * @param maxWidth [string] <'980px'> "Width at which to auto-disable plugin"
	 */
	var options = {
		maxWidth: "980px"
	};

	var pub = {

		/**
		 * @method
		 * @name close
		 * @description Closes navigation if open
		 * @example $.shifter("close");
		 */
		close: function() {
			if (initialized) {
				data.$html.removeClass(classes.isOpen);
				data.$body.removeClass(classes.isOpen);
				data.$shifts.off( classify(namespace) );
				// Close mobile keyboard if open
				data.$nav.find("input").trigger("blur");
			}
		},

		/**
		 * @method
		 * @name enable
		 * @description Enables navigation system
		 * @example $.shifter("enable");
		 */
		enable: function() {
			if (initialized) {
				data.$body.addClass(classes.isEnabled);
			}
		},

		/**
		 * @method
		 * @name destroy
		 * @description Removes instance of plugin
		 * @example $.shifter("destroy");
		 */
		destroy: function() {
			if (initialized) {
				data.$html.removeClass(classes.isOpen);
				data.$body.removeClass( [classes.isEnabled, classes.isOpen].join(" ") )
					      .off(events.click);

				// Navtive MQ Support
				if (window.matchMedia !== undefined) {
					data.mediaQuery.removeListener(onRespond);
				}

				data = {};
				initialized = false;
			}
		},

		/**
		 * @method
		 * @name disable
		 * @description Disables navigation system
		 * @example $.shifter("disable");
		 */
		disable: function() {
			if (initialized) {
				pub.close();
				data.$body.removeClass(classes.isEnabled);
			}
		},

		/**
		 * @method
		 * @name open
		 * @description Opens navigation if closed
		 * @example $.shifter("open");
		 */
		open: function() {
			if (initialized) {
				data.$html.addClass(classes.isOpen);
				data.$body.addClass(classes.isOpen);
				data.$shifts.one(events.click, onClick);
			}
		}
	};

	/**
	 * @method private
	 * @name init
	 * @description Initializes plugin
	 * @param opts [object] "Initialization options"
	 */
	function init(opts) {
		if (!initialized) {
			data = $.extend({}, options, opts || {});

			data.$html = $("html");
			data.$body = $("body");
			data.$shifts = $( [classify(classes.page), classify(classes.header)].join(", ") );
			data.$nav = $( classify(classes.navigation) );

			if (data.$shifts.length > 0 && data.$nav.length > 0) {
				initialized = true;

				data.$body.on(events.click, classify(classes.handle), onClick);

				// Navtive MQ Support
				if (window.matchMedia !== undefined) {
					data.mediaQuery = window.matchMedia("(max-width:" + (data.maxWidth === Infinity ? "100000px" : data.maxWidth) + ")");
					data.mediaQuery.addListener(onRespond);
					onRespond();
				}
			}
		}
	}

	/**
	 * @method private
	 * @name onRespond
	 * @description Handles media query match change
	 */
	function onRespond() {
		if (data.mediaQuery.matches) {
			pub.enable();
		} else {
			pub.disable();
		}
	}

	/**
	 * @method private
	 * @name onClick
	 * @description Determines proper click / touch action
	 * @param e [object] "Event data"
	 */
	function onClick(e) {
		e.preventDefault();
		e.stopPropagation();

		if (!hasTouched) {
			if (data.$body.hasClass(classes.isOpen)) {
				pub.close();
			} else {
				pub.open();
			}
		}

		if (e.type === "touchstart") {
			hasTouched = true;

			setTimeout(resetTouch, 500);
		}
	}

	/**
	 * @method private
	 * @name resetTouch
	 * @description Resets touch state
	 */
	function resetTouch() {
		hasTouched = false;
	}

	/**
	 * @method private
	 * @name classify
	 * @description Create class selector from text
	 * @param text [string] "Text to convert"
	 * @return [string] "New class name"
	 */
	function classify(text) {
		return "." + text;
	}

	$[namespace] = function(method) {
		if (pub[method]) {
			return pub[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return init.apply(this, arguments);
		}
		return this;
	};
})(jQuery, window);
/*
 * Tabber v3.0.12 - 2014-11-25
 * A jQuery plugin for adding simple tabbed interfaces. Part of the Formstone Library.
 * http://formstone.it/tabber/
 *
 * Copyright 2014 Ben Plum; MIT Licensed
 */

;(function ($, window) {
	"use strict";

	/**
	 * @options
	 * @param customClass [string] <''> "Class applied to instance"
	 * @param maxWidth [string] <'980px'> "Width at which to auto-disable mobile styles"
	 * @param vertical [boolean] <false> "Flag to draw vertical tab set"
	 */
	var options = {
		customClass: "",
		maxWidth: "767px",
		vertical: false
	};

	/**
	 * @events
	 * @event update.tabber "Active tab updated"
	 */

	var pub = {

		/**
		 * @method
		 * @name defaults
		 * @description Sets default plugin options
		 * @param opts [object] <{}> "Options object"
		 * @example $.tabber("defaults", opts);
		 */
		defaults: function(opts) {
			options = $.extend(options, opts || {});
			return (typeof this === 'object') ? $(this) : true;
		},

		/**
		 * @method
		 * @name destroy
		 * @description Removes instance of plugin
		 * @example $(".target").tabber("destroy");
		 */
		destroy: function() {
			return $(this).each(function(i) {
				var data = $(this).data("tabber");

				if (data) {
					if (window.matchMedia !== undefined) {
						data.mediaQuery.removeListener(data.mediaQueryListener);
					}

					data.$mobileHandles.remove();
					data.$tabber.removeClass("tabber initialized " + data.customClass)
							    .off(".tabber")
							    .data("tabber", null);
				}
			});
		},

		/**
		 * @method
		 * @name select
		 * @description Activates the specified tab
		 * @param index [int] "Index to activate"
		 * @example $(".target").tabber("select", 1);
		 */
		select: function(index) {
			return $(this).each(function(i) {
				var data = $(this).data("tabber");

				if (data) {
					_set(data, index - 1);
				}
			});
		}
	};

	/**
	 * @method private
	 * @name _init
	 * @description Initializes plugin
	 * @param opts [object] "Initialization options"
	 */
	function _init(opts) {
		// Local options
		opts = $.extend({}, options, opts || {});

		// Apply to each element
		var $items = $(this);
		for (var i = 0, count = $items.length; i < count; i++) {
			_build($items.eq(i), opts);
		}
		return $items;
	}

	/**
	 * @method private
	 * @name _build
	 * @description Builds each instance
	 * @param $select [jQuery object] "Target jQuery object"
	 * @param opts [object] <{}> "Options object"
	 */
	function _build($tabber, opts) {
		if (!$tabber.data("tabber")) {
			// Extend Options
			opts = $.extend({}, opts, $tabber.data("tabber-options"));

			$tabber.addClass("tabber " + opts.customClass + (opts.vertical ? " vertical" : ""));

			var data = $.extend({
				$tabber: $tabber,
				$tabs: $tabber.find(".tabber-tab"),
				$handles: $tabber.find(".tabber-handle"),
				index: -1
			}, opts);

			var index = data.$handles.index( data.$handles.filter(".active") );

			for (var i = 0, count = data.$handles.length; i < count; i++) {
				data.$tabs.eq(i).before('<span class="tabber-handle mobile">' + data.$handles.eq(i).text() + '</span>');
			}
			data.$mobileHandles = $tabber.find(".tabber-handle.mobile");

			$tabber.addClass("initialized")
				   .on("click.tabber", ".tabber-handle", data, _onClick)
				   .data("tabber", data);

			// Navtive MQ Support
			if (window.matchMedia !== undefined) {
				data.mediaQuery = window.matchMedia("(max-width:" + (data.maxWidth === Infinity ? "100000px" : data.maxWidth) + ")");

				// Make sure we stay in context
				data.mediaQueryListener = function() {
					_onRespond.apply(data.$tabber);
				};
				data.mediaQuery.addListener(data.mediaQueryListener);

				_onRespond.apply(data.$tabber);
			}

			_set(data, ((index > -1) ? index : 0) );
		}
	}

	/**
	 * @method private
	 * @name _onClick
	 * @description Handles click event on tab
	 * @param e [object] "Event data"
	 */
	function _onClick(e) {
		e.preventDefault();
		e.stopPropagation();

		var $target = $(this),
			data = e.data,
			index = ($target.hasClass("mobile")) ? data.$mobileHandles.index($target) : data.$handles.index($target);

		_set(data, index);
	}

	/**
	 * @method private
	 * @name _set
	 * @description Sets the active tab
	 * @param e [object] "Event data"
	 */
	function _set(data, index) {
		if (index !== data.index) {
			if (index < 0) {
				index = 0;
			}
			if (index > data.$tabs.length) {
				index = data.$tabs.length - 1;
			}

			data.index = index;
			data.$tabs.removeClass("active")
					  .eq(index)
					  .addClass("active");

			_update(data);
		}
	}

	/**
	 * @method private
	 * @name _update
	 * @description Updates the active handle
	 * @param data [object] "Instance data"
	 */
	function _update(data) {
		data.$handles.removeClass("active")
					 .eq(data.index)
					 .addClass("active");

		data.$mobileHandles.removeClass("active")
						   .eq(data.index)
						   .addClass("active");

		data.$tabber.trigger("update.tabber", [ data.index ]);
	}

	/**
	 * @method private
	 * @name _onRespond
	 * @description Handles media query match change
	 */
	function _onRespond() {
		var data = $(this).data("tabber");

		if (data.mediaQuery.matches) {
			data.$tabber.addClass("mobile");
		} else {
			data.$tabber.removeClass("mobile");
		}

		_update(data);
	}

	$.fn.tabber = function(method) {
		if (pub[method]) {
			return pub[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return _init.apply(this, arguments);
		}
		return this;
	};

	$.tabber = function(method) {
		if (method === "defaults") {
			pub.defaults.apply(this, Array.prototype.slice.call(arguments, 1));
		}
	};
})(jQuery, this);
$(document).ready(function() {

	// add js class to body if javascript enabled
	$('html').removeClass('no-js');

	// Shifter
	$.shifter({
		maxWidth: "767px"
	});

	// Naver
	$(".naver").naver();

	// Boxer - Lightbox
	$(".boxer").boxer();

	// Roller - Carousel
	$(".target").roller({
		paged: true,
		pagination: false
	});

	$('.pulse-panel').slick({
		lazyLoad: 'ondemand',
		infinite: false,
		slidesToShow: 4,
		slidesToScroll: 4,
		speed: 900,
		responsive: [
	    {
	      breakpoint: 980,
	      settings: {
				lazyLoad: 'ondemand',
				infinite: false,
				slidesToShow: 3,
				slidesToScroll: 3
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
				lazyLoad: 'ondemand',
				slidesToShow: 2,
				slidesToScroll: 2,
				infinite: true
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
				lazyLoad: 'ondemand',
				slidesToShow: 1,
				slidesToScroll: 1,
				infinite: true
	      }
	    }
	  ]
	});


});
