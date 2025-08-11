function dockerclean --description 'Clean up Docker system'
    echo "Cleaning Docker system..."
    
    # Stop all running containers
    set -l running (docker ps -q)
    if test -n "$running"
        echo "Stopping running containers..."
        docker stop $running
    end
    
    # Remove all containers
    set -l containers (docker ps -aq)
    if test -n "$containers"
        echo "Removing containers..."
        docker rm $containers
    end
    
    # Remove dangling images
    echo "Removing dangling images..."
    docker image prune -f
    
    # Remove dangling volumes
    echo "Removing dangling volumes..."
    docker volume prune -f
    
    # Remove dangling networks
    echo "Removing unused networks..."
    docker network prune -f
    
    echo "Docker cleanup complete!"
    docker system df
end