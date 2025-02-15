#!/usr/bin/env bash
nix-shell -p "python3.withPackages (ps: with ps; [ dbus-python ])"
python3 eduroam-linux.py