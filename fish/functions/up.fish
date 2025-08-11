function up --description 'Go up n directories'
    if test (count $argv) -eq 0
        cd ..
    else if string match -qr '^[0-9]+$' $argv[1]
        set -l path ""
        for i in (seq $argv[1])
            set path "../$path"
        end
        cd $path
    else
        echo "Usage: up [n]"
        echo "  where n is the number of directories to go up"
    end
end