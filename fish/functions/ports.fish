function ports --description 'Show listening ports with process names'
    if test (count $argv) -eq 0
        # Show all listening ports
        sudo lsof -i -P -n | grep LISTEN | awk '{printf "%-20s %-10s %-15s %s\n", $1, $2, $9, $8}' | column -t
    else
        # Show specific port
        sudo lsof -i :$argv[1] | grep LISTEN
    end
end