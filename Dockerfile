# Utilise une image Alpine avec Node.js
FROM node:18-alpine

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie package.json et install les dépendances
COPY package*.json ./
RUN npm ci --only=production

# Copie le reste des fichiers
COPY . .

# Définir les variables d'environnement nécessaires
ENV EXECUTIONS_MODE=queue
ENV DB_TYPE=sqlite
ENV N8N_HOST=$RENDER_EXTERNAL_HOSTNAME
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=${N8N_PROTOCOL}://${N8N_HOST}/

# Expose le port dynamique fourni par Render
EXPOSE $PORT

# Commande de démarrage
CMD ["node", "server.js"]
