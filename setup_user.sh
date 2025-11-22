#!/bin/bash

echo "=== Автоматическое создание пользователя ==="

read -p "Введите имя пользователя: " USERNAME

# Создаем пользователя
sudo adduser --gecos "" --disabled-password $USERNAME

# Устанавливаем пароль
echo "Установите пароль для пользователя $USERNAME:"
sudo passwd $USERNAME

# Создаем структуру каталогов
sudo -u $USERNAME mkdir -p /home/$USERNAME/.ssh
sudo -u $USERNAME chmod 700 /home/$USERNAME/.ssh

echo "=== Готово ==="
echo "Пользователь: $USERNAME"
echo "Переключение: su - $USERNAME"
echo "SSH директория: /home/$USERNAME/.ssh"
