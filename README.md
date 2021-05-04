# lab-tf-gcloud-ansible-docker-elastic

Laboratorio para desplegar un mini cluster de elasticsearch sobre dockers automatizado con ansible en la cloud de Google usando Terraform

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
