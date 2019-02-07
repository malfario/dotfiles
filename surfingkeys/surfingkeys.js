// an example to create a new mapping `ctrl-y`
mapkey('<Ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
map('gt', 'T');

// Disable surfingkeys for current domain
map('<Ctrl-i>', '<Alt-s>');

map('<Ctrl-d>', 'd');
map('d', 'x');
unmap ('x');

map('<Ctrl-u>', 'u');
map('u', 'X');
unmap ('X');

map('H', 'S');
map('L', 'D');
unmap('S');
unmap('D');

map('J', 'R');
map('K', 'E');
unmap('R');
unmap('E');
