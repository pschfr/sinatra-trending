// This file is a library of small functions that format data,
// used in conjunction with Bootstrap Table.

// Formats numbers with commas, see https://stackoverflow.com/a/32154217
function comma_formatter(value) {
	var nf = new Intl.NumberFormat();
	return nf.format(value);
}

// This takes in "pschfr/sinatra-trending", and outputs a link to that user.
function name_to_avatar_img(project_name) {
	// Drops everything before the slash
	var username = project_name.split('/')[0].trim();
	// Create a link to the GitHub user account with an image URL for the avatar for that user
	return `
		<a href="https://github.com/${username}" target="_blank" title="Link to ${username} on GitHub">
			<img src="https://github.com/${username}.png?size=150" alt="Image of ${username}" class="avatar" />
		</a>
	`;
}
