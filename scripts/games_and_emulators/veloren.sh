#!/bin/bash

echo "This process will install Veloren, a multiplayer voxel RPG written in Rust."
echo "It is inspired by games such as Cube World, Legend of Zelda: Breath of the Wild,"
echo "Dwarf Fortress and Minecraft."

sudo apt install -y wget git

echo "Installing Rust..."
cd ~
wget -O rustup-init.sh https://sh.rustup.rs
chmod +x rustup-init.sh
./rustup-init.sh -qy
source $HOME/.cargo/env
rm rustup-init.sh

echo "Cloning Veloren..."
git clone https://gitlab.com/veloren/veloren.git
cd veloren
echo "Building Veloren. This might take a while..."
cargo build
