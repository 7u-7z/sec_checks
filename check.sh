#!/bin/bash

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to print messages in color
print_color() {
    COLOR=$1
    MESSAGE=$2
    echo -e "${COLOR}${MESSAGE}${NC}"
}

# Function to perform port scan
perform_port_scan() {
    DOMAIN=$1
    print_color "${YELLOW}" "Performing port scan on ${DOMAIN}..."
    nmap -p- -T4 -oG - $DOMAIN | grep -Eo '[0-9]+/open' | cut -d '/' -f 1 | sort -n | xargs | tr ' ' ','
}

# Function to perform service version detection
perform_service_scan() {
    DOMAIN=$1
    print_color "${YELLOW}" "Performing service scan on ${DOMAIN}..."
    nmap -sV -T4 $DOMAIN | grep -Eo '^[0-9]+/tcp' | cut -d '/' -f 1 | sort -n | xargs | tr ' ' ','
}

# Function to perform vulnerability scan
perform_vulnerability_scan() {
    DOMAIN=$1
    print_color "${YELLOW}" "Performing vulnerability scan on ${DOMAIN}..."
    nikto -h $DOMAIN
}

# Main function
main() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <domain>"
        exit 1
    fi

    DOMAIN=$1

    print_color "${GREEN}" "Starting scanning process for ${DOMAIN}..."

    # Perform port scan
    PORTS=$(perform_port_scan $DOMAIN)
    print_color "${GREEN}" "Open ports found: ${PORTS}"

    # Perform service version detection
    SERVICES=$(perform_service_scan $DOMAIN)
    print_color "${GREEN}" "Services detected on open ports: ${SERVICES}"

    # Perform vulnerability scan
    perform_vulnerability_scan $DOMAIN

    print_color "${GREEN}" "Scanning process complete for ${DOMAIN}."
}

# Execute main function
main "$@"
