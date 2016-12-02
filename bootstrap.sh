#!/bin/sh
/usr/bin/postgres -D /data &

echo 'Pondering a short while to allow postgres time to start...'
sleep 5s

PASSWORD=$(uuidgen -r)
PASSWORD=${PASSWORD:0:7}

echo "...creating admin user with password authentication." 
RC=$(psql postgres -c "create user admin with superuser password '${PASSWORD}';")

if [ "$RC" == "CREATE ROLE" ]
then
  echo ""
  echo "************************"
  echo "*                      *"
  echo "*  USERNAME: admin     *"
  echo "*  PASSWORD: ${PASSWORD}  *"
  echo "*                      *"
  echo "************************"
  echo ""
else
  echo ""
  echo "Unable to add admin user. See above for error."
  echo "This can also happen if the container has been restarted as the user will"
  echo "already exist. If this is the case then use the originally generated"
  echo "password. (hint: scroll up!)"
  echo ""
fi

cd /app/; jetty-runner pgstudio.war