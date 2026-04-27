// Config docs:
//
//   https://glide-browser.app/config
//
// API reference:
//
//   https://glide-browser.app/api
//
// Default config files can be found here:
//
//   https://github.com/glide-browser/glide/tree/main/src/glide/browser/base/content/plugins
//
// Most default keymappings are defined here:
//
//   https://github.com/glide-browser/glide/blob/main/src/glide/browser/base/content/plugins/keymaps.mts
//
// Try typing `glide.` and see what you can do!

glide.o.hint_size = "30px";

glide.keymaps.set("normal", "<Leader>h", "back");
glide.keymaps.set("normal", "<Leader>l", "forward");
glide.keymaps.set("normal", "<Leader>t", "tab_new");
glide.keymaps.set("normal", "<Leader>j", "tab_next");
glide.keymaps.set("normal", "<Leader>k", "tab_prev");
