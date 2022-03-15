# README

# Introdução

O desafio desta aplicação consiste em implementar a página /dashboard. Esta página é formada por várias tabelas que
apresentam estatísticas de sistemas solares fictícios.

O esqueleto da aplicação está criado, com os modelos necessários já definidos e os CRUDs dos mesmo implementados. As
tabelas do dashboard devem ser populadas fazendo uso de boas práticas de consultas com ActiveRecord, criando escopos e
associações has_many :through sempre que possível e evitando consultas desnecessárias.

As técnicas de boas práticas de organização de código e testes já estudadas devem ser usadas quando aplicável.

Cada uma das tabelas do dashboard deve ser tratada independentemente, embora todas vão ser usadas pelo mesma action do
mesmo controller.

## Requisitos

- Ruby 3.0+
- Banco de dados PostgreSQL

## Semente de dados

O arquivo `db/seeds.rb` contém um script que cria um número considerável de registros no banco de dados e deve ser
executado com o comando `rails db:seed`.

## Descrição das tabelas

### Quantidade de corpos celestes

Apresentar o número total dos Estrelas, Planetas e Luas cadastrados no banco de dados.

### Número de estrelas por categoria

Listar a quantidade de estrelas existentes em cada categoria.

### 5 candidatos mais próximos

Um candidato é um planeta que atende as condições para vida:

- É um planeta rochoso
- Está na zona habitável do seu sistema
- Possui uma gravidade aceitável
- Não tem rotação sincronizada

A distância a ser considerada é a distância entre a Terra e a estala em torno da qual o planeta orbita.

### 5 sistemas com maior massa total

A massa total de um sistema é o somatório das massas de todos os corpos que compõem o sistema.

### Planetas na zona habitável

Exibir o número de planetas localizado em cada uma das faixas em relação a distância com sua estrela.

### Resumo dos sistemas mais próximos

Apresentar os 10 sistemas mais pŕoximos com a sua quantidade de planetas e luas, além do nomde do planeta e lua com
maior massa.

### Luas dos sistemas recentes

Apresentar os 5 sistemas inserido mais recentemente com o nome de suas luas no formato "Lua 1 e mais X luas"

## Definição de termos

- Planetas na zona habitável: planetas que encontram-se entre 0.3 e 10.0 UA de distância da sua estrela
- Gravidade aceitável: planetas que possuem massa similar a terrestre, entre 0.6 e 2.0 vezes a massa da Terra
- Rotação sincronizada: (tidal lock) significa que o corpo celeste tem sempre o mesmo lado em direção ao corpo celeste
  no qual orbita.
