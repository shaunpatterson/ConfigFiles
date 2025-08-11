function fish_user_key_bindings
    # Call default key bindings first
    fish_default_key_bindings
    
    # FZF key bindings if available
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
    
    # Custom key bindings that don't conflict with OMF
    
    # Alt+L to list directory contents
    bind \el 'echo; ls -lah; commandline -f repaint'
    
    # Alt+G for quick git status
    bind \eg 'echo; git status; commandline -f repaint'
    
    # Alt+D to show docker ps
    bind \ed 'echo; docker ps; commandline -f repaint'
    
    # Ctrl+G to go to git root
    bind \cg 'cd (git rev-parse --show-toplevel 2>/dev/null || echo .); commandline -f repaint'
    
    # Alt+Enter to execute command and keep it in the commandline
    bind \e\r 'commandline -f execute; commandline -f repaint'
    
    # Alt+H for man page of current command
    bind \eh 'set -l cmd (commandline -po)[1]; and man $cmd 2>/dev/null || $cmd --help 2>&1 | less; commandline -f repaint'
    
    # Alt+P to append | less to command
    bind \ep 'commandline -a " | less"'
    
    # Alt+S to prepend sudo to command
    bind \es 'set -l cmd (commandline); commandline -r "sudo $cmd"'
    
    # Quick directory jumps
    bind \e1 'cd ~/workspace; commandline -f repaint'
    bind \e2 'cd ~/Downloads; commandline -f repaint'
    bind \e3 'cd ~/Documents; commandline -f repaint'
    bind \e4 'cd ~/.config; commandline -f repaint'
    
    # Quick command replacements
    bind \ea 'commandline -r "git add . && git commit -m \"\""'
    bind \ez 'commandline -r "z "'
    
    # F1-F4 for common commands
    bind -k f1 'commandline -r "git status"'
    bind -k f2 'commandline -r "docker ps"'
    bind -k f3 'commandline -r "ls -lah"'
    bind -k f4 'commandline -r "ps aux | grep "'
end