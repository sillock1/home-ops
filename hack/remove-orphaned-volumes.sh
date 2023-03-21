#!/usr/bin/env bash

$mayastorapi
kubectl-mayastor get volumes | grep -e '<none>' | awk '{print $1}' | xargs -I {} curl -X "DELETE" "$mayastorapi/v0/volumes/"{} -H "accept:/"
