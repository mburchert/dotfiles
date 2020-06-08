function git
  set -l action (__get_action $argv)
  set -l opts   (__get_opts $argv)

  switch $action
  case ci
    command lab $argv
  case mr 
    command lab $argv
  case '*'
    command git $argv 
  end
end

