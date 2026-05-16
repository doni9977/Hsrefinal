NAMESPACE="sre-capstone"
HPA_NAME="capstone-app-hpa"

echo "=== [1/3] Applying HPA Configuration Manifest ==="
kubectl apply -f k8s/hpa.yaml

echo ""
echo "=== [2/3] Fetching Current HPA Operational Status ==="
kubectl get hpa $HPA_NAME -n $NAMESPACE

echo ""
echo "=== [3/3] Launching Live Infrastructure Monitor ==="
echo "Press [Ctrl+C] to terminate the monitoring loop"
echo "------------------------------------------------"

trap 'subshell_pid=$!; kill $subshell_pid; exit' INT
while true; do
    clear
    echo "=== Active Pods Tracker | Namespace: $NAMESPACE ==="
    kubectl get pods -n $NAMESPACE
    echo ""
    echo "=== Autoscaler Performance Tracker (HPA) ==="
    kubectl get hpa $HPA_NAME -n $NAMESPACE
    sleep 2
done