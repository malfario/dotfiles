const {
    map,
    unmap,
    addSearchAlias,
} = api;

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map('gt', 'T');

// Disable surfingkeys for current domain
// api.map('<Ctrl-i>', '<Alt-s>');

api.map('<Ctrl-d>', 'd');
api.map('d', 'x');
api.unmap ('x');

api.map('<Ctrl-u>', 'u');
api.map('u', 'X');
api.unmap ('X');

api.map('H', 'S');
api.map('L', 'D');
api.unmap('S');
api.unmap('D');

api.map('J', 'R');
api,map('K', 'E');
api.unmap('R');
api.unmap('E');

api.map('<Ctrl-g>', '<Ctrl-h>');
api.unmap('<Ctrl-h>');

api.addSearchAlias('f', 'filmaffinity', 'https://www.filmaffinity.com/es/search.php?stext=');
api.addSearchAlias('t', 'tidal', 'https://listen.tidal.com/search?q=');
  
