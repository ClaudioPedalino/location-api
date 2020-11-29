## LOCATION-API README:

- - -
#### BASE DE DATOS
Uso 2 bases de datos, postgres (por defecto) pero si quisieran podrían usar una base de datos en memoria (ventaja: no necesitan instalar nada, desventaja: no pueden consultarla en éste caso y además se pierde la información dentro al apagar la api)
En el archivo `appsettings.json` van a encontrar la siguiente sección:
```bash 
    "DataProvider": {
        "UsingPostgre": "True",
        "UsingLocalDb": "False"
    },
```
Deben indicar con 'True' la base de datos que quieran utilizar, por defecto va a usar postgres

Para correr la base de postgres deben correr el comando 'Update-Database' provisto por el tooling de EFCore.
- - -

#### AUTENTICACION
Integré la librería de ASP.Identity, deberan registrar un usuario y luego logear tantas veces como gusten, ambos endpoints de ejecutarse satisfactoriamente nos retornan un bearer token, que utilizaremos para poder ingresar a los demás endpoints
El edpoint `api/v1/identity/register` nos registra un usuario nuevo en la base de datos, la contraseña debe tener al menos un carácter en mayúscula y al menos un caracter no alfanumerico, igualmente si lo ingresan mal el mensaje de error es claro, mismo que el mail que ingresamos, que será tamibién nuestro nombre de usuario no debe exisitir previamente
El endpoint `api/v1/identity/login` será para logear a la aplicación, en caso de tener un usuario previamente registrado, también nos devuelve un token de acceso
- - -

#### POSTMAN
Exporté 2 archivos de postman, deberán importar ambos. Uno contiene la collection de request con información ya configurada para funcionar, se encuentra en el archivo `Location Api.postman_collection.json`. El siguiente archivo que deberán importar será el `Location.Api.postman_environment.json` y contiene el entorno de trabajo, junto con las variables de entorno necesarias y ya configuradas para funcionar; La única que deberan modificar claramente es el token de acceso ya que al levantar un entorno nuevo, el token se generará nuevamente
- - -

#### SWAGGER
Esta configurado para poder utilizar swagger con los endpoints disponibles, y también la autenticación para lograrlo en los endpoints que lo requieran.
- - -

#### BUSQUEDA
A la hora de buscar por nombre de la provincia existen 3 modos de búsqueda:

**Estricta**: Deberá coincidir la palabra completa, coincidiendo mayúsculas y mínusculas, también deberán coincidir las vocales acentuadas.
**Flexible**: Deberá coincidir la palabra completa si, pero ahora no serán tenidas en cuenta mayúsculas y mínusculas y será indistinto las vocales acentuadas.
**Like**: Es la modalidad más flexible, ignora mayúsculas, mínusculas y acentos y devuelve una lista de provincias que contengan ese segmento buscado en su nombre. Ej: "san" nos retornara "San Luis", "San Juan", "Santa Cruz", etc..

Para indicar qué tipo de búsqueda se quiere realizar deberá indicarse con 'True' en el `appsettings.json` en la siguiente sección:
```bash
"MatchingConstraintLevelEnum": {
    "Stirct": "False",
    "Flexible": "True",
    "Like": "False"
  },
```
Por defecto vendrá configurado el modo flexible
- - -

#### DOCKER
Configuré también la utilización de docker, existen 2 maneras para que puedan utilizarlo, en local, o en nube, recomiendo fuertemente la manera local
- **LOCAL**
Deberán posicionarse sobre la carpeta de la aplicación, donde se encuentra el archivo `docker-compose.yml` y levantar una nueva consola, y ejecutar el commando:
    ```bash
    docker-compose up -d
    ```
    Esto levantará 3 contenedores con los 3 servicios de nuestra aplicación: la base de datos postgres, la api, y el servicio de logging de Seq 

- **Nube**
Deberán ingresar a la url `https://labs.play-with-docker.com/` y crear un contenedor, (el único requisito es tener una cuenta de docker-hub, de no tenerla pueden resigstarse gratuitamente en: `https://hub.docker.com/`)
Una vez dentro del conetenedor nube que dura 4 hs debereán crear una instancia y tendrán acceso a una shell de linux, y ahí dentro ejecutar los 2 comandos siguientes:
    ```bash
    docker run -d --restart unless-stopped --name seq -e ACCEPT_EULA=Y -p 5341:80 datalust/seq:latest
    ```
    Este commando pondrá a correr una instancia del servicio de Seq, lamentablemente si levantan el servicio de esta manera no hay manera de que se conecte a la api por lo que no tendrá ninguna utilidad, sin embardo el commando es muy útil si quieren levantar una instancia del servicio de Seq de manera local
    
    ```bash
    docker run -d --name locationapi -p 44338:80 claudiopedalino/locationapi
    ```
    Éste comando levantará una instancia de la api y la pondrá a correr en el puerto :44338, La imagen que utilizá este contenedor es de mi registro de imagenes de docker-hub y por defecto dejé que utilicé una base de datos en memoria