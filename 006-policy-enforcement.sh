#!/bin/bash

PATH=`pwd`/bin:$PATH
if [ -f demo_env.sh ]; then
    . ./demo_env.sh
fi

. env.sh

export VAULT_TOKEN=${VAULT_ROOT_TOKEN}

clear
cyan "Let's now generate some tokens with the sakila-admin policy"
cyan "and see what happens when we try to use them to get access to"
cyan "the sakila-backend database role"
echo
echo
cyan "vault token create -policy sakila-admin"
pe "vault token create -policy sakila-admin -format=json > sakila-admin.token"
pe "SAKILA_ADMIN_TOKEN=`jq -r .auth.client_token sakila-admin.token`"
pe "VAULT_TOKEN=$SAKILA_ADMIN_TOKEN vault read auth/token/lookup-self"

# read
# clear
echo "Now try to fetch sakila-backend database role credentials"
echo
echo
# echo "vault read database/creds/sakila-backend"
pe "VAULT_TOKEN=$SAKILA_ADMIN_TOKEN vault read database/creds/sakila-backend -format=json"


# read
# clear
cyan "Same idea, just the other way: attempt to access the sakila-admin"
cyan "role when I only have sakila-backend rights"
echo
echo
echo "vault token create -policy sakila-backend"
pe "vault token create -policy sakila-backend -format=json > sakila-backend.token"
pe "SAKILA_BACKEND_TOKEN=`jq -r .auth.client_token sakila-backend.token`"
pe "VAULT_TOKEN=$SAKILA_BACKEND_TOKEN vault read auth/token/lookup-self"

read
clear
cyan "Now try to fetch sakila-admin database role credentials"
echo
echo
echo "vault read database/creds/sakila-admin"
pe "VAULT_TOKEN=$SAKILA_BACKEND_TOKEN vault read database/creds/sakila-admin -format=json"
echo
echo
