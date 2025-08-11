function gitclone --description 'Clone a git repo and cd into it'
    if test (count $argv) -eq 0
        echo "Usage: gitclone <repository-url>"
        return 1
    end
    
    git clone $argv[1]
    
    # Extract the repository name from the URL
    set -l repo_name (basename $argv[1] .git)
    
    if test -d $repo_name
        cd $repo_name
        echo "Cloned and moved into $repo_name"
    end
end