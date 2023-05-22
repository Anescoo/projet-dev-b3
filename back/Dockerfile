# Utilisez l'image de base Node.js
FROM node:18-alpine

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier package.json et package-lock.json
COPY package*.json ./

# Installez les dépendances du projet
RUN npm ci --only=production

# Copiez le reste des fichiers de l'application
COPY . .

# Exposez le port sur lequel l'application écoute
EXPOSE 3000

# Démarrez l'application
CMD [ "npm", "run", "start:prod" ]
