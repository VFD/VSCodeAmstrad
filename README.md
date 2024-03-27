# AMSTRAD Basic for VSCode

For Windows and *Nix users.

This is a WORK IN PROGRESS.
NO GARANTY.

___

## Source of inspiration

Source explanation are in french :

From this site: https://amstrad.eu/

Part 1:
https://amstrad.eu/faire-du-basic-dehors-le-tuto/

Part 2:
https://amstrad.eu/faire-du-basic-dehors-le-tuto-pour-windows/


___

## Prerequisit

### Install the Extention

Some extention for **VSCode** exists.

https://github.com/benchmarko/CPCBasic/


**AMSTRAD-Basic**

dfreniche\
Thanks to him to have develop this.

**CPCReady Basic Language (AMSTRAD)**

Fork from the above.\
This extension is a port of the one created by dfreniche.

**Amstrad Basic Helper**

Same but add the possibility to run your program. [ctrl]+[shift]+[p]: Amstrad Basic Run\
And also renum your code. [ctrl]+[shift]+[p]: Amstrad Basic Renum\
But some **CALL** does not work.


**sdk-cpc-amstrad-basic-snippet\
sdk-cpc-amstrad-basic-language**\
From: https://sdkcpc.github.io/cpc/

Not working for me :/

**dotENV Official**

Official dotEnv to use .env file at root of the project.

Not working for me :/


### Pull the project from Git Hub

Or simply download the project and unzip it inside your project folder.

### Install the emulators

Download all the ressources.\
More is better than less.

Link to Add !

CAPRICE32

CAPRICE FOREVER

AMSPIRIT

Install the emulators in [VSCodeAmstrad].\
Take care of folders, don't erase them.

### Install the DSK manager

**ManageDSK**

For Windows. URL:

Copy/paste in [VSCodeAmstrad]/ManageDSK

Studiing to incoreporate it in the project.

**iDSK**

Fo *nix. URL:

Copy/paste in [VSCodeAmstrad]/iDSK

___

### Tree project

Your Amstard Basic Projects must look like this:

```
.[VSCodeAmstrad]
└── 📂 .vscode
│   └── 📄 extention.json           (this file specify if an extention is needed)
│   └── 📄 launch.json              (file for debug mode, but can launch script)
│   └── 📄 settings.json            (settings to tune VSCode for this specific project)
│   └── 📄 tasks.json               (Tasks to lauch)
│
├── 📂 AMSpiriT
│   └── 📄 AmMSpiriT files          (not include)
├── 📂 Cap32
│   └── 📄 Caprice files            (not include)
├── 📂 CapriceForever
│   └── 📄 Caprice Forever files    (not include)
├── 📂 ManageDSK
│   └── 📄 ManageDSK files          (not include)
├── 📂 iDSK
│   └── 📄 iDSK files               (not include)
│
├── 📂 cmd
│   └── 📄 build.cmd                (start by the task)
│   └── 📄 addFileToDSK.cmd         (add the current file to the dsk)
│   └── 📄 buildDSK.cmd             (Create standard disk file .dsk)
│   └── 📄 set.cmd                  (set the env vars)
│   └── 📄 unset.cmd                (clear env vars)
│
├── 📂 sh                           (macOS z shell)
│   └── 📄 build.sh                 (start by the task)
│   └── 📄 amspirit.sh              (launch amspirit)
│   └── 📄 capforever.sh            (launch Caprice forever)
│   └── 📄 cap32.sh                 (launch Caprice)
│   └── 📄 set.sh                   (set the env vars)
│   └── 📄 unset.sh                 (clear env vars)
│
├── 📂 ps1
│   └── 📄 Start-cpcBuild.ps1       (start by the task)
│   └── 📄 New-cpcDSK.ps1           (Create standard disk file .dsk)
│   └── 📄 Add-cpcFile2dsk.ps1      (add the current file to the dsk)
│   └── 📄 Set-cpcVars.ps1          (set the env vars)
│   └── 📄 Test-cpcDSK.ps1          (launch emulator for test)
│
├── 📂 BlankDSK                     (some blank disk)
│   └── 📄 Amsdos_Blank_Disk.dsk
│
└── 📂 Hello
    ├── 📂 dsk
    │   └── 📄 hello.dsk            (dsk of the project)
    └── 📄 hello.bas

```

