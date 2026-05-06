# DevOps Finale

## Infrastructure
- VM k3s : 192.168.56.101 (k3s, Docker, GitHub Actions runner)
- VM monitoring : 192.168.56.103 (Prometheus, Grafana, node_exporter)

## Partie 1 - VM
Script `create-vm.sh` : cree une VM Debian sur VirtualBox avec 2Go RAM, 2 CPU, reseau NAT + host-only.
Script `get-vm-ip.sh` : recupere l'IP de la VM via VBoxManage.
Script `generate-inventory.sh` : genere l'inventaire Ansible automatiquement.

## Partie 2 - Docker
Image construite depuis le code source Node.js et poussee sur Docker Hub : `mahebois/node-api:latest`
Dockerfile optimise avec node:18-alpine.

## Partie 3 - Kubernetes
Manifests dans `k8s/` :
- `mysql.yaml` : base de donnees MySQL avec PersistentVolumeClaim
- `api.yaml` : deploiement Node API (1 replica minimum, 3 maximum)

## Partie 4 - CI/CD
Pipeline GitHub Actions `.github/workflows/deploy.yml` sur runner self-hosted :
1. Build image Docker
2. Push sur Docker Hub
3. Deploy sur k3s via kubectl

## Partie 5 - Monitoring
- Prometheus : http://192.168.56.103:9090
- Grafana : http://192.168.56.103:3000 (admin/admin)
- Dashboard Node Exporter Full (ID 1860) affiche les metriques des 2 VMs

## Demarrer l'infrastructure
```bash
VBoxManage startvm "debian-k3s" --type headless
VBoxManage startvm "debian-monitoring" --type headless
```

## Scripts disponibles
- create-vm.sh
- get-vm-ip.sh
- generate-inventory.sh
