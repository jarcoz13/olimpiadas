Autor: Alba Consuelo Nieto
===========================
El siguiente ejemplo ilustra la implementación de una aplicación en tres capas (presentación, negocio, datos) utilizando el patrón DAO, JSP, JDBC y PostgreSQL. 

El ejemplo crea y consulta un Municipio utilizando el primer ejercicio trabajado en clase de Municipios y Viviendas.Para ejecutar el ejemplo se debe:
1. Crear el la base de datos en PostgreSQL.La base de datos se debe llamar catastro
2. Ejecutar el script DDLCatastro.sql en la base de datos
3. Cargar y compilar el proyecto en Netbeans 
4. Ejecutar la página index.jsp
5. Seleccionar la opción Incluir Municipio que aparece en el Menú. Insertar municipios y verificar en la base de datos que los registros se hayan incluido
6. Como ejercicio, puede implementar la página para consultar municipios.

Notas:
- Utilizar la versión de Netbeans 8.1 o superior
- Asegurarse de que el servidor GlassFish esté adicionado (esto se hace por la opción Tools/Servers del menú principal de NetBeans)
- Asegurarse de que el servidor PostgreSQL esté iniciado