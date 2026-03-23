# 📚 Biblioteca Digital UNTEC 

## Tecnologías Utilizadas:

- Java EE
- Jakarta Servlet
- JSP 
- JSTL
- JDBC
- MySQL
- Apache Tomcat 10.1.52
- Bootstrap 5
- Maven
- JDK 21

## Descripción del Proyecto

Sistema web desarrollado en Java EE para gestionar la biblioteca digital de la Universidad UNTEC. 
El proyecto implementa el patrón de diseño MVC con acceso a base de datos mediante el patrón DAO, 
gestión de sesiones de usuario, vistas dinámicas con JSP y JSTL, y despliegue en Apache Tomcat. 
Permite a estudiantes consultar el catálogo y solicitar préstamos, y a administradores gestionar libros, 
copias y el ciclo completo de préstamos.
---
## Descripción General

La Biblioteca Digital UNTEC es un sistema de gestión web que permite a los usuarios interactuar 
con el catálogo de libros de forma online. 
El sistema contempla dos tipos de usuario: estudiantes y administradores. 
Los estudiantes pueden consultar el catálogo disponible y solicitar préstamos de libros. 
Los administradores gestionan el catálogo completo y administran el ciclo de vida de cada préstamo.

Cada libro en el sistema puede contar con múltiples copias físicas. 
Esta distinción es importante: cuando un estudiante solicita un libro, 
el sistema asigna automáticamente una copia disponible, 
permitiendo que otros estudiantes puedan solicitar el mismo título si existen más copias disponibles. 
Los administradores pueden agregar o eliminar copias de cada libro según las necesidades de la biblioteca.

Los préstamos siguen un ciclo de cuatro estados: 
SOLICITADO: cuando el estudiante realiza la solicitud
ENTREGADO: cuando el administrador hace entrega física del libro asignando una fecha de vencimiento de dos meses
VENCIDO: cuando el préstamo supera la fecha límite
DEVUELTO: cuando el administrador registra la devolución y la copia vuelve a estar disponible para nuevos préstamos.
---
## Funcionalidades Principales
- Inicio de sesión con RUT y contraseña  
![Login](./src/docs/img/presentacion/Login.PNG)

- Cerrar sesión  
![Cerrar Sesión](./src/docs/img/presentacion/CerrarSesion.PNG)

### 👤 Estudiante
- Consulta del catálogo completo de libros  
![Catálogo](./src/docs/img/presentacion/Catalogo.PNG)

- Vista de detalle del libro  
![Detalle Libro](./src/docs/img/presentacion/DetalleLibro.PNG)

- Solicitud de préstamo  
![Solicitud Confirmación](./src/docs/img/presentacion/solicitudConfirmacion.PNG)

- Préstamos del estudiante  
![Mis Préstamos](./src/docs/img/presentacion/MisPrestamos.PNG)

### 🛠️ Administrador
- Gestión del catálogo  
![Libros](./src/docs/img/presentacion/Libros.PNG)

- Agregar Libros  
![Agregar Libro](./src/docs/img/presentacion/AgregarLibro.PNG)

- Editar Libro  
![Editar Libro](./src/docs/img/presentacion/EditarLibro.PNG)

- Gestión de copias  
![Copias](./src/docs/img/presentacion/Copias.PNG)

- Gestión Préstamos Solicitados - Entregados - Vencidos - Devueltos  
![Préstamos Solicitados](./src/docs/img/presentacion/PrestamosSol.PNG)  
![Préstamos Entregados](./src/docs/img/presentacion/PrestamosEnt.PNG)  
![Préstamos Vencidos](./src/docs/img/presentacion/PrestamosVen.PNG)  
![Préstamos Devueltos](./src/docs/img/presentacion/PrestamosDev.PNG)

---

## Credenciales de Prueba
### Administrador:
Usuario: 11565421-1  
Contraseña: carla2024  

### Estudiante
Usuario: 19876543-2  
Contraseña: sumac456  

---

## Base de Datos
Los archivos DDL y DML se encuentran en: `BibliotecaWeb/src/docs/sql`.

### Diagrama ER  
![Diagrama ER](./src/docs/img/sql/DiagramaER.PNG)

### Tablas  
![Tabla Copias](./src/docs/img/sql/TablaCopias.PNG)  
![Tabla Libros](./src/docs/img/sql/TablaLibros.PNG)  
![Tabla Préstamos](./src/docs/img/sql/TablaPrestamos.PNG)  
![Tabla Usuarios](./src/docs/img/sql/TablaUsuarios.PNG)


