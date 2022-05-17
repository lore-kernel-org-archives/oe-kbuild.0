Content-Type: multipart/mixed; boundary="===============8733971414576524658=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 1018/1093] kismet: WARNING: unmet direct dependencies detected for SERIAL_CORE when selected by SERIAL_UARTLITE_RS485
Date: Tue, 17 May 2022 11:52:12 +0800
Message-ID: <202205171107.I0DWAdFz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8733971414576524658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Pallav Joshi <pallav.joshi@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_u=
pdate
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: db2754ae82e1526613a6ab5853d3cceeaed3920b [1018/1093] staging: uartl=
ite-rs485: Initial commit to add drv
:::::: branch date: 5 days ago
:::::: commit date: 8 weeks ago
config: (https://download.01.org/0day-ci/archive/20220517/202205171107.I0DW=
AdFz-lkp(a)intel.com/config)
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/db2754ae82e1526613a6a=
b5853d3cceeaed3920b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout db2754ae82e1526613a6ab5853d3cceeaed3920b
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_SERIAL_CORE --sel=
ectors CONFIG_SERIAL_UARTLITE_RS485 -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_CORE when=
 selected by SERIAL_UARTLITE_RS485
   =

   WARNING: unmet direct dependencies detected for SERIAL_CORE
     Depends on [n]: TTY [=3Dn] && HAS_IOMEM [=3Dy]
     Selected by [y]:
     - SERIAL_UARTLITE_RS485 [=3Dy] && STAGING [=3Dy] && HAS_IOMEM [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8733971414576524658==--

