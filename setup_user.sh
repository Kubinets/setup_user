#!/bin/bash

echo "🎯 Сервер Setup Script"
echo "======================"

# Спрашиваем нужно ли обновление
read -p "Обновить систему перед настройкой? (y/n): " UPDATE_CHOICE

if [[ $UPDATE_CHOICE == "y" || $UPDATE_CHOICE == "Y" ]]; then
    echo "🔄 Обновляем пакеты системы..."
    sudo apt update
    sudo apt upgrade -y
    echo "✅ Система обновлена"
else
    echo "⏭ Пропускаем обновление системы"
fi

echo ""
echo "=== Создание пользователя ==="

read -p "Введите имя пользователя: " USERNAME

# Создаем пользователя
sudo adduser --gecos "" --disabled-password $USERNAME

# Устанавливаем пароль
echo "Установите пароль для пользователя $USERNAME:"
sudo passwd $USERNAME

# Создаем структуру каталогов
sudo -u $USERNAME mkdir -p /home/$USERNAME/.ssh
sudo -u $USERNAME chmod 700 /home/$USERNAME/.ssh

echo ""
echo "=== Готово ==="
echo "✅ Пользователь: $USERNAME"
echo "🔑 Переключение: su - $USERNAME"
echo "📁 SSH директория: /home/$USERNAME/.ssh"
