. env.sh

echo
cyan "Running: $0: Enabling Secret Engines\n"
green "Enable the KV V2 Secret engine"
pe "vault secrets enable -path=${KV_PATH} -version=${KV_VERSION} kv"
