# using `gdate` on osx
date_fn="date"
if (( $+commands[gdate] ))
then
  date_fn="gdate"
fi

_command_time_preexec() {
    timer=$(($($date_fn +%s%0N)/1000000))
}

_command_time_precmd() {
  if [ $timer ]; then
    local now=$(($($date_fn +%s%0N)/1000000))
    elapsed=$(($now-$timer))
    if [ $elapsed -ge ${ZSH_COMMAND_TIME_MIN_MS:-100} ]; then
        _zsh_command_time
    fi
    unset timer
  fi
}

_zsh_command_time() {
  if [ -n "$elapsed" ]; then
    local hours="$(($elapsed/3600000))"
    local mins="$(($elapsed%3600000/60000))"
    local secs="$(($elapsed%600000/1000)).$(($elapsed%1000))"

    local time_display=""
    if [ $hours -gt 0 ]; then
        time_display+="${hours}h "
    fi
    if [ $mins -gt 0 ]; then
        time_display+="${mins}m "
    fi
    time_display+="${secs}s"

    local output="$fg[magenta]Elapsed time: $reset_color"
    output+="$fg[cyan]$time_display $reset_color"
    output+="$fg[white](${elapsed}ms)$reset_color"
    echo $output
  fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)
