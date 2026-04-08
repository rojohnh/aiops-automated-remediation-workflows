# AIOps: Automated Infrastructure Remediation

## Architectural Overview
This repository contains the logic for a "Self-Healing Infrastructure Agent." It leverages n8n workflows to connect traditional monitoring stacks (Zabbix, Elasticsearch) with internal LLM evaluations to automate system remediation.

## The Business Value
Instead of paging a human engineer at 3:00 AM for a crashed service, this AI agent:
1. Intercepts the Zabbix failure webhook.
2. Evaluates the server logs using a local LLM via RAG.
3. Automatically executes an SSH payload to restart the stalled service.
4. Alerts the engineering channel in Slack/Teams *only* after the issue is resolved.

Reduces Mean Time To Resolution (MTTR) from hours down to seconds, drastically cutting operational human costs.
