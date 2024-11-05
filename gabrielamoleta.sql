CREATE TABLE pacientes (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(130) UNIQUE NOT NULL,
telefone VARCHAR(20),
endereco VARCHAR(500)
);

CREATE TABLE medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE consultas (
    id SERIAL PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATE NOT NULL,
    FOREIGN KEY (paciente_id)
    REFERENCES pacientes(id)
    FOREIGN KEY (medico_id)
    REFERENCES medicos(id)
);

INSERT INTO pacientes (id, nome, email, telefone, endereco) VALUES
(1, 'Joao', 'joao@gmail.com', '19-994127771', 'Rua A, 789'),
(2, 'Maria', 'maria@gmail.com', '19-996385382', 'Rua B 363'),
(3, 'Carlos', 'carlos@gmail.com', '19-990531128', 'Rua C 875');

INSERT INTO medicos (id, nome, especialidade) VALUES
(1, 'Dr. Ana', 'Pediatria'),
(2, 'Dr. Pedro', 'Ortopedia'),
(3, 'Dr. Luiza', 'Ginecologista');

INSERT INTO consultas (id, paciente_id, medico_id, data_consulta) VALUES
(1, 1, 1, '05-11-2024'),
(2, 2, 2, '06-11-2024'),
(3, 3, 3, '07-11-2024');


SELECT pacientes.nome AS nomePacientes, medicos.nome AS nomeMedico, consultas.data_consulta, medicos.especialidade
FROM consultas
JOIN pacientes ON consultas.paciente_id = pacientes.id
JOIN  medicos ON consultas.medico_id = medicos.id;


SELECT pacientes.nome AS nomePaciente, medicos.nome AS nomeMedico, consultas.data_consulta AS dataConsulta, medicos.especialidade AS especialidade
FROM pacientes
LEFT JOIN consultas ON pacientes.id = consultas.paciente_id
LEFT JOIN medicos ON consultas.medico_id = medicos.id;


SELECT medicos.nome AS nomeMedico, medicos.especialidade AS especialidade
FROM medicos
LEFT JOIN consultas ON medicos.id = consultas.medico_id
WHERE consultas.id IS null;