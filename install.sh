#!/bin/bash

REPO_URL="https://github.com/jpegMushrum/Dotfiles.git"
REPO_NAME="$(basename "$REPO_URL" .git)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
TEMP_DIR="/tmp/$REPO_NAME-$(date +%s)"

if ! command -v "git" >/dev/null 2>&1; then
	echo "Git не установлен. Установите git и попробуйте снова."
	exit 1
fi

if ! ping -c 1 github.com >/dev/null 2>&1; then
	echo "Нет доступа к GitHub. Проверьте интернет-соединение."
	exit 1
fi

if [ -d "$CONFIG_DIR" ]; then
	echo "Создание резервной копии текущего .config..."
	cp -r "$CONFIG_DIR" "$BACKUP_DIR"
	echo "Резервная копия создана в: $BACKUP_DIR"
else
	echo "Папка .config не существует, пропускаем резервное копирование."
fi

if git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null; then
	echo "Репозиторий успешно склонирован"
else
	echo "Не удалось клонировать репозиторий. Проверьте URL: $REPO_URL"
	exit 1
fi

rm -rf "$CONFIG_DIR"
mv "$TEMP_DIR" "$CONFIG_DIR"

echo "Готово"
