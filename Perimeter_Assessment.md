# TITANCORP: PERIMETER ASSESSMENT REPORT
**Operator:Cameron H.  **Target Subnet:** 172.88.0.0/24

## PHASE 1: ACTIVE ENUMERATION (NMAP)
*(List the live IPs discovered and their running services/versions)*
* **Host 1 (172.88.0.10):** nginx 1.14.2
* **Host 2 (172.88.0.15):** Cache Database (version unknown)
* **Host 3 (172.88.0.20):** Apache httpd 2.4.66

## PHASE 2: VULNERABILITY AUDIT (NIKTO)
*(Run Nikto against the TWO web servers discovered above. List one major finding for each.)*
* **Target 1: 172.88.0.10:** Missing Anti-clickjacking X-Frame-Options header. Tool used was Nikto v2.1.5. 
The server does not return instructions to the browser on whether it is allowed to render the page in a frame, leaving it vulnerable to UI redress attacks.
* **Target 2: 172.88.0.20** HTTP Trace is active. Tool used Nikto v2.1.5. The server is configured to allow TRACE requests which could enable sentive user
cookies to be stolen.

## PHASE 3: RISK TRIAGE
*(Review your findings. Identify the SINGLE highest-risk vulnerability across the entire DMZ. Justify why it is the top priority using the Likelihood x Impact formula.)*

* **Top Priority Remediation:** HTTP TRACE enabled on 172.88.0.20
* **Justification:** A hijacker could easily use the public and internet facing nature of the server to steal session tokens which would enable them to
hijack user accounts. This is both a threat to the companies reputation as well as a compliance emergency waiting to happen. 
