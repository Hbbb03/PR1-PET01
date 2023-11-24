    Manual Técnico

1.	Introducción:

El presente Manual Técnico ofrece una visión exhaustiva y detallada del desarrollo y funcionamiento de la aplicación de máquina recicladora, un proyecto innovador orientado a promover y fomentar el reciclaje mediante la tecnología móvil. Esta herramienta pretende abordar la problemática ambiental incentivando a los usuarios a participar activamente en la recopilación y reciclaje de botellas plásticas mediante un sistema de recompensas.

El equipo de desarrollo se embarcó en la creación de esta aplicación con el propósito de brindar una solución práctica y atractiva para los usuarios interesados en contribuir al cuidado del medio ambiente. La aplicación se ha diseñado con una interfaz intuitiva y amigable, accesible tanto a través de dispositivos móviles como en entornos web, con el fin de facilitar su uso y maximizar su alcance.


2.	Descripción del proyecto:

La aplicación de la máquina recicladora es una plataforma que permite a los usuarios participar activamente en la tarea de reciclar botellas plásticas, brindándoles la oportunidad de acumular puntos como incentivo por sus contribuciones al medio ambiente. La premisa principal radica en la facilidad de uso: el usuario simplemente escanea el código QR proporcionado por la máquina recicladora al depositar botellas, lo que registra automáticamente la cantidad de botellas recicladas y otorga puntos en consecuencia.
Este sistema de recompensas se gestiona a través de una aplicación móvil desarrollada en Flutter, disponible para sistemas operativos Android e iOS, que permite a los usuarios realizar un seguimiento de sus puntos acumulados, revisar sus estadísticas de reciclaje y participar en campañas y promociones especiales relacionadas con el reciclaje.
Por otro lado, se ha desarrollado una plataforma web administrativa utilizando C# ASP.NET conectada a MongoDB Atlas, permitiendo al administrador de la máquina recicladora gestionar campañas, desde una interfaz intuitiva y completa. Esta plataforma web facilita el registro y la visualización de campañas activas que luego se reflejan en la aplicación móvil para su difusión entre los usuarios.
El enfoque técnico del proyecto ha priorizado la robustez y la escalabilidad, empleando MongoDB Atlas como base de datos para almacenar de manera eficiente y segura la información de los usuarios, los puntos acumulados, las campañas activas y los registros de reciclaje.
La aplicación se ha desarrollado con un enfoque centrado en el usuario, garantizando una experiencia fluida y satisfactoria tanto para aquellos que deseen registrarse y mantener un perfil personalizado, como para aquellos que prefieran participar de manera anónima en el proceso de reciclaje.
Este proyecto representa un paso significativo hacia la conciencia ambiental y la participación activa de la comunidad en la preservación del medio ambiente, alentando prácticas responsables y sostenibles a través de la tecnología.




3.	Roles / integrantes

Team Lider: Andres Castel Belmonte
Data Base Architect: Mishel Bravo Almendras
Developer-Git Master: Hugo Ballivian Beller



4.	Arquitectura del software: 

La aplicación se estructura en tres componentes principales:

App móvil (Flutter): Gestiona la interacción del usuario para el escaneo de QR, registro de botellas recicladas y visualización de puntos acumulados.

