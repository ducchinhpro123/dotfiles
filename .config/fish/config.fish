source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<

# >>> Artificial Analysis terminal dashboard >>>
# Display the AI highlights dashboard on demand.
function aaii --description "Show the Artificial Analysis Intelligence Index"
    command aa-dashboard $argv
end
# <<< Artificial Analysis terminal dashboard <<<
