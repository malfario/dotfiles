c.scrolling.smooth = True
c.tabs.padding = {'bottom': 5, 'left': 5, 'right': 5, 'top': 5}
c.window.hide_decoration = True
c.colors.tabs.odd.fg = '#707070'
c.colors.tabs.odd.bg = '#000000'
c.colors.tabs.even.fg = '#707070'
c.colors.tabs.even.bg = '#000000'
config.bind(';M', 'hint --rapid links spawn open -na /Applications/mpv.app {hint-url}')
config.bind('M', 'hint links spawn open -na /Applications/mpv.app {hint-url}')
config.bind('m', 'spawn open -na /Applications/mpv.app {url}')
