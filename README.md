# PR1-PET01
Repositorio del proyecto PET01



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

Lider: Andres Castel Belmonte
Desarrollador: Mishel Bravo Almendras
Git Master: Hugo Ballivian Beller



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


Servidor / Hosting / Base de Datos:

•	Procesador: Quad-core 2.4 GHz
•	Memoria RAM: 8 GB
•	Almacenamiento: 100 GB SSD
•	Requerimientos de Software:


Cliente:

•	Navegador web actualizado (para la versión web administrativa)
•	Flutter SDK instalado (para la versión móvil)
