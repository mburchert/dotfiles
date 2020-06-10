function kubectl --wraps kubectl --description 'Overlay to kubectl'
  set -l action (__get_action $argv)
  set -l opts   (__get_opts   $argv)

  switch $action
  case ctx
    command kubectx
  case ns 
    command kubens $opts
  case '*'
    command kubectl $argv
  end
end

