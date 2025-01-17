#     _____                                 _ _
#    / ____|                               | (_)
#   | (___   ___  _   _ _ __ ___   __ _  __| |_ _ __
#    \___ \ / _ \| | | | '_ ` _ \ / _` |/ _` | | '_ \
#    ____) | (_) | |_| | | | | | | (_| | (_| | | |_) |
#   |_____/ \___/ \__, |_| |_| |_|\__,_|\__,_|_| .__/
#                  __/ |                       | |
#                 |___/                        |_|
#_______________________________________________________________________
#

# Start & detach Apps from terminal

function dtch {
    local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}"
    local cmd_name=$(basename "$1")

    mkdir -p "$cache_dir"
    nohup "$@" >"$cache_dir/nohup-${cmd_name}.out" 2>&1 &
}
