#!/bin/bash
# Secure Webhook Receiver for AIOps Executions
# Triggered by n8n workflow upon LLM approval

SERVICE=$1
ACTION=$2

# Log the AI-driven intervention
echo "[$(date)] AIOps executed $ACTION on $SERVICE" >> /var/log/aiops_remediation.log

if [ "$ACTION" == "restart" ]; then
    systemctl restart $SERVICE
    if systemctl is-active --quiet $SERVICE; then
        echo "SUCCESS: $SERVICE successfully restored via automated remediation."
        exit 0
    else
        echo "CRITICAL: Automated remediation failed. Escalating to human on-call."
        exit 1
    fi
fi
