FROM node:18-slim

RUN apt-get update && apt-get install -y \
    git \
    wget \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
    
    
# Clone le dépôt dans /app
RUN git clone https://github.com/juliendragz/CaptchaSolver_LocalServer.git /app

# Utilise le sous-dossier offlineCaptchaSolver/ qui contient le serveur Node.js
WORKDIR /app/offlineCaptchaSolver/

# Installe les dépendances Node.js
RUN npm install

# Expose le port utilisé par l'application
EXPOSE 3000

# Démarre l'application
CMD ["node", "server.js"]
