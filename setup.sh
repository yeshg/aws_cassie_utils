# Make sure mjkey.txt is there
echo "Have you used SFTP to add mjkey.txt to the home folder of this instance?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

# Go to home
cd

# Make sure apt-get works
sudo apt-get update

# Requirements
sudo apt-get install libglfw3-dev make build-essential python3-pip
sudo apt install unzip

# For visdom
sudo apt-get install luarocks


# Python Env Setup
wget https://repo.continuum.io/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.1-Linux-x86_64.sh
source ~/.bashrc

conda create --name py36 python=3.6
conda activate py36
conda install numpy
conda install pytorch-cpu torchvision-cpu -c pytorch
pip install gym
pip install matplotlib
pip install visdom
# luarocks install visdom

# Get cassie-mujoco-sim and mujoco150
git clone https://github.com/p-morais/cassie-mujoco-sim.git
wget https://www.roboti.us/download/mjpro150_linux.zip

# Unzip mjpro150
unzip mjpro150_linux.zip

# Build cassie-mujoco-sim
mv mjpro150/ cassie-mujoco-sim/.
mv mjkey.txt cassie-mujoco-sim/.
cd cassie-mujoco-sim
make
make test

cd

# Get deep-rl and cassie-rl repos
git clone https://github.com/p-morais/deep-rl.git
git clone https://github.com/p-morais/cassie-rl.git

# Setup cassie-rl with stuff from cassie-mujoco-sim
cp cassie-mujoco-sim/mjkey.txt cassie-rl/cassie/cassiemujoco/.
cp -a cassie-mujoco-sim/mjpro150/ cassie-rl/cassie/cassiemujoco/.
cp ~/cassie-mujoco-sim/libcassiemujoco.so cassie-rl/cassie/cassiemujoco/.


# finish setting up cassie-rl
cd cassie-rl
pip install -e .

# Setup deep-rl
cd
cd deep-rl
python setup.py build
python setup.py install

# Done
cd
echo "Done Setting Up"