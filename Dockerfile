# Uso la imagen OpejJDK versión 8
FROM node:8.10.0

# Defino el workdir
WORKDIR /app

# Instalo las dependencias
COPY package.json ./
RUN npm install --silent
RUN npm install react-scripts@2.1.5 -g --silent

# Agrego el código del proyecto al Workdir
ADD . /app

# El puerto en el que escuchará la app es el 3000
EXPOSE 3000

# Ejecuto la apliación
CMD ["npm", "start"]
# Equivalente a : npm start