You can use this for any project you want.\
Sinclair, Amiga, Atari, etc.\
Just fork and adapt.
May be I do this because I have some aold computer

___

## How To build

### Start a new Basic Project

Create your new directory project inside [VSCodeAmstrad] (or the name of your CPC Basic Projects).\
You can simply copy/paste the hello project.


### Check to have CRLF

Bottom Right of VSCode, check you have "CRLF" and not "LF".
"CRLF" is the default on Windows.
"LF" is the default on *nix.

### Build the project

Type [SHIFT]+[CTRL]+[b].
Select the good build.

- Build Windows Command             (Build with command batch files)
- Build Windows PowerShell          (Build with PowerShell scripts)
- Build macOS sh                    (Build with zsh shell, macOS)



type [F1].\
Select "Amstrad Basic Run".

type [F1].\
Select "Amstrad Basic Renum".

___


- \${workspaceFolder} : le chemin du dossier ouvert dans VS Code.
- \${workspaceFolderBasename} : le nom du dossier ouvert dans VS Code sans aucune barre oblique (/).
- \${file} : le fichier actuellement ouvert.
- \${fileWorkspaceFolder} : le dossier de l’espace de travail du fichier actuellement ouvert.
- \${relativeFile} : le fichier actuellement ouvert par rapport à workspaceFolder.
- \${relativeFileDirname} : le nom du répertoire du fichier actuellement ouvert par rapport à workspaceFolder1.
- \${fileBasename} : le nom de base du fichier actuellement ouvert1.
- \${fileBasenameNoExtension} : le nom de base du fichier actuellement ouvert sans extension de fichier.
- \${fileExtname} : l’extension du fichier actuellement ouvert1.
- \${fileDirname} : le chemin du dossier du fichier actuellement ouvert.
- \${fileDirnameBasename} : le nom du dossier du fichier actuellement ouvert.
- \${cwd} : le répertoire de travail actuel du lanceur de tâches lors du démarrage de VS Code.
- \${lineNumber} : le numéro de ligne actuellement sélectionné dans le fichier actif.
- \${selectedText} : le texte actuellement sélectionné dans le fichier actif.
- \${execPath} : le chemin vers l’exécutable VS Code en cours d’exécution.
- \${defaultBuildTask} : le nom de la tâche de construction par défaut.
- \${pathSeparator} : le caractère utilisé par le système d’exploitation pour séparer les composants dans les chemins de fichiers.
- \${/} : un raccourci pour ${pathSeparator}.

Notez que vous pouvez également définir une variable d’extension en utilisant \${config:myExtensionsNewSetting}2. Vous pouvez également utiliser une variable d’environnement2. Utilisez IntelliSense à l’intérieur des valeurs de chaîne pour tasks.json et launch.json pour obtenir une liste complète des variables prédéfinies1.

___

%UserProfile%\\AppData\\Roaming\\Code\\User\\keybindings.json

```json
{
    "key": "alt+q",
    "command": "workbench.action.terminal.sendSequence",
    "args": {
        "text" : "echo file = '${file}' : workspaceFolder = '${workspaceFolder}'\\u000D"
    }
}
```


```json
{
    "key": "ctrl+;",
    "command": "workbench.action.tasks.runTask",
    "args": "My Awesome Task",
    "when": "config.workspaceKeybindings.myAwesomeTask.enabled"
}
```

.vscode/settings.json


```json
{
    "workspaceKeybindings.myAwesomeTask.enabled": true
}
```

.vscode/launch.json

___

- Créez un fichier .env à la racine de votre projet.
- Ajoutez l’extension DotEnv à VS Code.
- Définissez vos variables d’environnement dans le fichier .env.

Vous pouvez maintenant utiliser ces variables dans launch.json et tasks.json en utilisant la syntaxe process.env.NOM_DE_VOTRE_VARIABLE.
Par exemple, si vous avez défini une variable MY_VARIABLE dans votre fichier .env, vous pouvez l’utiliser dans launch.json ou tasks.json comme ceci : process.env.MY_VARIABLE.

Cependant, il est important de noter que process.env.NOM_DE_VOTRE_VARIABLE est une syntaxe spécifique à Node.js. Dans launch.json et tasks.json, vous devriez utiliser la syntaxe ${env:NOM_DE_VOTRE_VARIABLE} pour accéder aux variables d’environnement.

