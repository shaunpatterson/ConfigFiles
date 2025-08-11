# Performance optimizations for Fish shell

# Lazy load NVM (Node Version Manager) if it exists
function nvm
    if test -s "$HOME/.nvm/nvm.sh"
        # Remove the nvm function
        functions -e nvm
        # Source nvm
        bass source "$HOME/.nvm/nvm.sh"
        # Call nvm with original arguments
        nvm $argv
    else
        echo "NVM is not installed"
    end
end

# Lazy load RVM (Ruby Version Manager) if it exists  
function rvm
    if test -s "$HOME/.rvm/scripts/rvm"
        # Remove the rvm function
        functions -e rvm
        # Source rvm
        bass source "$HOME/.rvm/scripts/rvm"
        # Call rvm with original arguments
        rvm $argv
    else
        echo "RVM is not installed"
    end
end

# Disable fish greeting for faster startup (can be overridden in config.fish)
set -g fish_greeting

# Use faster prompt_pwd implementation
function prompt_pwd --description 'Print the current working directory, shortened for prompt'
    set -l realhome ~
    echo $PWD | sed -e "s|^$realhome|~|" -e 's|/\([^/]\)\([^/]*\)|/\1|g' -e 's|\([^/]\)$|\1|'
end

# Cache git status for prompt (refresh every 2 seconds)
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_char_stateseparator ' '

# Optimize path deduplication
function __fish_dedupe_path
    set -l new_path
    for path in $argv
        if not contains -- $path $new_path
            set -a new_path $path
        end
    end
    string join \n $new_path
end

# Lazy load completions for heavy commands
function __fish_lazy_load_completions
    # Only load completions when tab is pressed
    if not set -q __fish_completions_loaded
        set -g __fish_completions_loaded 1
        
        # Load Docker completions only when docker is used
        if type -q docker
            docker completion fish 2>/dev/null | source
        end
        
        # Load kubectl completions only when kubectl is used
        if type -q kubectl
            kubectl completion fish 2>/dev/null | source
        end
    end
end

# Removed tab binding to avoid conflicts with OMF

# Disable automatic cd (can be slow on network drives)
set -g fish_autocd 0

# Limit history search to improve performance
set -g fish_history 10000

# Use simpler ls coloring if vivid is slow
if not type -q vivid
    set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
end

# Optimize fish_right_prompt (disable if not needed)
function fish_right_prompt
    # Empty right prompt for better performance
    # Uncomment below to show execution time
    # echo (date '+%H:%M:%S')
end

# Cache command existence checks
set -g __fish_command_cache

function command_exists
    set -l cmd $argv[1]
    
    if set -q __fish_command_cache[$cmd]
        return $__fish_command_cache[$cmd]
    end
    
    if type -q $cmd
        set __fish_command_cache[$cmd] 0
        return 0
    else
        set __fish_command_cache[$cmd] 1
        return 1
    end
end

# Async prompt support (experimental)
function __fish_prompt_async
    # Run git status in background
    fish -c 'git status --porcelain 2>/dev/null' &
    set -g __fish_async_prompt_pid $last_pid
end

# Clear completion cache on PATH change
function __fish_clear_completion_cache --on-variable PATH
    set -e __fish_completions_loaded
    set -e __fish_command_cache
end