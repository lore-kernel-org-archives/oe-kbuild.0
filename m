Content-Type: multipart/mixed; boundary="===============6747562687185573997=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 231/1093] kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by XILINX_TSN_QBV
Date: Tue, 17 May 2022 07:59:08 +0800
Message-ID: <202205170721.sKArO40P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6747562687185573997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Syed Syed <syed.syed@xilinx.com>
CC: Priyadarshini Babu <priyadarshini.babu@xilinx.com>
CC: Ravali Potineni <ravali.potineni@xilinx.com>
CC: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_u=
pdate
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: a7ae7ddafe91c16d0f4bcd4d148c76318f3cfb06 [231/1093] net: xilinx: Ad=
d support for PL TSN IP features
:::::: branch date: 5 days ago
:::::: commit date: 4 months ago
config: (https://download.01.org/0day-ci/archive/20220517/202205170721.sKAr=
O40P-lkp(a)intel.com/config)
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/a7ae7ddafe91c16d0f4bc=
d4d148c76318f3cfb06
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout a7ae7ddafe91c16d0f4bcd4d148c76318f3cfb06
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_PTP_1588_CLOCK --=
selectors CONFIG_XILINX_TSN_QBV -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK w=
hen selected by XILINX_TSN_QBV
   =

   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=3Dy] && POSIX_TIMERS [=3Dn]
     Selected by [y]:
     - XILINX_TSN_PTP [=3Dy] && NETDEVICES [=3Dy] && ETHERNET [=3Dy] && NET=
_VENDOR_XILINX [=3Dy] && XILINX_TSN [=3Dy]
     - XILINX_TSN_QBV [=3Dy] && NETDEVICES [=3Dy] && ETHERNET [=3Dy] && NET=
_VENDOR_XILINX [=3Dy] && XILINX_TSN_PTP [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6747562687185573997==--

