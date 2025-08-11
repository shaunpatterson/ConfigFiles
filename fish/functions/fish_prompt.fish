function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""
    
    # Show exit status if non-zero
    if test $last_status -ne 0
        set status_color (set_color brred)
        set prompt_status "[$last_status] "
    end
    
    # Python virtual environment
    if set -q VIRTUAL_ENV
        echo -n -s (set_color blue) "(" (basename "$VIRTUAL_ENV") ") " $normal
    end
    
    # Username and hostname for SSH
    if set -q SSH_CONNECTION
        echo -n -s (set_color brblue) $USER "@" (prompt_hostname) " " $normal
    end
    
    # Current directory with truncation
    set -l realhome ~
    set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
    set -l parts (string split / $tmp)
    set -l path_str ""
    
    if test (count $parts) -gt 4
        set path_str "~/"
        for i in (seq 2 (math (count $parts) - 2))
            set path_str $path_str(string sub -l 1 $parts[$i])"/"
        end
        set path_str $path_str$parts[-2]"/"$parts[-1]
    else
        set path_str $tmp
    end
    
    echo -n -s $cwd_color $path_str $normal
    
    # Git information
    if command -sq git
        set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace -r '^refs/heads/' '')
        if test -n "$git_branch"
            set -l git_dirty (command git status --porcelain 2>/dev/null)
            set -l git_staged (command git diff --cached --numstat 2>/dev/null | wc -l | string trim)
            set -l git_unstaged (command git diff --numstat 2>/dev/null | wc -l | string trim)
            set -l git_untracked (command git ls-files --others --exclude-standard 2>/dev/null | wc -l | string trim)
            
            set -l git_status ""
            if test -n "$git_dirty"
                set git_status (set_color bryellow)"*"
            else
                set git_status (set_color brgreen)"✓"
            end
            
            # Add indicators for staged/unstaged/untracked
            set -l counters ""
            if test "$git_staged" -gt 0
                set counters $counters" "(set_color green)"●"(set_color normal)
            end
            if test "$git_unstaged" -gt 0
                set counters $counters" "(set_color red)"●"(set_color normal)
            end
            if test "$git_untracked" -gt 0
                set counters $counters" "(set_color brblue)"?"(set_color normal)
            end
            
            echo -n -s " " $vcs_color " " $git_branch $git_status $counters $normal
        end
    end
    
    # Docker context if active
    if command -sq docker
        set -l docker_context (command docker context show 2>/dev/null)
        if test -n "$docker_context" -a "$docker_context" != "default"
            echo -n -s " " (set_color blue) "🐳" $docker_context $normal
        end
    end
    
    # Jobs indicator
    set -l jobs_count (jobs -p | wc -l | string trim)
    if test $jobs_count -gt 0
        echo -n -s " " (set_color bryellow) "⚙$jobs_count" $normal
    end
    
    # Prompt character
    echo -n -s " " $status_color $prompt_status
    
    # Different prompt for root
    if test (id -u) -eq 0
        echo -n -s (set_color brred) "# " $normal
    else
        echo -n -s (set_color brmagenta) "❯ " $normal
    end
end