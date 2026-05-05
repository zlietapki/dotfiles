#!/usr/bin/env bash

INPUT=$(cat)

# ANSI цвета
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

# Округление до 1 знака
round_one_decimal() {
  value="$1"

  if ! [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "$value"
    return
  fi

  printf "%.1f" "$value"
}

# Цвет по проценту
colorize() {
  pct="$1"

  if ! [[ "$pct" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "$pct"
    return
  fi

  pct_int=${pct%.*}

  if (( pct_int >= 90 )); then
    echo -e "${RED}${pct}%${RESET}"
  elif (( pct_int >= 70 )); then
    echo -e "${YELLOW}${pct}%${RESET}"
  elif (( pct_int < 50 )); then
    echo -e "${GREEN}${pct}%${RESET}"
  else
    echo "${pct}%"
  fi
}

# Форматирование локального времени сброса
format_reset_time() {
  reset_ts="$1"

  if [[ "$reset_ts" == "null" || -z "$reset_ts" ]]; then
    echo "N/A"
    return
  fi

  today=$(date +%Y-%m-%d)
  reset_day=$(date -d @"$reset_ts" +%Y-%m-%d)

  if [[ "$today" == "$reset_day" ]]; then
    date -d @"$reset_ts" +%H:%M
  else
    date -d @"$reset_ts" +"%a %H:%M"
  fi
}

# Получаем данные
SESSION_PCT_RAW=$(echo "$INPUT" | jq -r '.rate_limits.five_hour.used_percentage // empty')
SESSION_RESET=$(echo "$INPUT" | jq -r '.rate_limits.five_hour.resets_at // empty')

WEEK_PCT_RAW=$(echo "$INPUT" | jq -r '.rate_limits.seven_day.used_percentage // empty')
WEEK_RESET=$(echo "$INPUT" | jq -r '.rate_limits.seven_day.resets_at // empty')

[[ -z "$SESSION_PCT_RAW" ]] && SESSION_PCT_RAW="N/A"
[[ -z "$WEEK_PCT_RAW" ]] && WEEK_PCT_RAW="N/A"

SESSION_PCT=$(round_one_decimal "$SESSION_PCT_RAW")
WEEK_PCT=$(round_one_decimal "$WEEK_PCT_RAW")

SESSION_TIME=$(format_reset_time "$SESSION_RESET")
WEEK_TIME=$(format_reset_time "$WEEK_RESET")

SESSION_COLORED=$(colorize "$SESSION_PCT")
WEEK_COLORED=$(colorize "$WEEK_PCT")

echo -e "S: ${SESSION_COLORED} (reset ${SESSION_TIME}) | W: ${WEEK_COLORED} (reset ${WEEK_TIME})"
