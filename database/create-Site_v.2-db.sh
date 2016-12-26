#!/bin/bash
BASEDIR=$(dirname $0)
psql -U postgres -f "$BASEDIR/dropdb.sql" &&
createdb -U postgres Site_v.2 &&
psql -U postgres -d Site_v.2 -f "$BASEDIR/schema.sql" &&
psql -U postgres -d Site_v.2 -f "$BASEDIR/user.sql" &&
psql -U postgres -d Site_v.2 -f "$BASEDIR/data.sql"
