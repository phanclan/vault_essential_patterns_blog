. env.sh

echo
cyan "Running: $0: Enable Audit Logging"
pe "vault audit enable file file_path=audit.log"

green "Verify that the audit log file is generated."
pe "cat audit.log | tail -n 20| jq"

# Optional - during development good to raw log data
# green "Enable audit logging - raw."
# pe "vault audit enable -path=file-raw file file_path=audit-raw.log log_raw=true"

# green "Verify that the audit-raw log file is generated."
# pe "cat audit-raw.log | tail -n 20| jq"

# vault audit disable file