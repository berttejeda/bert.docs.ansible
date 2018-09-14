---
title: Ansible Lab 1
subtitle: Let's Deploy a Virtual Machine with Vagrant and Provision it with Ansible
author:
- name: Bert Tejeda
sections:
- name: Introduction
  id: ansible_introduction
- name: Ansible - Installation
  id: ansible_installation
- name: Vagrant
  id: vagrant_introduction
- name: Preparing Your Lab
  id: vagrant_lab
date: 08.27.2018
version: 18.08.27.01
<!-- header-includes: 
- <script src="assets/jquery/hello.js"></script> -->
---
<div id="start">

## Forward

Thank you for taking the time to read through this interactive document.

If you're on the Windows platform, you'll likely be accessing this file in its HTA format, which provides a superior experience for interaction with your workstation or laptop. 

You can also output the resulting document as a .html file, which will allow you to open it in a web browser, but some caveats before you do that:

- If opening the document in a browser other than Internet Explorer, the shell interaction will **not** work at all
- If using Internet Explorer to open the .html file, should you choose to go that route, you'll need to allow ActiveX controls once prompted

Moving on.

## How to Use this Document

Notice the navigation bar at the <a href="#" class="flash" data-selector="#requirements" data-duration="300">top</a>. 

There are several buttons, one of which reads <a href="#" class="menu-toggle">Toggle Sidebar</a>

Clicking it will reveal a navigation menu on the left. That's pretty much all you need to know to get around this document.

There are also buttons that trigger commands for bootstrapping your system with the lab requirements.

Try them out!

## What This Lab Covers

Here's what I will cover for Lab 1 of this Ansible tutorial series:

- What is ansible?
- How to install Ansible on Windows/Linux/MacOS
- What is Vagrant?
- How to prepare a test environment for Ansible using Vagrant

Let's begin with the first topic: <a href="#" id="ansible_introduction" class="section_link">What is ansible?</a>

</div>

!include(includes/ansible.introduction.md)
!include(includes/ansible.installation.md)
!include(includes/vagrant.introduction.md)
!if( !defined(vagrant_lab) ) ( !include(!vagrant_lab) )( !include(includes/vagrant.lab.md) )