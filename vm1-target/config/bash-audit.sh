# Real-time bash command auditing for SIEM forwarding
export PROMPT_COMMAND='logger -p local1.info -t bash_audit "$(whoami)@$(hostname): $(history 1 | sed "s/^[ ]*[0-9]*[ ]*//")"'

# Support for Zsh Shell (Kali Linux default)
if [ -n "$ZSH_VERSION" ]; then
  precmd() {
    logger -p local1.info -t bash_audit "$(whoami)@$(hostname): $(fc -ln -1)"
  }
fi
