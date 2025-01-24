#!/bin/bash

xhost +SI:localuser:root
pkexec xampp-manager
xhost -SI:localuser:root