Página web administrativa (C# ASP.NET): Permite al administrador gestionar campañas de incentivo al reciclaje, registrándolas para que aparezcan en la app móvil.
Base de Datos (MongoDB Atlas): Almacena la información de usuarios, puntos acumulados, campañas activas, y datos de registro de botellas recicladas.
Patrones de diseño utilizados:

Patrón MVC (Modelo-Vista-Controlador): Implementado en la página web administrativa para separar la lógica de negocio (Controlador) de la interfaz (Vista) y la manipulación de datos (Modelo).


5.	Requisitos del sistema:

Requerimientos de Hardware (mínimo):

Cliente (Dispositivo móvil):

•	Sistema operativo: Android 7.0 o superior / iOS 10 o superior
•	Procesador: Dual-core 1.8 GHz
•	Memoria RAM: 2 GB
•	Espacio de almacenamiento: 100 MB libres


Servidor / Hosting / Base de Datos Hardware:

•	Procesador: Quad-core 2.4 GHz
•	Memoria RAM: 8 GB
•	Almacenamiento: 100 GB SSD
•	Requerimientos de Software:


Cliente Software:

•	Navegador web actualizado (para la versión web administrativa)
•	Flutter SDK instalado (para la versión móvil)


Servidor / Hosting / Base de Datos Software:

•	Sistema operativo: Windows Server / Linux
•	MongoDB 4.0 o superior
•	ASP.NET Framework
•	Flutter SDK para compilación de la aplicación móvil desde el servidor


Este manual técnico proporciona una visión detallada de la aplicación de la máquina recicladora, abarcando aspectos funcionales, técnicos y de requerimientos para su correcto despliegue y funcionamiento.


6.	Instalación y configuración:

•	Descargar el repositorio de la rama de main
 



•	Abrir el proyecto con Visual Studio Code

 



•	Dirigirse al archivo  “constant.dart”
 

•	Cambiar la direccion Url por la proporcionada por Mongo Atlas

 

•	Para saber la url de su base dirijase DEPLOYMENT/Database -> connect
 

•	Seleccionar Drivers y luego copiar la url de la base : 
 
 

•	Para ver la base o crear una, entrar a Browse Collections
 

 
•	Ajustar la url y tablas de la base en el “constant.dart”


 

•	Ejecutar en una terminal  Flutter pub get

 

 
Esto se hace, ya que al abrir el proyecto no tendrá las dependencias instaladas

•	Conectar un teléfono virtual o físico para ejecutar la app

Ejm. un emulador en android studio: 

 




•	Ejecutar en terminal el comando Flutter run

 

•	Esperar a que se cargue la app en el dispositivo 

 


•	Descargar la app del administrador desde el repositorio

 

•	Modificar la url de la base, con la que se usa en la app 

 

•	Modificar el Program.cs con el nombre de la base 

 

•	Ejecutar la Aplicación 

 


7.	PROCEDIMIENTO DE HOSTEADO / HOSTING (configuración)

Nota Importante: siempre a las apps de flutter (dart) en la terminal ejecutar el comando “Flutter pub get” para obtener las dependencias de esta.

Se requiere que el  equipo en el que se trabaja, tenga instalado Node.js y npm

Desde cmd u otra consola, instalar : “npm install express mongoose body-parser”


Para simular el funcionamiento de la cámara de la máquina de reciclaje hay una permite de pruebas que permite la interacción con el qr de la app, esta servirá como Servidor-Api para conectar con la base y actualizar el peso que tenga el usuario al que haya detectado, la app de pruebas se encuentra en la rama “AppPruebas” del repositorio de Github,
 

Despues, ejecutar el comando “Flutter run” en la terminal.

Para que esta app funcione se debe ejecutar el servidor-Api de la app, este se encuentra en la rama “Servidor(API)” del repositorio, 
 

Se debe cambiar la url por la propia para que funcione, ademas cambiar en la linea:
  
Y reemplazarlo por la ip de la pc, luego ejecutar "Flutter run” en terminal ejecutar el comando “node server.js”
Y con eso permitirá usar la API, de la cual su url será lo que salga en consola como mensaje.


8.	GIT : 

Link del repositorio de github: https://github.com/Hbbb03/PR1-PET01.git

9.	Personalización y configuración: 

La aplicación de la máquina recicladora está diseñada para ofrecer cierta flexibilidad en términos de personalización y configuración, adaptándose a las necesidades específicas de los usuarios. Para lograr esta personalización, se han integrado opciones y ajustes que permiten modificar ciertos aspectos del software:

•	Gestión de campañas y promociones: Los administradores tienen la capacidad de crear, editar y eliminar campañas especiales o promociones dentro de la aplicación móvil, estableciendo condiciones específicas para la acumulación de puntos o recompensas adicionales.

•	Opciones de registro y autenticación: Los usuarios pueden personalizar su experiencia eligiendo entre registrarse con un perfil completo, optar por un registro anónimo.

10.	Seguridad:

•	No compartir las credenciales de inicio de sesión con nadie

11.	Depuración y solución de problemas: 

Para facilitar la identificación y resolución de problemas, se proporcionan las siguientes pautas:

Aplicación Movil: En caso de salir un error al usar Flutter run la mayoría de casos se arregla usando el comando Flutter pub get, si sale en terminal que no reconoce una ruta del proyecto y muestra la de otro equipo, volver a ejecutar Flutter Run, en caso de ser otro tipo de error persistente en dependencias, se pueden usar los siguientes comandos : dart fix --dry-run y luego dart fix –apply,

App de pruebas: Si algo llegase a fallar respecto a la conexión, cambiar todo lo que dice localhost por la propia ip del equipo


12.	Glosario de términos: 

Flutter :  Es un marco de código abierto desarrollado y compatible con Google

MongoDB Atlas: MongoDB Atlas es una base de datos en la nube totalmente gestionada que se encarga de toda la complejidad de desplegar, gestionar y reparar sus despliegues en el proveedor de servicios en la nube de su elección (AWS, Azure y GCP).


NODE.JS: Node (o más correctamente: Node. js) es un entorno que trabaja en tiempo de ejecución, de código abierto, multi-plataforma, que permite a los desarrolladores crear toda clase de herramientas de lado servidor y aplicaciones en JavaScript.


13.	Referencias y recursos adicionales: 

Flutter : https://docs.flutter.dev/


14.	Herramientas de Implementación:
•	Lenguajes de programación:

Se uso principalmente Dart para las apps, JavaScript respecto al servidor-Api y C# en la pagina del Admin.

•	Frameworks:

Se uso ASP.NET CORE ENTITY FRAMEWORK en la página del Administrador

•	APIs de terceros, etc.

La única API es la propia de la app creada en el archivo “server,js”

15.	Bibliografía

MongoDB Atlas documentación: 

https://www.mongodb.com/docs/atlas/

Flutter documentación:

https://docs.flutter.dev/

