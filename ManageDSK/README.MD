# ManageDsk

## Français

Gestionnaire de fichiers DSK.
Permet de manipuler des fichier .DSK comme des disquettes virtuelles.

L'utilisation est assez simple :
les 3 boutons en bas de l'interface permettent respectivement :
- Bouton "Créer DSK" : Crée une disquette virtuelle vierge au format DATA
- Bouton "Lire DSK" : Charge un fichier DSK en tant que disquette virtuelle
- Bouton "Sauver DSK" : Sauvegarde de la disquette virtuelle dans un fichier
    au format DSK

La fenêtre centrale affiche un résumé des fichiers présents sur la disquette
virtuelle, avec :
- Le nom du fichier,
- Le numéro d'User,
- L'attribut de protection en écriture,
- L'attribut de fichier caché,
- Le type du fichier,
- La taille du fichier.
Pour obtenir plus d'informations sur un fichier, il suffit de faire un
"click droit sur celui-ci". Une pop-up apparaït alors avec les informations
sur le fichier sélectionné. Depuis cette popup, il est possible de modifier
directement certains paramétres du fichier comme :
Son adresse de début,
Son point d'entrée,
Ses attributs (lecture seule et fichier caché).

Les boutons en dessous de la fenêtre permettent la manipulation des fichiers :
- Bouton "Ajouter Fichier(s)" : Permet l'ajout de 1 ou plusieurs fichiers sur
la disquette virtuelle. La sélection de plusieurs fichiers se fait à l'aide
de l'interface standard de windows (Touche CTRL maintenue enfoncée).
- Bouton "Exporter Fichier(s)" : Permet d'extraire de la disquette virtuelle
1 ou plusieurs fichiers. Il suffit de sélectionner dans la fenêtre le ou les
fichiers à exporter (en maintenant la touche CTRL enfoncée dans le cas de
plusieurs fichiers) puis de cliquer sur le bouton. On pourra renommer chaque
fichiers avant l'export.
- Bouton "Renommer Fichier(s)" : Permet de renommer 1 ou plusieurs fichiers de
la disquette virtuelle. Il suffit de sélectionner dans la fenêtre le ou les
fichiers à exporter (en maintenant la touche CTRL enfoncée dans le cas de
plusieurs fichiers) puis de cliquer sur le bouton. On pourra alors modifier
le nom du fichier et le numéro d'User.
- Bouton "Supprimer Fichier(s)" : Permet de supprimer 1 ou plusieurs fichiers
de la disquette virtuelle. Il suffit de sélectionner dans la fenêtre le ou les
fichiers à exporter (en maintenant la touche CTRL enfoncée dans le cas de
plusieurs fichiers) puis de cliquer sur le bouton. Une confirmation de
suppression sera demandée pour chaque fichiers.

La case à cocher "nettoyage automatique des en-têtes au format AMSDOS" permet
de vider (remplir avec des zéros) les octets inutilisés dans l'en-tête AMSDOS
des fichiers basic ou BINAIRE. Cette option permet de gagner de la place lors
de la compression d'un fichier DSK au format ZIP par exemple.
Cette option fonctionne dans les deux sens : à l'importation de fichiers dans
la disquette virtuelle et à l'exportation vers le disque dur du PC.

### Ligne de commande

Depuis la version 0.8, ManageDsk peut s'utiliser depuis la ligne de commande,
ou depuis un fichier batch (.BAT ou .CMD) : si il est lancé avec un ou
plusieurs arguments, il n'ouvre pas l'interface, mais exécute les fonctions
qui sont précisés sur la ligne de commande.\
Les paramètres acceptés par la ligne de commande sont les suivants :
-Lnomdsk : permet de lire un fichier DSK.
-C : permet de créer un DSK vierge
-Amasquenomfichier : permet d'ajouter un ou plusieurs fichiers sur le .DSK.
Les fichiers sont ajoutés tel quel, sans création/modification de l'en-tête
amsdos éventuelle qu'ils pourraient contenir.
-Snomdsk : permet de sauvegarder le dsk sous un nom particulier
-IChemincompletfichier/fichierCPC/type/debut/execution : permet d'ajouter un fichier en
spécifiant les informations à écrire dans l'en-tête amsdos: type du fichier,
adresse de début et point d'entrée (adresse d'exécution).
Exemples :      -IC:\MONFICHIER/TOTO.BIN/BIN/16384/16384
                -I"D:\documents and settings\toto\mon ecran.src"/ECRAN.SCR/BIN/49152
                -IC:\testbasic/PROG.BAS/BAS/368
                -IC:\fichierbidon/test/ASCII
Pour les fichiers ascii, nul besoin d'indiquer adresse de debut et exécution.
		

Les arguments peuvent se suivre sur la ligne de commande, et doivent être
séparés par des espaces.

Voici un exemple typique de création d'un dsk, ajout de fichiers binaires, puis
sauvegarde de ce dsk sous le nom de toto.dsk :

```cmd
ManageDsk -C -A*.BIN -Stoto.dsk
```

Autre exemple : Lecture d'un dsk, ajout de fichiers .BAS et .BIN,
puis sauvegarde :

```cmd
ManageDsk -LOld.dsk -A*.BAS -A*.BIN -SNew.dsk
```

