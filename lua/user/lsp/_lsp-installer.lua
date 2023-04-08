------------------
-- load modules --
------------------
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lsp-installer not working")
  return
end


local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig loading failed")
  return
end



------------------------------
------  global options  ------
------------------------------
local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}



-- Initialize lsp_installer
-- Register a handler that will be called for all installed servers.
lsp_installer.setup {}



---------------------
------ pyright ------
---------------------
local pyright_opts = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      }
    },
  },
}
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lsp_config.pyright.setup { pyright_opts }



--------------------
------  ccls  ------
--------------------
-- local ccls_opts = require("user.lsp.settings.clangd")
local ccls_opts = {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math" };
      extraArgs = { "-std=c++17" };
    };
  }
}
ccls_opts = vim.tbl_deep_extend("force", ccls_opts, opts)
lsp_config.ccls.setup { ccls_opts }



-------------------
------  Lua  ------
-------------------
local lua_opts = {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
lua_opts = vim.tbl_deep_extend("force", lua_opts, opts)
lsp_config.sumneko_lua.setup { lua_opts }


--------------------------
------  Typescript  ------
--------------------------
local ts_opts = {
  root_dir = lsp_config.util.root_pattern("yarn.lock", "lerna.json", ".git"),
  settings = {documentFormatting = true}
}
ts_opts = vim.tbl_deep_extend("force", ts_opts, opts)
lsp_config.tsserver.setup { ts_opts }




-- note on July/26/2022 : lsp_installer.on_server_ready() is depreated
-- use the above way instead
-- lsp_installer.on_server_ready(function(server)

-- if server.name == "sumneko_lua" then
-- 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
-- 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- end
--
-- This setup() function is exactly the same as lspconfig's setup function.
-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--server:setup(opts)
-- end)
