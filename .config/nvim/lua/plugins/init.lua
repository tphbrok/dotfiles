require("plugins.nord")
require("plugins.telescope")
require("plugins.lazygit")

-- load extensions after all plugins are guaranteed to be loaded
require("telescope").load_extension("file_browser")
require("telescope").load_extension("lazygit")
