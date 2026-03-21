# flutter

PASOS DE IMPLEMENTACION DEL CODIGO Flutter

1. Tener instalado Flutter,dart,node.js ,xampp
2. Para clonar o descargar el repositorio 
    -Metodo HTPP
        Se dirigira al boton que esta a "code" vera una pestaña que dice "HTTPS" copeara la url que esta anexa 
        En el escritorio de windows abrira una terminal de comandos -CMD- con click derecho, en la terminal escribira "git clone -HTTP COPEADO-" y le dara enter para clonar el repositorio desde el metodo HTTP
    -Metodo .zip
        Se dirigira al boton que esta a "code" vera un boton que dice Donwload Zip, esta seleccion le descargara un archivo .zip 
        Se ubicara en descargas dentro de su windows, le dara cick derecho encima del archivoy buscara la opcion descomprimir.
3. Entrar en el repositorio clonado e identificar la carpeta db.
4. Ejecutar xampp y entrar a phpmyadmin.
5. ir a la pestaña importar, selecionar [elegir archivo] y buscar el archivo api-crud.sql ejecutar la base de datos.
6. verificar si se creo la base de datos y la tablas.
7. Entrar a la carpeta del repositorio y abri en dos entornos diferentes la carpeta Flutter y la carpeta api.
8. En el entorno de api moverse si no esta en la carpeta "api-basic" con el comando en terminal "ls" para identificar en que carpeta se encuentra y luego con "cd" hacia la carpeta "api-basic" y ejecutar el comando "npm install" para instalar las dependencia.
9. En el entorno de Flutter moverse si no esta en la carpeta "flutter" con el comando en terminal "ls" para identificar en que carpeta se encuentra y luego con "cd" hacia la carpeta "flutter" y ejecutar el comando "flutter pub get" para instalar las dependencias.
10. En el entorno de api ejecutar el comando "npm start" para iniciar el servidor.
11. En el entorno de Flutter ejecutar el comando "flutter run" para iniciar la aplicacion.
12. Le aparecera una zona de eleccion de emulador o dispositivo, seleccione el emulador o dispositivo de su preferencia y presione enter -preferiblemente chrome-.
13. Ya en la pestana de chrome podra ver la aplicacion y podra interactuar con ella. 
14. Si no quiere crear un usuario nuevo siga a la siguiente instruccion, si prefiere crear un usuario nuevo en postman con la url "http://localhost:3000/api_v1/apiUser" y metodo POST y en el body JSON 
    {
        "user": "[EMAIL_ADDRESS]",
        "password": "[PASSWORD]",
        "status": "Active",
        "role": "-exiten solo 3 roles admin,user,test puede elegir el de su preferencia"
    }.
15. Este es un usuario de prueba que ya esta creado en la base de datos, escribira en la seccion email o usuario "user@email.com" y en la seccion password "12345678" y presione enter.
16. Esto lo llevara a la pantalla de inicio de home en la parte derecha arriva habra un boton de salir de la aplicacion, presione salir y lo llevara a la pantalla de inicio de sesion.
17. En la pantalla vaya a la seccion de "registro un rol" y escriba los datos que se le piden, presione "guardar rol" y lo llevara a la pantalla de inicio de sesion.



     
