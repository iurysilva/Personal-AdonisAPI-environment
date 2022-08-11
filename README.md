# Adonis.js-API

<!---Esses são exemplos. Veja https://shields.io para outras pessoas ou para personalizar este conjunto de escudos. Você pode querer incluir dependências, status do projeto e informações de licença aqui--->


## 💻 Pré-requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:
* Você instalou a versão mais recente do Docker.
* Você instalou a versão mais recente do Docker Compose.
* Você instalou a versão mais recente do Node.js (Versão mínima permitida: Node.js 14).

## 🚀 Instalando
Primeiramente, crie um arquivo .env a partir do exemplo que está no diretório raiz, para atualizar as configurações do projeto, e de banco de dados:
```
cp .env.example .env
```

Para garantir:
```
npm install
```

Para que seja possível executar o projeto, é necessário instalar o CLI do Adonis.js no seu sistema:

```
npm i --global @adonisjs/cli
```

Para utilizar os serviços de banco de dados do Adonis.js, é necessário instalar o lucid:
```
npm i @adonisjs/lucid
```

Por fim, para criar as imagens no docker referentes a este projeto, basta executar o seguinte comando na raiz:
```
docker compose up
```
Ao final da criação das imagens, aperte CTRL+C para finalizar os containers, também é possível utilizar o comando:
```
docker compose stop
```


## ☕ Usando a API

Tenha em mente que ao rodar a API através do docker, não há hot-reload (A aplicação não atualiza em tempo real quando o código é modificado). Então, ao desenvolver, é mais atraende rodar a aplicação fora do container Docker usando o comando:
```
node ace serve --watch
```
E executar apenas o banco de dados e o pgadmin no Docker, a conexão da aplicação com esse banco já está configurada no arquivo ".env"

```
docker compose up postgres pgadmin -d
```

Agora, em relação a migrations:
- Para criar migrations:
```
node ace make:migration <nome da tabela>
```
- Para povoar o banco com as tabelas contidas nas migrations:
```
node ace migration:run
```

## 🐘 Usando pgadmin para visualizar os dados
Primeiro, execute a API e acesse a porta:
```
localhost:5052
```
Após isso, siga os seguintes passos:
- Faça login no pgadmin usando as credenciais presentes no arquivo "docker compose.yml".
- Clique com o botão direito em "servers" e selecione a opção de registrar um novo servidor.
- Na aba "General", apenas nomeie o servidor como desejar.
- Na aba "Connection", preencha os campos, "Host name/address", "Username", e "Password" com as informações contidas no arquivo "docker compose.yml". 
- Clique em "Save".

Ao fim dessas etapas, será possível visualizar o banco, você poderá visualizar as tabelas em "Schemas", se houverem. Além disso, é possível fazer queries PostgreSQL usando a ferramenta QuerieTool.

[⬆ Voltar ao topo](#Adonis.js-API)