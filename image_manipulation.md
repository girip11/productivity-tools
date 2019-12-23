# Image manipuliation tools

## Commandline tools

* [Imagemagick](https://imagemagick.org/index.php) is a cross platform tool for image processing.

```Bash
# Installation on Ubuntu
result=$(apt list --installed | grep -i 'imagemagick'| awk -F '/' '{ print $1 }' | head -n 1)

if [[ -z $result ]]
then
  sudo apt install imagemagick -y
fi
```

On windows 10, you could use this tool using **windows subsystem for linux** or natively install it.
