mkdir /home/buildozer/out
abuild-keygen -ain
sudo sed -i -E 's/export JOBS=[0-9]+$/export JOBS=$(nproc)/' /etc/abuild.conf
echo "http://dl-cdn.alpinelinux.org/alpine/${ALPINE_VERSION}/main" | sudo tee /etc/apk/repositories
sudo apk update
sudo apk add --upgrade apk-tools
sudo apk upgrade --available
cd /tmp/aports/community/gnu-libiconv
abuild -r
cp /home/buildozer/packages/community/*/*.apk /home/buildozer/out/
