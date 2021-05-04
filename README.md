# lab-tf-gcloud-ansible-docker-elastic

Laboratorio para desplegar un mini cluster de elasticsearch sobre dockers automatizado con ansible en la cloud de Google usando Terraform

## Verificar que se puede desplegar

Iniciar terraform...

```console
terraform init
```

crear el plan...

```console
terraform plan -out=plan
```

aplicar el plan...

```console
terraform apply plan
```

Si todo ha ido bien ya podemos eliminar lo que hemos creado

```console
terraform destroy
```

## Notas sobre inventory.tmpl

[bastion]
${bastion-dns} ansible_host=${bastion-ip} # ${bastion-id}

[servers]
%{ for index, dns in private-dns ~}
${dns} ansible_host=${private-ip[index]} # ${private-id[index]}
%{ endfor ~}

## Lanzar el laboratorio

```bash
#Creamos el plan de despliegue
tf plan -out=plan
#Desplegamos el plan sobre Google Cloud
tf apply plan
#Realizamos las instalaciones previas al despliegue de elastic
ansible-playbook -i inventory deploy_docker.yml
#Desplegamos los archivos de docker-compose certificados y condifuraciones
ansible-playbook -i inventory elastic_deploy.yml
#Unque ansible dispone de un módulo de para le compose, aqui hemos puesto un shell, se puede mejorar
#Lanzamos el docker compose
ansible-playbook -i inventory start_docker-compose.yml
#Una vez terminamos eliminamos el despliegue
tf destroy
```
