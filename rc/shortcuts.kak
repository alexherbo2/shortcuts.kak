# Shortcuts
# Public commands: ["select-next-word", "move-lines-down", "move-lines-up", "select-highlights"]

define-command -override select-next-word -docstring 'select next word' %{
  evaluate-commands -itersel %{
    hook -group select-next-word -always -once window User "%val{selection_desc}" %{
      search-next-word
    }
    try %{
      execute-keys '<a-i>w'
      trigger-user-hook "%val{selection_desc}"
    } catch %{
      search-next-word
    }
    remove-hooks window select-next-word
  }
}

define-command -override -hidden search-next-word -docstring 'search next word' %{
  execute-keys 'h/\W\w<ret><a-i>w'
}

# Reference: https://code.visualstudio.com/docs/getstarted/keybindings#_basic-editing
define-command -override move-lines-down -docstring 'move line down' %{
  execute-keys -draft '<a-x><a-_><a-:>Z;ezj<a-x>dzP'
}

define-command -override move-lines-up -docstring 'move line up' %{
  execute-keys -draft '<a-x><a-_><a-:><a-;>Z;bzk<a-x>dzp'
}

define-command -override select-highlights -docstring 'select all occurrences of current selection' %{
  execute-keys '"aZ*%s<ret>"bZ"az"b<a-z>a'
}
