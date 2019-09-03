# If you are manually creating the infrastructure, set 
# the following DB_ variables to point at your MySQL database
export DB_USERNAME="root"
export DB_PASSWORD="mysql"
export DB_HOSTNAME="localhost"
export DB_PORT="3306"

# The following variables are set to use the Vault dev
# instance in the demo
# export VAULT_ADDR=http://127.0.0.1:8200
# export VAULT_ROOT_TOKEN=vault-root-token
export VAULT_ROOT_TOKEN=${VAULT_TOKEN}