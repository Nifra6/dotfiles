autoload -Uz add-zsh-hook

_title_precmd() {
    local parent=${PWD%/*}
    local dir=${PWD##*/}
    local short_path="${parent##*/}/$dir"
    print -Pn "\e]0; $short_path\a"

}

_title_preexec() {
    local cmd=$1
    local parent=${PWD%/*}
    local dir=${PWD##*/}
    local short_path="${parent##*/}/$dir"
    local icon
    case $cmd[(w)1] in
        v|vim|nvim)  icon=" " ;;
        y|yazi)      icon="󰇥 " ;;
        py*)         icon="󰌠 " ;;
        lg|lazygit)  icon="󰊢 " ;;
        top|btop) 
            print -n "\e]0;󰘚 btop\a"
            return
            ;;
        watch)
            case $cmd[(w)2] in
                nvidia-smi)
                    print -n "\e]0;󰢮 GPU\a"
                    return
                    ;;
                *) icon="󰑖 " ;;
            esac
            ;;
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

add-zsh-hook precmd _title_precmd
add-zsh-hook preexec _title_preexec
