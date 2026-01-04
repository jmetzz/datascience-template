#!/usr/bin/env python3

# Define color codes
GREEN = "\033[0;32m"
CYAN = "\033[0;36m"
YELLOW = "\033[0;33m"
NC = "\033[0m"  # No Color
FIRE = "\U0001F525"  # 🔥

# Replace <your-project-directory> with the actual directory name
PROJECT_DIR = "{{ cookiecutter.project_slug }}"

# Print messages with colors
print(f"{GREEN}All set!{NC}")
print(f"{GREEN}Enter in your new project directory, install the dependencies and create the first commit:{NC}")
print(f"{GREEN}> {YELLOW}cd {PROJECT_DIR}{NC}")
print(f"{GREEN}> {YELLOW}make deps license{NC}")
print(f"{GREEN}> {YELLOW}make lint test{NC}")
print(f"{GREEN}> {YELLOW}git add .{NC}")
print(f"{GREEN}> {YELLOW}git commit -m \"Initial commit\"{NC}")
print()
print(f"{CYAN}{FIRE} TIP:{YELLOW} check out the 'make help' command{NC}")
print(f"{GREEN}Enjoy working on your new project!{NC}")
