# Hospital DB — Sistema de Gestão Hospitalar Vida & Saúde

## Apresentação

Este projeto acadêmico apresenta o desenvolvimento de um banco de dados relacional para o Hospital Geral Vida & Saúde. O objetivo é organizar as principais informações da instituição, facilitando o acesso aos registros de pacientes, médicos, quartos, internações, consultas e prescrições médicas.

O banco de dados foi desenvolvido utilizando MySQL, com modelagem e administração realizadas pelo MySQL Workbench. Seu nome é Hospital DB.

## Domínio do banco de dados

O domínio escolhido é a gestão hospitalar. O sistema foi desenvolvido para armazenar e relacionar informações importantes da rotina do Hospital Geral Vida & Saúde, incluindo os pacientes cadastrados, os médicos e suas especialidades, os quartos disponíveis, as internações realizadas, as consultas médicas e as prescrições de medicamentos.

O objetivo é centralizar essas informações, facilitar o acesso aos registros hospitalares e permitir consultas confiáveis sobre atendimentos, internações, prescrições e valores financeiros.

## Contextualização

O Hospital Geral Vida & Saúde utiliza planilhas eletrônicas isoladas e registros em papel para controlar parte de suas atividades. A falta de um sistema centralizado dificulta a consulta e a atualização dos dados, além de aumentar a possibilidade de erros.

No último trimestre, uma auditoria interna identificou que 15% dos atendimentos geraram cobranças incorretas. Também houve perda de 8% do histórico clínico de pacientes crônicos. Além disso, a sobreposição de agendas médicas provocou o cancelamento de 45 consultas na última semana.

Esses problemas prejudicam a organização dos setores do hospital e dificultam o acompanhamento das informações. Diante dessa situação, a diretoria estabeleceu o prazo de 10 dias para apresentar uma solução em ambiente de homologação, evitando novas falhas e possíveis sanções administrativas dos órgãos de saúde.

## Proposta de melhoria

A proposta consiste na criação de um banco de dados relacional utilizando MySQL para centralizar as informações hospitalares em tabelas relacionadas.

As chaves primárias identificam cada registro, enquanto as chaves estrangeiras conectam as tabelas e ajudam a preservar a integridade dos dados. Essa organização permite reduzir a repetição de informações, facilitar os cadastros e melhorar o acesso aos registros.

Com a implantação do sistema, espera-se melhorar o controle de pacientes, médicos, quartos, consultas, internações e prescrições, além de apoiar os setores administrativo, médico, financeiro, recepção, farmácia e auditoria.

A solução também busca evitar a sobreposição de horários dos médicos e a ocupação simultânea de um mesmo quarto. Entretanto, essas regras precisam de mecanismos complementares, pois ainda não são implementadas automaticamente pela estrutura SQL apresentada nesta versão.

## Modelagem lógica

O banco de dados é composto por seis tabelas principais, responsáveis por organizar as informações hospitalares.

A tabela pacientes armazena os dados pessoais dos pacientes cadastrados, incluindo identificador, nome, CPF, data de nascimento, telefone e convênio.

A tabela medicos registra os profissionais que trabalham no hospital, contendo identificador, nome, CRM e especialidade médica.

A tabela quartos armazena as informações dos quartos disponíveis, incluindo identificador, número, andar, tipo e situação.

A tabela internacoes registra as internações realizadas e relaciona os pacientes aos quartos. Também armazena o identificador da internação, o paciente relacionado, o quarto utilizado, as datas de entrada e saída e o valor da diária.

A tabela consultas armazena os atendimentos médicos realizados no hospital. Nela são registrados o identificador da consulta, o paciente atendido, o médico responsável, a data da consulta, a situação e o valor cobrado.

A tabela prescricoes registra os medicamentos indicados durante as consultas, incluindo identificador da prescrição, consulta relacionada, medicamento, dosagem e quantidade receitada.

Os tipos de dados SQL e as restrições exatas devem ser conferidos no script de criação do banco e no modelo desenvolvido no MySQL Workbench.

## Relacionamentos e cardinalidades

O relacionamento entre pacientes e internações é de um para muitos, pois um paciente pode possuir vários registros de internação, mas cada internação está vinculada a um paciente.

O relacionamento entre quartos e internações também é de um para muitos, porque um quarto pode aparecer em diferentes registros de internação ao longo do tempo, enquanto cada internação está vinculada a um quarto.

Entre pacientes e consultas existe um relacionamento de um para muitos, já que um paciente pode realizar várias consultas, mas cada consulta pertence a um paciente.

