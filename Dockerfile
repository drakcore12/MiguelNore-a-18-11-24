# Usar la imagen base de nginx
FROM nginx:latest

# Crear carpeta personal en la raíz del sistema
RUN mkdir -p /MiguelNorena2772878

# Asignar permisos necesarios para la carpeta
RUN chmod 777 /MiguelNorena2772878

# Copiar una imagen de recursos a la carpeta personal
COPY recursos/imagen.jpg /MiguelNorena2772878/

# Copiar el script main.sh a la carpeta personal
COPY main.sh /MiguelNorena2772878/

# Convertir el script main.sh a formato Unix y asignar permisos de ejecución
RUN apt-get update && apt-get install -y dos2unix && \
    dos2unix /MiguelNorena2772878/main.sh && \
    chmod +x /MiguelNorena2772878/main.sh

# Copiar los archivos del portal web al directorio raíz de Nginx
COPY portal-web/ /usr/share/nginx/html/

# Comando para ejecutar el script y luego iniciar Nginx
CMD ["/bin/bash", "-c", "/MiguelNorena2772878/main.sh && nginx -g 'daemon off;'"]
