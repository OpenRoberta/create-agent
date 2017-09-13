After changing directory to Installers/Linux folder open a terminal window in the directory and run the command: 

sh install.sh 

That will create the desktop application named ORCreateAgent which can be accessed at .local/share/applications or directly from Ubuntu search by typing the name of the program. 

To get the latest version of the program, run go get && go build in the root directory and obtain the executable. Don't forget about GOPATH!

In order to delete the desktop entry from the applications list, in the same directory, run the command: 

sh uninstall.sh 


