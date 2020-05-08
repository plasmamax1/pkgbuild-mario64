#!/bin/bash

echo " (           (         (        *             (    (        )                 "
echo " )\ )        )\ )      )\ )   (  \     (      )\ ) )\ )  ( /(    (         )  "
echo "(()/(    (  (()/( (   (()/(   )\))(    )\    (()/((()/(  )\())   )\ )   ( /(  "
echo " /(_))   )\  /(_)))\   /(_)) ((_)()\((((_)(   /(_))/(_))((_)\   (()/(   )\()) "
echo "(_))  _ ((_)(_)) ((_) (_))   (_()((_))\ _ )\ (_)) (_))    ((_)   /(_)) ((_)\  "
echo "/ __|| | | || _ \| __|| _ \  |  \/  |(_)_\(_)| _ \|_ _|  / _ \  (_) / | | (_) "
echo "\__ \| |_| ||  _/| _| |   /  | |\/| | / _ \  |   / | |  | (_) |  / _ \|_  _|  "
echo "|___/ \_(_/ |_|  |___||_|_\  |_|  )_|/_/ (_\ |_|_\|___|  \___/   \___/  |_|   "
echo "   (    )\ )    (        (     ( /(      )\ )                                 "
echo "   )\  (()/(    )\       )\    )\()) (  (()/(                                 "
echo " (((_)  /(_))((((_)(   (((_) |((_)\  )\  /(_))                                "
echo " )\___ (_))   )\ _ )\  )\___ |_ ((_)((_)(_))_                                 "
echo "((/ __|| _ \  (_)_\(_)((/ __|| |/ / | __||   \                                "
echo " | (__ |   /   / _ \   | (__   ' <  | _| | |) |                               "
echo "  \___||_|_\  /_/ \_\   \___| _|\_\ |___||___/                                "

sudo apt update
sudo apt install -y build-essential pkg-config git binutils-mips-linux-gnu python3 zlib1g-dev libaudiofile-dev libsdl2-dev libusb-1.0-0-dev libglfw3-dev

rm -frv sm64*
git clone https://github.com/n64decomp/sm64.git

cd sm64
wget https://01zgvw.dm.files.1drv.com/y4mGOEyhrD9LF_lGrgzM_FJZy0SZCSUTjY_95tGZ7wfvDWhpR5ZcAOdHOjbUxbLRPwKfdJAS3wB-rKVU15cHv4xrFmEfLLO6GfR0UQqzzvWSXldd8GwmCNGZp-drpoWy_KBDSW3Btc7dyT3NEtMIDJG8XMwDARID4bg_4SCQncWb4YOnQr-wEcQiuTLgeBobF2vsfuDKZ5wUfXHvdW_EcOYOg -O baserom.us.z64

if [ ! -e qemu-irix-2.11.0-2169-g32ab296eef_amd64.dev ]
then
	wget https://github.com/n64decomp/qemu-irix/releases/download/v2.11-deb/qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
	sudo dpkg -i qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
fi

patch -p1 -f -i ../mario64.patch
./configure --prefix=/usr
make TARGET_N64=0 -j2
