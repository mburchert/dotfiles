function secure
  if set -q FISH_SECURE_CONFIG
    echo Setup FISH_SECURE_CONFIG ... 
    op signin
    eval (op get item $FISH_SECURE_CONFIG | jq -r ".details | .notesPlain")
  else
    echo Skipping FISH_SECURE_CONFIG, since it\'s not set ... 
  end
  if set -q SSH_KEYS
    echo Setup SSH_KEYS ... 
    op signin
    ssh-add -D 
    for i in $SSH_KEYS 
      echo adding $i ... 
      op get item $i | jq -r '.details | .notesPlain ' | ssh-add -k -
    end
    ssh-add -l
  else
    echo Skipping ssh-agent setup, since SSH_KEYS is not set ... 
  end
end

