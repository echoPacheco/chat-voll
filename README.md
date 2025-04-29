# Chat Voll - Frontend

Este é o backend da aplicação **Chat Voll**, desenvolvida com **Ruby on Rails**, **Vue.js** e **PostgreSQL**, com suporte a autenticação de usuários, envio de mensagens, upload de arquivos e visualização de métricas.

## Tecnologias Utilizadas

- **Ruby**
- **Rails**
- **PostgreSQL**
- **Active Storage (upload de arquivos)**
- **Action Cable (troca de mensagens em tempo real)**
- **BCrypt (hashing de senhas)**
- **JWT (autenticação via token)**
- **Kaminari (a fazer paginação das mensagens)**


## Requisitos

- Rails (versão utilizada: 7.1.5.1)
- Yarn (versão utilizada: 1.22.22)

## Como rodar o projeto

1. **Clone o repositório**

```bash
git clone https://github.com/echoPacheco/chat-voll.git
cd chat-voll/backend
```
2. **Instale as dependências**
```bash
bundle install
```

3. **Configure o banco de dados**

Crie um arquivo .env com a seguinte variável:
```bash
POSTGRES_PASSWORD=suasenha
```
Certifique-se de que o PostgreSQL esteja rodando e que exista um usuário postgres com a senha correta.

Depois rode:
```bash
rails db:create
rails db:migrate
rails db:seed
```
Necessário rodar o seed para a criação dos usuários

4. **Inicie o servidor**
```bash
rails server
```

**✅ Funcionalidades**

- Envio de mensagens entre usuários

- Autenticação utilizando token JWT

- Comunicação em tempo real via WebSocket

- Suporte ao envio de arquivos

- Paginação na listagem de mensagens

- Endpoint de métricas