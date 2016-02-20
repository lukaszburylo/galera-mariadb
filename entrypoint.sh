#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

exec "$@"
