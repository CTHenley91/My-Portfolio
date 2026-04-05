#!/usr/bin/env python3
import subprocess
import json
import re

print("[*] Analyzing TitanCorp auth logs...")

# 1. Run grep to find failed attempts
result = subprocess.run(
    ["grep", "Failed password", "/var/log/titan_sim/auth_sim.log"],
    capture_output=True,
    text=True
)

# 2. Use a set to keep only UNIQUE IP addresses
attacker_ips = set()

# 3. Use Regex to find IP patterns
# This looks for: digit.digit.digit.digit
ip_pattern = r"(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"

for line in result.stdout.split('\n'):
    if line:
        match = re.search(ip_pattern, line)
        if match:
            attacker_ips.add(match.group(1))

# 4. Prepare the data (even if it's empty)
alert_data = {
    "alert_type": "Brute Force",
    "status": "Detected" if attacker_ips else "Clear",
    "attacker_ips": list(attacker_ips),
    "count": len(attacker_ips)
}

# 5. Save to JSON
with open("threat_report.json", "w") as file:
    json.dump(alert_data, file, indent=4)

print(f"[+] Report generated with {len(attacker_ips)} unique threats.")
