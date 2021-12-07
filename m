Content-Type: multipart/mixed; boundary="===============1080987388086278040=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/socfpga/clk-pll-s10.c:116:9: warning: Although the value stored to 'parent_rate' is used in the enclosing expression, the value is never actually read from 'parent_rate' [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Dec 2021 19:42:48 +0800
Message-ID: <202112071952.MxQp4L97-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1080987388086278040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: cdb1e8b4f4c2e515bfe3fd4d9d49bb9a5fc3806f clk: socfpga: allow compil=
e testing of Stratix 10 / Agilex clocks
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20211202 (https://download.01.org/0day-ci/archi=
ve/20211207/202112071952.MxQp4L97-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcdb1e8b4f4c2e515bfe3fd4d9d49bb9a5fc3806f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cdb1e8b4f4c2e515bfe3fd4d9d49bb9a5fc3806f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_FUNCGATED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_FUNCGATED))
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3735:2: note: Calling 'disp=
c_setup_color_conv_coef'
           dispc_setup_color_conv_coef();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:14: note: Assuming 'i' =
is >=3D 'num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:2: note: Loop condition=
 is false. Execution continues on line 695
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:6: note: Assuming field=
 'has_writeback' is true
           if (dispc.feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:2: note: Taking true br=
anch
           if (dispc.feat->has_writeback)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:696:3: note: Calling 'dispc=
_ovl_write_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(OMAP_DSS_WB, &ctbl_bt601=
_5_wb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: note: The result of=
 the left shift is undefined because the left operand is negative
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/clk/socfpga/clk-pll-s10.c:116:9: warning: Although the value sto=
red to 'parent_rate' is used in the enclosing expression, the value is neve=
r actually read from 'parent_rate' [clang-analyzer-deadcode.DeadStores]
           return parent_rate /=3D div;
                  ^              ~~~
   drivers/clk/socfpga/clk-pll-s10.c:116:9: note: Although the value stored=
 to 'parent_rate' is used in the enclosing expression, the value is never a=
ctually read from 'parent_rate'
           return parent_rate /=3D div;
                  ^              ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/scsi/device_handler/scsi_dh_rdac.c:454:4: warning: Value stored =
to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D SCSI_DH_RES_TEMP_UNAVAIL;
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/device_handler/scsi_dh_rdac.c:454:4: note: Value stored to =
'err' is never read
                           err =3D SCSI_DH_RES_TEMP_UNAVAIL;

vim +116 drivers/clk/socfpga/clk-pll-s10.c

07afb8db7340f9b Dinh Nguyen 2018-03-21  105  =

07afb8db7340f9b Dinh Nguyen 2018-03-21  106  static unsigned long clk_boot_=
clk_recalc_rate(struct clk_hw *hwclk,
07afb8db7340f9b Dinh Nguyen 2018-03-21  107  					 unsigned long parent_rat=
e)
07afb8db7340f9b Dinh Nguyen 2018-03-21  108  {
07afb8db7340f9b Dinh Nguyen 2018-03-21  109  	struct socfpga_pll *socfpgacl=
k =3D to_socfpga_clk(hwclk);
07afb8db7340f9b Dinh Nguyen 2018-03-21  110  	u32 div =3D 1;
07afb8db7340f9b Dinh Nguyen 2018-03-21  111  =

07afb8db7340f9b Dinh Nguyen 2018-03-21  112  	div =3D ((readl(socfpgaclk->h=
w.reg) &
07afb8db7340f9b Dinh Nguyen 2018-03-21  113  		SWCTRLBTCLKSEL_MASK) >>
07afb8db7340f9b Dinh Nguyen 2018-03-21  114  		SWCTRLBTCLKSEL_SHIFT);
07afb8db7340f9b Dinh Nguyen 2018-03-21  115  	div +=3D 1;
07afb8db7340f9b Dinh Nguyen 2018-03-21 @116  	return parent_rate /=3D div;
07afb8db7340f9b Dinh Nguyen 2018-03-21  117  }
07afb8db7340f9b Dinh Nguyen 2018-03-21  118  =


:::::: The code at line 116 was first introduced by commit
:::::: 07afb8db7340f9b6051a26c5c28f2ce74148f6b5 clk: socfpga: stratix10: ad=
d clock driver for Stratix10 platform

:::::: TO: Dinh Nguyen <dinguyen@kernel.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1080987388086278040==--

