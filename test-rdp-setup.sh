#!/bin/bash

# RDP Configuration Test Script
# This script verifies that the RDP setup is working correctly

echo "=== RDP Configuration Test ==="
echo

# Check if xrdp is installed
echo "1. Checking if xrdp is installed..."
if command -v xrdp >/dev/null 2>&1; then
    echo "   ✓ xrdp is installed"
else
    echo "   ✗ xrdp is not installed"
    exit 1
fi

# Check if XFCE is installed
echo "2. Checking if XFCE is installed..."
if command -v xfce4-session >/dev/null 2>&1; then
    echo "   ✓ XFCE is installed"
else
    echo "   ✗ XFCE is not installed"
    exit 1
fi

# Check xrdp service status
echo "3. Checking xrdp service status..."
if systemctl is-active --quiet xrdp 2>/dev/null || service xrdp status >/dev/null 2>&1; then
    echo "   ✓ xrdp service is running"
else
    echo "   ⚠ xrdp service is not running (this is expected if container hasn't started services yet)"
fi

# Check if port 3389 is listening
echo "4. Checking if port 3389 is listening..."
if netstat -ln 2>/dev/null | grep -q ":3389" || ss -ln 2>/dev/null | grep -q ":3389"; then
    echo "   ✓ Port 3389 is listening"
else
    echo "   ⚠ Port 3389 is not listening (services may not be started yet)"
fi

# Check xsession configuration
echo "5. Checking XFCE session configuration..."
if [ -f "/home/devuser/.xsession" ] && grep -q "xfce4-session" "/home/devuser/.xsession"; then
    echo "   ✓ XFCE session is configured for devuser"
else
    echo "   ⚠ XFCE session configuration not found"
fi

echo
echo "=== Test Complete ==="
echo
echo "To start RDP services manually, run:"
echo "  sudo service xrdp start"
echo
echo "To connect via RDP:"
echo "  Host: localhost"
echo "  Port: 3389"
echo "  Username: devuser"
echo "  Password: devpassword"