## Подготовка к запуску
Склонировать репозиторий и перейти в папку `ansible`

```bash
cd ansible
```

### Качаем все зависимости
Коллекции
```bash
ansible-galaxy collection install -r requirements.yml -p ./ --force
```
Роли
```bash
ansible-galaxy role install -r requirements.yml
```

### Настроить инвентарь
```bash
cp inventory/inventory.yaml.sample inventory.yaml
```
Указываем адрес нашей целевой машины в директиве `ansible_host`, при необходимости указываем порт в директиве `ansible_port`

### Первичная инициализация
Для первичной инициализации необходимо настроить УЗ ansible, с которой будут осуществялться дальнейшие запуски

```bash
ansible-playbook -i inventory/inventory.yaml playbooks/main.yaml --tags "create_user" --extra-vars "ansible_user=<ssh_login>" --ask-pass --become
```
где `<ssh_login>` - УЗ SSH, которая была создана при создании целевой машины.
После этого в терминал ввести пароль от УЗ

### Работа с плейбуками
После прохождения первичной инициализации дальнейшие манипуляции можно проводить с помощью УЗ `ansible` и *ansible-tags*

#### Первый запуск
```bash
ansible-playbook -i inventory/inventory.yaml playbooks/main.yaml --tags "prepare"
```

#### Обновление приложения
```bash
ansible-playbook -i inventory/inventory.yaml playbooks/main.yaml --tags "update_app"
```

#### Запуск приложения
```bash
ansible-playbook -i inventory/inventory.yaml playbooks/main.yaml --tags "start_app"
```

#### Остановка приложения
```bash
ansible-playbook -i inventory/inventory.yaml playbooks/main.yaml --tags "stop_app"
```

