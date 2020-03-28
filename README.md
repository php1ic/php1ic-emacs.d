# My personal ~/.emacs.d

After accidentally deleting the entire ~/.emacs.d directory, and only having a version I'd emailed myself over a year ago as backup, I decided this was the universe's way of telling me it was time to start tracking it in git and more importantly backing it up somewhere.
The version I recovered was close to the one I lost, but different enough that it was annoying, and having not kept track I couldn't put my finger on why.
I therefore did what any sensible person would do: scrapped everything and started from scratch.

The configuration uses the 'org file called by the init file' set up, so the main configuration is in [config.org](config.org) which is called by [init.el](init.el).

## Installation and set-up

### Aquiring the files
Depending on how you organise your system, either clone this repo directly into ~/.emacs.d/, making sure to backup your original first.

```bash
git clone https://gitlab.com/php1ic/php1ic-emacs.d.git ~/.emacs.d
```

Or clone somewhere locally and create a symbolic link

```bash
cd /path/to/other/repos
git clone https://gitlab.com/php1ic/php1ic-emacs.d.git
ln -s /path/to/other/repos/php1ic-emacs.d ~/.emacs.d
```

I find the second way simpler when cloning other peoples configs to see how they do things.


### Initial launch

The first time you run emacs with this configuration it will download a large number of packages from the internet so will take some time to start up.
I recommend that after the initial launch, once everything looks to be loaded, you close and re-open emacs to to ensure proper functionality.


### External dependencies

I use emacs mainly for programming, so some external packages are required on the system to allow internal packages to function correctly.
They are focussed around [lsp](https://github.com/emacs-lsp/lsp-mode) for autocompletion/IDE behaviour and are:
 - C++ : [ccls](https://github.com/MaskRay/ccls)
 - Python : [python-language-server](https://github.com/palantir/python-language-server)
 - BASH : [bash-language-server](https://github.com/mads-hartmann/bash-language-server)
 - CMake : [cmake-language-server](https://github.com/regen100/cmake-language-server)

Installation instructions for each can be found on the [lsp page](https://github.com/emacs-lsp/lsp-mode#supported-languages).

**WARNING**: [pyls](https://github.com/rmarkello/pyls) is also available via pip on [pipy](https://pypi.org/project/pyls/) but is a different package and unrelated to [python-language-server](https://github.com/palantir/python-language-server).

### Known Issues

After you update packages (`M-x list-packages` then `U` then `x`), emacs tells you that some packages are obsolete and can removed with `M-x package-autoremove`.
This is not true, as if you do run that command, the next time you launch emacs they are downloaded and installed again.
They are all included via use-package with `ensure: t` but if you look at the list of packages, those that emacs thinks can be removed are marked as dependencies.
Not sure what's going on here.
