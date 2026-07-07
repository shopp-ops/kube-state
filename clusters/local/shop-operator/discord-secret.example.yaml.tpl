# TEMPLATE ONLY — do not commit a filled-in copy.
#
# The operator holds ONE platform Discord bot. main.go reads two env vars:
#   DISCORD_BOT_TOKEN  — the bot token
#   DISCORD_GUILD_ID   — the server (guild) to create channels in
#
# One-time setup:
#   1. Create a Discord application + bot; copy the bot token.
#   2. Invite the bot to the server with Manage Channels + Manage Webhooks.
#   3. Note the guild ID.
#   4. Create this Secret in the operator namespace (out-of-band / SOPS, never in git):
#
#     kubectl create secret generic shop-operator-discord -n shop-operator-system \
#       --from-literal=bot-token="<bot-token>" \
#       --from-literal=guild-id="<guild-id>"
#
# The operator Deployment already reads these from this Secret (secretKeyRef,
# optional: true — wired in shop-operator config/manager/manager.yaml). Just
# create the Secret with the two keys below; nothing else to wire.
#
apiVersion: v1
kind: Secret
metadata:
  name: shop-operator-discord
  namespace: shop-operator-system
type: Opaque
stringData:
  bot-token: "CHANGE_ME"
  guild-id: "CHANGE_ME"
