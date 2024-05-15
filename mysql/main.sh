#!/usr/bin
echo "mysql:"
/usr/bin/mysqld_safe &
until $(mysqladmin ping > /dev/null 2>&1)
do
    :
done
echo "root password:"
mysqladmin -u $USER password $PASS
mysql -u $USER -p$PASS <<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$PASS' WITH GRANT OPTION;
EOF
echo "mysql:"
mysqladmin -p$PASS shutdown
exec /usr/bin/mysqld_safe
