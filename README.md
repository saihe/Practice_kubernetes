# Practice_kubernetes

kind を利用してローカルの kubernetes へアプリをデプロイする

## 前提

- DockerDesktop がインストールされている
- kind がインストールされている

## 手順

1. クラスタ作成

```sh
kind create cluster --name practice-kubernetes --config ./kubernetes/cluster.yml
```

1. アプリイメージロード

```sh
docker build -t frontend:local ./frontend
docker build -t backend:local ./backend
kind load docker-image frontend:local --name practice-kubernetes
kind load docker-image backend:local --name practice-kubernetes
```

1. アプライ

```sh
kubectl apply -k kubernetes
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
```

1. ポートフォワード

```sh
kubectl port-forward ingress.networking.k8s.io/ingress 8080:80
```

1. お試しイングレス

```sh
kubectl create ingress demo-localhost --class=nginx --rule="localhost/*=frontend:80"
```

1. 管理コンソール

<http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/>

```sh
kubectl proxy
```

1. クラスタ削除

```sh
kind delete cluster --name practice-kubernetes
```
