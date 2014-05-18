// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.qtip.min
//= require bootstrap.min

$(document).ready(function() {

	$('.item-qtip').qtip({
		content: {
			attr: 'mesg'
		},
		position: {
			my: 'top center',
			at: 'bottom center',
			target: '.item-qtip',
			adjust: {
				y: 10
			}
		},
		style: {
			tip: {
            corner: true,
            height: 24
			},
			classes: 'qtip-light qtip-blue qtip-shadow'
		}
	});

	$(document.body).delegate('.groups .items li.item-qtip', 'click', function(event) {
		event.preventDefault();
		var self = this;
		if ($(this).hasClass('disable')) {
			return false;
		}

		var related_items = eval($(self).data('related-items'));
		
		if($(self).hasClass('active')) {
			$(self).removeClass('active').removeClass('disable');
			$(".groups .items li.item-qtip").removeClass('disable');

			$('.groups .items li.item-qtip.active').each(function() {
				var related_items_active = eval($(self).data('related-items'));
				if($.inArray(parseInt($(this).data('item-id')), related_items_active) < 0 && this != self ) {
					$(this).addClass('disable');		
					$(this).parent('.items').find('li.item-qtip:not(' + $(this) + ')').addClass('disable');
					for (var i = 0; i < related_items_active.length; i++) {
						$('.groups .items li.item-qtip[data-item-id=' + related_items_active[i] + ']').removeClass('disable');
					}
				}
			});
		}else {
			$(".groups .items li.item-qtip").each(function(){
				if($.inArray(parseInt($(this).data('item-id')), related_items) < 0 && this != self ) {
					$(self).addClass('active');
					$(this).addClass('disable');		
				}
			});
		}	

	});

});

