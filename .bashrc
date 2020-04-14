if [ -f ~/.bash/variables.sh ]; then
    source ~/.bash/variables.sh
fi

if [ -f ~/.bash/prompt.sh ]; then
    source ~/.bash/prompt.sh
fi

if [ -f ~/.bash/aliases.sh ]; then
    source ~/.bash/aliases.sh
fi

if [ -f ~/.bash/functions.sh ]; then
    source ~/.bash/functions.sh
fi

if [ -f ~/.bash/extra.sh ]; then
    source ~/.bash/extra.sh
fi

# added by travis gem
if [ -f $HOME/.travis/travis.sh ]; then
    source $HOME/.travis/travis.sh
fi

# Start ssh-agent automatically if it hasn't been started alredy
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

# Setup and activate the conda package manager
if [ -f $HOME/miniconda3/etc/profile.d/conda.sh ]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
    conda activate
fi

# Activate the conda default environment
if [ -f $HOME/environment.yml ]; then
    cenv $HOME/environment.yml
fi

# If pyjoke is installed, start the terminal with a random joke. Because why not?
if hash pyjoke 2>/dev/null; then
    printf "... $(pyjoke) 🥁\n"
fi
