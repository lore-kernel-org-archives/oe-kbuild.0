Content-Type: multipart/mixed; boundary="===============3944585231134442902=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 1089/1091] drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: linux/clk.h is included more than once.
Date: Fri, 08 Apr 2022 17:21:53 +0800
Message-ID: <202204081742.J7VidrBV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3944585231134442902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Harini Katakam <harini.katakam@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   031eb9ce665429a9574c95f89bcc488fd0ba0ec1
commit: 8c6910de988070200e93c242ced7187754c4020d [1089/1091] net: xilinx: M=
ove Xilinx TSN to staging
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: linux/clk.h is inc=
luded more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3944585231134442902==--

