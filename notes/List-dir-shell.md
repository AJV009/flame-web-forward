# Prepare a simple shell script to create a folder with you name in home directory and then it will create a file containing the list of all the files inside /var/www/html/folder (base level only).

## Lets develop a script with basic functionality
- Make a blank file and name it `lf.sh`
- Insert the below text into `lf.sh`
```bash
mkdir ~/$USER
ls /var/www/html > ~/$USER/html_files.txt
```
**Note** <br> 
`mkdir` - Stands for Make Directory <br>
`$USER` - A global varieable with current username! <br>
`ls` - Stands for list files in a dir <br>
`>` - used to pine output to a file or some output

- Make an executable.
```bash
chmod -x lf.sh
```
- Run by calling 
```bash
./lf.sh
```
- Now you can check at `~/$USER/` you should see a folder with username with a file named html_files which contains list of files in html
