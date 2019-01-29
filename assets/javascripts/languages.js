// Waits for the DOM to be ready
document.addEventListener('DOMContentLoaded', function() {
	// Attach to the proper select tag
	const langTag = document.getElementById('lang');
	const timeTag = document.getElementById('time');

	// If a sort not has been selected,
	if (getCookie('lang') == null) {
		// select the default option.
		langTag.value = '';
	} else {
		// Otherwise, select the respective option.
		langTag.value = getCookie('lang');
	}

	// Likewise, for the time...
	if (getCookie('time') == null) {
		// select the default option.
		timeTag.value = 'daily';
	} else {
		// Otherwise, select the respective option.
		timeTag.value = getCookie('time');
	}

	// And if the user picks a different sort,
	langTag.addEventListener('change', function() {
		// Set a cookie with the selected language,
		document.cookie = `lang=${langTag.value}`;

		// and reload.
		location.reload();
	});

	// Again, for the time this time.
	timeTag.addEventListener('change', function() {
		// Set a cookie with the selected time,
		document.cookie = `time=${timeTag.value}`;

		// and reload.
		location.reload();
	});
}, false);

// Simply gets the proper cookie by name, see https://stackoverflow.com/a/15724300
function getCookie(name) {
	var value = "; " + document.cookie;
	var parts = value.split("; " + name + "=");
	if (parts.length == 2) return parts.pop().split(";").shift();
}
