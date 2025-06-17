# Oh-My-Zsh installation and plugin setup
echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh custom plugins directory
ZSH_CUSTOM="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"

# Install Zsh plugins
echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM}/plugins/zsh-autocomplete
git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM}/plugins/zsh-bat

# Reload Zsh configuration
echo "Reloading Zsh..."
source ~/.zshrc
echo "Setup complete! Restart your terminal to ensure everything is loaded."
