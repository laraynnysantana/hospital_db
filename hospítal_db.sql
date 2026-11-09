create database if not exists hospital_db;
use hospital_db;

create table if not exists paciente(
    id_paciente int auto_increment primary key,
    nome_paciente varchar(255) not null,
    cpf varchar(14) unique not null,
    data_nascimento date not null,
    telefone varchar(20),
    convenio varchar(50)
);

create table if not exists medicos(
    id_medico int auto_increment primary key,
    nome_medico varchar(255) not null,
    crm varchar(12) unique not null,
    especialidade varchar(100) not null
);

create table if not exists quarto (
    id_quarto int auto_increment primary key,
    numero_quarto int unique not null,
    andar int not null,
    tipo_quarto varchar(50) not null,
    status_quarto varchar(20) not null
);

create table if not exists internacoes(
    id_internacao int auto_increment primary key,
    id_paciente int not null,
    id_quarto int not null,
    data_entrada date,
    data_saida date,
    valor_diaria decimal(10,2),
    foreign key (id_paciente) references paciente(id_paciente),
    foreign key (id_quarto) references quarto(id_quarto)
);

create table if not exists consultas(
    id_consultas int auto_increment primary key,
    id_paciente int not null,
    id_medico int not null,
    data_consulta datetime,
    status_consulta varchar(30),
    valor_consulta decimal(10,2),
    foreign key (id_paciente) references paciente (id_paciente),
    foreign key (id_medico) references medicos (id_medico)
);

create table if not exists prescricoes(
    id_prescricoes int auto_increment primary key,
    id_consultas int not null,
    medicamento varchar(300),
    dosagem varchar(100),
    quantidade int,
    foreign key(id_consultas) references consultas (id_consultas)
);

insert into paciente (nome_paciente, cpf, data_nascimento, telefone, convenio) values
('Ana Silva', '111.222.333-01', '1985-03-15', '(11) 98765-4321', 'Unimed'),
('Carlos Oliveira', '222.333.444-02', '1990-07-22', '(11) 97654-3210', 'Bradesco Saúde'),
('Maria Santos', '333.444.555-03', '1978-11-05', '(11) 96543-2109', 'Unimed'),
('João Pedro Silva', '444.555.666-04', '2000-01-30', '(11) 95432-1098', 'Particular'),
('Fernanda Costa', '555.666.777-05', '1995-09-12', '(11) 94321-0987', 'Amil'),
('Roberto Almeida', '666.777.888-06', '1962-04-18', '(11) 93210-9876', 'SulAmérica'),
('Juliana Oliveira', '777.888.999-07', '1988-12-08', '(11) 92109-8765', 'Unimed Pleno'),
('Lucas Souza', '888.999.000-08', '2003-05-25', '(11) 91098-7654', 'Particular'),
('Beatriz Lima', '999.000.111-09', '1973-08-02', '(11) 90987-6543', 'Bradesco Saúde'),
('Ricardo Pereira', '000.111.222-10', '1981-10-19', '(11) 98877-6655', 'Amil');

insert into medicos (nome_medico, crm, especialidade) values
('Dr. Marcos Andrade', 'CRM/SP 12345', 'Cardiologia'),
('Dra. Patricia Lima', 'CRM/SP 23456', 'Pediatria'),
('Dr. Roberto Silva', 'CRM/SP 34567', 'Cardiologia Pediatrica'),
('Dra. Camila Rocha', 'CRM/SP 45678', 'Cirurgia Geral'),
('Dr. Gustavo Santos', 'CRM/SP 56789', 'Ortopedia'),
('Dra. Vanessa Martins', 'CRM/SP 67890', 'Cirurgia Vascular'),
('Dr. Felipe Barbosa', 'CRM/SP 78901', 'Neurologia'),
('Dra. Renata Mello', 'CRM/SP 89012', 'Ginecologia'),
('Dr. Eduardo Ramos', 'CRM/SP 90123', 'Dermatologia'),
('Dra. Claudia Castro', 'CRM/SP 01234', 'Cirurgia Plastica');

insert into quarto (numero_quarto, andar, tipo_quarto, status_quarto) values
(101, 1, 'UTI', 'Ocupado'),
(102, 1, 'Enfermaria', 'Livre'),
(201, 2, 'Apartamento', 'Ocupado'),
(202, 2, 'Apartamento', 'Livre'),
(301, 3, 'UTI', 'Ocupado'),
(302, 3, 'Enfermaria', 'Ocupado'),
(401, 4, 'Suíte VIP', 'Livre'),
(402, 4, 'Apartamento', 'Ocupado'),
(501, 5, 'UTI', 'Livre'),
(502, 5, 'Enfermaria', 'Ocupado');

insert into internacoes (id_paciente, id_quarto, data_entrada, data_saida, valor_diaria) values
(1, 1, '2026-02-10', '2026-02-20', 450.00),
(2, 3, '2026-03-01', '2026-03-10', 300.00),
(3, 5, '2026-04-15', '2026-04-25', 500.00),
(7, 6, '2026-05-01', '2026-05-08', 250.00),
(5, 8, '2026-06-10', '2026-06-18', 350.00),
(6, 10, '2026-07-01', '2026-07-10', 280.00),
(2, 1, '2026-08-05', '2026-08-12', 450.00),
(4, 2, '2026-01-15', '2026-01-22', 200.00),
(8, 4, '2026-02-20', '2026-02-28', 320.00),
(9, 7, '2026-03-12', '2026-03-19', 600.00);

insert into consultas (id_paciente, id_medico, data_consulta, status_consulta, valor_consulta) values
(1, 1, '2026-01-10 09:00:00', 'Realizada', 350.00),
(1, 4, '2026-02-05 14:00:00', 'Realizada', 500.00),
(2, 3, '2026-03-01 10:30:00', 'Realizada', 400.00),
(3, 2, '2026-03-15 11:00:00', 'Realizada', 280.00),
(4, 6, '2026-04-10 15:00:00', 'Realizada', 550.00),
(5, 5, '2026-05-02 08:30:00', 'Realizada', 320.00),
(6, 1, '2026-05-20 16:00:00', 'Realizada', 350.00),
(7, 10, '2026-06-01 13:00:00', 'Realizada', 600.00),
(8, 8, '2026-06-15 10:00:00', 'Realizada', 300.00),
(1, 4, '2026-07-01 14:00:00', 'Realizada', 500.00);

insert into prescricoes (id_consultas, medicamento, dosagem, quantidade) values
(1, 'Dipirona 500mg', '1 comprimido de 6h/6h', 20),
(1, 'Amoxicilina 500mg', '1 capsula de 8h/8h', 21),
(2, 'Ibuprofeno 600mg', '1 comprimido de 12h/12h', 10),
(3, 'Paracetamol 750mg', '1 comprimido de 8h/8h', 15),
(4, 'Omeprazol 20mg', '1 capsula em jejum', 30),
(5, 'Cetanest', 'Aplicar via IV', 5),
(6, 'Dorflex', '1 comprimido se dor', 12),
(7, 'Atenolol 50mg', '1 comprimido ao dia', 30),
(8, 'Cefalexina 500mg', '1 capsula de 6h/6h', 28),
(10, 'Tramadol 50mg', '1 comprimido de 8h/8h', 10);


