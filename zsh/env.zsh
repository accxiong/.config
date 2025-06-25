export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# proxy url
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# 终端代理
function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy=$http_proxy
    
    export all_proxy=socks5://127.0.0.1:7890
    curl www.google.com
    echo -e "\n"
    echo -e "\033[32m已开启代理\033[0m":
}
function proxy_off(){
    unset http_proxy && unset https_proxy && unset all_proxy && echo -e "已关闭代理"
}
# 终端代理 end

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# yazi cmd
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# pnpm
export PNPM_HOME="/Users/lemon/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm 配置
eval "$(fnm env --use-on-cd)"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_COMPLETION_TRIGGER='?'
export FZF_DEFAULT_OPTS='
  --bind ctrl-t:top,change:top 
  --height 40% --reverse --border
  --color fg:242,bg:0,hl:65,fg+:15,bg+:8,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
'


# 异步加载 Conda
conda_async_init() {
  # 定义 conda 命令别名，首次调用时触发真实加载
  conda() {
    echo "正在加载 Conda 环境..." >&2
    
    # 移除临时别名，避免循环调用
    unfunction conda
    
    # 执行原始的 conda 初始化
    __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    
    # 执行原始命令
    conda "$@"
  }
}

# 立即调用异步初始化函数
conda_async_init
