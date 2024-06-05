Steps to Use the Playbook

1. Prepare your Ansible environment:
   Make sure you have Ansible installed on your VM. You can install it using apt if it's not already installed:
    Add the Ansible PPA:
      sudo apt-add-repository --yes --update ppa:ansible/ansible
    Install Ansible:
      sudo apt install ansible

2. Edit the hosts file:
   Replace your_vm_public_ip with the actual public IP of your EC2 instance, and provide the correct path to your SSH key.
3. Run the playbook:
   Execute the playbook using the following command:

   ansible-playbook -i hosts playbook.yml
