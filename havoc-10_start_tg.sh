#!/bin/bash
#SENDING TELEGRAM NOTIFICATIONS
cd /home/abhijittudu98/python_scripts/
rm -rf url.py
echo "build_url='${BUILD_URL}'" >> url.py
python3 havoc-10.0_start.py