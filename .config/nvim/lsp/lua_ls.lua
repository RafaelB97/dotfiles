return {
  -- Command and arguments to start the server
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers =  {{".luarc.json", ".luarc.jsonc"}, ".git"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}
