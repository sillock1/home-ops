#!/usr/bin/env bash

kubectl get applications.argoproj.io -n argocd -o name | xargs -I {} kubectl patch {} --type=json -p='[{"op": "remove", "path": "/metadata/finalizers"}]' -n argocd