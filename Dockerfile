# Dockerfile

# Usa a imagem oficial do Nginx
FROM nginx:latest

# Remove o arquivo HTML padrão do Nginx
RUN rm /usr/share/nginx/html/index.html

# Copia o arquivo HTML personalizado para o diretório do Nginx
COPY index.html /usr/share/nginx/html/

# Expõe a porta padrão do Nginx
EXPOSE 80

