#!/usr/bin/env python3
import subprocess
import json
import os

print("[*] Initiating System Audit...")

# 1. Capture the process list
process_list = subprocess.run(["ps", "aux"], capture_output=True, text=True)

# 2. Check for the specific threat
if "unauthorized_cryptominer" in process_list.stdout:
    print("[!] THREAT DETECTED: unauthorized_cryptominer")
    
    alert_data = {
        "event": "Unauthorized Process",
        "severity": "High",
        "process": "unauthorized_cryptominer"
    }

    # 3. Only write the file if the threat was found
    with open("security_alert.json", "w") as file:
        json.dump(alert_data, file, indent=4)
    print("[+] security_alert.json has been generated.")

else:
    print("[+] No unauthorized processes found.")

print("[+] Audit Complete.")
