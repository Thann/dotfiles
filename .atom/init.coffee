atom.commands.add 'atom-text-editor', 'custom:save-and-esc', (e) ->
  view = atom.views.getView(atom.workspace)
  atom.commands.dispatch(e.currentTarget, "vim-mode-plus:activate-normal-mode")
  atom.commands.dispatch(view, "core:save")
