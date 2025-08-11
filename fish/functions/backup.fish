function backup --description 'Create a backup copy of a file with timestamp'
    if test (count $argv) -eq 0
        echo "Usage: backup <file>"
        return 1
    end
    
    for file in $argv
        if test -f $file
            cp $file $file.backup.(date +%Y%m%d_%H%M%S)
            echo "Backed up $file"
        else
            echo "$file is not a file"
        end
    end
end