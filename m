Content-Type: multipart/mixed; boundary="===============1714837064249763759=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 364/1093] drivers/usb/dwc3/core.c:583:10: warning: Signed integer overflow for expression '0xf<<28'. [integerOverflow]
Date: Sat, 16 Apr 2022 20:58:12 +0800
Message-ID: <202204162010.QCTAdsw8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1714837064249763759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Manish Narani <manish.narani@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Piyush Mehta <piyush.mehta@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   b1635a7683e2274f21d795783e4c9db7e518267a
commit: f0fac249047d89d08b43602104206071b484e86c [364/1093] usb: dwc3: of-s=
imple: Enable CCI support in dwc3 driver
:::::: branch date: 5 days ago
:::::: commit date: 2 months ago
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f0fac249047d89d08b43602104206071b484e86c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/dwc3/core.c:583:10: warning: Signed integer overflow for exp=
ression '0xf<<28'. [integerOverflow]
     reg |=3D DWC3_GSBUSCFG0_DATRDREQINFO |
            ^

vim +583 drivers/usb/dwc3/core.c

26ceca97502609 Felipe Balbi  2011-09-30  571  =

f0fac249047d89 Manish Narani 2022-01-26  572  static void dwc3_config_soc_b=
us(struct dwc3 *dwc)
f0fac249047d89 Manish Narani 2022-01-26  573  {
f0fac249047d89 Manish Narani 2022-01-26  574  	/*
f0fac249047d89 Manish Narani 2022-01-26  575  	 * Check if CCI is enabled f=
or USB. Returns true
f0fac249047d89 Manish Narani 2022-01-26  576  	 * if the node has property =
'dma-coherent'. Otherwise
f0fac249047d89 Manish Narani 2022-01-26  577  	 * returns false.
f0fac249047d89 Manish Narani 2022-01-26  578  	 */
f0fac249047d89 Manish Narani 2022-01-26  579  	if (of_dma_is_coherent(dwc->=
dev->of_node)) {
f0fac249047d89 Manish Narani 2022-01-26  580  		u32 reg;
f0fac249047d89 Manish Narani 2022-01-26  581  =

f0fac249047d89 Manish Narani 2022-01-26  582  		reg =3D dwc3_readl(dwc->reg=
s, DWC3_GSBUSCFG0);
f0fac249047d89 Manish Narani 2022-01-26 @583  		reg |=3D DWC3_GSBUSCFG0_DAT=
RDREQINFO |
f0fac249047d89 Manish Narani 2022-01-26  584  			DWC3_GSBUSCFG0_DESRDREQINF=
O |
f0fac249047d89 Manish Narani 2022-01-26  585  			DWC3_GSBUSCFG0_DATWRREQINF=
O |
f0fac249047d89 Manish Narani 2022-01-26  586  			DWC3_GSBUSCFG0_DESWRREQINF=
O;
f0fac249047d89 Manish Narani 2022-01-26  587  		dwc3_writel(dwc->regs, DWC3=
_GSBUSCFG0, reg);
f0fac249047d89 Manish Narani 2022-01-26  588  	}
f0fac249047d89 Manish Narani 2022-01-26  589  }
f0fac249047d89 Manish Narani 2022-01-26  590  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1714837064249763759==--

