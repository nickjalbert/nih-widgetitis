nih-widgetitis
==============

Small scripts and other haphazard bits

### Example Symlink

```
ln -s `pwd`/ghurl /usr/local/bin/
```

### Bash config

```
chsh -s /bin/bash
rm ~/.bashrc
ln -s `pwd`/bash/.bashrc ~/.bashrc
rm ~/.bash_profile
ln -s `pwd`/bash/.bash_profile ~/.bash_profile
```

### How to password protect a file

Encrypt: `gpg -c [file name]`
Decrypt: `gpg [encrypted file name]`
