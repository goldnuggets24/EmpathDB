$(document).ready ->
	# open/close drawer
	$('.drawer').drawer desktopEvent: 'click'
	# slider functions
	$('#ex1').slider
		min: 1
		max: 4
		formatter: (value) ->
			if value == 1
				return 'One Day'
			if value == 2
				return 'One Week'
			if value == 3
				return 'One Month'
			if value == 4
				return 'One Year'

	$('#ex1').slider().on 'slideStop', (ev) ->
		newVal = $('#ex1').data('slider').getValue()
		$.ajax
			type: 'GET'
			url: window.location.pathname
			dataType: 'html'
			data:
				value: newVal
			success: (data) ->
				$('.networkImage').replaceWith $('.networkImage', data)
				$('.script').replaceWith $('.script', data)

	#click Circle Zero Options
	$('.zero').on 'click', -> 
		alert('Insert Options Here')