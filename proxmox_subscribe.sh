
#!/bin/sh

# Переход в нужный каталог
cd /usr/share/javascript/proxmox-widget-toolkit || {
  echo "Ошибка: каталог не найден"
  exit 1
}

# Создание резервной копии
cp proxmox.js proxmox.js.back
echo "Резервная копия создана: proxmox.js.back"

# Замена строки проверки подписки
sed 's/res\.data\.status\.toLowerCase() !== '\''active'\''/res.data.status.toLowerCase() == '\''active'\''/g' proxmox.js > proxmox.tmp && mv proxmox.tmp proxmox.js
echo "Проверка подписки изменена."

# Напоминание очистить кэш
