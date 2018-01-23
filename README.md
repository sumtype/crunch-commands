# Crunch Commands
Shell scripts that perform common command sequences, organized by commands they relate to.

##### Crunch Package Commands - `crunch-commands action`

Where action equals one of the options below.

* `update`
  * Updates the Crunch Commands package and installs new and updated command references in ~/.bashrc.

* `help`
  * Displays helpful information about the `crunch-commands` command.

## Commands

### `cd`

#### Change to Directory with Node Version - `cdn folder-path`

Navigate to folder-path using `cd` and then check if a ".nvmrc" file exists inside that directory.  If it does, `nvm use` is executed.  Please note that you must have [Node Version Manager](https://github.com/creationix/nvm)(NVM) installed to make use of this script.

#### Create and Navigate to Directory - `cdm folder-path`

Creates a new folder or series of folders (using mkdir -p) equal to the folder-path and then navigates to the deepest folder-path directory.

### `git`

#### Git Push - `gp [remote_repository, ["Commit message"]]`

Adds all the file changes to be committed by Git, then commits the changes using ["Commit Message"], or "Updated files." by default, and pushes the changes to the [remote_repository], or origin repository by default, on the currently checked out branch.

#### Git Download - `gd [remote repository]`

Git pulls the current project from your current branch on the [remote repository] or origin repository by default.

#### Git Clone and Install Node.js Dependencies - `gc clone-url`

Clones the clone-url repository and installs any [Node.js](https://nodejs.org) dependencies if there is a package.json file in the cloned repository's root directory.  Please note, you must have [`npm`](https://npmjs.org) installed for this script to work.

#### Git Initialization and Add Remote Origin - `go origin-remote-repository-url`

Initializes a local Git repository and adds an origin remote repository with the specified origin-remote-repository-url.

### `rsync`

#### Sync Folder(s)/File(s) to Location - `sf folder-path location-path update-interval [&]`

Removes previous folder-path version if it exists at location-path using `rm -rf`, then using `rsync -ar --exclude='.git' ...` copies the folder-path directory to the location-path directory every update-interval (in seconds).  Optionally specify `&` at the end of the command to run it in the background.  In addition to copying folders to the location-path, wildcard syntax can be used to specify sets of files or individual files can be copied over directly.

Ex: `sf ~/stuff/folder ~/otherStuff 5`

Would copy the 'folder' directory into '~/otherStuff' (removing previous versions when they exist in '~/otherStuff') every five seconds.

Ex: `sf ~/stuff/*.js ~/otherStuff 4`

Would copy all JavaScript files into '~/otherStuff' (removing previous versions when they exist in '~/otherStuff') every four seconds.

Ex: `sf ~/stuff/thing.txt ~/otherStuff 3`

Would copy 'thing.txt' into '~/otherStuff' (removing previous versions when they exist in '~/otherStuff') every three seconds.

If you want to enable update logging to the console, uncomment lines 6 - 7 and 12 - 14 in sf.sh.

### `apt-get`

#### Update and Autoremove - `ur`

Updates, upgrades, updates, then auto-removes and cleans packages.

### `shred`

#### Shred and Remove File(s) - `sr [path]`

Runs `shred` (40 passes) on the specified [path] file, if [path] is a directory `shred` is run on all it's files.  Afterwards, `rm -rf` is run on the [path].

### OpenSSL

#### AES-256 Encrypt - `aese [file]`

Encrypts [file] and removes the original, new encrypted file is "[file].enc".

#### AES-256 Decrypt - `aesd [file].enc`

Decrypts "[file].enc", new file is in the same directory as the encrypted version.

### `sensible-browser`

#### DuckDuckGo Search - `wb query`

Searches DuckDuckGo.com for query in a new tab or window of your default browser.  To make use of DuckDuckGo's !bang queries prefix the bang command with "\".

Ex: `\!g query`

Would use DuckDuckGo's bang g command to search Google for query.

### Node.js

#### Node.js Application Dependency Security Check - `nsc`

Runs `nsp check`, `snyk test`, `retire -j`, and `retire -n`.  Assumes you have installed the "nsp", "snyk", and "retire" packages globally, so install them if you haven't already.

#### Snazzy Standard Code Styling Check/Fix - `sstd`

Runs `standard --fix --env mocha | snazzy` to fix styling errors where appropriate and provide snazzy reporting for any remaining errors.

### Android

#### Sign Release APK - `rapk [your-unaligned.apk] your-release.apk your-key.jks`

Signs an APK release file with the specified key, zipaligns the release APK if an unaligned APK is passed.

### IP

#### Get IP Information - `wip`

Queries ipinfo.io and freegeoip.net for information about the computer's IP address.

## Bash Installation and Updates
First, clone this directory into a folder in your home directory, this is where the project files will reside.

`git clone https://github.com/sumtype/crunch-commands.git`

#### Install Every Command

To install all the commands navigate to the project root directory of the downloaded folder and enter the following command:

`. install.sh`

This will add the scripts to your ~/.bashrc path with appropriate aliases.  Restart your bash console to start using the new commands.  Please note that this action will remove empty lines from your ~/.bashrc file.  If you don't want to do that install commands manually (see next section).

#### Install a Command

To a command from this project, at the bottom of your ~/.bashrc file add the following two lines (sequentially) after making the following changes to them.

`export PATH="$PATH:$HOME/[parent path]/crunch-commands"`

`alias [command name]=". [command name].sh"`

1) Substitute '[parent path]' with the path to the project folder.  For example, if you cloned this project into a folder called 'stuff' in your home directory your first line should look like this:

`export PATH="$PATH:$HOME/stuff/crunch-commands"`

2) Substitute [command name] with the name of the command you want to add.  Here for example, if you want to add the `gp` command your second line should look like this:

`alias gp=". gp.sh"`

Restart your bash console to start using the new command.  Please note, once you've added the export line if you want to add other commands you'll only need to add other alias lines.  For example if you've installed `gp` above to add `gc` just add `alias gc=". gc.sh"` to your ~/.bashrc file.

#### Update Everything

To update all the commands to their latest versions and install any new ones enter the following command:

`crunch-commands update`

Once the update process is completed restart your terminal to start using new commands (old commands will automatically be updated and will not require a terminal restart).  Please note, this command will install all the commands automatically.

#### Update the Commands You're Using

Navigate to your cloned folder of this repository in your terminal and enter the following:

`git pull origin master`

When you do this your commands will automatically update to the current versions.  In addition, new commands will be added to the package, but you'll need to install them manually to access them.  Follow the instructions in the 'Install a Command' section for guidance.
