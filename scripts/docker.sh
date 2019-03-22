#!/bin/sh

sudo usermod -aG docker $USER
sudo systemctl enable docker
