function ls --wraps=exa --description ''
	if count $argv
	for i in (seq (count $argv))
		if [ $argv[$i] = '-als' ]
			set argv[$i] -al
		end
	end
end
	exa $argv
end
