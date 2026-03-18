#!/bin/bash
# T1-M1-S03: STREAM EDITING SILENT PROVISIONING [cite: 336]
echo "[*] Provisioning Session 03: Stream Editing..."
cd ~

# 1. Generate noisy access.log (5000 lines) [cite: 338-343, 798]
echo "[*] Generating massive web server log..."
rm -f access.log
for i in {1..2500}; do
    echo "192.168.1.$((RANDOM % 255)) [09/Mar/2026:12:00:00 +0000] \"GET /index.html HTTP/1.1\" 200" >> access.log
done

# 2. Inject SQL Injection attacks [cite: 344-354]
echo "103.45.67.89 [09/Mar/2026:12:05:00 +0000] \"GET /search?q=UNION SELECT HTTP/1.1\" 403" >> access.log
echo "204.15.11.2 [09/Mar/2026:12:06:00 +0000] \"GET /search?q=UNION SELECT HTTP/1.1\" 403" >> access.log
echo "185.22.44.55 [09/Mar/2026:12:07:00 +0000] \"GET /search?q=UNION SELECT HTTP/1.1\" 403" >> access.log

# 3. Add more noise [cite: 351-354]
for i in {1..2500}; do
    echo "10.10.5.$((RANDOM % 255)) [09/Mar/2026:12:10:00 +0000] \"POST /login HTTP/1.1\" 401" >> access.log
done

echo "[*] Environment Ready. The log is waiting for interrogation." [cite: 365]
