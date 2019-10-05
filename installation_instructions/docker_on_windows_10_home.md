# Docker Installation on Windows 10 Home

**NOTE**: Before proceeding with these steps in the future, first check if docker for windows is supported in Windows 10 Home edition.

> The current version of Docker for Windows runs on 64bit Windows 10 Pro, Enterprise and Education (1607 Anniversary Update, Build 14393 or later). In the future we will support more versions of Windows 10. - [Docker on Windows Install Instructions](https://docs.docker.com/v17.09/docker-for-windows/install/#what-to-know-before-you-install)

## Steps to install docker

* Download [Speccy](https://www.piriform.com/speccy) to check your computer specs.
* Enabled Virtualization in BIOS. Virtualization status can be viewed in **Task Manager -&gt; Performance**.
* Ensure **Hyper-V** feature is disabled in **Windows Features**. To look at the current enabled windows features, **Control Panel -&gt; Turn windows features on or off**.
* Download and install [Docker Toolbox](https://github.com/docker/toolbox/releases)

## Volume Mounting and port mapping

Follow the [docker toolbox guide for mounting and port mapping](https://github.com/markcam1/Technical_Guides/blob/master/WebDevelopment/Docker_on_Windows10_home/003_DockerToolbox_Windows.md)

## References

* [Docker on windows 10 Home using Docker Toolbox](https://github.com/markcam1/Technical_Guides/blob/master/WebDevelopment/Docker_on_Windows10_home/003_DockerToolbox_Windows.md)
* [Medium: Docker on Windows 10 Home using Linux VM](https://medium.com/@mbyfieldcameron/docker-on-windows-10-home-edition-c186c538dff3)
* [Install Docker toolbox on Windows](https://docs.docker.com/toolbox/toolbox_install_windows/)
