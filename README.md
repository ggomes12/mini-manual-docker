# Mini-manual de Funcionalidades do Docker

Obs: Para uma melhor visualização do mini-manual, abra-o com o Preview do vscode (visualizador de arquivos .MD)
ou leia-o no próprio github

## a. Dockerfile
### O que é?
O Dockerfile é um arquivo de texto que contém todas as instruções para criar uma imagem Docker. Ele define a base da imagem, as dependências, as configurações e o comando a ser executado quando um container é iniciado a partir dessa imagem.

### Funcionalidades:
- **FROM**: Define a imagem base.
- **RUN**: Executa comandos durante a construção da imagem.
- **COPY**: Copia arquivos do sistema de arquivos local para a imagem.
- **CMD**: Especifica o comando padrão a ser executado quando o container é iniciado.
- **EXPOSE**: Informa ao Docker que o container escutará em portas específicas durante a execução.

### Exemplo de Dockerfile:
```Dockerfile
# Use uma imagem base do Ubuntu
FROM ubuntu:latest

# Atualiza o sistema e instala pacotes
RUN apt-get update && apt-get install -y curl

# Copia um arquivo para a imagem
COPY ./meuarquivo.txt /app/meuarquivo.txt

# Define o comando a ser executado
CMD ["echo", "Hello, Docker!"]
```


## a. Volumes
### O que são?
Volumes são um mecanismo do Docker para persistir dados gerados e utilizados por containers. Eles permitem que você armazene dados fora do sistema de arquivos do container, garantindo que os dados não sejam perdidos quando o container é removido.

### Funcionalidades:
- **Persistência de Dados**: Os dados em volumes persistem mesmo se o container for excluído.
- **Compartilhamento**: Volumes podem ser compartilhados entre vários containers.
- **Gerenciamento**: Você pode criar, inspecionar e remover volumes usando comandos Docker.

### Comandos Úteis:
- **Criar um volume**:
    ```bash
    docker volume create meu_volume
    ```

- **Listar volumes**:
    ```bash
    docker volume ls
    ```

- **Inspecionar um volume**:
    ```bash
    docker volume inspect meu_volume
    ```

- **Remover um volume**:
    ```bash
    docker volume rm meu_volume
    ```

### Exemplo de Uso de Volumes:
```bash
# Criar um volume
docker volume create meu_volume

# Iniciar um container usando o volume
docker run -d -v meu_volume:/app/data nginx
```

## c. Gerenciamento de Imagens
### O que é?
O gerenciamento de imagens no Docker refere-se ao processo de criar, listar, excluir e compartilhar imagens Docker. As imagens são os componentes principais na construção de containers, pois contêm o sistema de arquivos e as dependências necessárias para a execução de aplicações.

### Funcionalidades:
- **Listagem de Imagens**: Permite ver todas as imagens disponíveis localmente.
- **Remoção de Imagens**: Exclui uma ou mais imagens que não são mais necessárias ou estão obsoletas.
- **Baixar Imagens**: Obtém imagens do Docker Hub ou de outros repositórios.
- **Construção de Imagens**: Cria novas imagens a partir de um Dockerfile.

### Comandos Úteis:
- **Listar imagens**:
    ```bash
    docker images
    ```

- **Remover uma imagem**:
    ```bash
    docker rmi nome_da_imagem
    ```

- **Baixar uma imagem do Docker Hub**:
    ```bash
    docker pull ubuntu:latest
    ```

### Exemplo de Comandos de Gerenciamento de Imagens:
1. **Listar todas as imagens disponíveis**:
    ```bash
    docker images
    ```

    **Saída Esperada**:
    ```
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    nginx               latest              abcdef123456        2 days ago          123MB
    ubuntu              latest              789ghijk1234       5 days ago          72.9MB
    ```

2. **Remover uma imagem específica**:
    ```bash
    docker rmi nginx
    ```

    **Nota**: Para remover uma imagem que está sendo usada por algum container, você precisará parar e remover o container primeiro.

3. **Baixar uma imagem do Docker Hub**:
    ```bash
    docker pull nginx
    ```

