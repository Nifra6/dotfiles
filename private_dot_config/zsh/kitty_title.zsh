autoload -Uz add-zsh-hook

_kitty_precmd() {
    local parent=${PWD%/*}
    local dir=${PWD##*/}
    local short_path="${parent##*/}/$dir"
    print -Pn "\e]0; $short_path\a"

}

_kitty_preexec() {
    local cmd=$1
    local parent=${PWD%/*}
    local dir=${PWD##*/}
    local short_path="${parent##*/}/$dir"
    local icon
    case $cmd[(w)1] in
        v|vim|nvim)  icon=" " ;;
        y|yazi)      icon="󰇥 " ;;
        top|btop)    icon="󰻠 " ;;
        py*)         icon="󰌠 " ;;
        lg|lazygit)  icon="󰊢 " ;;
        tmux*)
            local session
            session=$(tmux display-message -p '#S' 2>/dev/null)
            print -Pn "\e]0; ${session}\a"
            return
            ;;
        *)           icon=" " ;;
    esac
    print -Pn "\e]0;$icon $short_path\a"
}

add-zsh-hook precmd _kitty_precmd
add-zsh-hook preexec _kitty_preexec
