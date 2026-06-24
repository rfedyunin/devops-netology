Репозиторий для курса DevOps.

В папке terraform добавлен .gitignore, который игнорирует служебные файлы Terraform: папки .terraform, файлы состояний (*.tfstate), логи, файлы подписей и переменные окружения, чтобы случайно не закоммитить секреты.


### Описание правил в .gitignore для Terraform

В файле .gitignore для Terraform используются следующие шаблоны:

1. *.tfstate — звёздочка (*) означает любые символы, поэтому игнорируются все файлы с расширением .tfstate (например, terraform.tfstate, prod.tfstate).

2. *.tfstate.* — игнорируются все файлы с расширением .tfstate и любым окончанием (например, terraform.tfstate.backup).

3. *.tfvars и *.tfvars.json — игнорируются все файлы с расширением .tfvars и .tfvars.json (например, terraform.tfvars, dev.tfvars.json).

4. *.auto.tfvars и *.auto.tfvars.json — игнорируются все файлы с расширением .auto.tfvars и .auto.tfvars.json (например, dev.auto.tfvars).

5. .terraform/ — слеш в конце означает, что игнорируется целая директория .terraform со всем содержимым.

6. crash.log и crash.*.log — игнорируются файлы crash.log и все файлы, начинающиеся с crash. и заканчивающиеся на .log (звёздочка заменяет любые символы).

7. override.tf, override.tf.json, *_override.tf и *_override.tf.json — игнорируются файлы с точными именами override.tf и override.tf.json, а также все файлы, заканчивающиеся на _override.tf и _override.tf.json (звёздочка в начале заменяет любые символы).

8. .terraformrc и terraform.rc — игнорируются файлы с точными именами .terraformrc и terraform.rc.

