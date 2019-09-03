case ${OSTYPE} in
  darwin*)
    IP_ADDRESS=$(ipconfig getifaddr en0)
  ;;
  linux-gnu)
    IP_ADDRESS=$(ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}')
  ;;
esac
export IP_ADDRESS
export VAULT_ADDR="http://${IP_ADDRESS}:8200"
export VAULT_TOKEN=${VAULT_ROOT_TOKEN:-"notsosecure"} # Dev server environment variables
export VAULT_DEV_LISTEN_ADDRESS="${IP_ADDRESS}:8200"
export VAULT_DEV_ROOT_TOKEN_ID=${VAULT_TOKEN}