#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /tax-calculator/tmp/pids/server.pid
rake db:reset

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
