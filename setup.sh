sudo apt update
sudo apt install git ansible -y
git clone https://github.com/J-Gierend/ansible.git
ansible-playbook -t zsh ./ansible/local.yml -K 
