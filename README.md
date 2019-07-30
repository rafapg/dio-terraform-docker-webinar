# dio-terraform-docker-webinar

Repositório criado para o Webniar de 

### Terraform

- Infrastructure as a Code (IaaC)
- Declarativa
    - Define recursos e o estado esperado
    - Envia um comando para que a infra passe a refletir a nova definição
- Permite alta customização com variáveis e linguagem de interpolação

### Diferenças entre providers

- Cada provider oferece uma gama de recursos a serem utilizados
- Os recursos são bastante diferentes
- Vamos usar como exemplo recursos básicos do Google Cloud Provider

### Por onde começar?

- Criar conta do (GCP) Google Cloud Platform
- Criar projeto no GCP
- Habilitar a cobrança (cadastrar cartao)
- Baixar o gcloud sdk
- Configurar projeto e conta no sdk
- Configurar credenciais no GCP

### Documentação Terraform?

- Getting started Google Provider:
    https://www.terraform.io/docs/providers/google/getting_started.html
- Instancia: 
    https://www.terraform.io/docs/providers/google/d/datasource_compute_instance.html

### Passo a passo

 - Criar uma instância básica:
    - Tudo default
 - Criar scripts de instalação do docker, docker compose
 - Clonar repositório
 - Startar aplicação


#### Instalar o docker

```
    $ curl -fsSL https://get.docker.com -o get-docker.sh
    $ sudo chmod +x get-docker.sh
    $ ./get-docker.sh
    $ sudo usermod -aG docker Rafael
    $ newgrp docker
```

#### Instalar o docker-compose

```
    $ sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    $ sudo chmod +x /usr/local/bin/docker-compose
    $ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```