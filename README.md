<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Ansible Labs](#ansible-labs)
  - [Lab 1](#lab-1)
- [Modifying/Rebuilding the Document(s)](#modifyingrebuilding-the-documents)
  - [Requirements](#requirements)
  - [HowTo](#howto)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Ansible Labs

This repository contains a set of interactive documents for learning ansible. 

These are neatly packaged, self-contained HTML files bearing the .hta file extension, which elevats the documents to full-blown applications on the Windows platform.

As such, these documents are meant to be executed from a Windows host, but you can simply rename the document(s) to .html for viewing content on non-Windows operating systems.

Of course, you can use whatever file extension of your choosing when rebuilding the document(s).

Added Bonus: With the files renamed/built as .html you can drop these on a web server and leverage the same level of access granted to the .hta's so long as you are accessing them via Internet Explorer (with ActiveX enabled).

## Lab 1

In Lab 1, you will make use of [Vagrant](https://www.vagrantup.com/) for setting up a localized lab for a hands-on ansible learning experience.

Here's what's covered:

- What is ansible?
- How to install Ansible on Windows/Linux/MacOS
- What is Vagrant?
- How to prepare a test environment for Ansible using Vagrant

[ansible-lab1.hta](lab1/ansible-lab1.hta)

# Modifying/Rebuilding the Document(s)

## Requirements

If you want to make changes to the content and rebuild the documents, you'll need to install some requirements:

* optional:
    - **python 2.7+** (only if you plan on installing pandoc python module, i.e. `pip install pandoc`)
    - [cmder](http://cmder.net/)(full version is best, as it ships with git-bash)
* mandatory:
    - [pandoc](https://pandoc.org/installing.html)
    - [pp](https://github.com/CDSoft/pp) (Pre-compiled binaries available for Windows and Linux)
    - A copy of the [bert.docs](https://github.com/berttejeda/bert.docs.git) repo

## HowTo

Again, to build the document, you'll need to grab a copy of [bert.docs](https://github.com/berttejeda/bert.docs.git), as this project utilizes objects from that codebase.

The [build.sh](build.sh) pandoc/pp wrapper script outputs a single .hta file as per specification.

Supposing you downloaded/cloned *bert.docs* to a folder named *git* under your *HOME* folder (e.g. C:\Users\MyUserName), invoking the build script can be done as follows:

- From a cmd or powershell terminal
    - `&$HOME\git\bert.docs\build.bat -s lab1\ansible-lab1.markdown -o lab1\ansible-lab1.hta -r $HOME\git\bert.docs -t lab1\templates\ansible-lab1.html -c $HOME\git\bert.docs\_common\templates\default.css -H $HOME\git\bert.docs\_common\templates\header.html -p provisioners_rb_url='https:\\github.com\berttejeda\vagrant-venv\blob\master\lib\provision.rb' -p git_url=https:\\github.com\berttejeda\vagrant-venv.git -p vagrant_lab=$HOME\git\github\bert.docs.ansible\lab1\includes\vagrant.lab.md -p vagrant_machine=web01.contoso.com -p vagrant_group=web-servers`
- To issue a dry run, simply include the `--dry` flag when you call the build script
	- Invoking the commands above with the `--dry` flag will display something similar to:<br />
	`&C:\ProgramData\chocolatey\bin\pp.exe -D provisioners_rb_url=https:\\github.com\berttejeda\vagrant-venv\blob\master\lib\provision.rb -D git_url=https:\\github.com\berttejeda\vagrant-venv.git -D vagrant_lab=C:\Users\MyUserName\git\bert.docs.ansible\lab1\includes\vagrant.lab.md -D vagrant_machine=web01.contoso.com -D vagrant_group=web-servers  lab1\ansible-lab1.markdown  | C:\ProgramData\chocolatey\bin\pandoc.exe -o 'lab1\ansible-lab1.hta' -c 'C:\Users\MyUserName\git\self\bert.docs\_common\templates\default.css' -H 'C:\Users\MyUserName\git\self\bert.docs\_common\templates\header.html' --template lab1\templates\ansible-lab1.html -V docroot=C:\Users\MyUserName\git\self\bert.docs --self-contained  --standalone`
- From git-bash/cmder/cygwin, etc
	- `~/git/bert.docs/build.sh -s lab1/ansible-lab1.markdown -o lab1/ansible-lab1.hta -r ~/git/bert.docs -t lab1/templates/ansible-lab1.html -c ~/git/bert.docs/_common/templates/default.css - H ~/git/bert.docs/_common/templates/header.html -p provisioners_rb_url='https://github.com/berttejeda/vagrant-venv/blob/master/lib/provision.rb' -p git_url=https://github.com/berttejeda/vagrant-venv.git -p  vagrant_lab=~/git/github/bert.docs.ansible/lab1/includes/vagrant.lab.md -p vagrant_machine=web01.contoso.com -p vagrant_group=web-servers`
	- Invoking the commands above with the `--dry` flag will display something similar to:<br />
	`pp -D provisioners_rb_url=https://github.com/berttejeda/vagrant-venv/blob/master/lib/provision.rb -D git_url=https://github.com/berttejeda/vagrant-venv.git -D vagrant_lab=/c/Users/MyUserName/git/github/bert.docs.ansible/lab1/includes/vagrant.lab.md -D vagrant_machine=web01.contoso.com -D vagrant_group=web-servers  lab1/ansible-lab1.markdown  | pandoc -o 'lab1/ansible-lab1.hta' -c '/c/Users/MyUserName/git/self/bert.docs/_common/templates/default.css' -H '/c/Users/MyUserName/git/self/bert.docs/_common/templates/header.html' --template lab1/templates/ansible-lab1.html -V docroot=/c/Users/MyUserName/git/self/bert.docs --self-contained  --standalone`
	- Lastly, the bash-based build script includes a poor man's filewatcher which utilizes the `find` command to monitor file changes and trigger a rebuild based on specified parameters, e.g.<br />
	- `~/git/bert.docs/build.sh -s lab1/ansible-lab1.markdown -o lab1/ansible-lab1.hta -r ~/git/bert.docs -t lab1/templates/ansible-lab1.html -c ~/git/bert.docs/_common/templates/default.css - H ~/git/bert.docs/_common/templates/header.html -p provisioners_rb_url='https://github.com/berttejeda/vagrant-venv/blob/master/lib/provision.rb' -p git_url=https://github.com/berttejeda/vagrant-venv.git -p  vagrant_lab=~/git/github/bert.docs.ansible/lab1/includes/vagrant.lab.md -p vagrant_machine=web01.contoso.com -p vagrant_group=web-servers -w *.md,*.js,*.css,*.html -i 5`
	- The above command will watch for relevant file changes at 5-second intervals


   