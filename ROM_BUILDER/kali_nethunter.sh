#!/bin/bash
selection=
until [ "selection" = "E" ]; do
echo ""
echo "================================================================="
echo "+                                                               +"
echo "+                Welcome to HTC One X Modder!                   +"
echo "+                                                               +"
echo "+       ROM Builder! Please type the commands accurately.       +"
echo "+                                                               +"
echo "================================================================="
echo "Do you really want to build Kali NetHunter? (Y/N/E)"
echo -n "Enter your choice: "
read selection
echo ""
case $selection in
Y ) echo "done" ;;
N ) echo "Aborted." ;;
E ) exit ;;
* ) echo "Please enter Y, N or E"
esac
done