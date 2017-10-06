!include "MUI2.nsh"
!include "WordFunc.nsh"

!define MUI_LANGDLL_ALLLANGUAGES
;Remember the installer language
!define MUI_LANGDLL_REGISTRY_ROOT "HKCU" 
!define MUI_LANGDLL_REGISTRY_KEY "Software\Modern UI Test" 
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"
Unicode true
OutFile "ORCreateAgent-installer-v.0.0.1.exe"

!insertmacro MUI_RESERVEFILE_LANGDLL

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

;Languages

!insertmacro MUI_LANGUAGE "German" ;first language is the default language
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Catalan"


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

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd
 
Section "uninstall"
	RMDir /r "$INSTDIR"
	RMDir /r "$PROFILE\.arduino-create\"
    Delete "$SMPROGRAMS\ORCreateAgent-uninstal.lnk"
    Delete "$SMPROGRAMS\ORCreateAgent.lnk"
	Delete "$DESKTOP\ORCreateAgent.lnk"
	DeleteRegKey /ifempty HKCU "Software\Modern UI Test"
SectionEnd

Function un.onInit
  !insertmacro MUI_UNGETLANGUAGE
FunctionEnd