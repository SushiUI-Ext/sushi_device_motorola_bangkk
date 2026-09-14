#!/system/bin/sh

echo "This installation:"
echo "Device: motorola-bangkk"
echo "Sushi version: 1.1.2"
echo "Bugs: beta not compiling"
echo "Release channel: stable"

echo "I: Checking SDK (minimum 36)"
SDK="$(getprop ro.build.version.sdk)"

if [ "$SDK" -ge 36 ]; then
    :
else
    echo "Wrong SDK, sorry"
    exit 1
fi

echo "I: Checking device"
DEVICE="$(getprop ro.product.device)"

if [ "$DEVICE" = "bangkk" ]; then
    :
else
    echo "Wrong device, sorry"
    exit 1
fi