4. **Criar uma nova imagem a partir de um Dockerfile**:
    ```bash
    docker build -t minha_imagem:1.0 .
    ```

    **Nota**: O ponto (`.`) indica que o Dockerfile está no diretório atual.


# Passo a Passo para Testar e Capturar Tela
### Captura de Tela:
## a. Dockerfile

### Passo 1: Criar um Dockerfile
1. Crie um diretório para o projeto:
    ```bash
    mkdir mini_manual
    cd mini_manual
    ```
2. Crie um arquivo chamado `Dockerfile`:
    ```bash
    nano Dockerfile
    ```
![Imagem 01 - ](/home/guilhermegomes/Documents/03-SD/lista05/01.png)

3. Insira o seguinte conteúdo no `Dockerfile`:
    ```Dockerfile
    FROM ubuntu:latest
    RUN apt-get update && apt-get install -y curl
    COPY ./meuarquivo.txt /app/meuarquivo.txt
    CMD ["echo", "Hello, Docker!"]
    ```
4. Salve e saia do editor (`Ctrl + X`, depois `Y`, depois `Enter`).

![Imagem 02 - ](/home/guilhermegomes/Documents/03-SD/lista05/02.png)

### Passo 2: Criar um arquivo de exemplo
1. Crie um arquivo de texto:
    ```bash
    echo "Este é um arquivo de exemplo." > meuarquivo.txt
    ```

### Passo 3: Construir a imagem
1. Execute o comando para construir a imagem:
    ```bash
    docker build -t minha_imagem:1.0 .
    ```


![Imagem 03 - ](/home/guilhermegomes/Documents/03-SD/lista05/03.png)

### Passo 4: Rodar o container
1. Execute o container a partir da imagem:
    ```bash
    docker run --rm minha_imagem:1.0
    ```


![Imagem 04 - ](/home/guilhermegomes/Documents/03-SD/lista05/04.png)

---

---

## b. Volumes

### Passo 1: Criar um volume
1. Crie um volume chamado `volume_mini_manual`:
    ```bash
    docker volume create volume_mini_manual
    ```
### Passo 2: Listar volumes
1. Liste todos os volumes:
    ```bash
    docker volume ls
    ```

![Imagem 05 - ](/home/guilhermegomes/Documents/03-SD/lista05/05.png)

### Passo 3: Executar um container com o volume
1. Execute um container usando o volume criado:
    ```bash
    docker run -d -v volume_mini_manual:/app/data nginx
    ```

### Passo 4: Inspecionar o volume
1. Inspecione o volume para verificar as informações:
    ```bash
    docker volume inspect volume_mini_manual
    ```

![Imagem 06 - ](/home/guilhermegomes/Documents/03-SD/lista05/06.png)

### Passo 5: Buildar o volume
1. Build o volume:
    ```bash
    docker build -t volume_nginx .
    ```

![Imagem 06 - ](/home/guilhermegomes/Documents/03-SD/lista05/07.png)


### Passo 5: Executar o container
1. Execute o container:
    ```bash
    docker run -d --name nginx_custom -p 8080:80 volume_nginx
    ```

### Passo 5: Fazer requisição http
1. Requisite na porta 8080 com o comando curl:
    ```bash
    curl http://localhost:8080
    ```

![Imagem 06 - ](/home/guilhermegomes/Documents/03-SD/lista05/08.png)


---

## c. Gerenciamento de Imagens

### Passo 1: Listar imagens
1. Liste todas as imagens disponíveis:
    ```bash
    docker images
    ```

### Passo 2: Remover uma imagem
1. Remova uma imagem específica:
    ```bash
    docker rmi ubuntu
    ```


![Imagem 06 - ](/home/guilhermegomes/Documents/03-SD/lista05/09.png)


### Passo 3: Baixar uma imagem do Docker Hub
1. Baixe a imagem do Nginx:
    ```bash
    docker pull nginx
    ```


![Imagem 06 - ](/home/guilhermegomes/Documents/03-SD/lista05/10.png)

## Esse mini-manual cobre os principais recursos do Dockerfile, volumes e gerenciamento de imagens, com comandos e exemplos para testar cada funcionalidade.
### Aluno: Guilherme Kelvin da Silva Gomes
### Prof: Rayner Gomes
### Disciplina: Sistemas Distribuídos
