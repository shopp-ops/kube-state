# TEMPLATE ONLY — do not commit a filled-in copy.
# The HelmRelease reads api.jwtSecret and database.password from a Secret named
# `shophub-secrets`. Create it out-of-band (or with SOPS), never in plain git:
#
#   kubectl create secret generic shophub-secrets -n shophub \
#     --from-literal=values.yaml="$(cat <<'EOF'
#   api:
#     jwtSecret: "<random-long-string>"
#   database:
#     password: "<db-password>"
#   EOF
#   )"
#
apiVersion: v1
kind: Secret
metadata:
  name: shophub-secrets
  namespace: shophub
type: Opaque
stringData:
  values.yaml: |
    api:
      jwtSecret: "CHANGE_ME"
    database:
      password: "CHANGE_ME"
