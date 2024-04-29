local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- neovim uses LuaJIT
        path = runtime_path, -- setup your lua path
      },
      diagnostics = {
        globals = {
            'vim', -- get the language server to recognize the `vim` global
            'alsa_monitor', -- for wireplumber
    },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- make the server aware of Neovim runtime files
      },
      telemetry = {
        enable = false, -- do not send telemetry data
      },
    },
  },
}
