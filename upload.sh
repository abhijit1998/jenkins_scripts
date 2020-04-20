#!/bin/bash

SERVER_ADDRESS=XX.XX.XX.XX
cd out/target/product/potter/

# BACKUP & UPLOADING TO ONLINE TEST STORAGE --------------------------------------------------------------------------------------------------------------------------------------------
if [ "$upload_test" = true ]; then

if [ "$make_gapps" = false ]; then
cp Havoc-OS-v*-$(date +%Y%m%d)-potter-Official.zip /home/abhijittudu98/releases/test
mv /home/abhijittudu98/releases/test/Havoc-OS-v*-$(date +%Y%m%d)-potter-Official.zip /home/abhijittudu98/releases/test/Havoc-OS-v*-$(date +%Y%m%d-%H%M)-potter-Experiment.zip
scp /home/abhijittudu98/releases/test/Havoc-OS-v*-$(date +%Y%m%d-%H%M)-potter-Experiment.zip abhijittudu98@${SERVER_ADDRESS}:/home/abhijittudu98/builds/tests
fi

if [ "$make_gapps" = true ]; then
cp Havoc-OS-v*-$(date +%Y%m%d)-potter-Official-GApps.zip /home/abhijittudu98/releases/release
mv /home/abhijittudu98/releases/test/Havoc-OS-v*-$(date +%Y%m%d)-potter-Official-GApps.zip /home/abhijittudu98/releases/test/Havoc-OS-v*-$(date +%Y%m%d-%H%M)-potter-Experiment-GApps.zip
scp /home/abhijittudu98/releases/test/Havoc-OS-v*-$(date +%Y%m%d-%H%M)-potter-Experiment-GApps.zip abhijittudu98@${SERVER_ADDRESS}:/home/abhijittudu98/builds/tests
fi

fi

# BACKUP & UPLOADING TO ONLINE RELEASE STORAGE -------------------------------------------------------------------------------------------------------------------------------------------
if [ "$upload_release" = true ]; then

if [ "$make_gapps" = false ]; then
cp Havoc-OS-v*-$(date +%Y%m%d)-potter-Official.zip /home/abhijittudu98/releases/release
scp /home/abhijittudu98/releases/release/Havoc-OS-v*-$(date +%Y%m%d)-potter-Official.zip abhijittudu98@${SERVER_ADDRESS}:/home/abhijittudu98/builds/releases
fi

if [ "$make_gapps" = true ]; then
cp Havoc-OS-v*-$(date +%Y%m%d)-potter-Official-GApps.zip /home/abhijittudu98/releases/release
scp /home/abhijittudu98/releases/release/Havoc-OS-v*-$(date +%Y%m%d)-potter-Official-GApps.zip abhijittudu98@${SERVER_ADDRESS}:/home/abhijittudu98/builds/releases
fi

fi