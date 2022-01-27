Content-Type: multipart/mixed; boundary="===============6675860144835830406=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal).
Date: Fri, 28 Jan 2022 07:13:22 +0800
Message-ID: <202201280737.ElKaQTXl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6675860144835830406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Adam Ford <aford173@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   626b2dda7651a7c766108db4cdc0825db05b980d
commit: 042b67799e2991e301df8269e166d8bc5944495e soc: imx: imx8m-blk-ctrl: =
Fix imx8mm mipi reset
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220121 (https://download.01.org/0day-ci/arc=
hive/20220128/202201280737.ElKaQTXl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D042b67799e2991e301df8269e166d8bc5944495e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 042b67799e2991e301df8269e166d8bc5944495e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'st=
ruct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   clk_names, =

   gpc_name, =

   num_clks, =

   rst_mask, =

   clk_mask, =

   mipi_phy_rst_mask, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct imx8m_blk_ctrl_domain_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/imx8m-blk-ctrl.c:33:8: note: Excessive padding in 'struc=
t imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal). Optima=
l fields order: name, clk_names, gpc_name, num_clks, rst_mask, clk_mask, mi=
pi_phy_rst_mask, consider reordering the fields or adding explicit padding =
members
   struct imx8m_blk_ctrl_domain_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/ntfs3/inode.c:372:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   fs/ntfs3/inode.c:372:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   fs/ntfs3/index.c:2463:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2463:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2465:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2465:3: note: Value stored to 'err' is never read
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/clk/clk-bm1880.c:106:8: warning: Excessive padding in 'struct bm=
1880_composite_clock' (14 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   name, =

   parent, =

   parents, =

   flags, =

   table, =

   id, =

   num_parents, =

   gate_reg, =

   mux_reg, =

   div_reg, =

   div_initval, =

   gate_shift, =


vim +33 drivers/soc/imx/imx8m-blk-ctrl.c

2684ac05a8c4d2d Lucas Stach 2021-10-02  32  =

2684ac05a8c4d2d Lucas Stach 2021-10-02 @33  struct imx8m_blk_ctrl_domain_da=
ta {
2684ac05a8c4d2d Lucas Stach 2021-10-02  34  	const char *name;
2684ac05a8c4d2d Lucas Stach 2021-10-02  35  	const char * const *clk_names;
2684ac05a8c4d2d Lucas Stach 2021-10-02  36  	int num_clks;
2684ac05a8c4d2d Lucas Stach 2021-10-02  37  	const char *gpc_name;
2684ac05a8c4d2d Lucas Stach 2021-10-02  38  	u32 rst_mask;
2684ac05a8c4d2d Lucas Stach 2021-10-02  39  	u32 clk_mask;
042b67799e2991e Adam Ford   2021-11-28  40  =

042b67799e2991e Adam Ford   2021-11-28  41  	/*
042b67799e2991e Adam Ford   2021-11-28  42  	 * i.MX8M Mini and Nano have a=
 third DISPLAY_BLK_CTRL register
042b67799e2991e Adam Ford   2021-11-28  43  	 * which is used to control th=
e reset for the MIPI Phy.
042b67799e2991e Adam Ford   2021-11-28  44  	 * Since it's only present in =
certain circumstances,
042b67799e2991e Adam Ford   2021-11-28  45  	 * an if-statement should be u=
sed before setting and clearing this
042b67799e2991e Adam Ford   2021-11-28  46  	 * register.
042b67799e2991e Adam Ford   2021-11-28  47  	 */
042b67799e2991e Adam Ford   2021-11-28  48  	u32 mipi_phy_rst_mask;
2684ac05a8c4d2d Lucas Stach 2021-10-02  49  };
2684ac05a8c4d2d Lucas Stach 2021-10-02  50  =


:::::: The code at line 33 was first introduced by commit
:::::: 2684ac05a8c4d2d5c49e6c11eb6206b30a284813 soc: imx: add i.MX8M blk-ct=
rl driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6675860144835830406==--

