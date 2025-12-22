
#!/usr/bin/env bash

TIMER_FILE="/tmp/timericon"

cleanup() {
    echo "" > "$TIMER_FILE"
    pkill -RTMIN+3 dwmblocks
    exit 0
}

timer() {
    trap cleanup SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

    HALF_TIME=$((TOTAL_SECONDS / 2))
    ONE_PERCENT=$((TOTAL_SECONDS / 100))

    notify-send "⏳ Timer started" "Ends in $MINUTES minutes"

    while [ $TOTAL_SECONDS -gt 0 ]; do
        # Mostrar cuenta atrás en dwmblocks
        MIN=$(printf "%02d" $((TOTAL_SECONDS / 60)))
        SEC=$(printf "%02d" $((TOTAL_SECONDS % 60)))
        echo "  $MIN:$SEC " > "$TIMER_FILE"
        pkill -RTMIN+3 dwmblocks

        # Notificación a la mitad
        if [ $TOTAL_SECONDS -eq $HALF_TIME ]; then
            notify-send "50%! Halfway there!" "Remaining: $MIN minutes"
        fi

        # Notificación al 1% restante
        if [ $TOTAL_SECONDS -eq $ONE_PERCENT ]; then
            notify-send " 1%! Almost done!" "Only $MIN:$SEC left"
        fi

        sleep 1
        ((TOTAL_SECONDS--))
    done

    notify-send -u critical ":)) Timer ended" "Nice job!"
    cleanup
}

menu() {
    MINUTES="$(echo "" | dmenu -c -p "Minutes: " <&-)"
    [ -z "$MINUTES" ] && exit 0
    TOTAL_SECONDS=$((MINUTES * 60))
    timer
}

case "$#" in
    0) menu ;;
    1) notify-send "⏹ Killing timer..." && kill -TERM "$(pgrep -f "$(basename "$0")")" ;;
esac
