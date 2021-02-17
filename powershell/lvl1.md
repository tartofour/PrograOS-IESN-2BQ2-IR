<h1 align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/a/af/PowerShell_Core_6.0_icon.png" alt="Powershell-lvl1" width="200"></a>
  <br>
  Programmation orientée OS : PowerShell - Niveau 1
  <br>
</h1>

## Principaux alias

| Cmdlet | Alias bash-like |
| --- | --- |
| Get-ChildItem | ls  |
| Get-Content | cat |
| Write-Output | echo |
| New-Item -Name &lt;name&gt; -ItemType "directory" | mkdir |
| ... | ... |

## Exercice 1

- Trouvez la commande originale dont les alias sont dir et ls.
    
    ```powershell
    PS C:\Users\tartof> Get-Alias ls
    CommandType     Name                                	           Version
    -----------     ----                                               --
    Alias           ls -> Get-ChildItem
    ```
    ```powershell
    PS C:\Users\tartof> Get-Alias dir
    CommandType     Name                                               Version
    -----------     ----                                               --
    Alias           dir -> Get-ChildItem
    ```
- Utilisez la pour renvoyer le listing du répertoire courant dans une variable.
    
    ```powershell
    PS C:\Users\tartof> $var=ls
    ```
- Affichez ensuite le contenu de cette variable
    
    ```powershell
    PS C:\Users\tartof> echo $var
    
    Directory: C:\Users\tartof
    
    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    d-----         1/16/2021  12:28 AM                .imibrowser
    d-r---        11/12/2020  11:05 AM                3D Objects
    d-r---        11/12/2020  11:05 AM                Contacts
    d-r---         1/16/2021  12:28 AM                Desktop
    d-r---        12/10/2020  11:26 AM                Documents
    d-r---         1/16/2021   3:03 PM                Downloads
    d-r---        11/12/2020  11:05 AM                Favorites
    d-r---        11/12/2020  11:05 AM                Links
    d-r---        11/12/2020  11:05 AM                Music
    d-r---         2/17/2021  12:05 AM                OneDrive
    d-r---         1/16/2021  12:20 PM                Pictures
    d-r---        11/12/2020  11:05 AM                Saved Games
    d-r---        11/12/2020  11:07 AM                Searches
    d-r---        11/12/2020  11:05 AM                Videos
    ```
- Affichez maintenant uniquement la première ligne de la variable
    
    ```powershell
    PS C:\Users\tartof> echo $var[0]
    
    Directory: C:\Users\tartof
     
    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    d-----         1/16/2021  12:28 AM                .imibrowser
    ```
