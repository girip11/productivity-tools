# Managing virtual environments

For managing different versions of python we have pyenv, for node we have nodenv, nvm, for ruby we have rbenv, rvm. **asdf** provides a unified interface to these `*env`,`*vm` tools.

asdf is not only limited to python, nodejs, ruby. It can work for other programming languages. `asdf plugin list all` lists the plugins supported by asdf for various programming languages and frameworks.

asdf works with `.tools-versions` as configuration very similar to `.python-version` of pyenv, `.node-version` of nodenv, `.ruby-version` of rbenv.

asdf provides support for pyenv, nodenv through its [plugin ecosystem](https://asdf-vm.com/#/core-manage-plugins).

## Install plugin

- `asdf plugin add python` installs python plugin for asdf.

## Use a plugin

- `asdf install python <version>` - Install a specific version
- `asdf global python <version>` - Set global version
- `asdf local python <version>` - Writes the version to `.tool-versions`

All the asdf commands can be found [here](https://asdf-vm.com/#/core-commands)

---

## References

- [Github asdf](https://github.com/asdf-vm/asdf)
- [asdf website](https://asdf-vm.com/)
