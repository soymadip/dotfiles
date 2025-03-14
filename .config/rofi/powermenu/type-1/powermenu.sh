#!/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-1'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown=' ⏼  Shutdown'
reboot='   Reboot'
lock='   Lock'
suspend=' ⏾  Suspend'
logout=' 󰗽  Logout'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
  rofi -dmenu \
    -p "$host" \
    -mesg "Uptime: $uptime" \
    -theme "${dir}/${theme}.rasi"
}

# Confirmation CMD
confirm_cmd() {
  rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
    -theme-str 'mainbox {children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you sure?' \
    -theme "${dir}/${theme}.rasi"
}

# Ask for confirmation
confirm_exit() {
  selection=$(echo -e "$yes\n$no" | confirm_cmd)

  [[ -z "$selection" ]] && exit 0

  echo "$selection"
}

# Pass variables to rofi dmenu
run_rofi() {
  choice=$(echo -e "$suspend\n$shutdown\n$lock\n$reboot\n$logout" | rofi_cmd)

  [[ -z "$choice" ]] && exit 0

  echo "$choice"
}

# Execute Command
run_cmd() {
  selected="$(confirm_exit)"

  if [[ "$selected" == "$yes" ]]; then
    case $1 in
    '--shutdown')
      systemctl poweroff
      ;;
    '--reboot')
      systemctl reboot
      ;;
    '--suspend')
      mpc -q pause
      loginctl lock-session
      systemctl suspend
      ;;
    '--logout')
      case "$DESKTOP_SESSION" in
      'openbox')
        openbox --exit
        ;;
      'bspwm')
        bspc quit
        ;;
      'i3')
        i3-msg exit
        ;;
      'plasma')
        qdbus org.kde.ksmserver /KSMServer logout 0 0 0
        ;;
      'hyprland')
        hyprctl dispatch exit
        ;;
      esac
      ;;
    '--lock')
      if [[ -x '/usr/bin/betterlockscreen' ]]; then
        betterlockscreen -l
      elif [[ -x '/usr/bin/i3lock' ]]; then
        i3lock
      else
        loginctl lock-session
      fi
      ;;
    '--screen-off')
      if [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
        sleep 1 && hyprctl dispatch dpms toggle
      fi
      ;;
    esac
  else
    exit 1
  fi
}

# Actions
chosen="$(run_rofi)" && [[ -z "$chosen" ]] && exit 1

case $chosen in
"$shutdown")
  run_cmd --shutdown
  ;;
"$reboot")
  run_cmd --reboot
  ;;
"$lock")
  run_cmd --lock
  ;;
"$suspend")
  run_cmd --suspend
  ;;
"$logout")
  run_cmd --logout
  ;;
"$scrnof")
  run_cmd --screen-off
  ;;
*)
  exit 1
  ;;
esac
