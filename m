Content-Type: multipart/mixed; boundary="===============1245611501612016136=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 1068/1093] kismet: WARNING: unmet direct dependencies detected for NET_SWITCHDEV when selected by XILINX_TSN_SWITCH
Date: Mon, 16 May 2022 20:54:53 +0800
Message-ID: <202205162034.9BQIIDKs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1245611501612016136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: Syed Syed <syed.syed@xilinx.com>
CC: Priyadarshini Babu <priyadarshini.babu@xilinx.com>
CC: Ravali Potineni <ravali.potineni@xilinx.com>
CC: Harini Katakam <harini.katakam@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_u=
pdate
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: 14a65c2935e17cfbd7b38e935d43fb48d1c225dc [1068/1093] net: xilinx: A=
dd switch device support
:::::: branch date: 4 days ago
:::::: commit date: 6 weeks ago
config: (https://download.01.org/0day-ci/archive/20220516/202205162034.9BQI=
IDKs-lkp(a)intel.com/config)
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/14a65c2935e17cfbd7b38=
e935d43fb48d1c225dc
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 14a65c2935e17cfbd7b38e935d43fb48d1c225dc
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_NET_SWITCHDEV --s=
electors CONFIG_XILINX_TSN_SWITCH -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_SWITCHDEV wh=
en selected by XILINX_TSN_SWITCH
   =

   WARNING: unmet direct dependencies detected for NET_SWITCHDEV
     Depends on [n]: NET [=3Dy] && INET [=3Dn]
     Selected by [y]:
     - XILINX_TSN_SWITCH [=3Dy] && NETDEVICES [=3Dy] && ETHERNET [=3Dy] && =
NET_VENDOR_XILINX [=3Dy] && XILINX_TSN [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1245611501612016136==--

