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

Or clone to the place where your other repos live and create a symbolic link

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

I use emacs mainly for programming, so some external packages are required on the system to allow internal packages to function correctly. The internal packages and their dependencies are listed below. Follow the links for full details.

- **[Irony](https://github.com/Sarcasm/irony-mode)** for C++. You will need to install the irony server with `M-x irony-install-server`
  * [cmake](https://cmake.org)
  * [libclang](https://clang.llvm.org/doxygen/group__CINDEX.html), make sure to get the development package for libclang so Irony can compile. Depending on the distribution you are using it will likely contain 'dev' or 'devel' in the name.

- **[jedi](https://tkf.github.io/emacs-jedi/)** for python. You will need to install the jedi server with `M-x jedi:install-server`
  * [virtualenv](https://virtualenv.pypa.io/)

