#!/bin/bash

copy_file() {
    echo "Введіть ім'я файлу, який потрібно скопіювати:"
    read -r source_file
    echo "Введіть ім'я копії файлу:"
    read -r destination_file
    cp "$source_file" "$destination_file"
    echo "Файл $source_file був скопійований у $destination_file"
}

delete_file() {
    echo "Введіть ім'я файлу, який потрібно видалити:"
    read -r file_to_delete
    rm "$file_to_delete"
    echo "Файл $file_to_delete був видалений"
}

display_file_contents() {
    echo "Введіть ім'я файлу, вміст якого потрібно вивести:"
    read -r file_to_display
    echo
    cat "$file_to_display"
    printf "\n\n"
}

while true
do
    echo "Меню:"
    echo "1. Копіювати файл"
    echo "2. Видалити файл"
    echo "3. Вивести вміст файлу на консоль"
    echo "4. Вийти"
    echo "Виберіть опцію:"
    read -r option
    case $option in
        1) copy_file ;;
        2) delete_file ;;
        3) display_file_contents ;;
        4) echo "До побачення!"; break ;;
        *) echo "Невірна опція! Будь ласка, виберіть знову." ;;
    esac
done
