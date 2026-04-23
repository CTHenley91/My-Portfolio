# CLOUDNANO REMEDIATION PLAN
**Operator:** ## TOP 5 CRITICAL FIXES
*(From the 20 raw findings, select the 5 that pose the greatest ACTUAL risk. Explain your reasoning.)*

1. **[Unauthenticated AWS S3 Bucket]**
   * **Justification:** [Discovery is highly likely because of automated bucket scanners and the impact would be massive because the customer data leak would lead to legal, regulatory, and PR issues. ]

2. **[SQL Injection in Login Page]**
   * **Justification:** [A SQL injection into the login page is an easy to reach and highly sensitive entry point and could lead to theft of the entire customer database.]

3. **[Remote Code Execution in Apache Struts]**
   * **Justification:** [Since this is an internet facing server, a remote code execution in Apache Struts is likely and could lead to complete compromise of the web server.]

4. **[SMBv1 Enabled (Internal HR File Server)]**
   * **Justification:** [While the HR server is purely internal, SMBv1 is a common entry point for ransomware and HR servers contain highly sensitive data.]

5. **[Cross-Site Scripting (XSS) on Support Forum]**
   * **Justification:** [A compromised support forum is a perfect vector to expose customers to various threats. Customers will trust links or files found on a support forum that could lead to reputational and legal issues.]
