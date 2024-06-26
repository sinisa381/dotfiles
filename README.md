# Dotfiles

## Prerequisites

Make sure you have the following installed:
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- GNU stow

### zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

### powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

### Clone the Repository

```bash
git clone https://github.com/sinisa381/dotfiles.git ~/dotfiles
```

cd ~/dotfiles
stow zsh
stow nvim
stow tmux

