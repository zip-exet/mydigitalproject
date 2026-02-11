#!/bin/bash

# === CONFIGURATION ===
BACKUP_DATE=$(date +"%Y-%m-%d_%H-%M")
DEST_VM="10.2.5.98"
DEST_USER="backupuser"
DEST_DIR="/srv/backups"
KEY_PATH="/home/$(whoami)/.ssh/id_rsa"

# Dossiers à sauvegarder
declare -A SOURCES
SOURCES["loomi"]="/srv/loomi"
SOURCES["groop"]="/srv/groop"

# Dossier temporaire local pour les archives
TMP_BACKUP_DIR="/tmp/docker-backups"

# Création dossier temporaire
mkdir -p $TMP_BACKUP_DIR

echo "🔄 Démarrage de la sauvegarde..."

for NAME in "${!SOURCES[@]}"; do
    SRC="${SOURCES[$NAME]}"
    ARCHIVE_NAME="${NAME}_backup_${BACKUP_DATE}.tar.gz"
    ARCHIVE_PATH="${TMP_BACKUP_DIR}/${ARCHIVE_NAME}"

    echo "📦 Compression de ${SRC}..."
    tar -czf "${ARCHIVE_PATH}" -C "$(dirname $SRC)" "$(basename $SRC)"

    echo "📤 Transfert vers ${DEST_VM}:${DEST_DIR}/${NAME}/"
    ssh -i "${KEY_PATH}" ${DEST_USER}@${DEST_VM} "mkdir -p ${DEST_DIR}/${NAME}"
    rsync -avz -e "ssh -i ${KEY_PATH}" "${ARCHIVE_PATH}" ${DEST_USER}@${DEST_VM}:${DEST_DIR}/${NAME}/

    echo "✅ ${NAME} sauvegardé."
done

# Nettoyage local
rm -rf "${TMP_BACKUP_DIR}"
echo "🧹 Dossiers temporaires nettoyés."
echo "🎉 Sauvegarde terminée avec succès."
