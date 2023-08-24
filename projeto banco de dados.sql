pragma foreign_key=on;

CREATE TABLE cliente( id integer primary key autoincrement not null, 
nome text, email text, genero text, idade integer )

CREATE TABLE agenda(id integer primary key autoincrement not null, 
horario text, objetivo text, data_agendamento text, tipo_de_consulta text, valor integer, id_cliente integer,
foreign key (id_cliente) references cliente(id) )

