# 💻​ VM DATA-MANAGEMENT - VM D'ADMINISTRATION 

##  Principe : 

> Avoir un environnement nous permettant l'administration et la supervision de l'ensemble de l'infrastructure pour plusieurs intérêt : 

* 1-centralisation 
* 2-isolation  
* 3-portabilité   
* 4-automatisation et maintenance  
* 5-supervision consolidée 


## 🧱 Fondation de l'infrastructure

### 🔹 OS : Debian

Debian est un système d’exploitation stable et sécurisé, reconnu pour sa robustesse, son cycle de mises à jour long, ainsi que sa compatibilité avec la majorité des outils open source. C’est une base idéale pour les serveurs de production.

### 🔹 Docker

Docker, quant à lui, permet la conteneurisation des applications en isolant chaque service dans des conteneurs légers. Cela facilite le déploiement, la scalabilité, la portabilité et les mises à jour grâce à l’utilisation d’images. Docker simplifie ainsi la gestion et l’automatisation des environnements applicatifs.

## 🖥️ Services de supervision et d’observabilité

### 🔹 Grafana

Grafana joue le rôle d’interface de visualisation de données, permettant de créer des tableaux de bord personnalisés pour surveiller les métriques système, réseau, logs, et bien plus. Il exploite les données collectées par des outils comme Prometheus ou Loki pour offrir une vue claire et interactive de l’état de l’infrastructure.

### 🔹 Prometheus

**Prometheus** joue le rôle de **collecteur de métriques et système de monitoring**. Il récupère régulièrement des données de performance des services, telles que l’utilisation CPU, la mémoire ou les temps de réponse. Grâce à ces informations, il permet de suivre l’état du système en temps réel et de déclencher des alertes en cas d’anomalies.


### 🔹 Loki

**Loki** joue le rôle d’**agrégateur de logs**, offrant une solution plus légère que la stack ELK traditionnelle. Il centralise les journaux de tous les conteneurs et services, et s’intègre parfaitement avec **Grafana** pour permettre une visualisation et une analyse simplifiées des logs.


### 🔹 Promtail

Promtail joue le rôle d’agent de collecte de logs, chargé d’envoyer les journaux des conteneurs ou des serveurs vers Loki. Léger et facile à déployer, il s’installe sur chaque machine concernée et assure la centralisation des logs pour une visualisation et une analyse efficaces via Grafana.

### 📥 Gestion de tickets et d’inventaire

🔹 GLPI

GLPI joue le rôle d’outil ITSM (gestion des services informatiques), permettant la gestion du parc informatique, des tickets, des incidents et des demandes. Il offre également un suivi détaillé du matériel et des logiciels, ce qui en fait une solution complète et précieuse pour les équipes de support et d’assistance technique.

## 🔐 Accès, sécurité et connectivité

### 🔹 Tailscale

**Tailscale** joue le rôle de **VPN maillé Zero-Config basé sur WireGuard**, permettant de connecter facilement plusieurs nœuds entre eux via un réseau privé sécurisé. Il élimine la complexité de la configuration réseau traditionnelle et permet un accès distant au serveur **sans exposer de ports publics**, ce qui améliore à la fois la sécurité et la simplicité d’administration.

### 🔹 Fail2ban

**Fail2ban** joue le rôle de **protection contre les attaques par brute-force**.

 Il analyse les fichiers de logs des services (comme SSH ou Apache) et bannit automatiquement les adresses IP suspectes après plusieurs tentatives échouées. Cela renforce efficacement la sécurité du serveur en bloquant les attaques automatisées.

Dans notre cas de figure nous avons configurer au bout de 3 tentatives sur une fenêtres de 5 minutes de ban l'ip une durée de 10 minutes.

## Infrastructure réseau et base de données

### 🔹 MariaDB

MariaDB joue le rôle de base de donnée relationnelle , servant de backend de stockage pour des applications comme GLPI ou Grafana. Compatible avec MySQL, elle offre de bonnes performances, une grande fiabilité, et reste entièrement open source.


### 🔹 Cloudflared

Cloudflared joue le rôle de tunnel sécurisé vers Cloudflare, agissant comme un proxy reverse. Il permet d’exposer des services locaux (comme l’interface GLPI) via HTTPS, tout en bénéficiant de la protection DDoS de Cloudflare, et ce sans avoir à ouvrir de ports sur le serveur.

### 🔹 Apache2

Apache2 joue le rôle de serveur web et reverse proxy, permettant d’exposer proprement les services Docker via des sous-domaines. Il offre la possibilité d’ajouter des certificats SSL, de gérer les redirections, les en-têtes HTTP et d'autres configurations avancées. Selon les besoins, il peut être remplacé par Nginx, souvent plus léger pour ce type d’usage.

## ⚙️ Interface d’administration

🔹 Portainer

Portainer joue le rôle d’interface graphique de gestion Docker, permettant d’administrer facilement l’ensemble des conteneurs, stacks, volumes, images et réseaux, sans avoir recours à la ligne de commande. Il offre une vue d’ensemble claire de l’environnement et facilite considérablement la gestion et l’observation des services déployés.