- Affichez les méthodes et propriétés associées à cette variable
    
    ```powershell
    PS C:\Users\tartof> $var | Get-Member
    
    TypeName: System.IO.DirectoryInfo
     
    Name                      MemberType     Definition
    ----                      ----------     ----------
    LinkType                  CodeProperty   System.String LinkType{ge...
    Mode                      CodeProperty   System.String Mode{get=Mo...
    Target                    CodeProperty   System.Collections.Generi...
    Create                    Method         void Create(), void Creat...
    CreateObjRef              Method         System.Runtime.Remoting.O...
    CreateSubdirectory        Method         System.IO.DirectoryInfo C...
    Delete                    Method         void Delete(), void Delet...
    EnumerateDirectories      Method         System.Collections.Generi...
    EnumerateFiles            Method         System.Collections.Generi...
    EnumerateFileSystemInfos  Method         System.Collections.Generi...
    Equals                    Method         bool Equals(System.Object...
    GetAccessControl          Method         System.Security.AccessCon...
    GetDirectories            Method         System.IO.DirectoryInfo[]...
    GetFiles                  Method         System.IO.FileInfo[] GetF...
    GetFileSystemInfos        Method         System.IO.FileSystemInfo[...
    GetHashCode               Method         int GetHashCode()
    GetLifetimeService        Method         System.Object GetLifetime...
    GetObjectData             Method         void GetObjectData(System...
    GetType                   Method         type GetType()
    InitializeLifetimeService Method         System.Object InitializeL...
    MoveTo                    Method         void MoveTo(string destDi...
    Refresh                   Method         void Refresh()
    SetAccessControl          Method         void SetAccessControl(Sys...
    ToString                  Method         string ToString()
    PSChildName               NoteProperty   string PSChildName=.imibr...
    PSDrive                   NoteProperty   PSDriveInfo PSDrive=C
    PSIsContainer             NoteProperty   bool PSIsContainer=True
    PSParentPath              NoteProperty   string PSParentPath=Micro...
    PSPath                    NoteProperty   string PSPath=Microsoft.P...
    PSProvider                NoteProperty   ProviderInfo PSProvider=M...
    Attributes                Property       System.IO.FileAttributes ...
    CreationTime              Property       datetime CreationTime {ge...
    CreationTimeUtc           Property       datetime CreationTimeUtc ...
    Exists                    Property       bool Exists {get;}
    Extension                 Property       string Extension {get;}
    FullName                  Property       string FullName {get;}
    LastAccessTime            Property       datetime LastAccessTime {...
    LastAccessTimeUtc         Property       datetime LastAccessTimeUt...
    LastWriteTime             Property       datetime LastWriteTime {g...
    LastWriteTimeUtc          Property       datetime LastWriteTimeUtc...
    Name                      Property       string Name {get;}
    Parent                    Property       System.IO.DirectoryInfo P...
    Root                      Property       System.IO.DirectoryInfo R...
    BaseName                  ScriptProperty System.Object BaseName {g...
    ```
- Utilisez la propriété adéquate pour afficher le mode d'accès autorisé, la date de dernière écriture ainsi que le répertoire associés à la première ligne de la variable
    
    ```powershell
    PS C:\Users\tartof> $var[0].Attributes
    Directory
    ``````powershell
    PS C:\Users\tartof> $var[0].LastWriteTime
    Saturday, January 16, 2021 12:28:52 AM
    ``````powershell
    PS C:\Users\tartof> $var[0].Name
    .imibrowser
    ```

## Exercice 2

- Lister les fichiers d'un répertoire qui ont pour extension txt via la commande Where-Object (?). Utilisez un pipeline pour réaliser la commande en une seule ligne.
    
    ```powershell
    PS C:\Users\tartof\Desktop> ls | Where-Object {$_.Extension -match "txt"}
    
    Directory: C:\Users\tartof\Desktop
    
    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----         2/17/2021   1:52 AM           5674 powershell_lvl1.txt
    ```

## Exercice 3

- Lister les fichiers d'un répertoire dans l'ordre de dernière modification
    
    ```powershell
    PS C:\Users\tartof\Desktop> ls | Sort-Object -Property LastwriteTime -Descending
    
    Directory: C:\Users\tartof\Desktop
     
    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----         2/17/2021   1:52 AM           5674 powershell_lvl1.txt
    -a----         1/16/2021  12:28 AM           2450 MIB Browser.lnk 
    ```

## Exercice 4

- Créez un tableau recensant tous les processus Notepad
    
    ```powershell
    PS C:\Users\tartof\Desktop> Get-Process | Where-Object {$_.Name -match "notepad"}
    ```
- Tuez tous les processus notepad en utilisant la méthode adéquate de la variable
    
    ```powershell
    PS C:\Users\tartof\Desktop> $process=Get-Process | Where-Object {$_.Name -match "notepad"}
    PS C:\Users\tartof\Desktop> $process.Kill()
    
    ```

## Exercice 5

- Sur base d'un fichier texte contenant une liste de noms, créez des répertoires associés
    
    ```powershell
    PS C:\Users\tartof\Desktop> $var = Get-Content "noms.txt"
    PS C:\Users\tartof\Desktop> New-Item -Name $var[0] -ItemType "directory"
    
    Directory: C:\Users\tartof\Desktop
    
    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    d-----         2/17/2021   2:08 PM                Arnaud
    ```
