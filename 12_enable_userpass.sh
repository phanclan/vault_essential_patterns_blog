. env.sh

green "Enable auth userpass"
pe "vault auth enable userpass"

green "Create IT user"
pe "vault write auth/userpass/users/deepak3 password=thispasswordsucks policies=kv-it,kv-user-template"

unset VAULT_TOKEN
green "Login as IT user"
pe "vault login -method=userpass username=deepak3 password=thispasswordsucks"

green "Test KV puts to allowed paths"
pe "vault kv put kv-blog/it/servers/hr/root password=rootntootn"

green "Test KV gets to allowed paths"
pe "vault kv get kv-blog/it/servers/hr/root"

green "Create Engineering user"
pe "vault write auth/userpass/users/chun2 password=thispasswordsucks policies=db-engineering,kv-user-template"

unset VAULT_TOKEN
green "Login as Engineering user"
pe "vault login -method=userpass username=chun2 password=thispasswordsucks"

