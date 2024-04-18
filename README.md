# sec_checks  
This Bash script is designed to automate the process of network scanning for a specified domain. It utilizes popular tools like Nmap and Nikto to perform port scanning, service version detection, and vulnerability scanning.  

## Features:  

 * **Colorful Output:** Utilizes ANSI color codes to provide visually appealing output, making it easier to distinguish different stages of the scanning process.

 * **Port Scanning:** Conducts a comprehensive port scan on the specified domain, identifying open ports and services available.

 * **Service Version Detection:** Performs service version detection to determine the specific software and its versions running on the open ports.

 * **Vulnerability Scanning:** Executes a vulnerability scan using Nikto, searching for potential security loopholes or misconfigurations in the web server.

## Usage: 
~~~
 $ ./script_name.sh <domain>
~~~

##### **Note:** Ensure you have Nmap and Nikto installed on your system for the script to function properly. Additionally, exercise caution and obtain proper authorization before scanning any network or server that you do not own or have explicit permission to scan. Unauthorized scanning may be illegal and can lead to severe consequences.
