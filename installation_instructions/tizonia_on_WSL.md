# Running Tizonia command line music player on windows 10

## Enable WSL on Windows 10

* Enable **Windows Subsystem for Linux(WSL)** in Windows 10 and install **Ubuntu** from windows store. Find the installation instructions [here](https://codebriefly.com/setup-windows-subsystem-linux-wsl-windows-10/)

## Install Tizonia

```Bash
sudo apt-get update
sudo apt-get install -y curl
curl -kL https://github.com/tizonia/tizonia-openmax-il/raw/master/tools/install.sh | bash
# Or its shortened version:
# curl -kL https://goo.gl/Vu8qGR | bash
```

## Pulse Audio support for WSL

Run the below commands to install **pulse client** in WSL.

```Bash
sudo add-apt-repository ppa:aseering/wsl-pulseaudio
sudo apt-get update
sudo apt-get install libpulse0
```

After installing the pulse client, edit the pulse configuration file **/etc/pulse/client.conf** as below

```Conf
default-server = tcp:127.0.0.1
# or
default-server = tcp:localhost
```

After these changes better to restart the WSL service using the below powershell command run in **powershell with admin privileges**.

```Powershell
# command to restart the WSL service
Get-Service LxssManager | Restart-Service
```

## Enabling Pulse Audio on Windows 10

* Download [pulse audio port for windows](https://www.freedesktop.org/wiki/Software/PulseAudio/Ports/Windows/Support/)
* Extract the downloaded **pulseaudio-1.1.zip** to **pulseaudio-1.1** directory.
* You can add the **bin** folder inside **pulseaudio-1.1** to PATH environment variable for easy access.

## Configuration changes required on Pulse Audio to run on Windows

Changes to be made in **etc\pulse\default.pa**

```Conf
; CHANGE Line 42 FROM
; load-module module-waveout sink_name=output source_name=input
; TO
load-module module-waveout sink_name=output source_name=input record=0
...
...
...
; CHANGE LINE 61 FROM
#load-module module-native-protocol-tcp
; TO
load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1
```

Changes to be made in **etc\pulse\daemon.conf**

```Conf
; CHANGE LINE 39 FROM
; exit-idle-time = 20
; TO
exit-idle-time = -1
```

## Configuring Firewall for Pulse audio

When **Pulse** audio is runt for the first time, windows firewall alert popup opens. Since we will be **accessing pulse audio server only from WSL which is on the same machine, we can cancel/ignore the firewall alert**.

## Run Tizonia on WSL

```Bash
tizonia --help

# to run a song from youtube
tizonia --youtube-audio-stream '<YOUTUBE_SONG_URL>'

# More options on playing songs frmo youtube
tizonia --help youtube
```

## References

* [Tizonia Installation](http://tizonia.org/docs/debian/)
* [Tizonia Tools](https://github.com/tizonia/tizonia-openmax-il/tree/master/tools)
* [Pulse Support for WSL](https://launchpad.net/~aseering/+archive/ubuntu/wsl-pulseaudio)
* [Pulse Audio on WSL Github](https://github.com/microsoft/WSL/issues/3794)
* [Restart WSL service](https://www.how2shout.com/how-to/how-to-reboot-wsl-windows-subsystem-linux-in-windows-10.html)
* [Enable Audio on WSL](https://token2shell.com/howto/x410/enabling-sound-in-wsl-ubuntu-let-it-sing/)
