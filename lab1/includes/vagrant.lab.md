<div id="vagrant_lab" class="section">

## Lab Prep

To follow along, you'll need to have installed **vagrant**, **virtualbox**, and **git** at the very least.

You can do this manually:

- Download and install vagrant:
	1. [vagrant downloads](https://www.vagrantup.com/downloads.html)
- Download and install virtualbox
	1. [virtualbox](https://www.virtualbox.org/)
- Download and install git
	1. [git](https://git-scm.com/download/win)

Once you've installed the three, you should be able follow along using your **Powershell** terminal

--OR-- you can go with the automated approach:

1. Install **cmder** using the **Install Lab Requirements** button at the <a href="#" class="flash" data-selector="#requirements" data-duration="300">top</a>
1. <a href="#" class="shell" data-shell="%ChocolateyToolsLocation%\\cmder\\cmder.exe">Start Lab1 Bash Shell Environment</a>
1.  Obtain a copy of the [vagrant-environments](!git_url) repository.
	- You can grab a copy using git: 
		- `git clone !git_url`
		or
		- by navigating to the [repository](!git_url) in your browser and downloading a zip archive of the files

Once you've installed and downloaded the requirements, we can proceed with the following exercises in preparing your local lab environment:

- Initializing virtual machines using vagrant
- Provisioning your machines using ansible
- Writing ansible playbooks using Sublime 3 Text Editor<br />
  You can of course use Notepad++ or whatever other *inferior* text editor of your choice
- Testing your playbooks using a virtual machine

## Initializing virtual machines using vagrant

As Follows ☞

1. Again, you'll need the **vagrant-environments** source files to follow along, so make sure you've obtained the files via `git clone` or through your web browser
1. From your terminal, navigate to the **vagrant-environments** folder
	- `cd vagrant-environments`
1. List the available environments
	- `vagrant environment list`<br />
	You should see only one: *environments/contoso*
1. Activate the **contoso** environment
	- `vagrant environment activate contoso`
1. Create the ansible **inventory** file for the **contoso** environment
	- `vagrant inventory create contoso`
1. Review the status of the **contoso** virtual machines
	- `vagrant status`<br />You should see something similar to:<br /><br />![vagrant status](!ifdef(assets_folder)(!assets_folder)(!cwd/../assets)/images/vagrant_status.gif)
1. Now that you are aware of the available machines, let's boot up the **!vagrant_machine** host:
	- `vagrant up !vagrant_machine`<br />You should see something similar to:<br /><br />![vagrant up](!ifdef(assets_folder)(!assets_folder)(!cwd/../assets)/images/vagrant_up.gif)
1. You'll observe that vagrant takes the following actions:
	- Checks for the **machine** **box** as specified in the **machine definition**
	- Downloads the **box** locally if necessary<br />i.e., if the box has already been downloaded, vagrant will happily use the cached version
	- Boots up the **machine** using the **box** image
	- Checks if the initial **provisioning** tasks have been run against the **machine**,<br /> and if not, will run the initial provisionment task(s)
1. Again, vagrant is simply 'talking' to the underlying hypervisor and cycling through several phases of the machine boot up process, as illustrated:<br /><br />![Vagrant 'talking' to Virtualbox](!ifdef(assets_folder)(!assets_folder)(!cwd/../assets)/images/vagrant_up_diagram.png)


## Provisioning your machines using ansible

The machine **!vagrant_machine** should be booted and ready for action 😎

Let's modify the provisionment steps for this machine.

As Follows ☞

1. From your terminal, open the current directory as a *Project Tree* in Sublime Text 3:
	- `subl .`<br />
Note: I'm assuming you've chosen to install **Sublime Text 3**, which includes a step that adds a custom function `subl` to your *~/bash.profile*.<br />
Again, you can install Sublime Text 3 via the **Install Lab Requirements** button at the <a href="#" class="flash" data-selector="#requirements" data-duration="300">top</a><br />
You can also verify that the `subl` function is available to you by entering `type subl` in your terminal
1. Review the **!vagrant_machine** machine definition file: *environments/contoso/machines/!vagrant_group/!vagrant_machine.yaml*
![!vagrant_machine machine definition file](!ifdef(assets_folder)(!assets_folder)(!cwd/../assets)/images/subl.gif)
1. As per the <span class="medium_red">provisioners</span> key, we have **3** provisionment tasks:
	- local
	- shell
	- ansible<br />
1. Manually invoke the provisionment steps:
	- `vagrant provision !vagrant_machine`<br />
	You should see output similar to:<br />
	![!vagrant_machine vagrant up](!ifdef(assets_folder)(!assets_folder)(!cwd/../assets)/images/vagrant_provision.gif)

## Writing ansible playbooks using Sublime 3 Text Editor

The fun starts when you learn your way around ansible **playbooks**!

Let's create some of these and reference them in the !vagrant_machine machine definition file:

As Follows ☞

- Create a folder path **!vagrant_machine/playbooks** *alongside* the !vagrant_machine definition file:
	- `mkdir -p environments/contoso/machines/!vagrant_group/!vagrant_machine/playbooks`
- Using Sublime Text Editor 3, create a playbook under this path named **hello.yaml**
	- `subl environments/contoso/machines/!vagrant_group/!vagrant_machine/playbooks/hello.yaml`
- Add a debug task to the playbook that prints out a simple message:<br />

```yaml

- name: debug | Say Hello!
  debug:
    msg: |
      Hello from the imported playbook!

```

- Add an include_tasks task to the **!vagrant_machine** machine definition referencing this playbook:

```yaml

- name: includes | Include Tasks from the Hello Playbook
  include_tasks: !vagrant_machine/playbooks/hello.yaml

```

- Manually invoke the provisionment steps:
	- `vagrant provision !vagrant_machine`<br />
	As illustrated:<br />
	![writing the !vagrant_machine playbook](!ifdef(assets_folder)(!assets_folder)(!cwd/../assets)/images/subl_playbook_provision.gif)


## Testing your playbooks using a virtual machine

At this point, you don't need the vagrant command to thoroughly test your ansible playbooks.

You can ssh to the **!vagrant_machine** machine and play with the **scratch playbook**

As Follows ☞

1. SSH to the **!vagrant_machine** machine
	- `vagrant ssh !vagrant_machine`
1. chdir to the **/vagrant** directory (by default, vagrant will create this shared folder between guest and host; maps to the vagrant project folder, read more: [synced folder](https://www.vagrantup.com/docs/synced-folders/))
	- `cd /vagrant`
1. Call the playbook via the `ansible-playbook` command
	- `ansible-playbook -i environments/contoso/inventory.yaml -c local ./.vagrant/machines/!vagrant_machine/provisioners/ansible/playbook.scratch.yaml`

Notice how I forced ansible to use a local connection to the host (`-c local`).

If you want ansible to utilize passwordless ssh connection for the playbook tasks, you'll need to initialize ssh keys for passwordless connectivity:

As Follows ☞

* Generate an ssh key
	- `ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''`
* Add authorized key locally
    - `cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys`
* Apply appropriate file permissions
    - `if test -f ~/.ssh/config;then chmod 600 ~/.ssh/config;fi`
    - `chmod 700 ~/.ssh && chmod 400 ~/.ssh/id_rsa`


This concludes lab1. 

In lab2, we'll be converting a complicated bash shell script into an Ansible Playbook.

The lab will cover:

- Playbooks and Tasks
- Templates and Handlers
- Variables & Facts
- Task Blocks

</div>