Remarque :
- chaque commande (argument) commence par le caractère '-' (caractère moins)
- Les options des commandes (noms de fichiers) doivent être accolés à la
commande (pas d'espaces)
- Les commandes peuvent être entrés en majuscules ou en minuscules.
- pour le moment, 5 commandes sont connues :\
    -L : Lecture DSK\
    -C : Création DSK\
    -A : Ajout fichiers sur DSK\
    -S : Sauvegarde DSK\
    -I : Ajout d'un fichier en spécifiant éventuellement les paramètres de l'en-tête AMSDOS\

### Lecture/écriture directe sur disquette 3,5 pouces

Depuis la version 0.15, ManageDsk est capable de lire/�crire directement sur
des disquettes 3,5 pouces. Ceci permet par exemple de :
- lire une disquette 3,5 pouces et créer le DSK correspondant,
- lire un fichier dsk et l'écrire sur disquette 3,5 pouces pour pouvoir 
    utiliser la disquette 3,5 pouces sur CPC.

Ceci est possible grace à l'utilisation du driver fdrawcmd.sys de Simon Owen.
Il est donc nécessaire d'installer ce driver pour pouvoir utiliser ces 
nouvelles fonctions de lecture/écriture directe.
fdrawcmd.sys n'est pas livré dans l'archive, mais est disponnible gratuitement
à l'adresse suivante : https://simonowen.com/fdrawcmd \
Ou : https://github.com/simonowen/fdrawcmd

Pour plus d'information lire les fichier TXT.

## English

DSK file manager.
Allows to manipulate DSK files like virtual disks.

Usage is quite simple:
3 buttons at the bottom of the interface allow respectively
- Click on "Create DSK": Create a virtual disk format blank DATA
- Click on "Read DSK": Load a DSK as a virtual floppy
- Button "Save DSK": Saving the virtual floppy to DSK file format.

The central window shows a summary of the files on the virtual disk, with:
- The name of the file,
- The user number,
- The write protection attribute,
- File hidden attribute,
- The type of the file,
- The size of the file.
For more information about a file, simply do a
"Right click on it." A pop-up appears with the information
on the selected file. From this popup, it is possible to change
directly certain parameters of the file as:
Its starting address,
Its point of entry,
Its attributes (read-only and hidden file).

The buttons below the window allow the manipulation of files:
- Click on "Add file (s)": Enables the addition of 1 or more files
virtual floppy. Selecting multiple files is done using
of the standard Windows interface (CTRL key held down).
- Button "Export File (s)" Retrieves the virtual floppy
One or more files. Just select the window or
export files (by holding down the CTRL key in the case of
multiple files) and click on the button. We can rename each
files before export.
- Button "Rename File (s)": Rename one or more files
virtual floppy. Just select the window or
export files (by holding down the CTRL key in the case of
multiple files) and click on the button. We can then edit
the file name and the number of User.
- "Delete File (s)": Delete a file or files
the virtual disk. Just select the window or
export files (by holding down the CTRL key in the case of
multiple files) and click on the button. Confirmation of
suppression will be required for each file.

The check box "automatic cleaning of headers AMSDOS format" allows
to clear (fill with zeros) the unused bytes in the header AMSDOS
basic or BINARY files. This option lets you save space in
compression of a file in ZIP format DSK example.
This works both ways: import files into
Virtual Floppy and for export to the PC hard drive.

### Command line

Since version 0.8, ManageDsk can be used from the command line,
or from a batch file (. BAT or. CMD) when it is launched with one or
several arguments, it does not open the interface, but performs the functions
that are specified on the command line.
The parameters accepted by the command line are:
-Ldskname: read a DSK file.
-C: Create a blank DSK
-Afilemasks: add one or more files to. DSK.
The files are added as is, without creation / modification of the header
AMSDOS possible they may contain.
-Sdskname: saves the dsk under a particular name
-Ifullpathname/fichierCPC/type/debut/execution: Add a file
specifying the information to be written in the header AMSDOS: file type,
start address and port of entry (execution address).
Examples:-IC:\MYFILE/TOTO.BIN/BIN/16384/16384
                -I"D:\documents and settings\foo\my ecran.src"/ECRAN.SCR/BIN/49152
                -IC:\testbasic/PROG.BAS/BAS/368
                -IC:\file/test/ASCII
For ascii files, no need to specify starting address and execution.


The arguments can be followed on the command line, and must be
separated by spaces.

A typical example of creating a dsk, adding binary files, then
save this dsk as the toto.dsk:

```cmd
ManageDsk -C -A*.BIN -Stoto.dsk
```

Another example: Reading a dsk, adding .BAS and .BIN files and saving :

```cmd
ManageDsk -LOld.dsk -A*.BAS -A*.BIN -SNew.dsk
```

Note:
- Each command (argument) starts with the character '-' (minus character)
- The command options (file name) must be joined to the
control (no spaces)
- Orders can be entered in uppercase or lowercase.
- For the moment, five commands are known:\
    -L: Read DSK\
    -C: Create DSK\
    -A: Adding files to DSK\
    -S: Save DSK\
    -I: Adding a file with optionally specifying the parameters of the AMSDOS header

### Read/write directly on 3.5-inch disk

Since version 0.15, ManageDsk can read/write directly to 3.5-inch floppy disks.
This allows for example:
- Read a 3.5-inch disk and create the corresponding DSK,
- Dsk read a file and write it to 3.5-inch disk in order to use the 3.5-inch
disk of CPC.

This is possible by using the driver fdrawcmd.sys Simon Owen.
It is therefore necessary to install this driver to use these
new features read/write direct.
fdrawcmd.sys is not delivered in the archive, but is free disponnible
at the following address: http://simonowen.com/fdrawcmd \
Or: https://github.com/simonowen/fdrawcmd

Thanks to Ramlaid for his permission to use the code
DamsConverter, and Targhan, Longshot and Kukulcan for their many buggs-report,
Simon Owen for his fdrawcmd.sys at Lex Sparrow for his translation into Spanish,
and to all users!

Read txt file for more informations.
___