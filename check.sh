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
    nmap -p- -T4 $DOMAIN
}

# Function to perform service version detection
perform_service_scan() {
    DOMAIN=$1
    print_color "${YELLOW}" "Performing service scan on ${DOMAIN}..."
    nmap -sV $DOMAIN
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
    perform_port_scan $DOMAIN

    # Perform service version detection
    perform_service_scan $DOMAIN

    # Perform vulnerability scan
    perform_vulnerability_scan $DOMAIN

    print_color "${GREEN}" "Scanning process complete for ${DOMAIN}."
}

# Execute main function
main "$@"
