<div id="ansible_introduction" class="section">

## What is Ansible?

Ansible is a simple yet powerful tool for configuration management and orchestration of your infrastructure. 

It speeds up installing software, configuring servers, and most importantly reduces manual, error-prone methods for managing modern infrastructure components.

It is also a great alternative to [Puppet](https://puppet.com/) and [Chef](https://www.chef.io/configuration-management/). 

Both are similar tools to Ansible, but in my opinion Ansible is much easier to learn and master.

In a nutshell, [Ansible](https://www.ansible.com/) is:
  
- Like a higher-level, [idempotent](https://en.wikipedia.org/wiki/Idempotence#Computer_science_meaning) version of traditional shell scripts
- Much, much easier to rapidly develop and manage
- Lends itself to self-documenting development

### Terminology

Throughout the sections ahead, I'll make reference to the following ansible terms:

- [inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) - This is how ansible is made aware of the machines it is to manage
- [playbooks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html) - This is the ansible version of a **bash** script
- [tasks](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html#tasks-list) - Think of this as you would a neatly commented step in a **bash** script, only far more superior in structure and clarity
- [variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html) - Just like **bash** variables, ansible stores repeatable information in these named constructs
- [facts](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html) - Very similar to variables, but think more of these as values that 
  are automatically [derived](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#information-discovered-from-systems-facts) from a machine
  or from a little bit of ansible [magic](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#magic-variables-and-how-to-access-information-about-other-hosts)

For more information on ansible terms, consult the [Ansible Glossary](https://docs.ansible.com/ansible/latest/reference_appendices/glossary.html)

Next, let's go over installing Ansible: <a href="#" id="ansible_installation" class="section_link">Installation</a>

</div>