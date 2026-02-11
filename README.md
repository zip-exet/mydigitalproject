# 💻 MyDigitalProjet

> **Infrastructure DevOps auto-hébergée avec supervision, gestion de code, CI/CD et services métiers.**

---

## 📌 Objectif

Mettre en place une infrastructure virtuelle sous **Proxmox**, contenant plusieurs VMs Debian configurées avec **Docker** et des stacks applicatives orientées développement, monitoring et gestion de projet.

---

## 🗂️ Architecture générale

### 🖥️ Cluster Proxmox (10.2.5.11)
- 3 serveurs (HP / DELL / ILO)
- Interface Proxmox : [https://10.2.5.11:8006]

### 📦 Machines virtuelles

#### 🔧 VM - DATAFLOW MANAGEMENT [10.2.5.98]
- OS : Debian + Docker
- Rôle : Supervision / Tickets / Logs / Base de données
- Services :
  - **Grafana**, **Prometheus**, **Loki**, **Promtail**
  - **GLPI** (gestion de tickets)
  - **Tailscale** (VPN)
  - **MariaDB** (DB)
  - **Cloudflared** (proxy cloud)
  - **Fail2ban** (sécurité brute-force)
  - **Apache2** (reverse proxy)
  - **Portainer** (interface Docker)

#### 💡 VM - LOOMI DEV [10.2.5.99]
- OS : Debian + Docker
- Rôle : Dev PHP/MySQL
- Services :
  - **Nginx + PHP + MariaDB**
  - **PhpMyAdmin**
  - **GitLab EE**
  - **Fail2ban**
  - **Runner GitLab**
  - **Promtail**, **Portainer**

#### 🛠️ VM - GROOP DEV [10.2.5.100]
- OS : Debian + Docker
- Rôle : GitLab + Dev Laravel
- Services :
  - **GitLab EE**
  - **Runner GitLab**
  - **Nginx + PHP (Laravel)**
  - **Fail2ban**, **Promtail agent**
  - **Portainer**

---

## 🐳 Stacks Docker

Les fichiers `docker-compose` sont situés dans [`/infrastructure/docker-compose`](infrastructure/docker-compose/).

| Stack | Description |
|-------|-------------|
| `dataflow-management.yml` | Supervision, ticketing, base de données |
| `groop-dev.yml` | Laravel + GitLab |
| `loomi-dev.yml` | PHP/MySQL classique |
| `gitlab-runner.yml` | GitLab Runner autonome |

---

## 🔧 Services de monitoring

Situé dans [`/infrastructure/monitoring`](infrastructure/monitoring)

- `prometheus.yml` : configuration scrape + jobs
- Dashboards Grafana : dans `/grafana/dashboards`

---

## 📄 Documentation technique

Voir le dossier [`/docs`](docs)

| Fichier | Description |
|--------|-------------|
| `dataflow-management.md` | Détail VM Monitoring |
| `groop-dev.md` | Détail VM Laravel |
| `loomi-dev.md` | Détail VM PHP |
| `gitlab.md` | Installation GitLab |
| `gitlab-runner.md` | Enregistrement Runner |
| `monitoring.md` | Configuration Grafana/Prometheus/Loki |

---

## 🛠️ Scripts utiles

Dans [`/scripts`](scripts) :
- `backup.sh` : modèle de script de sauvegarde
- `init-runner.sh` : enregistrement GitLab Runner

---

## 🔒 Sécurité

- 🔐 **Fail2ban** sur chaque VM
- 🔐 **Cloudflare tunnel** sur Dataflow VM
- 🔐 Accès GitLab protégés par clés SSH

---

## 📸 Aperçu visuel

Les schémas d’architecture sont disponibles dans [`/assets/screenshots`](assets/screenshots)

---

## 📜 Licence

Projet sous licence MIT

---

## 📬 Contact

Pour toute question, tu peux me ping dans les issues ou contribuer avec une PR ! 🚀
