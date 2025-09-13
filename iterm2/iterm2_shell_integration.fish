# iTerm2 Shell Integration for Fish
# This enables advanced features like marks, badges, and automatic profile switching

if status is-interactive
    and not set -q ITERM_SHELL_INTEGRATION_INSTALLED
    set -g ITERM_SHELL_INTEGRATION_INSTALLED Yes

    # Mark return status
    function iterm2_status
        printf "\033]133;D;%s\007" $argv
    end

    # Mark start of prompt
    function iterm2_prompt_mark
        printf "\033]133;A\007"
    end

    # Mark end of prompt
    function iterm2_prompt_end
        printf "\033]133;B\007"
    end

    # Inform terminal that command starts here
    function iterm2_preexec --on-event fish_preexec
        printf "\033]133;C;\007"
    end

    # Inform terminal that command ended
    function iterm2_postexec --on-event fish_postexec
        iterm2_status $status
    end

    # Set user and hostname variables
    function iterm2_print_user_vars
    end

    # Print version
    function iterm2_print_version_number
        printf "\033]1337;ShellIntegrationVersion=14;shell=fish\007"
    end

    # Set badge
    function iterm2_set_badge
        printf "\033]1337;SetBadgeFormat=%s\007" (printf "%s" $argv | base64)
    end

    # Set current directory
    function iterm2_update_cwd
        printf "\033]1337;CurrentDir=%s\007" $PWD
    end

    # Hook into prompt
    functions -c fish_prompt iterm2_fish_prompt_base
    function fish_prompt
        iterm2_status $status
        iterm2_prompt_mark
        iterm2_fish_prompt_base
        iterm2_prompt_end
        iterm2_update_cwd
    end

    # Enable shell integration features
    iterm2_print_version_number
    iterm2_update_cwd

    # Custom iTerm2 functions for Fish

    # Open new tab in same directory
    function tab
        osascript -e 'tell application "iTerm2" to tell current window to create tab with default profile' > /dev/null
    end

    # Split pane vertically
    function vsplit
        osascript -e 'tell application "iTerm2" to tell current session of current window to split vertically with default profile' > /dev/null
    end

    # Split pane horizontally
    function hsplit
        osascript -e 'tell application "iTerm2" to tell current session of current window to split horizontally with default profile' > /dev/null
    end

    # Set tab title
    function title
        echo -ne "\033]0;$argv\007"
    end

    # Clear scrollback buffer
    function clear-scrollback
        printf '\033]1337;ClearScrollback\007'
    end

    # iTerm2 imgcat - display images inline
    function imgcat
        if [ $argv[1] ]
            printf '\033]1337;File='
            set -l args ""
            
            if isatty
                set args "inline=1"
            end
            
            printf '%s' $args
            printf ':'
            base64 < "$argv[1]"
            printf '\007'
        else
            echo "Usage: imgcat image_file"
            return 1
        end
    end

    # iTerm2 imgls - list directory with image previews
    function imgls
        for file in (ls -1 $argv)
            if test -f $file
                set -l mime (file -b --mime-type $file)
                if string match -q "image/*" $mime
                    imgcat $file
                    echo $file
                end
            end
        end
    end

    # Create notification
    function notify
        printf "\033]9;%s\007" $argv
    end

    # Mark directory for quick navigation
    function mark
        printf "\033]1337;SetMark\007"
    end

    # Jump to next mark
    function jump-next
        printf "\033]1337;NextMark\007"
    end

    # Jump to previous mark
    function jump-prev
        printf "\033]1337;PrevMark\007"
    end
end