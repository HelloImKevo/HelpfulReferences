#!/bin/bash
# This script checks for and installs all of the Python dependencies used by
# the modules in this repository.
#
# Usage ./install_python_dependencies.sh <options>
#   v - verbose, print all statements

# Path to our 'scripts' directory.
# Example: /Users/John/GitRepos/PythonProject/scripts
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Attempting to changedir to: $SCRIPT_PATH/.."

# Change dir to the parent of 'scripts' directory (should be the repository dir).
cd "$SCRIPT_PATH/.."

set -e
OPTIONS="$1"

# Show verbose script output.
if [[ $OPTIONS == *"v"* ]]; then
    set -x
fi

# Here Document user prompt.
cat <<EOF
Welcome to Helpful References!

This script will check and install the necessary dependencies needed to
run all the Python scripts in this project. This includes:
    * PyTest
    * Kivy
    * PyGame
    * Other fun stuff

If you'd prefer to install these dependencies yourself, please exit this script
now with Ctrl-C.

EOF

printf "Proceed with installing necessary dependencies? (y/N) > "
read -e input
if [[ "$input" != "y"* ]]; then
    echo "Bye-bye. Exiting..."
    exit 0
fi

echo 'Checking for Python dependencies...'

# Check for Python 3
echo "Checking for Python 3..."
if python3 -V &>/dev/null; then
    echo "Python 3 is installed"
else
    echo "Python 3 is required - please install Python3 before proceeding"
    echo "Reference: https://www.python.org/downloads/"
    echo "Exiting..."
    exit 0
fi

echo -ne '##                         (20%)\r'

# Check for Pip 3 (Python 3 package installer)
if pip3 --version &>/dev/null; then
    echo "Pip 3 is installed"
else
    echo "Python 3 Pip package installer is required"
    echo "Try running: brew install python3"
    echo "Exiting..."
    exit 0
fi

echo -ne '#####                      (40%)\r'

# Install PyTest
if pip3 show pytest &>/dev/null; then
    echo "PyTest is installed"
else
    echo "Installing PyTest..."
    pip3 install pytest
fi

echo -ne '#########                  (60%)\r'

# Install Kivy
if pip3 show kivy &>/dev/null; then
    echo "Kivy is installed"
else
    echo "Installing Kivy..."
    pip3 install kivy
fi

echo -ne '###################        (80%)\r'

# Install PyGame
if pip3 show pygame &>/dev/null; then
    echo "PyGame is installed"
else
    echo 'Installing PyGame...'
    pip3 install pygame
fi

echo -ne '########################   (100%)\r'
echo -ne '\n'

echo 'Finished installing all dependencies. You are ready to rock and roll.'
