# Utilise l'image officielle de n8n
FROM n8nio/n8n:latest

# Définir les variables d'environnement nécessaires
ENV EXECUTIONS_MODE=queue
ENV DB_TYPE=sqlite
ENV N8N_HOST=$RENDER_EXTERNAL_HOSTNAME
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=${N8N_PROTOCOL}://${N8N_HOST}/

# Expose le port dynamique fourni par Render
EXPOSE $PORT

# Remplace la commande par défaut pour utiliser le port dynamique
CMD ["sh", "-c", "n8n start --port $PORT"]
