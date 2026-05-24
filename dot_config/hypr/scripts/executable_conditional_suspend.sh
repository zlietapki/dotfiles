#!/bin/bash
RETRY_INTERVAL=${1:-3600}

# не выключать если активны torrent загрузки
while true; do
    DOWNLOADING=$(curl -sf --max-time 2 "http://127.0.0.1:8080/api/v2/torrents/info?filter=downloading")
    if [ $? -eq 0 ] && [ "$DOWNLOADING" != "[]" ] && [ -n "$DOWNLOADING" ]; then
        sleep "$RETRY_INTERVAL"
    else
        systemctl suspend
        exit 0
    fi
done
