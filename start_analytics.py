import subprocess
import os
import shutil

def clone_repo_and_run_in_docker(repo_url, docker_image_name, command_to_run):
    # Extract the repository name from the URL to determine the directory name
    repo_dir = os.path.basename(repo_url).replace('.git', '')
    
    # Clone the repository
    subprocess.run(['git', 'clone', repo_url], check=True)

    # Copy .env_analytics to .env
    shutil.copy('.env_analytics', os.path.join(repo_dir, '.env'))
    
    # Change to the repository directory
    os.chdir(repo_dir)
    
    # Source .env file to set environment variables
    subprocess.run('set -a; source .env; set +a;', shell=True, check=True)

    # Prune unused Docker objects
    subprocess.run(['docker', 'system', 'prune', '-a', '-f'], check=True)
    
    # Build the Docker image
    subprocess.run(['docker', 'build', '-t', docker_image_name, '.'], check=True)
    
    # Start the Docker container and run the desired command inside it
    # "-it" flag can run the container in interactive mode with a pseudo-TTY, useful if your command is interactive
    # "-d" flag runs the container in detached mode
    subprocess.run(['docker', 'run','-d', docker_image_name] + command_to_run, check=True)

# Example usage:
repo_url = "https://github.com/hyplabs/crocswap_audit_tools.git"
docker_image_name = "audit_tools"
command_to_run = ['python3', 'run_server.py']  # can add arguments as ['command', 'arg1', 'arg2', ...]
clone_repo_and_run_in_docker(repo_url, docker_image_name, command_to_run)