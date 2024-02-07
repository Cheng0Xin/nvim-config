if vim.g.vscode then
  local kmap = require("vim.keymap")
  local vscode = require("vscode-neovim")

  -- Save all the files
  kmap.set({ "n", "v" }, "ss", function()
    vscode.action("saveAll")
  end)

  -- Toggle Fold
  kmap.set("n", "za", function()
    vscode.action("editor.toggleFold")
  end)

  kmap.set("n", "zM", function()
    vscode.action("editor.foldAll")
  end)

  kmap.set("n", "zR", function()
    vscode.action("editor.unfoldAll")
  end)

  -- Movement
  -- Left most and right most
  kmap.set({ "n", "v" }, "<C-H>", "<home>")
  kmap.set({ "n", "v" }, "<C-L>", "<end>")
  -- Left tap or right tap
  kmap.set("n", "<S-H>", function()
    vscode.action("workbench.action.previousEditorInGroup")
  end)
  kmap.set("n", "<S-L>", function()
    vscode.action("workbench.action.nextEditorInGroup")
  end)
  kmap.set("n", "=", function()
    vscode.action("editor.action.smartSelect.expand")
  end)

  kmap.set("n", "j", function()
    vscode.action("cursorDown")
  end)

  kmap.set("n", "k", function()
    vscode.action("cursorUp")
  end)

  -- Window manage
  kmap.set("n", "<C-W>d", function()
    vscode.action("workbench.action.closeActiveEditor")
  end)

  -- Better yank
  kmap.set("n", "Y", "yy")

  -- Window manage
  -- Toggle menu
  kmap.set("n", "<space>a", function()
    vscode.action("workbench.action.toggleActivityBarVisibility")
  end)
  -- Toggle directories
  kmap.set("n", "<space>e", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)

  -- Format
  kmap.set("n", "<space>f", function()
    vscode.action("editor.action.formatDocument")
  end)

  -- Search
  kmap.set("n", "<space>s", function()
    vscode.action("search.action.openNewEditorToSide")
  end)

  -- Open
  kmap.set("n", "<space><space>", function()
    vscode.action("workbench.action.quickOpen")
  end)

  -- CenteredLayout
  kmap.set("n", "<space>c", function()
    vscode.action("workbench.action.toggleCenteredLayout")
  end)

  -- Execute makefile
  kmap.set("n", "<space>x", "<cmd>!make<cr>")
end
