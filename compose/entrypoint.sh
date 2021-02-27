#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# check connect resource
python <<END
import sys
import pymysql
import time

OK = 0
WARNING = 1
countdown = 30

for _ in range(countdown):
    try:
        conn = pymysql.connect(
            host="${MYSQL_HOST}",
            port=${MYSQL_PORT},
            db="${MYSQL_DATABASE}",
            user="${MYSQL_ROOT_USER}",
            password="${MYSQL_ROOT_PASSWORD}",
        )
        # with conn.cursor() as cur:
        #     cur.execute(f"Grant all privileges on test_${MYSQL_DATABASE}.* to 'admin'@'%';")
        #     print(f"Grant all privileges on test_${MYSQL_DATABASE} to 'admin'")

    except Exception as e:
        print("Waiting for MYSQL available...")
        time.sleep(1)

    print("MYSQL is available")
    sys.exit(OK)

print("Can't connect resource")
sys.exit(WARNING)
END

#python manage.py

exec "$@"
