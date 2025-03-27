# weather-monitor

Este es un pequeño script para mostar en conky la temperatura actual

## Configuración: 

Para configurar este script es necesario crear un cron para ejecutar este en un tiempo determinado y agregar las variables de tornos necesarias

### Variable de entorno: 

- APIKEY_WEATHER ="key de la api openweathermap"
- LATI ="latitud donde estara monitoreando la temperatura"
- LONG = "longitud donde estara monitoreando la temperatura"

### Cron:

*/5 * * * * /usr/local/bin/weather.sh

