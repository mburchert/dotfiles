function op --wraps=op --description='wrapper around op to cache logins'

  set action $argv[1]
  if [ (count $argv) -gt 1 ]
    set opts $argv[2..(count $argv)]
  else
    set opts ''
  end

  if [ -f ~/.op/token ]
    eval (cat ~/.op/token)
  end

  # @todo This can be reworked using set -Ux 
  switch $action
    case signin
      command op get account &> /dev/null; \
      or command op signin $opts > ~/.op/token
      eval (cat ~/.op/token)
    case '*'
      op signin 
      command op $argv
  	
  end
end

