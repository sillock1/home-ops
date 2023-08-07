#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.7.20 -f ./clusterconfig/production-polaris.pill.ac.yaml
talosctl apply-config -n 10.1.7.21 -f ./clusterconfig/production-rigel.pill.ac.yaml
talosctl apply-config -n 10.1.7.22 -f ./clusterconfig/production-sirius.pill.ac.yaml
talosctl apply-config -n 10.1.7.30 -f ./clusterconfig/production-mercury.pill.ac.yaml
talosctl apply-config -n 10.1.7.31 -f ./clusterconfig/production-venus.pill.ac.yaml
talosctl apply-config -n 10.1.7.32 -f ./clusterconfig/production-earth.pill.ac.yaml
