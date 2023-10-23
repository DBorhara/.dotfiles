#!/bin/bash

# Use fzf to select from combined list of languages and commands
selected=$(cat ~/.config/tmux/.tmux-cht-languages ~/.config/tmux/.tmux-cht-command | fzf)

# Exit if no selection was made
if [[ -z $selected ]]; then
    exit 0
fi

# If an argument is provided, use it as the query. Otherwise, prompt the user.
if [ "$#" -eq 1 ]; then
    query="$1"
else
    read -p "Enter Query: " query
fi
# Encode the query by replacing spaces with '+'
encoded_query=$(echo "$query" | tr ' ' '+')

#If not tmux just do a regular curl call
if [ -z "$TMUX" ]; then
    if grep -qs "$selected" ~/.config/tmux/.tmux-cht-languages; then
        # Fetch for a language and use less for viewing
        curl -s cht.sh/$selected/$encoded_query | bat
    else
        # Fetch for a command and use less for viewing
        curl -s cht.sh/$selected~$encoded_query | less
    fi
fi
# Check if the selected item is a language or a command
if grep -qs "$selected" ~/.config/tmux/.tmux-cht-languages; then
    # Fetch for a language and use less for viewing
    tmux neww "curl -s cht.sh/$selected/$encoded_query | bat"
else
    # Fetch for a command and use less for viewing
    tmux neww "curl -s cht.sh/$selected~$encoded_query | less"
fi
