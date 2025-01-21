#!/bin/bash
echo "**************************************************"
echo " Setting up CI/CD Final Project Environment"
echo "**************************************************"

echo "*** Installing Python 3.9 and Virtual Environment"
brew update
brew install pyenv
brew install xz
pyenv install 3.9
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

echo "*** Making Python 3.9 the default..."
pyenv local 3.9

echo "*** Checking the Python version..."
python3 --version

echo "*** Creating a Python virtual environment"
python3 -m venv ~/venv

echo "*** Configuring the developer environment..."
echo "# CI/CD Final Project additions" >> ~/.bashrc
echo "export GITHUB_ACCOUNT=$GITHUB_ACCOUNT" >> ~/.bashrc
echo 'export PS1="\[\e]0;\u:\W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "' >> ~/.bashrc
echo "source ~/venv/bin/activate" >> ~/.bashrc

echo "*** Installing Selenium and Chrome for BDD"
brew update
brew install sqlite3 ca-certificates chromium-driver python3-selenium

echo "*** Installing Python depenencies..."
python3 -m pip install --upgrade pip wheel
pip install -r requirements.txt

echo "**************************************************"
echo " CI/CD Final Project Environment Setup Complete"
echo "**************************************************"
echo ""
echo "Use 'exit' to close this terminal and open a new one to initialize the environment"
echo ""
