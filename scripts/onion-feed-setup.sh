#! /bin/sh

echo "Preparing package feeds..."
git config --list | grep ssl || true
sudo apt-get install -y ca-certificates
git config --list | grep ssl || true
echo "After setup of ca certificates..."
./scripts/feeds update -a
./scripts/feeds install -a
#./scripts/feeds install -a -p onion

# take care of Onion customized packages
./scripts/feeds uninstall bluez-examples bluez-libs bluez-utils pulseaudio-daemon pulseaudio-profiles pulseaudio-tools avrdude
./scripts/feeds install -p onion bluez-examples bluez-libs bluez-utils pulseaudio-daemon pulseaudio-profiles pulseaudio-tools avrdude



