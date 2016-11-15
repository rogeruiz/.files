# .files

```
__________________________________/\\\______________/\\\\\________/\\\\\\________________________________
 ________________________________/\\\/_____________/\\\///________\////\\\________________________________
  ____/\\\\\____________________/\\\/______________/\\\_______/\\\____\/\\\________________________________
   __/\\\///\\\__/\\\__________/\\\/_____________/\\\\\\\\\___\///_____\/\\\________/\\\\\\\\___/\\\\\\\\\\_
    _\///__\///\\\\\/_________/\\\/______________\////\\\//_____/\\\____\/\\\______/\\\/////\\\_\/\\\//////__
     _________\/////_________/\\\/___________________\/\\\______\/\\\____\/\\\_____/\\\\\\\\\\\__\/\\\\\\\\\\_
      ______________________/\\\/_____________________\/\\\______\/\\\____\/\\\____\//\\///////___\////////\\\_
       ____________________/\\\/_______________/\\\____\/\\\______\/\\\__/\\\\\\\\\__\//\\\\\\\\\\__/\\\\\\\\\\_
        ___________________\///________________\///_____\///_______\///__\/////////____\//////////__\//////////__
```

Some people like to make an impression, this is mine. This repository contains
some of my useful little `.files` and scripts that I've amassed over the years
and were just too good to leave as [pure gists][pg].

[pg]: https://gists.github.com/rogeruiz "A living collection of the best ideas I just couldn't keep to myself. Also, kudos to you for reading and patiently waiting for this title to pop up in your browser! :)"

## Keeping files in sync

Run the `./install.sh` script to install every thing. This is particularly
helpful if you're coming fresh on a new computer. If any of the files that are
being copied over exist, the script will open a diff editor in order to allow
you to choose which copy to keep and which copy to borrow from. In the future
this script may give an option to use symlinks in order to ensure that files are
kept up-to-date in the repository automatically.

### Diff editors that are used

Currently, the only supported diff editors are `vimdiff` and `opendiff` the
later which is installed when installing Xcode.

Made with 🕖: by Roger Steve Ruiz
