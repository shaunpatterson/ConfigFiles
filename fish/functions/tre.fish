function tre --description 'Tree with color and ignoring common ignore patterns'
    set -l ignore_patterns '.git|node_modules|__pycache__|*.pyc|.venv|.env|dist|build|.idea|.vscode'
    
    if type -q tree
        if test (count $argv) -eq 0
            tree -C -I $ignore_patterns --dirsfirst
        else
            tree -C -I $ignore_patterns --dirsfirst $argv
        end
    else
        echo "tree is not installed. Install it with: sudo apt install tree"
    end
end