#!/bin/bash
set -e

install_tools() {
    tools=(
        git curl neovim btop nitch zoxide jq
        xh fd fzf tmux lazygit less
        nvibrant-bin nautilus yazi zen-browser-bin obsidian automake ripgrep eza unzip
        noto-fonts-emoji v2rayn neovide ttf-jetbrains-mono-nerd fish starship
    )

    echo "Installing additional tools..."
    for tool in "${tools[@]}"; do
        if ! yay -S --noconfirm --needed "$tool"; then
            echo "⚠️ Failed to install $tool, skipping..."
        fi
    done
}

echo "Starting installation script..."
install_tools
echo "All tools have been installed successfully."
