Content-Type: multipart/mixed; boundary="===============6050467166662052817=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 216/1093] kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by XILINX_AXI_EMAC_HWTSTAMP
Date: Tue, 17 May 2022 00:31:41 +0800
Message-ID: <202205170043.xWSaeMmj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6050467166662052817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_u=
pdate
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: bf05571deda79b6b79d0e5cd93dd813a7696fa79 [216/1093] net: axienet: A=
dd support for 1588
:::::: branch date: 4 days ago
:::::: commit date: 4 months ago
config: (https://download.01.org/0day-ci/archive/20220517/202205170043.xWSa=
eMmj-lkp(a)intel.com/config)
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/bf05571deda79b6b79d0e=
5cd93dd813a7696fa79
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout bf05571deda79b6b79d0e5cd93dd813a7696fa79
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_PTP_1588_CLOCK --=
selectors CONFIG_XILINX_AXI_EMAC_HWTSTAMP -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK w=
hen selected by XILINX_AXI_EMAC_HWTSTAMP
   =

   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=3Dy] && POSIX_TIMERS [=3Dn]
     Selected by [y]:
     - XILINX_AXI_EMAC_HWTSTAMP [=3Dy] && NETDEVICES [=3Dy] && ETHERNET [=
=3Dy] && NET_VENDOR_XILINX [=3Dy] && XILINX_AXI_EMAC [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6050467166662052817==--

