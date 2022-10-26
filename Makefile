.PHONEY: init
init:
	kind create cluster --name practice-kubernetes --config ./kubernetes/cluster.yml
	docker build -t frontend:local ./frontend
	kind load docker-image frontend:local --name practice-kubernetes

.PHONEY: apply
apply:
	docker build -t frontend:latest ./frontend
	docker build -t backend:latest ./backend
	kubectl apply 

.PHONEY: destroy
destroy:
	kind delete cluster --name practice-kubernetes
