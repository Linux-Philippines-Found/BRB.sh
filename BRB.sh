#!/usr/bin/env bash

# Clear screen once at start and hide cursor
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

# Infinite animation loop
while true; do
  # 1. Normal resting state ( -.-)
  draw_frame "z"      "-_-" "⠋"
  draw_frame "zz"     "-_-" "⠙"
  draw_frame "zzz"    "-_-" "⠹"
  draw_frame " zzz"   "-_-" "⠸"
  draw_frame "  zzz"  "-_-" "⠼"
  draw_frame " zzz"   "-_-" "⠴"
  
  # 2. Quick blink transition (holds ~0.35s)
  draw_frame "zzz"    "-_-" "⠦"
  
  # 3. Wide-eyed state ( •.• ) held for ~4 seconds (11 frames * 0.35s = ~3.85s)
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