# Ansible

## Configure Ansible User

1. Create a new ansible user

    ```yaml
    useradd -m -d /home/ansible-user/ -s /bin/bash -G sudo ansible-user
    passwd ansible-user
    ```

2. Add Ansible User to sudoers

    ```shell
    echo "ansible-user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible-user
    ```

3. Copy SSH Keys

    ```shell
    ssh-copy-id -i ~/.ssh/id_ed25519.pub ansible-user@host
    ```

4. Run

    ```shell
    ansible-playbook -i inventory.yaml site.yaml
    ```
