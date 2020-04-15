# Uso la imagen Node versión 8.10.0
FROM node:8.10.0

# Defino el workdir
WORKDIR /app

# Agrego `/app/node_modules/.bin` al $PATH
#ENV PATH /app/node_modules/.bin:$PATH

# Agrego el código del proyecto al Workdir
ADD . /app

# Instalo las dependencias
RUN yarn install --silent

# El puerto en el que escuchará la app es el 3000
EXPOSE 3000

# Ejecuto la aplicación
CMD ["yarn", "start"]
# Equivalente a : yarn start