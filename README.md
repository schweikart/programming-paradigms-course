# Programming Paradigms
*course at KIT taken in winter semester 2022 / 2023*

## Setup
### **Haskell**
Install the haskell toolchain using the following command from a non-elevated
powershell ([source](https://www.haskell.org/ghcup/)).
Ignore the suggestion to use chocolatey (see below for details) and make sure to
allow for the Haskell Language Server installation.
Wait for the MinGW script to complete execution even if the PowerShell script is
already done!
 
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true } catch { Write-Error $_ }
```

You might need to upgrade the GHC or HLS version before the VSCode extension
works.
* `ghcup upgrade` upgrades GHCup to the latest version
* `ghcup list` prints a list of all available tool versions
* `ghcup install <tool> <version>` installs the given version of the specified
  tool

Some words about possible alternatives that I have considered too many times:
* No, installing the `ghc` chocolatey package is not sufficient since it is
  missing GHCup and does not come with the Haskell Language Server.
* Same goes for the `haskell-dev` chocolatey package which will be recommended
  to you by the GHCup installer.
  (If you happen to uninstall it, remember to uninstall `ghc` and `cabal` too!)
* The `haskell-language-server` chocolatey package is outdated and exempt from
  moderation by the chocolatey community.

### **Prolog**
A recent open source prolog build for Windows can be installed through
chocolatey from an elevated shell:

```shell
choco install swi-prolog
```

### **OpenJML**
OpenJML is not available in Windows but can be used inside an Ubuntu 20.04 WSL.

1. Download the most recent release of OpenJML from its
   [GitHub Releases](https://github.com/OpenJML/OpenJML/releases/latest) page using
   wget:

   ```shell
   wget LINK_TO_OPENJML_ZIP
   # e.g.
   wget https://github.com/OpenJML/OpenJML/releases/download/0.17.0-alpha-15/openjml-ubuntu-20.04-0.17.0-alpha-15.zip
   ```
2. Extract the file to `/opt/openjml`, sudo might be necessary:

   ```shell
   sudo unzip PATH_TO_OPENJML_ZIP -d /opt/openjml
   # e.g.
   sudo unzip openjml-ubuntu-20.04-0.17.0-alpha-15.zip -d /opt/openjml
   ```
3. Add `/opt/openjml` to your `PATH` env variable by adding the following line
   to the end of your `~/.bashrc` file:

   ```bash
   export PATH=$PATH:/opt/openjml
   ```
4. Restart your shell and use the following command to check your installation:
   
   ```shell
   openjml -version
   # should print your downloaded OpenJML version to the console
   ```

### **VSCode Extensions**
The following extensions can help with autocompletion, debugging tools and
linting:

* [Haskell](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)
  * You might need to configure this extension to find your haskell installation
    but I'm not sure about that any more 
* [Haskell Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=justusadam.language-haskell)
* [VSC-Prolog](https://marketplace.visualstudio.com/items?itemName=arthurwang.vsc-prolog)
  * After installing, make sure to configure the `prolog.executablePath` VSCode
    setting.
    Chocolatey will install the SWI-Prolog executable to `C:\Program Files\swipl\bin`.
