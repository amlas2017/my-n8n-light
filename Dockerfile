# Dockerfile

# Choisissez une version spécifique de N8N pour la stabilité.
# Trouvez les tags ici : https://hub.docker.com/r/n8nio/n8n/tags
ARG N8N_VERSION=1.36.0 # Remplacez par la version de N8N souhaitée
FROM n8nio/n8n:${N8N_VERSION}

# --- Section de personnalisation (Optionnelle) ---
# Si vous avez besoin d'installer des paquets système supplémentaires, décommentez et adaptez :
# USER root
# RUN apt-get update && apt-get install -y \
#    vips-dev \ # Exemple pour le traitement d'images avec Sharp (si un noeud custom l'utilise)
#    ffmpeg \   # Exemple pour le traitement vidéo/audio
#    # ... autres paquets ...
#    && rm -rf /var/lib/apt/lists/*
# USER node # Retourner à l'utilisateur non-root 'node' utilisé par N8N

# Si vous avez des fichiers de configuration personnalisés ou des noeuds customs à copier :
# COPY ./custom-nodes /home/node/.n8n/custom/
# COPY ./my-n8n-config.json /home/node/.n8n/config

# N8N écoute sur le port 5678 par défaut, déjà exposé par l'image de base.
# EXPOSE 5678

# Le point d'entrée et la commande sont hérités de l'image de base n8nio/n8n
# Vous n'avez généralement pas besoin de les redéfinir.