O relacionamento entre médicos e consultas é de um para muitos, pois um médico pode realizar várias consultas, enquanto cada consulta está vinculada a um médico responsável.

Por fim, o relacionamento entre consultas e prescrições é de um para muitos, porque uma consulta pode possuir várias prescrições, mas cada prescrição pertence a uma consulta.

Essas relações são implementadas por meio de chaves estrangeiras, permitindo conectar as informações e manter a integridade referencial do banco de dados.

## Formas normais

A normalização foi considerada na organização do banco de dados até a Terceira Forma Normal, com o objetivo de reduzir a repetição de informações e evitar problemas durante a inserção, atualização e exclusão dos registros.

A Primeira Forma Normal (1FN) determina que cada campo deve armazenar um único valor, sem listas ou grupos de informações em uma mesma coluna. No Hospital DB, os dados dos pacientes, médicos, quartos, internações, consultas e prescrições são separados em campos individuais.

A Segunda Forma Normal (2FN) determina que todos os atributos não-chave devem depender da chave primária completa. No projeto, os atributos de cada tabela estão relacionados ao identificador do respectivo registro, evitando dependências parciais.

A Terceira Forma Normal (3FN) determina que os atributos não-chave não devem depender de outros atributos que não sejam a chave primária. No Hospital DB, as informações de pacientes, médicos e quartos ficam separadas em suas próprias tabelas, enquanto as demais utilizam chaves estrangeiras para relacionar esses registros.

A normalização contribui para reduzir a repetição de informações, facilitar atualizações e manter a consistência dos dados.

## Implementação SQL e dados de teste

O banco de dados Hospital DB foi criado utilizando MySQL e contém seis tabelas principais: pacientes, medicos, quartos, internacoes, consultas e prescricoes.

Foram inseridos dez registros em cada uma das seis tabelas, totalizando 60 registros de teste. Os dados simulam situações hospitalares e permitem testar os relacionamentos entre pacientes, médicos, quartos, internações, consultas e medicamentos prescritos.

O script SQL reúne a criação do banco de dados, a criação das seis tabelas, a definição das chaves primárias e estrangeiras, as restrições e a inserção dos registros de teste.

## Consultas SQL e perguntas de negócio

O projeto prevê quinze consultas estratégicas para atender às necessidades de informação dos diferentes setores do hospital. Elas utilizam relacionamentos entre tabelas, filtros, ordenações, agrupamentos e funções de cálculo.

A primeira consulta apresenta o nome do paciente, o médico responsável, a data da consulta, o medicamento prescrito e a quantidade receitada.

A segunda consulta apresenta o histórico de internações, incluindo o paciente, o número do quarto, o andar, a data de entrada e o valor da diária.

A terceira consulta lista os pacientes, seus convênios, os médicos que os atenderam e as especialidades desses profissionais.

A quarta consulta apresenta as prescrições, identificando o médico responsável, sua especialidade, o paciente e o medicamento indicado.

A quinta consulta cruza os registros de pacientes que passaram por internações e consultas, apresentando sem duplicidades o paciente, o quarto, o médico e a data do atendimento.

A sexta consulta apresenta os nomes dos pacientes, os médicos responsáveis e as datas das consultas, organizando os atendimentos dos mais recentes para os mais antigos.

A sétima consulta apresenta o nome do paciente, o número do quarto e o valor da diária, organizando os resultados do menor para o maior valor.

A oitava consulta calcula o valor médio das consultas médicas registradas no hospital.

A nona consulta calcula o valor total arrecadado exclusivamente com as consultas médicas registradas no banco de dados.

A décima consulta identifica as consultas de pacientes com sobrenome Silva, apresentando o paciente, o médico responsável e a data da consulta.

A décima primeira consulta localiza os atendimentos realizados por médicos cujas especialidades contenham a expressão Cardio.

A décima segunda consulta apresenta as internações com entrada no primeiro semestre de 2026, incluindo o paciente, o quarto e a data de entrada.

A décima terceira consulta calcula o valor total gasto em consultas por pacientes com convênio que contenha o nome Unimed, agrupando os resultados por paciente e organizando do maior para o menor valor.

A décima quarta consulta calcula o custo total das diárias por andar dos quartos, considerando somente pacientes com sobrenome Oliveira e organizando os resultados em ordem crescente de andar.

A décima quinta consulta calcula o faturamento total das consultas por especialidades que contenham a palavra Cirurgia, começando pelo maior faturamento.

