#!/bin/bash
API_KEY=${APIKEY_WEATHER} 
LAT=${LATI} 
LON=${LONG}

URL="https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&units=metric&APPID=${API_KEY}"


# Obtener la respuesta JSON
JSON=$(curl -s "$URL" | jq '{temp: .main.temp, icon: .weather[0].icon}')

# Usamos un 'case' para definir el icono basado en el código del icono
ICON=$(echo "$JSON" | jq -r '.icon')
case "$ICON" in
    "01d") ICON_EMOJI="☀️";;
    "01n") ICON_EMOJI="🌙";;
    "02d") ICON_EMOJI="🌤️";;
    "02n") ICON_EMOJI="☁️";;
    "03d"|"03n") ICON_EMOJI="🌥️";;
    "04d"|"04n") ICON_EMOJI="☁️";;
    "09d"|"09n") ICON_EMOJI="🌧️";;
    "10d"|"10n") ICON_EMOJI="🌦️";;
    "11d"|"11n") ICON_EMOJI="🌩️";;
    "13d"|"13n") ICON_EMOJI="❄️";;
    "50d"|"50n") ICON_EMOJI="🌫️";;
    *) ICON_EMOJI="❓";;
esac

# Guardar la temperatura y el icono en el archivo
echo "$JSON" | jq --arg icon "$ICON_EMOJI" '. + {icon_emoji: $icon}' > /tmp/weather.txt

