#!/bin/bash

helpFunction() {
   echo ""
   echo "Usage: lf -l -p <project_name> -o <output_dir> "
   echo -e "\t-i    - Input Folder"
   echo -e "\t-o    - Output Folder"
   echo -e "\t-h    - Show this help file."
   exit 1
}

while getopts "i:o:h ?" opt
do
   case "$opt" in
        i ) indir=$OPTARG  ;;
        o ) outfile=$OPTARG ;;
        ? | h | * ) helpFunction ;;
   esac
done

ls indir > outfile