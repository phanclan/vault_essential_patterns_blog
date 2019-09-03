#/bin/sh
set -x
#sudo mysql
#GRANT ALL PRIVILEGES ON *.* TO 'adminuser'@'localhost' IDENTIFIED BY 'adminpassword';

SAKILA_TEST_DB_FILE=http://downloads.mysql.com/docs/sakila-db.tar.gz

PATH=`pwd`/bin:$PATH
if [ -f demo_env.sh ]; then
    . ./demo_env.sh
fi

# Create .my-admin.cnf --- for database administrator
cat <<EOF > .my-admin.cnf
[client]
host=${DB_HOSTNAME}
port=${DB_PORT}
user=${DB_USERNAME}
password="${DB_PASSWORD}"
EOF

# Download and install sakila test database
curl -sL -o sakila-db.tgz ${SAKILA_TEST_DB_FILE}
tar -zxf sakila-db.tgz
sudo mysql --defaults-file=.my-admin.cnf < sakila-db/sakila-schema.sql
sudo mysql --defaults-file=.my-admin.cnf < sakila-db/sakila-data.sql
# rm -rf sakila-db
# rm -f sakila-db.tgz

echo "# Data loaded"