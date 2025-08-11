function fish_right_prompt --description 'Write out the right prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l yellow (set_color bryellow)
    set -l green (set_color brgreen)
    set -l red (set_color brred)
    
    # Show command duration if it was long
    if test $CMD_DURATION
        set -l duration (math -s0 "$CMD_DURATION / 1000")
        if test $duration -gt 3
            set -l duration_str
            set -l hours (math -s0 "$duration / 3600")
            set -l mins (math -s0 "$duration % 3600 / 60")
            set -l secs (math -s0 "$duration % 60")
            
            if test $hours -gt 0
                set duration_str {$hours}h{$mins}m
            else if test $mins -gt 0
                set duration_str {$mins}m{$secs}s
            else
                set duration_str {$secs}s
            end
            
            echo -n -s $yellow "⏱ " $duration_str $normal " "
        end
    end
    
    # Show current time
    echo -n -s (set_color brblack) (date '+%H:%M') $normal
end