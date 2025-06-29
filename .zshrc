# ~/.zshrc

# Load modular zsh configuration in proper order
ZSH_DIR="$HOME/.zsh"
for file in env conf plugins functions keybinds aliasrc setup; do
  source "$ZSH_DIR/$file"
done

