# Command for AMSTRAD Project

## Description

This scripts are for creating a DSK file for use with AMSTRAD emulator.
Automaticly create the dsk file if needed and add the current file to the DSK file.

THIS IS A WORK IN PROGRESS.


## The process

Process description:

Using Mermaid: https://mermaid.js.org/syntax/stateDiagram.html


```mermaid
%%{init: {'theme': 'forest'} }%%
stateDiagram-v2

    Build: Build Windows Command (tasks.json)
    Start: build.cmd
    Set: set.cmd
    Unset: unset.cmd
    New: buildDSK.cmd
    Add: AddFile2DSK.cmd
    SetVars: Set all $env needed
    Compil: ASM to BIN (to do)
    DSK: is DSK present
    CheckPRG: Check System
    BuildDSK: Build the DSK
    isASM: ASM File?
    forADD: Adding file

    state Build {
        state if_dsk <<choice>>
        state if_asm <<choice>>
        state End: Exit-cpcBuild
        [*] --> Start
        state Start {
            [*] --> Set:(dot souced)
            Set --> DSK
            DSK --> if_dsk
            if_dsk --> isASM: dsk file found
            if_dsk --> New: No dsk file found
            New --> isASM
            isASM --> if_asm
            if_asm --> Compil: need to build BIN
            if_asm --> forADD: no compilation
            Compil --> forADD
            forADD --> Add
            Add --> PrepareEnd
            PrepareEnd --> Unset
            Unset --> End
            End --> [*]
        }
        
    state Set {
        [*] --> SetVars
        SetVars --> [*]
    }

   state New {
        state if_prg <<choice>>
        [*] --> CheckPRG
        CheckPRG --> if_prg
        if_prg --> iDSK: nix
        if_prg --> ManageDSK: Windows
        iDSK --> BuildDSK
        ManageDSK --> BuildDSK
        BuildDSK --> [*]
    }

   state Add {
        [*] --> AddFile
        AddFile --> [*]
    }

    state Compil {
        [*] --> Buildasm
        Buildasm --> [*]
    }

    state Unset {
        [*] --> UnsetAllVars
        UnsetAllVars --> [*]

    }

}


```



___