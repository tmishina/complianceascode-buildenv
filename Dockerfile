FROM fedora:latest

RUN dnf install -y ansible python3
RUN ansible-galaxy install marcusburghardt.ansible_role_openscap
RUN cp -r /root/.ansible/roles/marcusburghardt.ansible_role_openscap/files/Ansible_Samples/ /root/Ansible
RUN cd /root/Ansible/ && sed -i.bak -e "s/      - { enabled: True, name: 'configure_vscode' }//g" ansible_openscap.yml && ansible-playbook -K ansible_openscap.yml -e "ansible_become_pass=''"
RUN cd /root && git clone https://github.com/ComplianceAsCode/content.git