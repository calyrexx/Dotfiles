# custom greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
  (set_color normal)"fish $FISH_VERSION" \
  (set_color normal)"| $KERNEL
  "

# remove default clock
function fish_right_prompt
  echo (set_color e5e5e5)"@$USER"
end

# Сокращения для make
abbr mcp --set-cursor "make compush m=\"%\""
abbr ms --set-cursor "make stage m=\"%\""
abbr mst "make start"
abbr msp "make stop"
abbr mc "make checks"

abbr du "docker compose up -d"
abbr ds "docker stop "

abbr gs "git switch"
abbr gf "git fetch"
abbr gp "git pull"

# custom prompt
function fish_prompt
  set_color --bold 4086ef

  set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 3b82f6))

  echo -n $transformed_pwd

  # git branch  
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    #space
    echo -n " "

    echo -n (set_color --bold 4338ca)"("

    set_color f0abfc
    echo -n (git branch --show-current)

    echo -n (set_color --bold 4338ca)")"
    set_color normal
  end

  # space
  echo -n " "

  echo -n (set_color --bold 14b8a6)"→"
  
  #space
  echo -n " "

  set_color normal
end

# set environment variables
set -x PATH $PATH:/usr/local/bin:/opt/bin
set -gx PATH $PATH (go env GOPATH)/bin

# set editor
set -x EDITOR "code"

# for hyprland
set -x WLR_NO_HARDWARE_CURSORS 1

# wayland
set -x GDK_BACKEND wayland
set -x QT_QPA_PLATFORM wayland

# fzf
export FZF_DEFAULT_OPTS="
--bind='ctrl-j:down,ctrl-k:up,ctrl-t:toggle-all,ctrl-v:toggle-preview,ctrl-space:toggle-preview'
--color=fg:#ffffff,hl:#00ff00,fg+:#a5b4fc,bg+:#737373,hl+:#ffff00,info:#14b8a6,spinner:#00ffff,pointer:#f59e0b
"

alias ls "exa -a --icons"
alias treelist "tree -a -I '.git'"
alias fetch "fastfetch --localip-show-ipv4 false"

# TokyoNight Color Palette from https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_storm.fish
set -l foreground c0caf5
set -l selection 6366f1
set -l comment 737373
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

fish_add_path ~/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/calyrex/.lmstudio/bin
# End of LM Studio CLI section

