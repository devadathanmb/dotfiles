#! /usr/bin/env bash

LOFI_STREAM="https://www.youtube.com/watch?v=jfKfPfyJRdk"
ALL_TIME_CHILL_HITS="https://www.youtube.com/playlist?list=PL1FPWPLPHKhysG2trm9RKV8FG3eQ7J4VN"
ALL_TIME_MALAYALAM_HITS="https://www.youtube.com/playlist?list=PL1FPWPLPHKhyZeoBv-Ws_eRiWiUYKkuDz"

# Player menu controls
play="  Play music"
pause="  Pause music"
stop="  Stop music"
next_track="  Next track"
prev_track="  Previous track"
increase_volume="󰝝  Increase volume"
decrease_volume="󰝞  Decrease volume"

# Music menu controls
play_lofi="  Play lofi girl"
play_chill_hits="1.   Play All time chill hits"
play_malayalam_hits="2.   Play All time malayalam hits"

if pgrep -x "rofi"
then
    killall rofi
    exit
fi

function music(){
    local chosen=$(printf "%s\n%s\n" "$play_lofi" "$play_chill_hits" "$play_malayalam_hits" | rofi -dmenu -i -l 3 -p "Music time : ")

    if [[ "$chosen" == "$play_lofi" ]]
    then
        notify-send "🎹 Playing lofi girl"
        exec -a "rofi-music" mpv --no-video $LOFI_STREAM --volume=70
    elif [[ "$chosen" == "$play_chill_hits" ]]
    then
        notify-send "🎹 Playing all time chill hits"
        exec -a "rofi-music" mpv --no-video "$ALL_TIME_CHILL_HITS" --shuffle --volume=70
    elif [[ "$chosen" == "$play_malayalam_hits" ]]
    then
        notify-send "🎹 Playing malayalam hits"
        exec -a "rofi-music" mpv --no-video "$ALL_TIME_MALAYALAM_HITS" --shuffle --volume=70
    fi
}

function controls(){
    local chosen=$(printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n" "$play" "$pause" "$stop" "$next_track" "$prev_track" "$increase_volume" "$decrease_volume" | rofi -dmenu -i -l 7 -p "Music controls : ")

    if [[ "$chosen" == "$play" ]]
    then
        playerctl --player=mpv play && notify-send "▶️  Resuming music"
    elif [[ "$chosen" == "$pause" ]]
    then
        playerctl --player=mpv pause && notify-send "⏸️ Music paused"

    elif [[ "$chosen" == "$stop" ]]
    then
        kill $(pidof "rofi-music") && notify-send "🛑 Music stopped"
    elif [[ "$chosen" == "$next_track" ]]
    then
        playerctl --player=mpv next && notify-send "⏭️  Next track playing"
    elif [[ "$chosen" == "$prev_track" ]]
    then
        playerctl --player=mpv previous && notify-send "⏮️  Previous track playing"
    elif [[ "$chosen" == "$increase_volume" ]]
    then
        current_volume=$(playerctl --player=mpv volume)
        new_volume=$(echo "$current_volume + 0.1" | bc)
        playerctl --player=mpv volume $new_volume && notify-send "🔊 Increasing track volume"
    elif [[ "$chosen" == "$decrease_volume" ]]
    then
        current_volume=$(playerctl --player=mpv volume)
        new_volume=$(echo "$current_volume - 0.1" | bc)
        playerctl --player=mpv volume $new_volume && notify-send "🔉 Decreasing track volume"
    fi

}

# Check if music is running
if pidof "rofi-music" > /dev/null
then
    controls
else
    music
fi
