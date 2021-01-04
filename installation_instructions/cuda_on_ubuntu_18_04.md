# Installing Cuda on Ubuntu 18.04

## Important GPU linux commands

* `lspci | grep -i nvidia` - This commands returns the Nvidia graphics card model and name if present in the system.

* `sudo lshw -c video | grep configuration` - This lists the graphics card used in the system.

* NVIDIA System Management Interface program, query your GPU using `nvidia-smi` . This command will be available only when the nvidia graphics driver is installed.

## Performing clean installation

```bash
sudo rm /etc/apt/sources.list.d/cuda*
sudo apt remove --autoremove nvidia-cuda-toolkit
sudo apt remove --autoremove nvidia-*

sudo apt-get purge nvidia*
sudo apt-get autoremove
sudo apt-get autoclean

sudo rm -rf /usr/local/cuda*
```

The above steps are from [this article](https://medium.com/@stephengregory_69986/installing-cuda-10-1-on-ubuntu-20-04-e562a5e724a0)

## Installing nvidia graphics card driver

* We can [install the graphics driver either from **Software and updates**](https://www.cyberciti.biz/faq/ubuntu-linux-install-nvidia-driver-latest-proprietary-driver/) or using **apt**

```Bash
# To check if we have already have the graphics card driver installed
# Below command should return a path to the nvidia-smi tool
which nvidia-smi

# This command prints the nvidia GPU information
nvidia-smi -q
```

* Latest nvidia graphics driver for your graphics card can be found using [this article](https://wiki.debian.org/NvidiaGraphicsDrivers)

* To list the list of nvidia-drivers currently available we could use the following command.

```Bash
sudo ubuntu-drivers devices
```

* From the above list, we could select the recommended driver version or a particular version like `nvidia-driver-450`.

```Bash
sudo apt-get update
# We need to restart the system after installing the driver.
# with latest nvidia-driver, we get latest versions of cuda toolkit support
# for instance driver v450 supports upto cuda-11.0 while driver version 455
# supports cuda version 11.1
sudo apt-get install --no-install-recommends nvidia-driver-450
```

* After installing the graphics card driver, reboot the system and execute `nvidia-smi` to check if the driver got installed successfully.

* If we get error like **NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running.**, then we need to remove the file `blacklist-nvidia.conf` from either `/etc/modprobe.d/` or `/lib/modprobe.d/` folders. This issue is covered [here](https://forums.developer.nvidia.com/t/nvlinked-titan-rtx-chips-nvidia-smi-has-failed-because-it-couldnt-communicate-with-the-nvidia-driver/119328)

## Checking for Cuda support

* `lspci | grep -i nvidia` - This command prints the graphics card model and name. Check if nvidia provides cuda support for this graphics card model.

* Using the command `nvidia-smi` we can find the latest cuda version that the installed driver supports

```text
$ nvidia-smi
Mon Jul  6 11:43:32 2020
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.36.06    Driver Version: 450.36.06    CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce 940MX       On   | 00000000:01:00.0 Off |                  N/A |
| N/A   47C    P5    N/A /  N/A |    467MiB /  2004MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      1637      G   /usr/lib/xorg/Xorg                254MiB |
|    0   N/A  N/A      2348      G   /usr/bin/gnome-shell              109MiB |
|    0   N/A  N/A      8396      G   ...oken=12446063203495869302       46MiB |
|    0   N/A  N/A     11392      G   ...AAAAAAAAA= --shared-files       49MiB |
|    0   N/A  N/A     11785      G   gnome-control-center                1MiB |
+-----------------------------------------------------------------------------+
```

## Cuda installation

```Bash
sudo add-apt-repository ppa:graphics-drivers

# change to ubuntu2004 on ubuntu 20.04
sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

# change to ubuntu2004 on ubuntu 20.04
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'

# change to ubuntu2004 on ubuntu 20.04
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'

sudo apt update

# select the cuda version you wanted to install.
# At the time of writing this article, latest cuda version - 11
# But I chose to install 10-1
sudo apt-get install --no-install-recommends cuda-toolkit-10-1

sudo apt-get install --no-install-recommends \
    libcudnn7=7.6.4.38-1+cuda10.1  \
    libcudnn7-dev=7.6.4.38-1+cuda10.1
```

* [cudnn installation](https://docs.nvidia.com/deeplearning/cudnn/install-guide/index.html) contains steps to install cudnn v8 on various operating systems.

* If you hit error while installing cuda(mostly we won't), refer the troubleshooting section below. After this continue with the installation of **libcudnn**.

* If cuda installation updates the nvidia driver(mostly it shouldn't), then reboot the system. Before rebooting add the system, add the cuda folder to **PATH**.

```Bash
# Following lines should be added to ~/.profile or to ~/.bashrc
# set PATH for cuda 10.1 installation
if [ -d "/usr/local/cuda/bin/" ]; then
    export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
```

## Verifying cuda installation

```Bash
# to check if driver update was successful
nvidia-smi

# Cuda compiler version
nvcc --version

# libcudnn installation check
/sbin/ldconfig -N -v $(sed ‘s/:/ /’ <<< $LD_LIBRARY_PATH) 2>/dev/null | grep libcudnn
```

## Nvidia GPU selection tool

`sudo apt install nvidia-prime` can be installed so that we can use the following commands to switch between builtin graphics and nvidia graphics card.

```bash
prime-select query
prime-select nvdia}|intel|on-demand
```

## Troubleshooting cuda installation

* Towards the end of the cuda installation, if we get error like below, we need to force install **libnvidia-compute-450**

```Text
<!-- Reference: https://github.com/tensorflow/tensorflow/issues/40278 -->
Errors were encountered while processing:
/tmp/apt-dpkg-install-fjAi3S/55-libnvidia-compute-450_450.36.06-0ubuntu1_amd64.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

* The above issue can be fixed with the following command.

```Bash
sudo apt-get -o Dpkg::Options::="--force-overwrite" install libnvidia-compute-450

# after this command I executed cuda install command to verify if all steps are completed
sudo apt-get install --no-install-recommends cuda-toolkit-10-1
```

---

## References

* [GPU linux commands](https://gist.github.com/neomatrix369/256913dcf77cdbb5855dd2d7f5d81b84)
* [Cuda installation on Ubuntu](https://medium.com/@exesse/cuda-10-1-installation-on-ubuntu-18-04-lts-d04f89287130)
* [Cuda installation error github issue](https://github.com/tensorflow/tensorflow/issues/40278)
* [Setup pycuda on ubuntu](https://medium.com/leadkaro/setting-up-pycuda-on-ubuntu-18-04-for-gpu-programming-with-python-830e03fc4b81)
* [Nvidia graphics card driver installation](https://www.cyberciti.biz/faq/ubuntu-linux-install-nvidia-driver-latest-proprietary-driver/)
