# lab-libvirt ansible project
Provision a RHEL/CentOS/AlmaLinux/RockyLinux lab on Fedora host using Ansible roles. Use it to practice for the RHCE exam or something.

## Things to be aware of:
- This ansible project applies changes to your local host system. However there are some optional playbooks I made that are designed to apply on the guest machines. I will add those later.
- The only playbook that requires root access is the "system_requirements" one which will install the needed packages and add your user to the libvirt group.
- It's recommended to provide your own iso file for your Enterprise Linux distro of choice and then to put it in the "roles/lab.fetch_media/files/iso/" directory. Then to use the iso, just give the name of the file in the the vars section of your playbook for calling the roles (see "iso_filename" in my example playbooks). It will copy it to /tmp as needed to work around permission issues.
  - There is a built in feature to download the ISO from within the role but you won't get to see the download progress which may cause you to feel disconnected from reality.
- There is a kickstart file that you can edit to your liking if you don't enjoy my chosen defaults. Make sure you edit the one with the .j2 extention since that is what is actually used.
- Please don't run similar playbooks at the same time. Wait for one to finish, then start the next installation. It doesn't take that much longer and you save yourself from unpredictable outcomes and errors.
- The default username is *admin* and the default password is *fishy*


I know it's hard to believe, but these are NOT the greatest set of ansible roles in the world. They are just supposed to kinda work. Thanks and I hope it helps you figure out your own thing.
