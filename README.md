# configfiles
My Linux ~/.config/ files

This is a repo to keep my .config files.

To use the following files symlink them to .config/ (without the leading '.'):
    ~/.bashrc
    ~/.bash_profile
    ~/.Xresources
    ~/.themes/

To use the pkglists use:
    [sudo] pacman -S `cat ~/.config/pkglist/[module]`
or
    for x in $(cat ~/.config/pkglist/[module]); do [sudo] pacman -S $x; done
(see https://bbs.archlinux.org/viewtopic.php?id=56601)
