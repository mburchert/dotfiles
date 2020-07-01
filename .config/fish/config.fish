# theme_gruvbox dark medium
#set fish_greeting (string collect (cat ~/daily.todo))
#set fish_greeting ''
set -Ux FISH_SECURE_CONFIG .fish.secure.config
set -Ux TF_PLUGIN_CACHE_DIR $HOME/.terraform.d/plugin-cache
set -Ux EDITOR vim

contains /Users/mburchert/bin              $fish_user_paths; or set -Ua fish_user_paths /Users/mburchert/bin
contains /usr/local/opt/terraform@0.11/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/opt/terraform@0.11/bin

contains 5dz2yv5nkbaojl4zw6xwlf3o5e $SSH_KEYS;  or set -Ua SSH_KEYS 5dz2yv5nkbaojl4zw6xwlf3o5e

fish_ssh_agent
#starship init fish | source
# Spacefish config
set SPACEFISH_HOST_SHOW false
set SPACEFISH_USER_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_NODE_SHOW false
set SPACEFISH_JULIA_SHOW	false
set SPACEFISH_HASKELL_SHOW false
set SPACEFISH_VENV_SHOW false
set SPACEFISH_CONDA_SHOW false
set SPACEFISH_PYENV_SHOW false

