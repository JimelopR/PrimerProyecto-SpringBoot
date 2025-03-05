Este proyecto es es el primero que hago en Spring Boot, aqui solo es para echarlo a andar 
y hacer la conexión a la base de datos para ello en el proyecto dejo el script para crear 
la Base de Datos, tomar las siguientes consideraciones:

1. "\primerProyecto\src\main\resources\application.properties" existe este archivo
que es el configura la conexion a la Base de Datos, tiene este código:

spring.datasource.url=jdbc:mysql://localhost:3306/nombre_de_tu_base

spring.datasource.username=tu_usuario

spring.datasource.password=tu_contraseña

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect

spring.jpa.hibernate.ddl-auto=update


2. Debes cambiar tu usuario y contraseña donde se indica
y el nombre de la base de Datos, yo la nombre "primerProyectoLibreria" 
y así se encuentra en el proyecto, también si tu puerto es distinto al
que yo estoy usando que es el 3306, también se tiene que cambiar en la url de la bd

4. Yo trabaje con MySQLWorkbench
5. Tiene que estar todo bien configurado, Maven, El jdk, el ide y las variables de entorno sel sistema
6. Use maven 3.9.9 y Java version: 23.0.2
