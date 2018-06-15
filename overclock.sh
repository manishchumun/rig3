#!/bin/bash
##
#Define Environment Variable 
#

#sudo xset -dpms
#sudo xset s off
#sudo xhost +

##Create xorg.conf with cool bits. I will use 31.. please check the manual properly 
sudo nvidia-xconfig -a --force-generate --allow-empty-initial-configuration --cool-bits=28 --no-sli --connected-monitor="DFP-0"
echo "In case of any error please reboot and run this script again"

# Paths to the utilities we will need
SMI='/usr/bin/nvidia-smi'
SET='/usr/bin/nvidia-settings'

# Determine major driver version
VER=$(awk '/NVIDIA/ {print $8}' /proc/driver/nvidia/version | cut -d . -f 1)

# Drivers from 285.x.y on allow persistence mode setting
if [ "${VER}" -lt 285 ]
then
    echo "Error: Current driver version is ${VER}. Driver version must be greater than 285."; exit 1;
fi


echo "Applying Settings"

 
# Script needs to run as sudo for nvidia-smi settings to take effect.
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
 
# Setting a terminal variable called memoryOffset
 
# Since all my cards are the same, I'm happy with using the same Memory Transfer Rate Offset
memoryOffset_1050="800"
memoryOffset_1070="600"
fanspeed="80"

# Enable nvidia-smi settings so they are persistent the whole time the system is on.
nvidia-smi -pm 1
 
# Set the power limit for each card (note this value is in watts, not percent!
# 1050Ti
nvidia-smi -i 0,1,2,3,5,6,7,8,9,10,11 -pl 53
# GTX1070
nvidia-smi -i 4 -pl 100
 
## Apply overclocking settings to each GPU
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:1]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:2]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:2]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:3]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:3]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:4]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:4]/GPUMemoryTransferRateOffset[3]=$memoryOffset_1070

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:5]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:5]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:6]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:6]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:7]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:7]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:8]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:8]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:9]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:9]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:10]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:10]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050

sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:11]/GpuPowerMizerMode=1
sudo DISPLAY=:0 XAUTHORITY=/run/user/124/gdm/Xauthority nvidia-settings -a [gpu:11]/GPUMemoryTransferRateOffset[2]=$memoryOffset_1050
