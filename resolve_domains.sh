#!/bin/bash

# Function to check if a domain is valid and resolvable
is_valid_domain() {
    if nslookup "$1" >/dev/null 2>&1; then
        return 0 # Valid domain
    else
        return 1 # Invalid domain
    fi
}

# Function to filter valid domains from a list
filter_valid_domains() {
    while IFS= read -r domain; do
        if is_valid_domain "$domain"; then
            echo "$domain"
        fi
    done
}

# Main function
main() {
    # Read the list of domain names from a file or input stream
    if [ -p /dev/stdin ]; then
        # If input is piped, read from stdin
        filter_valid_domains
    else
        # Otherwise, read from file
        if [ -f "$1" ]; then
            filter_valid_domains < "$1"
        else
            echo "Usage: $0 [domain_list.txt]" >&2
            exit 1
        fi
    fi
}

# Call main function with arguments
main "$@"
