#!/bin/bash
BASEDIR=$(dirname $0)
psql -U postgres -f "$BASEDIR/dropdb.sql" &&
createdb -U postgres Site_v.2 &&
psql -U postgres -d personal_website -f "$BASEDIR/schema.sql" &&
psql -U postgres -d personal_website -f "$BASEDIR/user.sql" &&
psql -U postgres -d personal_website -f "$BASEDIR/data.sql"
