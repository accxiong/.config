alias av='source venv/bin/activate'
alias c='clear'
# alias l='ls -la'
alias lg='lazygit'
alias ra='y'
alias vim='nvim'
alias py="python"
alias nvimconfig='nvim ~/.config'
alias wk="cd ~/workspace"

# git
alias gs='git status'
alias gp='git push'
alias gcl='git clone'
alias gco='git checkout'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gfa="for b in \`git branch -r | grep -v -- '->'\`; do git branch --track \${b##origin/} \$b; done"

# pnpm
alias p='pnpm'
alias pa='pnpm add'
alias pr='pnpm remove'
alias pu='pnpm update'
alias pi='pnpm install'
alias pc='pnpm create'
alias pd='pnpm dev'

# cleanmac
# alias cleanmac="/usr/local/bin/mac-cleanup"

# eza 别名配置（替代传统 ls 命令）
alias ls='eza --icons'                  # 默认带图标
alias ll='eza --long --icons --header'  # 长格式显示（带文件头）
alias la='eza --all --icons'            # 显示所有文件（包括隐藏文件）
alias lla='eza --long --all --icons'    # 长格式显示所有文件
alias lt='eza --tree --icons'           # 树形结构显示
alias ltr='eza --tree --level=2 --icons' # 树形结构显示，只展开2层
alias lx='eza --sort=extension --icons' # 按文件扩展名排序
alias lk='eza --sort=size --icons'      # 按文件大小排序
alias lm='eza --sort=modified --icons'  # 按修改时间排序
alias lS='eza --sort=size --reverse --icons' # 按大小倒序（显示最大文件）
alias l.='eza --icons .*'               # 只显示隐藏文件


