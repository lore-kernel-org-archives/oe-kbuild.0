Content-Type: multipart/mixed; boundary="===============2348277385217262700=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 820/1208] drivers/gpu/drm/xlnx/xlnx_hdmi.c:2969:2-9: line 2969 is redundant because platform_get_irq() already prints an error
Date: Sun, 10 Jul 2022 20:54:20 +0800
Message-ID: <202207102017.jPAtmnvm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2348277385217262700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   50470cc53c4c22e09797a106e8fb06606383b904
commit: 245de1aec40eb32ded219a6162750f7227cde486 [820/1208] drm: xlnx: hdmi=
: Add HDMI 2.1 Tx subsystem driver
:::::: branch date: 10 days ago
:::::: commit date: 5 months ago
config: h8300-randconfig-c023-20220710 (https://download.01.org/0day-ci/arc=
hive/20220710/202207102017.jPAtmnvm-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xlnx/xlnx_hdmi.c:2969:2-9: line 2969 is redundant becaus=
e platform_get_irq() already prints an error

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2348277385217262700==--

