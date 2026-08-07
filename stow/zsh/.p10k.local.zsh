# Powerlevel10k directory colors based on path depth.
# This file is loaded after the generated ~/.p10k.zsh so `p10k configure`
# can safely regenerate the main config without overwriting these rules.

typeset -g POWERLEVEL9K_DIR_CLASSES=(
  '~'         HOME        ''
  '~/*'       LEVEL_ONE   ''
  '~/*/*'     LEVEL_TWO   ''
  '~/*/*/*'   LEVEL_THREE ''
  '*'         DEEPER      ''
)

# 256-color palette: cyan, green, purple, amber, blue.
typeset -g POWERLEVEL9K_DIR_HOME_{FOREGROUND,SHORTENED_FOREGROUND,ANCHOR_FOREGROUND}=39
typeset -g POWERLEVEL9K_DIR_LEVEL_ONE_{FOREGROUND,SHORTENED_FOREGROUND,ANCHOR_FOREGROUND}=76
typeset -g POWERLEVEL9K_DIR_LEVEL_TWO_{FOREGROUND,SHORTENED_FOREGROUND,ANCHOR_FOREGROUND}=141
typeset -g POWERLEVEL9K_DIR_LEVEL_THREE_{FOREGROUND,SHORTENED_FOREGROUND,ANCHOR_FOREGROUND}=214
typeset -g POWERLEVEL9K_DIR_DEEPER_{FOREGROUND,SHORTENED_FOREGROUND,ANCHOR_FOREGROUND}=75
