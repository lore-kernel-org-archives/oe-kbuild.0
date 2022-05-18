Content-Type: multipart/mixed; boundary="===============1991596699232504006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lunn:v5.18-rc4-stacked-bridges 1/2] kismet: WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED when selected by ZII_RAP
Date: Wed, 18 May 2022 13:03:14 +0800
Message-ID: <202205181212.wkAYWKCS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1991596699232504006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>
CC: Andrey Smirnov <andrew.smirnov@gmail.com>

tree:   https://github.com/lunn/linux.git v5.18-rc4-stacked-bridges
head:   54c29cf210da59f450762e12946a2dec224c6850
commit: 104ddfd33f3bd72e3a37262edefff94c0c7d55d4 [1/2] platform/x86: Add Zo=
diac Radio Access Point platform driver
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: (https://download.01.org/0day-ci/archive/20220518/202205181212.wkAY=
WKCS-lkp(a)intel.com/config)
reproduce:
        # https://github.com/lunn/linux/commit/104ddfd33f3bd72e3a37262edeff=
f94c0c7d55d4
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v5.18-rc4-stacked-bridges
        git checkout 104ddfd33f3bd72e3a37262edefff94c0c7d55d4
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_KEYBOARD_GPIO_POL=
LED --selectors CONFIG_ZII_RAP -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_PO=
LLED when selected by ZII_RAP
   =

   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=3Dy] && ETHERNET [=3Dn] && NET_VENDOR_INT=
EL [=3Dn] && PCI [=3Dn] && PTP_1588_CLOCK_OPTIONAL [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for MMC_SDHCI_PCI
     Depends on [n]: MMC [=3Dy] && MMC_SDHCI [=3Dy] && PCI [=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for TQMX86_WDT
     Depends on [n]: WATCHDOG [=3Dn] && X86 [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=3Dy] && USB [=3Dn] && TTY [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for USB_SERIAL_FTDI_SIO
     Depends on [n]: USB_SUPPORT [=3Dy] && USB [=3Dn] && USB_SERIAL [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
     Depends on [n]: INPUT [=3Dn] && INPUT_KEYBOARD [=3Dn] && GPIOLIB [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for USB_SERIAL_CONSOLE
     Depends on [n]: USB_SUPPORT [=3Dy] && USB [=3Dn] && USB_SERIAL [=3Dy]=
=3Dy
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1991596699232504006==--

