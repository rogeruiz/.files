# Reál
# by Roger Steve Ruiz ( forked from Pure by Sindre Sorhus )
# https://github.com/sindresorhus/pure
# MIT License

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)


# turns seconds into human readable time
# 165392 => 1d 21h 56m 32s
prompt_pure_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    echo -n "  %F{242}"
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s %f"
}

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null

    (($? == 1)) && echo ''
}

prompt_pure_job_count() {
  local job_count=$(jobs | wc -l | xargs)
  if (( $job_count > 0 ))
  then
    echo -ne "\uf0c7  "
  fi
}

prompt_pure_env_status() {
  if [[ -n $BUNDLE_GEMS__CONTRIBSYS__COM ]]
  then
    echo -ne "\uf484  " # Earth logo
  fi
  if [[ $(env | rg -i arm | rg -i 'tenant|client') ]]
  then
    echo -ne "\uf17a  " # Windows logo
  fi
  if [[ $(env | rg -i aws) ]]
  then
    echo -ne "\uf270  " # AWS logo
  fi
  if [[ -n $REPLICATED_API_TOKEN ]]
  then
    echo -ne "\uf187  " # Bankers box icon
  fi
  if [[ -n $DOCKER_PASS ]]
  then
    echo -ne "\ue7bb  " # Red Hat logo
  fi
  if [[ -n $DOCKER_PASSWORD ]]
  then
    echo -ne "\ue7b0  " # Docker logo
  fi
  if [[ -n $CIRCLE_TOKEN ]]
  then
    echo -ne "\uf085  " # Gears icon
  fi
  if [[ $(env | rg -i github) ]]
  then
    echo -ne "\uf113  " # GitHub logo
  fi
  if [[ -n $QUAY_TOKEN ]]
  then
    echo -ne "\uf483  " # Squirrel icon
  fi
  if [[ -n $QUAY_PASSWORD ]]
  then
    echo -ne "\uf478  " # Huebot logo
  fi
}

prompt_pure_docker_password_status() {
}

prompt_pure_git_diary() {
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    command git log -1 &>/dev/null || return

    for day in $(seq 14 -1 0); do
        git log --before="${day} days" --after="$[${day}+1] days" --format=oneline |
        wc -l
    done | spark
}

# displays the exec time of the last command if set threshold was exceeded
prompt_pure_cmd_exec_time() {
    local stop=$(date +%s)
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PURE_CMD_MAX_EXEC_TIME:=5})) && prompt_pure_human_time $elapsed
}

prompt_pure_preexec() {
    cmd_timestamp=$(date +%s)

    # shows the current dir and executed command in the title when a process is active
    print -Pn "\e]0;"
    echo -nE "$PWD:t: $2"
    print -Pn "\a"
}

# string length ignoring ansi escapes
prompt_pure_string_length() {
    echo ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}}
}

prompt_pure_precmd() {
    # shows the full path in the title
    print -Pn '\e]0;%~\a'

    # git info
    vcs_info

    local prompt_pure_preprompt='\n%F{yellow}`prompt_pure_cmd_exec_time`%f%F{cyan}  %F{magenta}`prompt_pure_job_count`%F{242}%(5~|%-1~/.../%3~|%4~) $vcs_info_msg_0_ %F{242}`prompt_pure_git_diary`%f %F{yellow}`prompt_pure_git_dirty`%f $prompt_pure_username %f'
    print -P $prompt_pure_preprompt

    # check async if there is anything to pull
    (( ${PURE_GIT_PULL:-1} )) && {
        # check if we're in a git repo
        command git rev-parse --is-inside-work-tree &>/dev/null &&
        # check check if there is anything to pull
        command git fetch &>/dev/null &&
        # check if there is an upstream configured for this branch
        command git rev-parse --abbrev-ref @'{u}' &>/dev/null &&
        (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) &&
        # some crazy ansi magic to inject the symbol into the previous line
        print -Pn "\e7\e[A\e[1G\e[`prompt_pure_string_length $prompt_pure_preprompt`C%F{cyan}    %f\e8"
    } &!

    # reset value since `preexec` isn't always triggered
    unset cmd_timestamp
}


prompt_pure_setup() {
    # prevent percentage showing up
    # if output doesn't end with a newline
    export PROMPT_EOL_MARK=''

    prompt_opts=(cr subst percent)

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    add-zsh-hook precmd prompt_pure_precmd
    add-zsh-hook preexec prompt_pure_preexec

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats "%F{green}%F{242} %b"
    zstyle ':vcs_info:git*' actionformats "%F{green}%F{242} %b %F{green}%F{242} %a"

    # show username@host if logged in through SSH
    [[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username='%n@%m '

    # prompt turns red if the previous command didn't exit with 0

    prompt_okay="%F{green}  "
    prompt_not_okay="%F{red}  "
    PROMPT='%F{yellow}`prompt_pure_env_status`%f%(?.${prompt_okay}.${prompt_not_okay})%f %F{242} %f '

}

prompt_pure_setup "$@"
