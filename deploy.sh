#!/bin/bash
set -eu

cd "$(dirname "$0")"

if [ -f app.pid ]; then
    pid=$(cat app.pid)

    if kill -0 "$pid" 2>/dev/null; then
        kill "$pid" || true
        sleep 1
    fi
fi

nohup python3 app.py > app.log 2>&1 &
echo $! > app.pid

for i in $(seq 1 10); do
    if curl -fsS http://127.0.0.1:8000/health; then
        echo
        echo "Deployment successful"
        exit 0
    fi
    sleep 1
done

echo "Deployment failed. Check app.log"
exit 1
