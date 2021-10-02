# gke-deployment

Example used for persistent volume encryption keys handed over to Kubernetes etcd when using StorageOS

### step 1
```
kubectl apply -f storageclass.yaml
```

### step 2
```
kubectl apply -f nginx.yaml
```

### step 3 
Check for the keys:
```
kubectl get secrets -n web-wpv
NAME                                                        TYPE                                  DATA   AGE
default-token-x2562                                         kubernetes.io/service-account-token   3      4m25s
storageos-namespace-key                                     Opaque                                1      4m25s
storageos-volume-key-78001de1-6bb7-48a9-8ba6-29afab20ed84   Opaque                                4      4m25s
```