As quinze consultas devem ser implementadas em SQL e apresentadas com seus respectivos comandos e resultados obtidos no MySQL Workbench. Os resultados exatos dependem dos registros inseridos no banco e, por isso, devem ser conferidos após a execução, sem utilizar valores presumidos.

## Testes e validação

Após a criação das tabelas e a inserção dos dados, devem ser realizados testes para verificar se as seis tabelas foram criadas corretamente e se cada uma possui dez registros.

Também é necessário verificar se as chaves primárias identificam os registros, se as chaves estrangeiras mantêm os relacionamentos e se as restrições de preenchimento e unicidade funcionam corretamente.

As quinze consultas devem ser executadas para confirmar que não apresentam erros e que os resultados correspondem aos dados cadastrados. Também devem ser realizados testes para verificar a proteção contra exclusões indevidas e a integridade referencial, impedindo referências a registros inexistentes.

A prevenção automática de conflitos de horários médicos e de ocupação simultânea de quartos ainda precisa ser implementada em uma etapa complementar.

## Resultados esperados

Com a implantação do Hospital DB, espera-se centralizar as informações hospitalares, facilitar o acesso aos históricos e melhorar a organização dos atendimentos.

O sistema poderá apoiar o setor administrativo na organização dos registros hospitalares, o setor médico na consulta aos históricos e atendimentos, o setor financeiro no acompanhamento dos valores cobrados, a recepção na localização dos dados dos pacientes, a farmácia na consulta às prescrições médicas e a auditoria no acompanhamento das internações e dos registros financeiros.

As consultas estratégicas permitem transformar os registros armazenados em informações úteis para a administração do hospital.

## Ferramentas utilizadas

O MySQL foi utilizado para a criação e o gerenciamento do banco de dados relacional.

O MySQL Workbench foi utilizado como ferramenta de apoio à modelagem, visualização dos relacionamentos e administração do banco de dados.

## Exportação do banco de dados

A exportação do banco pode ser realizada pelo MySQL Workbench, utilizando a opção Data Export. Nessa etapa, deve ser selecionado o banco hospital_db e marcada a opção para exportar a estrutura e os dados.

O arquivo de exportação deve ser salvo em um local de fácil acesso para permitir a restauração do banco quando necessário.

## Como executar o projeto

Para executar o projeto, é necessário instalar e abrir o MySQL Server e o MySQL Workbench, conectar-se ao servidor MySQL e abrir o script de criação do banco.

Depois, devem ser executados os comandos responsáveis pela criação do banco e das seis tabelas. Em seguida, deve ser executado o script de inserção dos dados de teste.

Após a inserção, é necessário conferir se todas as tabelas possuem dez registros e executar as quinze consultas SQL. Por fim, devem ser conferidos os resultados, os relacionamentos e as restrições do banco de dados.

Os arquivos SQL e os diagramas da modelagem devem ser salvos para a entrega do projeto.

## Estrutura do repositório

O repositório do projeto deve conter o arquivo README.md, o script de criação das tabelas chamado 01_criacao_tabelas.sql, o script de inserção dos dados chamado 02_insercao_dados.sql e o script das consultas chamado 03_consultas.sql.

Também deve conter o arquivo hospital_db_dump.sql, quando a exportação tiver sido realizada, e a imagem modelagem.png, que deve apresentar o diagrama lógico criado no MySQL Workbench.

## Entrega

A entrega do projeto deve incluir a documentação do Hospital DB, o script de criação das tabelas, o script de inserção com pelo menos dez registros por tabela, o script com as quinze consultas estratégicas, o diagrama lógico DER e o arquivo de exportação do banco de dados.

O repositório deve ser publicado no GitHub, e o link deverá ser enviado na plataforma indicada pelo professor.

## Considerações finais

O projeto Hospital DB apresenta uma estrutura de banco de dados relacional para organizar as principais informações do Hospital Geral Vida & Saúde.

A separação dos dados em seis tabelas relacionadas facilita a consulta dos registros e contribui para reduzir os problemas causados pelo uso de planilhas isoladas e documentos em papel.

A estrutura contempla o cadastro de pacientes, médicos e quartos, além do controle de internações, consultas e prescrições. A inserção dos dados de teste e as quinze consultas estratégicas permitem avaliar a organização das informações e apoiar as análises dos diferentes setores da instituição.

Para atender integralmente aos requisitos do projeto, ainda é necessário validar os diagramas MER e DER, realizar os testes de integridade referencial e implementar mecanismos específicos para impedir a sobreposição de horários médicos e a ocupação simultânea de quartos.

**Projeto acadêmico — Sistema de Gestão Hospitalar Vida & Saúde.**
