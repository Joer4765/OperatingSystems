#!/bin/bash

create_backup() {
  backup_directory="$1"
  store_backup_directory="$2"
  backup_path="$store_backup_directory/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

  if [[ -n "$3" ]]; then
    exceptions_file="$3"
    tar czf "$backup_path" --exclude-from="$exceptions_file" "$backup_directory"
  else
    tar czf "$backup_path" "$backup_directory"
  fi

  echo "Backup created: $backup_filename"
}

restore_backup() {
  if [[ -n "$3" ]]; then
    backup_filename="$2"
    restore_directory="$3"
    tar xzf "$backup_filename" -C "$restore_directory" "${@:5}"
  else
    backup_filename="$1"
    restore_directory="$2"
    tar xzf "$backup_filename" -C "$restore_directory"
  fi

  echo "Backup restored to: $restore_directory"
}


if [[ "$1" = "create" ]]; then
  if [[ -z "$2" ]] || [[ -z "$3" ]]; then
    echo "Usage: $0 create <backup_directory> <store_backup_directory> [-X <exceptions_file>]"
    exit 1
  fi
  if [[ "$4" = "-X" && -n "$5" ]]; then
    create_backup "$2" "$3" "$5"
  else
    create_backup "$2" "$3"
  fi
elif [[ "$1" = "restore" ]]; then
  if [[ -z "$2" ]] || [[ -z "$3" ]]; then
    echo "Usage: $0 restore <backup_filename> <restore_directory> [-R <restores_file>]"
    exit 1
  fi
  if [[ "$4" = "-R" && -n "$5" ]]; then

    restore_backup "$@"
  else
    restore_backup "$2" "$3"
  fi
else
  echo "Usage:"
  echo "To create backup: $0 create <backup_directory> <store_backup_directory> [-X <exceptions_file>]"
  echo "To restore backup: $0 restore <backup_filename> <restore_directory> [-R <restore_files_or_directories>]"
  exit 1
fi
