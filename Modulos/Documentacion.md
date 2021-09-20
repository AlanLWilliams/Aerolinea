#DOCUMENTACIÓN DEL MÓDULO ODBC

###¿Que es este archivo?
Este archivo simplifica la conexión con el ODBC para realizar querys a la base de datos.
Todos vamos a usar este módulo.

###¿Como se usa?
Crear un ODBC llamado "Jandua" que vincule con la base de datos.

En tu primer formulario, incluí la siguiente línea de código:
`Call OdbcConexion.connect("Jandua")`

Luego, para realizar una query, se llama a la función
`Call doQuery("select nombre from personas")`.
