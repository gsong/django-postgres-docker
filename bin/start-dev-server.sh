#!/bin/bash
set -euo pipefail

bin/wait-for-db.sh db
exec ./manage.py runserver "0.0.0.0:${APP_PORT}"
