Content-Type: multipart/mixed; boundary="===============0376252112612050619=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lunn:v5.18-rc4-stacked-bridges 1/2] kismet: WARNING: unmet direct dependencies detected for IGB when selected by ZII_RAP
Date: Tue, 17 May 2022 09:51:42 +0800
Message-ID: <202205170940.Eb2JQsni-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0376252112612050619==
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
:::::: branch date: 12 days ago
:::::: commit date: 13 days ago
config: (https://download.01.org/0day-ci/archive/20220517/202205170940.Eb2J=
Qsni-lkp(a)intel.com/config)
reproduce:
        # https://github.com/lunn/linux/commit/104ddfd33f3bd72e3a37262edeff=
f94c0c7d55d4
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v5.18-rc4-stacked-bridges
        git checkout 104ddfd33f3bd72e3a37262edefff94c0c7d55d4
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_IGB --selectors C=
ONFIG_ZII_RAP -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IGB when selecte=
d by ZII_RAP
   =

   WARNING: unmet direct dependencies detected for NET_DSA
     Depends on [n]: NET [=3Dn] && (BRIDGE [=3Dn] || BRIDGE [=3Dn]=3Dn) && =
(HSR [=3Dn] || HSR [=3Dn]=3Dn) && INET [=3Dn] && NETDEVICES [=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=3Dn] && ETHERNET [=3Dn] && NET_VENDOR_INT=
EL [=3Dn] && PCI [=3Dn] && PTP_1588_CLOCK_OPTIONAL [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for EEPROM_AT24
     Depends on [n]: I2C [=3Dy] && SYSFS [=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for MMC_SDHCI_PCI
     Depends on [n]: MMC [=3Dy] && MMC_SDHCI [=3Dy] && PCI [=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for NET_DSA_MV88E6XXX
     Depends on [n]: NETDEVICES [=3Dn] && NET_DSA [=3Dy] && PTP_1588_CLOCK_=
OPTIONAL [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for PHYLIB
     Depends on [n]: NETDEVICES [=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for TQMX86_WDT
     Depends on [n]: WATCHDOG [=3Dn] && X86 [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=3Dy] && USB [=3Dy] && TTY [=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for MDIO_BITBANG
     Depends on [n]: NETDEVICES [=3Dn] && MDIO_DEVICE [=3Dn] && MDIO_BUS [=
=3Dn]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for MDIO_GPIO
     Depends on [n]: NETDEVICES [=3Dn] && MDIO_DEVICE [=3Dn] && MDIO_BUS [=
=3Dn] && MDIO_BITBANG [=3Dy] && (GPIOLIB [=3Dy] || COMPILE_TEST [=3Dn])
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
     Depends on [n]: INPUT [=3Dn] && INPUT_KEYBOARD [=3Dn] && GPIOLIB [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]
   =

   WARNING: unmet direct dependencies detected for MARVELL_PHY
     Depends on [n]: NETDEVICES [=3Dn] && PHYLIB [=3Dy]
     Selected by [y]:
     - ZII_RAP [=3Dy] && X86 [=3Dy] && X86_PLATFORM_DEVICES [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0376252112612050619==--

