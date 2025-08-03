#!/bin/sh

echo "Запуск скрипта..."

cd /usr/share/javascript/proxmox-widget-toolkit || {
  echo "❌ Ошибка: каталог не найден"
  exit 1
}

cp proxmox.js proxmox.js.back || {
  echo "❌ Ошибка при создании резервной копии"
  exit 1
}

sed 's/res\.data\.status\.toLowerCase() !== '\''active'\''/res.data.status.toLowerCase() == '\''active'\''/g' proxmox.js > proxmox.tmp && mv proxmox.tmp proxmox.js || {
  echo "❌ Ошибка при изменении файла"
  exit 1
}

echo "✅ Скрипт выполнен успешно!"
echo "ℹ️ Очистите кэш браузера вручную, чтобы изменения вступили в силу."
