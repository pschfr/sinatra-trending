// This file is a library of small functions that format data,
// used in conjunction with Bootstrap Table.

// Formats numbers with commas, see https://stackoverflow.com/a/32154217
function comma_formatter(value) {
	var nf = new Intl.NumberFormat();
	return nf.format(value);
}
