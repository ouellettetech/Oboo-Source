#!/bin/sh
set -e

if ! whoami >/dev/null 2>&1; then
  echo "builder:x:$(id -u):$(id -g):Builder,,,:/build:/bin/sh" >> /etc/passwd
fi

exec "$@"