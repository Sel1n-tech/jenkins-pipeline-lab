# Принимаем базовый образ как аргумент (например, ubuntu:24.04 или alpine:3.18)
ARG BASE_IMAGE=ubuntu:24.04
FROM ${BASE_IMAGE}

# Метаданные нашей "мини-ОС"
LABEL maintainer="devuser@jenkins-lab.local"
LABEL os.version="1.0.0"

# Имитация установки пакетов и настройки
RUN echo "🛠️ Настройка системы на базе ${BASE_IMAGE}..." && \
    echo "export CUSTOM_OS=TRUE" >> /etc/environment

# Команда по умолчанию при запуске контейнера
CMD ["sh", "-c", "echo 'Мини-ОС успешно запущена!' && cat /etc/environment"]
