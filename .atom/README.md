Atom
====

Installation
------------

Packages are synced using [package-sync](https://atom.io/packages/package-sync). This means installation can be done as follow:

1. Install Atom
2. Install `package-sync`:
```
apm install package-sync
```
3. In Atom
    1. <kbd>⌘</kbd> + <kbd>shift</kbd> + <kbd>p</kbd>
    2. *Package Sync: Sync*

Updating
--------

### Method 1: Atom -> `packages.cson`

After having installed a new package, or removed one, update `packages.cson` by
using:
1. <kbd>⌘</kbd> + <kbd>shift</kbd> + <kbd>p</kbd>
2. *Package Sync: Create Package List*

### Method 2: `packages.cson` -> Atom

After having updated `packages.cson` the way you want, install/remove packages in Atom by
using:

1. <kbd>⌘</kbd> + <kbd>shift</kbd> + <kbd>p</kbd>
2. *Package Sync: Sync*
