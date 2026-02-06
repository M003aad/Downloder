#define MyAppName "Downloader"
#define MyAppVersion "1.0"
#define MyAppPublisher "MouadGarroud"
#define MyAppExeName "Downloader.exe"
#define MyAppAssocName MyAppName + ""
#define MyAppAssocExt ".exe"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
AppId={{77A261A3-8B0C-46AA-BEA6-3C1125AB56FC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}
UninstallDisplayName=Downloader
AppPublisher={#MyAppPublisher}

; --- Paths (ADJUST IF NEEDED)
DefaultDirName={autopf}\{#MyAppName}
InfoBeforeFile=C:\Users\MouadGarroud\Documents\Downloader\Readme.txt
OutputDir=C:\Users\MouadGarroud\Documents\Downloader\innoEXE
OutputBaseFilename=Downloader

ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
ChangesAssociations=yes
DisableProgramGroupPage=yes

Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; \
GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\MouadGarroud\Documents\Downloader\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\MouadGarroud\Documents\Downloader\Downloader.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\MouadGarroud\Documents\Downloader\Readme.txt"; DestDir: "{app}"; Flags: ignoreversion

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; \
ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; \
ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; \
ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; \
ValueType: string; ValueName: ""; \
ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; \
ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; \
Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; \
Flags: nowait postinstall skipifsilent
