# Programming Paradigms
*course at KIT taken in winter semester 2022 / 2023*

## Setup
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
