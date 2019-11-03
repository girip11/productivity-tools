# Vagrant

## Installation with VirtualBox

```Bash
sudo apt update
sudo apt install virtualbox

sudo apt install vagrant
# If you have downloaded .deb file from
# https://www.vagrantup.com/downloads.html
# sudo apt install /path_to_deb_file
```

## Troubleshooting installation

## SSH Issue while provisioning VM for first time

```bash
# on NTFS file system when used in Ubuntu host().
vagrant init ubuntu/bionic64
vagrant up
# stops at SSH step
```

> The private key to connect to this box via SSH has invalid permissions
set on it. The permissions of the private key should be set to 0600, otherwise SSH will
ignore the key. Vagrant tried to do this automatically for you but failed. Please set the
permissions on the following file to 0600 and then try running this command again:
>/media/girish/HDD/EgnaroCodeRepos/marutham/vagrant_testing/.vagrant/machines/Marutam/virtualbox/private_key
> Note that this error occurs after Vagrant automatically tries to
do this for you. The likely cause of this error is a lack of filesystem
permissions or even filesystem functionality. For example, if your
Vagrant data is on a USB stick, a common case is that chmod is
not supported. The key will need to be moved to a filesystem that
supports chmod.

Changing file permission to 600 won't work on NTFS file system. Hence this error. But this wouldnot stop the VM from getting started. But steps like mounting default /vagrant folder that follows SSH step wouldnot have completed.

To fix this perform the following

```bash
vagrant status

# pasue the VM if its running
vagrant halt

# copy the privatekey file to the OS partition folder say $HOME/.vagrant/VM_NAME
# change the
mkdir -p $HOME/.vagrant/VM_Name
cp .vagrant/machines/VM_Name/virtualbox/private_key $HOME/.vagrant/VM_Name/
rm .vagrant/machines/VM_Name/virtualbox/private_key
sudo chmod 600 $HOME/.vagrant/VM_Name/private_key
ln -s $HOME/.vagrant/VM_Name/private_key .vagrant/machines/VM_Name/virtualbox/private_key

# now we can start the VM without any issues
vagrant up
vagrant status

# to SSH
vagrant ssh
```

---

## References

* [Medium: Getting started with Vagrant](https://medium.com/cleverprogrammer/the-ultimate-guide-to-getting-started-with-vagrant-and-why-you-shouldve-been-using-it-like-a8116e18fdca)
* [Vagrant installation on Ubuntu 18.04](https://linuxize.com/post/how-to-install-vagrant-on-ubuntu-18-04/)
* [Vagrant getting started](https://www.vagrantup.com/intro/getting-started/index.html)
