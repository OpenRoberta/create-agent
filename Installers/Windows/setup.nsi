!include "MUI2.nsh"
!include "WordFunc.nsh"

Unicode true
OutFile "ORCreateAgent-installer-v.0.0.1.exe"

XPStyle on
 
InstallDir $PROGRAMFILES64\ORCreateAgent\

Caption "OpenRoberta Create Agent Installation"
 
RequestExecutionLevel admin

Name "OpenRoberta Create Agent"

!define MUI_TEXT_WELCOME_INFO_TITLE "OpenRoberta Create Agent"
!define MUI_INNERTEXT_LICENSE_BOTTOM "https://www.apache.org/licenses/LICENSE-2.0"
!define MUI_TEXT_LICENSE_TITLE "Apache2 standard license"
!define MUI_TEXT_LICENSE_SUBTITLE "Jan. 2004"

!define MUI_ICON "resources\logo.ico"

!insertmacro WordReplace
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "resources\Apache2.rtf"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM 
!insertmacro MUI_UNPAGE_INSTFILES 

!insertmacro MUI_LANGUAGE English

Section "licenseLeave"
    SetOutPath "$INSTDIR"
	CopyFiles "$EXEDIR\resources\arduino-create-agent.exe" "$INSTDIR"
	CopyFiles "$EXEDIR\resources\config.ini" "$INSTDIR"
	CreateDirectory "$PROFILE\.arduino-create"
	CopyFiles "$EXEDIR\resources\arduino\*" "$PROFILE\.arduino-create"
	SetFileAttributes "$PROFILE\.arduino-create" hidden
	FileOpen $9 "$PROFILE\.arduino-create\installed.json" w
	${WordReplace} $PROFILE "\" "/" "+" $R0
	FileWrite $9 '{"apilevel":"v1","avrdude":"$R0/.arduino-create/arduino/avrdude/6.3.0-arduino9","avrdude-6.3.0-arduino9":"$R0/.arduino-create/arduino/avrdude/6.3.0-arduino9","windows-drivers":"$R0/.arduino-create/arduino/windows-drivers/1.8.0","windows-drivers-1.8.0":"$R0/.arduino-create/arduino/windows-drivers/1.8.0"}'
	FileClose $9
	CreateShortCut "$DESKTOP\ORCreateAgent.lnk" "$INSTDIR\arduino-create-agent.exe"
	CreateShortCut "$SMPROGRAMS\ORCreateAgent.lnk" "$INSTDIR\arduino-create-agent.exe"
    WriteUninstaller "$INSTDIR\uninstall.exe"
    CreateShortCut "$SMPROGRAMS\ORCreateAgent-uninstall.lnk" "$INSTDIR\uninstall.exe"
SectionEnd
 
Section "uninstall"
	RMDir /r "$INSTDIR"
	RMDir /r "$PROFILE\.arduino-create\"
    Delete "$SMPROGRAMS\ORCreateAgent-uninstal.lnk"
    Delete "$SMPROGRAMS\ORCreateAgent.lnk"
	Delete "$DESKTOP\ORCreateAgent.lnk"
SectionEnd
