# Ansible Lab1

This is an ansible learning document, neatly packaged in a self-contained .hta file.

It is meant to be executed from a Windows host, but you can simply rename the file to .html for viewing.

[ansible-lab1.hta](lab1/ansible-lab1.hta)

# Requirements

* optional:
    - **python 2.7+** (only if you plan on installing pandoc python module, i.e. `pip install pandoc`)
    - [cmder](http://cmder.net/)(full version is best, as it ships with git-bash)
* mandatory:
    - [pandoc](https://pandoc.org/installing.html)
    - [pp](https://github.com/CDSoft/pp) (Pre-compiled binaries available for Windows and Linux)

# Building The HTA

To build the HTA, you'll need to grab a copy of [bert.docs](https://github.com/berttejeda/bert.docs.git), as this project utilizes objects from that codebase.

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


   