```bash
python3 -m venv env
source env/bin/activate
env/bin/pip3 install  -r requirements.txt
env/bin/ansible-playbook kms.yaml  -b -v -i ./inventory/dev.ini
env/bin/ansible-playbook cluster.yaml  -b -v -i ./inventory/dev.ini -e "ignore_assert_errors=true"
```

example kms.yaml file

```yaml
- hosts: kube_control_plane
  roles:
    - vault-kms
  vars:
    docker_tag: "demo3"
    vault_address:  https://vault/
    vault_token: token
    vault_key: kubespray-test
```
