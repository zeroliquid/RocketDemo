# RocketChat demo
Automatic deployment of RocketChat 7.10 demo instance to Azure.

## Setting up the deployment environment
### Deploy Environment Setup (1), Preferred
1\. Install ansible, ansible-builder, ansible-navigator and Docker\
2\. Create `.env` file (`.env.example`)\
3\. `make build`\
4\. Make sure your ssh-agent is running and has the private key
```
eval `ssh-agent -s`
ssh-add ~/.ssh/id_azurevm
```

### Deploy Environment Setup (2)
1\. Install Ansible, AzureRM Collection and Azure CLI\
!!!! May disrupt your local environment.
```
python -m venv .venv # System python (3.12.12 Works)
source .venv/bin/activate

python -m pip install ansible
ansible-galaxy collection install azure.azcollection --force
python -m pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt

az login # Authenticate via CLI
```
Do **not** install Azure CLI into the same virtual environment, AzureRM has conflicting packages. 

2\. Create `group_vars/all.yaml`\
3\. Change `ansible.cfg`

## Usage
**1. Provision Resources**

1\) `make provision`

2\) `ansible-playbook provision.yaml -v --diff`

**2. Deploy**

1\) `make deploy`

2\) `ansible-playbook deploy.yaml -v --diff`

**3. Clean Up The Resources**

1\) `make cleanup`

2\) `ansible-playbook cleanup.yaml -v --diff`

(!) Force deletes non-empty resource group.


