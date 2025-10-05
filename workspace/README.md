# README for the Code Server Workspace

# Introducción
Este espacio de trabajo está diseñado para facilitar el uso de code-server en un entorno de desarrollo. A continuación, se detallan las instrucciones para configurar y utilizar el contenedor.

# Requisitos Previos
Asegúrate de tener Docker y Docker Compose instalados en tu máquina.

# Configuración del Contenedor
1. Clona este repositorio en tu máquina local.
2. Navega al directorio `code-server-container`.
3. Ejecuta el siguiente comando para iniciar el contenedor:
   ```
   docker-compose up -d
   ```

# Acceso a code-server
Una vez que el contenedor esté en funcionamiento, puedes acceder a code-server a través de tu navegador en la siguiente dirección:
```
http://localhost:8080
```
Asegúrate de reemplazar `8080` con el puerto que hayas configurado en `docker-compose.yml` si es diferente.

# Extensiones Recomendadas
Se recomienda instalar las siguientes extensiones para mejorar tu experiencia de desarrollo:
- [Extensión 1]
- [Extensión 2]

# Contribuciones
Si deseas contribuir a este proyecto, por favor abre un issue o un pull request en el repositorio.

# Licencia
Este proyecto está bajo la licencia MIT.