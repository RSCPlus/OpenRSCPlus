[Setup]
AppName=OpenRSCPlus
AppPublisher=OpenRSCPlus
DisableWelcomePage=No
DisableDirPage=Yes
DisableProgramGroupPage=Yes
UninstallDisplayName=OpenRSCPlus
; TODO: Bump when updating the Windows binary
AppVersion=1.0.0
AppSupportURL=https://rsc.plus/
DefaultDirName={userappdata}\OpenRSCPlus
MinVersion=0,5.0

; ~15 mb headroom
ExtraDiskSpaceRequired=15000000
ArchitecturesAllowed=x86 x64
PrivilegesRequired=lowest

WizardImageFile=wizard.bmp
WizardSmallImageFile=wizard_small.bmp
SetupIconFile=..\openrscplus.ico
UninstallDisplayIcon={app}\OpenRSCPlus.exe

Compression=lzma2
SolidCompression=yes

OutputDir=..\..\..\
OutputBaseFilename=OpenRSCPlusSetup32

[Tasks]
Name: DesktopIcon; Description: "Create a &desktop icon";
Name: DesktopIconConsole; Description: "Create a &desktop icon for the console launcher";

[Files]
Source: "..\..\..\native-win32\OpenRSCPlus.exe"; DestDir: "{app}"
Source: "..\..\..\native-win32\openrscplus.ico"; DestDir: "{app}"
Source: "..\..\..\native-win32\OpenRSCPlus_console.exe"; DestDir: "{app}"
Source: "..\..\..\native-win32\openrscplus_console.ico"; DestDir: "{app}"
Source: "..\..\..\native-win32\rscplus.jar"; DestDir: "{app}"
Source: "..\..\..\native-win32\jre\*"; DestDir: "{app}\jre"; Flags: recursesubdirs

[Icons]
; start menu
Name: "{userprograms}\OpenRSCPlus\OpenRSC+"; Filename: "{app}\OpenRSCPlus.exe"; IconFileName: "{app}\openrscplus.ico"
Name: "{userprograms}\OpenRSCPlus\OpenRSC+ (console)"; Filename: "{app}\OpenRSCPlus_console.exe"; IconFilename: "{app}\openrscplus_console.ico"
; Desktop Shortcuts
Name: "{userdesktop}\OpenRSC+"; Filename: "{app}\OpenRSCPlus.exe"; IconFileName: "{app}\openrscplus.ico"; Tasks: DesktopIcon
Name: "{userdesktop}\OpenRSC+ (console)"; Filename: "{app}\OpenRSCPlus_console.exe"; IconFilename: "{app}\openrscplus_console.ico"; Tasks: DesktopIconConsole

[Run]
Filename: "{app}\OpenRSCPlus.exe"; Description: "&Open OpenRSCPlus"; Flags: postinstall skipifsilent nowait

[InstallDelete]
; Delete the old jvm so it doesn't try to load old stuff with the new vm and crash
Type: filesandordirs; Name: "{app}\jre"
; previous shortcut
Type: files; Name: "{userprograms}\OpenRSCPlus.lnk"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\OpenRSCPlus.exe"
Type: filesandordirs; Name: "{app}\openrscplus.ico"
Type: filesandordirs; Name: "{app}\OpenRSCPlus_console.exe"
Type: filesandordirs; Name: "{app}\openrscplus_console.ico"
Type: filesandordirs; Name: "{app}\rscplus.jar"
Type: filesandordirs; Name: "{app}\jre"
; the lib directory is created by rscplus.jar
Type: filesandordirs; Name: "{app}\lib"
