FROM ghcr.io/coder/code-server:latest

# Cambiar a usuario root para instalar paquetes
USER root

# Instalar dependencias adicionales si es necesario
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node.js (especificando la versión 24)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
    && apt-get install -y nodejs

# Instalar Docker CLI
RUN apt-get update && apt-get install -y ca-certificates
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce-cli

# Instalar gosu para cambiar de usuario correctamente
RUN apt-get update && apt-get install -y gosu

# Crear el grupo docker con el GID que coincide con el del contenedor dind (999)
# y añadir el usuario coder a ese grupo.
RUN getent group docker || groupadd -g 999 docker
RUN usermod -aG docker coder

# NO cambiar de usuario aquí. El contenedor se iniciará como root.
# USER coder

# Copiar configuraciones adicionales si es necesario, asegurando el propietario correcto
COPY --chown=coder:coder ./workspace /home/coder/project

# Establecer el directorio de trabajo
WORKDIR /home/coder/project

# Exponer el puerto por defecto de code-server
EXPOSE 8080

# Usar gosu para cambiar al usuario 'coder' y ejecutar el comando.
# Esto inicializa correctamente los grupos del usuario.
CMD ["gosu", "coder", "code-server", "--host", "0.0.0.0", "--port", "8080", "--auth", "none", "/home/coder/project"]