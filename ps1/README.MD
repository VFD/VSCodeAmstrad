# PowerShell for AMSTRAD Project

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

    Build: Build Windows PowerShell (tasks.json)
    Start: Start-cpcBuild.ps1
    Set: Set-cpcVars.ps1
    New: New-cpcDSK.ps1
    Add: Add-cpcDSK.ps1
    SetVars: Set all $env needed
    Compil: ASM to BIN
    DSK: is DSK present
    CheckPRG: Check System
    BuildDSK: Build the DSK
    isASM: ASM File?

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
            if_dsk --> New: No dsk file found\n(dot sourced)
            New --> isASM
            isASM --> if_asm
            if_asm --> Compil: need to build BIN\n(dot sourced)
            if_asm --> Add: no compilation
            Compil --> Add
            Add --> End
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
    }

   state Add {
        [*] --> AddFile
        AddFile --> [*]
    }

    state Compil {
        [*] --> Buildasm
        Buildasm --> [*]
    }

}


```



___