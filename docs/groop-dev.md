# 📦 GROOP DEV - VM de développement Laravel + GitLab

## 🧾 Objectif

Fournir un environnement de développement Laravel avec GitLab auto-hébergé, monitoring, protection SSH, et conteneurisation complète.

---

## 📁 Services déployés

| Service            | Rôle                          | Port         | Docker Image                        |
|--------------------|-------------------------------|--------------|-------------------------------------|
| GitLab             | Outil de gestion de code       | `80:80`      | `gitlab/gitlab-ee:18.0.1-ee.0`      |
| Laravel NGINX      | Webserver Laravel              | `89:80`      | `nginx:alpine`                      |
| Laravel PHP        | Backend Laravel (PHP-FPM)      | `8000:8000`  | `flowadmin-laravel-php`            |
| Fail2ban SSH       | Sécurité brute-force SSH       | `2222:22`    | `fail2ban-ssh`                      |
| Node Exporter      | Monitoring Prometheus          | `9100:9100`  | `prom/node-exporter`               |
| Portainer Agent    | Gestion des conteneurs         | `9001:9001`  | `portainer/agent`                  |
| Promtail           | Collecteur de logs vers Loki   | -            | `grafana/promtail`                 |

---

## 🧩 Réseau

Les services sont répartis sur plusieurs bridges Docker (`172.17.0.0/16`, `172.18.0.0/16`, `172.20.0.0/16`) pour isoler les composants.

---

## 📌 Points d'accès

- **GitLab** : http://IP_VM:80
- **Laravel app** : http://IP_VM:89
- **Laravel backend** : http://IP_VM:8000
- **Portainer Agent** (centralisé) : http://IP_VM:9001

---

## 🛡️ Sécurité

- **Fail2ban** est actif sur le port 22 avec forwarding local via 2222
- Gestion via conteneur isolé
- GitLab peut être sécurisé avec HTTPS ou Cloudflare Tunnel

---

## 📤 CI/CD

- Runner GitLab prévu via `init-runner.sh` (voir `docs/gitlab-runner.md`)
- Pipeline Laravel : tests, lint, déploiement auto possible

---

## 🗃️ Volumes recommandés (à monter dans le Docker Compose)

- `/srv/gitlab/config`, `/srv/gitlab/logs`, `/srv/gitlab/data`
- `/var/www/laravel`
- `/etc/fail2ban`, `/var/log/fail2ban`

---

## 📈 Monitoring

- `node-exporter` exposé pour Prometheus
- `promtail` collecte les logs et les envoie vers Loki central

---