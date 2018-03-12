#!/bin/bash

docker container prune -f
docker volume rm stormy_mw_data
