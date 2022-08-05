# EN ESPAÑOL

Screencast con ffmpeg con opción de pausa

Tuve esta idea porque vi el siguiente proyecto abandonado

[https://github.com/raviraa/ffmpegui](https://github.com/raviraa/ffmpegui)

**Dependencias**

```sudo apt install ffmpeg git clex```

Sugiero usar el administrador de archivos para terminal Clex, pero también puede usar: "nnn" o alguna terminal como: xfce4-terminal, gnome-terminal, konsole, tilix, qterminal, etc, etc.

**Instalación**

```git clone https://github.com/wachin/ffmpeg-screencast```

**Cómo usar**

Debe entrar desde una terminal en el respotorio clonado:

```
cd ffmpeg-screencast
```

Escriba en la terminal y presione Enter:

    clex
   
La primera vez que use Clex, debe configurarlo, presione Enter algunas veces para eso, siga las instrucciones y estará listo para usarlo

## Capturando la pantalla
Dentro de Clex primero pongase encima del script:

<span><mark>→ ffmpeg-yuv444p-losseless-mkv.sh</mark></span>

y presione Enter dos veces y comenzará a grabar la pantalla en un cuadro de 854x480 píxeles

para detenerlo con:

⌨  Ctrl + C

Para grabar otro video repita el proceso

## Uniendo los videos
Para unir los videos, pongase encima del script:

<span><mark>→ join.sh</mark></span> 

y presione Entrar dos veces, y espere un poco, los videos se unirán en la carpeta:

🗀 recorded-videos

**Otras opciones para FFmpeg**

Hay otros comandos para grabar pantalla con ffmpeg, hice un tutorial sobre ello pero en español:

**[Screencast] Grabar pantalla con FFmpeg 4.2 + seguir cursor + mostrar cursor + grabar rectangulo de 480p**
https://facilitarelsoftwarelibre.blogspot.com/2021/03/screencast-ffmpeg-follow-mouse-linux.html 
