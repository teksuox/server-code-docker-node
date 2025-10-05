# code-server-container

Este proyecto contiene un contenedor de desarrollo que incluye code-server, permitiendo el uso de un entorno de desarrollo basado en la web.

## Estructura del Proyecto

- **.devcontainer/devcontainer.json**: Configuración del contenedor de desarrollo.
- **workspace/README.md**: Documentación sobre el espacio de trabajo y su uso.
- **docker-compose.yml**: Definición de los servicios y configuración del contenedor.
- **Dockerfile**: Instrucciones para construir la imagen del contenedor.

## Instrucciones de Configuración

1. Clona este repositorio en tu máquina local.
2. Asegúrate de tener Docker y Docker Compose instalados.
3. Navega al directorio del proyecto.
4. Ejecuta `docker-compose up` para construir y ejecutar el contenedor.

## Uso

Una vez que el contenedor esté en funcionamiento, puedes acceder a code-server a través de tu navegador web. La URL y el puerto se especificarán en la configuración de `docker-compose.yml`.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar este proyecto, por favor abre un issue o un pull request.