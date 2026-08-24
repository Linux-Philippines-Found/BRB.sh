#!/usr/bin/env bash

clear
tput civis
trap "tput cnorm; clear; exit" INT TERM EXIT

away_time=$(date +"%H:%M:%S")

draw_frame() {
  printf "\033[H"
  printf -v z_padded "%-6s" "$1"
  eyes="$2"
  spin_char="$3"

  cat << EOF
 (\_/)
 ( ${eyes})
 / >🧋  ${z_padded}

+-----------------+
|  BE RIGHT BACK  |
+-----------------+

away since: $away_time
(press Ctrl+C when you're back)

$spin_char waiting...
EOF

  sleep 0.35
}

while true; do
  draw_frame "z"      "-_-" "⠋"
  draw_frame "zz"     "-_-" "⠙"
  draw_frame "zzz"    "-_-" "⠹"
  draw_frame " zzz"   "-_-" "⠸"
  draw_frame "  zzz"  "-_-" "⠼"
  draw_frame " zzz"   "-_-" "⠴"
  
  draw_frame "zzz"    "-_-" "⠦"
  
  draw_frame "zz"     "•_•" "⠧"
  draw_frame "z"      "•_•" "⠇"
  draw_frame ""       "•_•" "⠏"
  draw_frame "z"      "•_•" "⠋"
  draw_frame "zz"     "•_•" "⠙"
  draw_frame "zzz"    "•_•" "⠹"
  draw_frame " zzz"   "•_•" "⠸"
  draw_frame "  zzz"  "•_•" "⠼"
  draw_frame " zzz"   "•_•" "⠴"
  draw_frame "zzz"    "•_•" "⠦"
  draw_frame "zz"     "•_•" "⠧"
  
  # 4. Blink again before repeating
  draw_frame "z"      "-_-" "⠇"
done
