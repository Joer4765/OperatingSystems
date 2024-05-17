#!/bin/bash

LOG_DIR="/var/log"
LOG_FILES="${LOG_DIR}/*.log"
#LOG_FILES="${LOG_DIR}/syslog"
PERIOD="day"

while getopts "d:p:" opt; do
  case $opt in
#   потестити лапки
    d) LOG_DIR="$OPTARG";;
    p) PERIOD="$OPTARG";;
    \?) echo "Unknown option: -$OPTARG" >&2;;
  esac
done

analyze_logs() {
  local log_file="$1"
  local period="$2"
  local date_string

  case $period in
    day)
      date_string=$(date +"%F")
      ;;
    week)
      date_string=$(date -d "week ago" +"%F")
      ;;
    month)
      date_string=$(date -d "month ago" +"%F")
      ;;
    *)
      echo "Wrong period: $period"
      exit 1
      ;;
  esac

  echo "----------------------------------------"

  local warnings=0;
  local errors=0;
  while IFS= read -r line
  do
    IFS=" "; local record_arr=($line); IFS=
    local record_date
    record_date=$(date -d "${record_arr[0]} ${record_arr[1]} ${record_arr[2]}" +"%F")
    local line_lower
    line_lower=$(echo "$line" | awk '{print tolower($0)}')

    if [[ "$record_date" -ge "$date_string" ]]; then
      if [[ "$line_lower" = *"warning"* ]]; then
        ((warnings++))
      elif [[ "$line_lower" = *"error"* ]]; then
        ((errors++))
      fi
    fi
  done < "$log_file"


  echo "Log file: $log_file"
  echo "Errors: $errors"
  echo "Warnings: $warnings"
  echo ""
}

analyze_logs "$file" "$PERIOD"

for file in $LOG_FILES; do
  if [[ -f "$file" ]]; then
    analyze_logs "$file" "$PERIOD"
  fi
done
