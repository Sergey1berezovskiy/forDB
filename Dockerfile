FROM alpine:3.20

# Установим psql и bash
RUN apk add --no-cache postgresql-client bash

# Скрипт обновления
COPY refresh.sh /refresh.sh
RUN chmod +x /refresh.sh

# По запуску контейнер сразу выполнит обновление
CMD ["/bin/bash", "-lc", "/refresh.sh"]
