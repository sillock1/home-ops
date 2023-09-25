#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.7.20 -f ./clusterconfig/cluster-production-polaris.pill.ac.yaml --insecure
talosctl apply-config -n 10.1.7.21 -f ./clusterconfig/cluster-production-rigel.pill.ac.yaml --insecure
talosctl apply-config -n 10.1.7.22 -f ./clusterconfig/cluster-production-sirius.pill.ac.yaml --insecure
talosctl apply-config -n 10.1.7.30 -f ./clusterconfig/cluster-production-mercury.pill.ac.yaml --insecure
talosctl apply-config -n 10.1.7.31 -f ./clusterconfig/cluster-production-venus.pill.ac.yaml --insecure
talosctl apply-config -n 10.1.7.32 -f ./clusterconfig/cluster-production-earth.pill.ac.yaml --insecure
