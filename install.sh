#!/bin/bash

echo "Installing Anti-Attack AI..."

# Make scripts executable
chmod +x monitor.sh safe_mode.sh alert_email.sh

# Create log file if not exists
touch alerts.log

# Create system service directory
INSTALL_DIR="/opt/anti-attack-ai"
mkdir -p $INSTALL_DIR

# Copy files
cp monitor.sh safe_mode.sh alert_email.sh alerts.log $INSTALL_DIR

# Create runner script
cat << 'EOF' > $INSTALL_DIR/run.sh
#!/bin/bash
cd /opt/anti-attack-ai
./monitor.sh
EOF

chmod +x $INSTALL_DIR/run.sh

echo "Installation completed."
echo "Run the system with:"
echo "sudo /opt/anti-attack-ai/run.sh"
