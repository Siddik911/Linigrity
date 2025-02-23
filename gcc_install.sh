#Install and Set g++ 14.2.0 as Default on Linux
#This guide shows how to download, build, and set g++ 14.2.0 as your default compiler. You can modify it for other versions by simply changing the version number.
#1. Install Prerequisites
#Before building g++ from source, ensure all necessary dependencies are installed:

sudo apt update
sudo apt install build-essential libmpfr-dev libgmp3-dev libmpc-dev -y

#2. Download and Extract GCC Source

wget http://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.gz 
tar -xf gcc-14.2.0.tar.gz
cd gcc-14.2.0

#3. Configure the Build

./configure -v \
    --build=x86_64-linux-gnu \
    --host=x86_64-linux-gnu \
    --target=x86_64-linux-gnu \
    --prefix=/usr/local/gcc-14.2.0 \
    --enable-checking=release \
    --enable-languages=c,c++ \
    --disable-multilib \
    --program-suffix=-14.2.0

#4. Build and Install
#This step can take a while, depending on your system’s resources:

make -j$(nproc)
sudo make install

#5. Verify the Installation

/usr/local/gcc-14.2.0/bin/g++-14.2.0 --version

#You should see the version output confirming the installation, such as: g++ (GCC) 14.2.0


#6. Set g++ 14.2.0 as the Default Version
#Register the New Version:

sudo update-alternatives --install /usr/bin/g++ g++ /usr/local/gcc-14.2.0/bin/g++-14.2.0 100

#Select the Default Version:

sudo update-alternatives --config g++

#You will see output similar to:

#There are 2 choices for the alternative g++ (providing /usr/bin/g++).
#
#  Selection    Path                                    Priority   Status
#------------------------------------------------------------
#* 0            /usr/bin/g++-13                          50        auto mode
#  1            /usr/bin/g++-13                          50        manual mode
#  2            /usr/local/gcc-14.2.0/bin/g++-14.2.0     100       manual mode
#
#    Type the number corresponding to g++-14.2.0 (in this example, 2) and press Enter.

#7. Confirm the Default Version

g++ --version

#You should now see the output for g++ 14.2.0, confirming it is the default version.