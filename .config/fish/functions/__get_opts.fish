function __get_opts
  if [ (count $argv) -gt 1 ] 
    echo $argv[2..(count $argv)]
  else
    echo 
  end
end

