#/bin/bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl get ns
kubectl -n kubernetes-dashboard get pods -o wide
kubectl -n kubernetes-dashboard edit svc kubernetes-dashboard        /change clusterIP to LoadBalancer for public access
kubectl -n kubernetes-dashboard get svc                              /you will get elastic_load_balancer url   
kubectl create serviceaccount dashboard -n default
kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard 
kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode  /token will be generated copy paste this token into dashboard
