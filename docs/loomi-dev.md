# 📦 LOOMI-DEV - VM de développement PHP/MySQL

## 🎯 Objectif

Fournir un environnement complet de développement PHP/MySQL avec gestion de code, base de données, interface web, monitoring et sécurité.

---

## 🧩 Services déployés

| Service         | Rôle                                    | Port          | Image                            |
|-----------------|----------------------------------------|---------------|---------------------------------|
| gitlab          | Gestion de code source                  | `80:80`       | `gitlab/gitlab-ee:latest`       |
| mariadb         | Base de données MySQL/MariaDB           | `3306:3306`   | `mariadb:latest`                |
| nginx           | Serveur web Nginx                      | `89:80`       | `nginx:latest`                  |
| php             | Backend PHP (PHP-FPM)                   | `8000:8000`   | `flowadmin-php`                 |
| phpmyadmin      | Interface web de gestion MySQL          | `8081:80`     | `phpmyadmin/phpmyadmin:latest` |
| fail2ban-ssh    | Protection contre brute-force SSH       | `2222:22`     | `fail2ban-ssh` (à vérifier)    |
| node_exporter   | Monitoring métriques système Prometheus | `9100:9100`   | `prom/node-exporter`            |
| portainer_agent | Gestion des conteneurs Docker           | `9001:9001`   | `portainer/agent:2.27.3`        |
| promtail        | Collecteur de logs vers Loki            | -             | `grafana/promtail`              |

---

## ⚙️ Accès aux services

- **GitLab** : `http://<IP_LOOMI-DEV>:80`
- **PhpMyAdmin** : `http://<IP_LOOMI-DEV>:8081`
- **Nginx (Laravel app)** : `http://<IP_LOOMI-DEV>:89`
- **PHP backend** : `http://<IP_LOOMI-DEV>:8000`
- **Portainer** : `http://<IP_LOOMI-DEV>:9001`

---

## 🛡️ Sécurité

- Fail2ban actif pour protéger le port SSH (redirection 2222:22)
- Gestion des clés SSH recommandée
- Accès sécurisé via reverse proxy HTTPS ou tunnel Cloudflare conseillé

---

## 🗄️ Volumes et données

- **MariaDB** : sauvegarder `/var/lib/mysql` (volume Docker ou bind mount selon ta config)
- **GitLab** : volumes persistants similaires à GROOP-DEV
- **PHP/Nginx** : source code dans `/var/www` (ou autre selon montage)
- **Fail2ban** : configs et logs dans `/etc/fail2ban` et `/var/log`

---

## 📈 Monitoring

- Node Exporter pour métriques système
- Promtail pour collecte et centralisation des logs

---

## 🛠️ Maintenance

- Mettre à jour les images Docker régulièrement
- Sauvegarder les volumes avant toute mise à jour
- Consulter les logs via Portainer ou directement sur les conteneurs

---

## 📚 Références utiles

- [GitLab Docker](https://docs.gitlab.com/ee/install/docker.html)
- [MariaDB](https://mariadb.com/kb/en/installing-mariadb-docker/)
- [PhpMyAdmin](https://www.phpmyadmin.net/docs/)
- [Nginx](https://hub.docker.com/_/nginx)
- [Fail2ban Docker](https://hub.docker.com/r/fail2ban/fail2ban)
- [Portainer](https://www.portainer.io/)

---
