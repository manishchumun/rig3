sudo mount /dev/sdb2 /media/manish/drive1
sudo mount /dev/sdc2 /media/manish/drive2
cd /home/manish/creepMiner-1.7.16-Linux/opt/creepMiner-1.7.16/
tmux new -s burstminer "./run.sh"
