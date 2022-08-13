#!/bin/bash
namespaces=('ebo' 'payment' 'handler' 'istio-system' 'istio-operator' 'inventory' 'invoice' 'kube-system' 'logistics-service' 'monitoring' 'node-master' \
            'order-orchestration' 'order-service' 'payment' 'promise-service' 'tax' 'default' 'core-service' 'notification' 'fulfillment' 'common' 'beta' 'snappyflow' 'command-center'
            'inbound-supply-chain' 'task' 'wms-outbound' 'castai-agent' 'quotation' 'catalog' 'customer' 'tms' 'artifact' 'availability')
for namespace in "${namespaces[@]}"; do
  echo "Removing pods from $namespace"
  echo "-----------------------------"
  kubectl get pods -n $namespace | grep Terminated | awk '{print $1}' | xargs kubectl delete pod -n $namespace
  echo "Cleaned $namespace"
  echo "-----------------------------"
done
