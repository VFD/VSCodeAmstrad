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

**AMSTRAD-Basic**\
dfreniche\
Thanks to him to have develop this.

**CPCReady Basic Language (AMSTRAD)**\
This extension is a port of the one created by dfreniche.

**Amstrad Basic Helper**\
Same but add the possibility to run your program.\
But some **CALL** does not work.\
And also renum your code.

**sdk-cpc-amstrad-basic-snippet\
sdk-cpc-amstrad-basic-language**\
From: https://sdkcpc.github.io/cpc/


**dotENV Official**

Official dotEnv to use .env file at root of the project.

Not working :/



### Build an Amstrad project folder.

``` cmd
mkdir MyCPC
```

Or use your Github project on your machine.

### Pull

Pull the project.
Or simply download the project and unzip it inside your project folder.

### Download the emulators

Link to Add

CAPRICE32

CAPRICE FOREVER

AMSPIRIT

Install the emulators at the root of the Amstrad Projets ("MyCPC").

Change ENV variables to set Emulator Rep






### Install the DSK manager

#### Windows

**ManageDSK**\
URL :

#### *Nix

**iDSK**\
URL:

### The final tree

Your Amstard Basic Projects look like this :

```
.[MyCPC]
└── 📂 .vscode
│   └── 📄 tasks.json
│
└── 📂 AMSpiriT
└── 📂 Cap32
└── 📂 CapriceForever
└── 📂 ManageDSK
└── 📂 iDSK
│
└── 📄 amspirit.cmd
└── 📄 amspirit.ps1
└── 📄 amspirit.sh
└── 📄 cap32.cmd
└── 📄 cap32.ps1
└── 📄 cap32.sh
└── 📄 capforever.cmd
└── 📄 capforever.ps1
└── 📄 capforever.sh
└── 📂 Hello World
    └── 📄 [Basic files]

```

You can change the **.cmd** (Windows Command) **.ps1** (PowerShell) **.sh** (Bash) scripts for them to go where are your's emulators.

For example:

```cmd
SET AMSpirit="Amspirit v0.967_beta_x64.exe"
SET AMSpiritFolder=AMSpirit
```

___

## How To

### Start a new Basic Project

Create your new directory project inside "MyCPC" (or the name of your CPC Basic Project).\


### Check to have CRLF

Bottom Right of VSCode, check you have "CRLF" and not "LF".

### Execute your code

type [F1].\
Select "Amstrad Basic Run".

### Renum your code

type [F1].\
Select "Amstrad Basic Renum".

### Start the tasks

Type [SHIFT]+[CTRL]+[b].

ou [SHIFT]+[CTRL]+[b]\
puis "run task"
___

https://github.com/benchmarko/CPCBasic/

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

