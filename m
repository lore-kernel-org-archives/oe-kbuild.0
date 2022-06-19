Content-Type: multipart/mixed; boundary="===============0737744740213014280=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 47/1181] drivers/net/ethernet/cadence/macb_main.c: linux/crc32.h is included more than once.
Date: Mon, 20 Jun 2022 03:41:31 +0800
Message-ID: <202206200306.bRSSsaIu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0737744740213014280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Maulik Jodhani <maulik.jodhani@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Harini Katakam <harini.katakam@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: c3094c5cea55f500a0f225a0f0d75523e2e2a8d0 [47/1181] net: macb: Add s=
upport for partial store and forward
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/cadence/macb_main.c: linux/crc32.h is included more=
 than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0737744740213014280==--

