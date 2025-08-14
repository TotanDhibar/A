#!/bin/bash

# Start SSH service
service ssh start

# Start xrdp service
service xrdp start

# Keep container running
exec "$@"