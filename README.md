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
