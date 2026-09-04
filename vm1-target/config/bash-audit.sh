# /etc/profile.d/audit.sh - Log all bash commands to syslog
export PROMPT_COMMAND='history -a; logger -t bash_audit "$(whoami) [$$]: $(history 1 | sed "s/^[ ]*[0-9]*[ ]*//")"'
