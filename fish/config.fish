if status is-interactive
    # Starship custom prompt
    starship init fish | source

    zoxide init fish | source
    # Direnv + Zoxide
    #
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source
    fzf --fish | source

    alias pamcan pacman
    alias ls 'eza --icons'
    alias clear "printf '\033[2J\033[3J\033[1;1H'"

    # aliass
    alias q xh
    alias v "neovide --fork && exit"
    alias cls clear
    alias p pnpm
    alias g git
    alias y yay
    alias py python
    alias lg lazygit
    alias y yay
    alias gpom 'git push origin main'
    alias gr 'go run'
    alias gd 'git diff'
    alias ga 'git add .'
    alias gc 'git commit -am'
    alias gl 'git log'
    alias gs 'git status'
    alias gst 'git stash'
    alias gsp 'git stash pop'
    alias gp 'git push'
    alias gpl 'git pull'
    alias gsw 'git switch'
    alias gsm 'git switch main'
    alias gb 'git branch'
    alias gbd 'git branch -d'
    alias gco 'git checkout'
    alias gsh 'git show'
    alias l ls
    alias ll 'ls -l'
    alias la 'ls -a'
    alias lla 'ls -la'

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2>/dev/null
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    set --universal nvm_default_version latest
    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end
end
