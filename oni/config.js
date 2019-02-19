"use strict";
exports.__esModule = true;
exports.activate = function (oni) {
    console.log("config activated");
    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", function () { return console.log("Control+Enter was pressed"); });
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
    oni.editors.activeEditor.neovim.command('let mapleader="\\<SPACE>"');
    oni.editors.activeEditor.neovim.command("nmap <silent> <Leader>fs :w<CR>");
    oni.editors.activeEditor.neovim.command("nmap <silent> <Leader>qq :q<CR>");
    oni.editors.activeEditor.neovim.command("nmap <silent> <Leader>bb :ls<CR>");
    oni.editors.activeEditor.neovim.command("nmap <silent> <Leader>bd :bd<CR>");
    oni.editors.activeEditor.neovim.command("nmap <silent> <Leader>sc :nohl<CR>");
    oni.editors.activeEditor.neovim.command("nmap <silent> <Leader><TAB> :b#<CR>");
};
exports.deactivate = function (oni) {
    console.log("config deactivated");
};
exports.configuration = {
    //add custom config here, such as
    "ui.colorscheme": "nord",
    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    //"oni.loadInitVim": false,
    //"editor.fontSize": "12px",
    //"editor.fontFamily": "Monaco",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "sidebar.enabled": false,
    "siedebar.default.open": false,
    "learning.enabled": false,
    "achievements.enabled": false,
    "tabs.mode": "buffers",
    "vim.setting.relativenumber": true,
    "commandline.mode": false
};
