#
# Primera etapa - container para build
#
FROM node:8.10.0 as builder

# Defino el workdir
WORKDIR /app

# Agrego `/app/node_modules/.bin` al $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Instalo las dependencias
COPY package.json ./
COPY yarn.lock ./
RUN npm install react-scripts@2.1.5 -g --silent
RUN yarn install --silent

# Agrego el código del proyecto al Workdir
ADD . /app

# Compilo la aplicación
RUN yarn run build

#
# Segunda etapa - container de aplicación
#
FROM nginx:stable-alpine

# Copio la aplicacion del container builder
COPY --from=builder /app/build /usr/share/nginx/html

# El puerto en el que escuchará la app es el 80
EXPOSE 80

# Ejecuto el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]