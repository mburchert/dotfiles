# Defined in - @ line 1
function tmux --wraps='tmux -2 -u' --description 'alias tmux=tmux -2 -u'
 command tmux -2 -u $argv;
end
