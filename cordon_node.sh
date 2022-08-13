#!/bin/bash

function gcp_delete_node_instance() {
  (
    local node="$1"
    local project="$2"
    set -e
    echo "Cordoning $node"
    kubectl cordon "$node"
    echo "Draining $node"
    kubectl drain "$node" --force --ignore-daemonsets --delete-emptydir-data
    zone="$(kubectl get node "$node" -o jsonpath='{.metadata.labels.topology\.gke\.io/zone}')"
    instance_group=$(gcloud compute instances describe --zone="$zone" --format='value[](metadata.items.created-by)' "$node" --project "$project")
    instance_group="${instance_group##*/}"
    echo "Deleting instance for node '$node' in zone '$zone' instance group '$instance_group'"
    gcloud compute instance-groups managed delete-instances --instances="$node" --zone="$zone" "$instance_group" --project $project
    echo "Deleting instance for node '$node' completed."
  )
}

gcp_delete_node_instance "$1" "$2"

#Usage ./cordon.sh <node-name> <gcp-project name>
