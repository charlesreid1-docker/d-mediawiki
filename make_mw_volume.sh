#!/bin/bash

docker container prune -f
docker volume create stormy_mw_data
