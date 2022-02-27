Content-Type: multipart/mixed; boundary="===============5469489854155704868=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: warning: Value stored to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 14:37:51 +0800
Message-ID: <202202271424.wDOPGQAv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5469489854155704868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: a3c62a042237d1adeb0290dcb768e17edd6dcd25 net: mtk_eth: add COMPILE_=
TEST support
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220226 (https://download.01.org/0day-ci/archi=
ve/20220227/202202271424.wDOPGQAv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da3c62a042237d1adeb0290dcb768e17edd6dcd25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3c62a042237d1adeb0290dcb768e17edd6dcd25
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:2757:2: warning: Value stor=
ed to 'channel' is never read [clang-analyzer-deadcode.DeadStores]
           channel =3D dispc_ovl_get_channel_out(plane);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:2757:2: note: Value stored =
to 'channel' is never read
           channel =3D dispc_ovl_get_channel_out(plane);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3156:3: warning: Value stor=
ed to 'ht' is never read [clang-analyzer-deadcode.DeadStores]
                   ht =3D timings->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3156:3: note: Value stored =
to 'ht' is never read
                   ht =3D timings->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3157:3: warning: Value stor=
ed to 'vt' is never read [clang-analyzer-deadcode.DeadStores]
                   vt =3D timings->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3157:3: note: Value stored =
to 'vt' is never read
                   vt =3D timings->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3987:2: warning: Value stor=
ed to 'rev' is never read [clang-analyzer-deadcode.DeadStores]
           rev =3D dispc_read_reg(DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3987:2: note: Value stored =
to 'rev' is never read
           rev =3D dispc_read_reg(DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:344:7: warning: Branch condi=
tion evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (err)
                       ^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:220:20: note: 'err' declared=
 without an initial value
           int val, ge_mode, err;
                             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:223:7: note: Assuming the co=
ndition is true
           if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
                ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:808:34: note: expanded from =
macro 'MTK_HAS_CAPS'
   #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) =3D=3D (_x))
                                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:223:52: note: Left side of '=
&&' is false
           if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
                                                             ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:322:6: note: Assuming field =
'interface' is equal to PHY_INTERFACE_MODE_SGMII
           if (state->interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:322:51: note: Left side of '=
||' is true
           if (state->interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
                                                            ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:334:10: note: Assuming the c=
ondition is true
                   sid =3D (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII))=
 ?
                          ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:808:34: note: expanded from =
macro 'MTK_HAS_CAPS'
   #define MTK_HAS_CAPS(caps, _x)          (((caps) & (_x)) =3D=3D (_x))
                                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:334:9: note: '?' condition i=
s true
                   sid =3D (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_SGMII))=
 ?
                         ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:338:14: note: Field 'interfa=
ce' is equal to PHY_INTERFACE_MODE_SGMII
                   if (state->interface !=3D PHY_INTERFACE_MODE_SGMII)
                              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:338:3: note: Taking false br=
anch
                   if (state->interface !=3D PHY_INTERFACE_MODE_SGMII)
                   ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:341:8: note: Taking false br=
anch
                   else if (phylink_autoneg_inband(mode))
                        ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:344:7: note: Branch conditio=
n evaluates to a garbage value
                   if (err)
                       ^~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: warning: Value store=
d to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
                   budget =3D mtk_poll_tx_qdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1404:3: note: Value stored t=
o 'budget' is never read
                   budget =3D mtk_poll_tx_qdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1406:3: warning: Value store=
d to 'budget' is never read [clang-analyzer-deadcode.DeadStores]
                   budget =3D mtk_poll_tx_pdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1406:3: note: Value stored t=
o 'budget' is never read
                   budget =3D mtk_poll_tx_pdma(eth, budget, done, bytes);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   7 warnings generated.
   drivers/clk/sifive/sifive-prci.c:326:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:326:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:347:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:347:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:369:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:369:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:390:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:390:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:411:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:411:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:432:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:432:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:453:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:453:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/firmware/broadcom/tee_bnxt_fw.c:146:3: warning: Value stored to =
'nbytes' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes =3D rbytes;
                   ^        ~~~~~~
   drivers/firmware/broadcom/tee_bnxt_fw.c:146:3: note: Value stored to 'nb=
ytes' is never read
                   nbytes =3D rbytes;
                   ^        ~~~~~~
   2 warnings generated.
   drivers/spi/spi-rspi.c:358:20: warning: Division by zero [clang-analyzer=
-core.DivideZero]
                   rspi->speed_hz =3D DIV_ROUND_UP(clksrc, (2U << brdv) * s=
pbr);
                                    ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/spi/spi-rspi.c:348:6: note: Assuming 'clksrc' is > field 'speed_=
hz'
           if (rspi->speed_hz >=3D clksrc) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-rspi.c:348:2: note: Taking false branch
           if (rspi->speed_hz >=3D clksrc) {
           ^
   drivers/spi/spi-rspi.c:353:10: note: Assuming 'spbr' is <=3D 255
                   while (spbr > 255 && brdv < 3) {
                          ^~~~~~~~~~
   drivers/spi/spi-rspi.c:353:21: note: Left side of '&&' is false
                   while (spbr > 255 && brdv < 3) {
                                     ^
   drivers/spi/spi-rspi.c:357:10: note: Assuming '__UNIQUE_ID___x255' is <=
=3D '__UNIQUE_ID___y256'
                   spbr =3D clamp(spbr, 0, 255);
                          ^
   include/linux/minmax.h:89:45: note: expanded from macro 'clamp'
   #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:45:33: note: expanded from macro 'min'

vim +/budget +1404 drivers/net/ethernet/mediatek/mtk_eth_soc.c

296c9120752bab Stefan Roese  2019-08-16  1391  =

296c9120752bab Stefan Roese  2019-08-16  1392  static int mtk_poll_tx(struc=
t mtk_eth *eth, int budget)
296c9120752bab Stefan Roese  2019-08-16  1393  {
296c9120752bab Stefan Roese  2019-08-16  1394  	struct mtk_tx_ring *ring =
=3D &eth->tx_ring;
e9229ffd550b2d Felix Fietkau 2021-04-22  1395  	struct dim_sample dim_sampl=
e =3D {};
296c9120752bab Stefan Roese  2019-08-16  1396  	unsigned int done[MTK_MAX_D=
EVS];
296c9120752bab Stefan Roese  2019-08-16  1397  	unsigned int bytes[MTK_MAX_=
DEVS];
296c9120752bab Stefan Roese  2019-08-16  1398  	int total =3D 0, i;
296c9120752bab Stefan Roese  2019-08-16  1399  =

296c9120752bab Stefan Roese  2019-08-16  1400  	memset(done, 0, sizeof(done=
));
296c9120752bab Stefan Roese  2019-08-16  1401  	memset(bytes, 0, sizeof(byt=
es));
296c9120752bab Stefan Roese  2019-08-16  1402  =

296c9120752bab Stefan Roese  2019-08-16  1403  	if (MTK_HAS_CAPS(eth->soc->=
caps, MTK_QDMA))
296c9120752bab Stefan Roese  2019-08-16 @1404  		budget =3D mtk_poll_tx_qdm=
a(eth, budget, done, bytes);
296c9120752bab Stefan Roese  2019-08-16  1405  	else
296c9120752bab Stefan Roese  2019-08-16  1406  		budget =3D mtk_poll_tx_pdm=
a(eth, budget, done, bytes);
296c9120752bab Stefan Roese  2019-08-16  1407  =

656e705243fd0c John Crispin  2016-03-08  1408  	for (i =3D 0; i < MTK_MAC_C=
OUNT; i++) {
656e705243fd0c John Crispin  2016-03-08  1409  		if (!eth->netdev[i] || !do=
ne[i])
656e705243fd0c John Crispin  2016-03-08  1410  			continue;
656e705243fd0c John Crispin  2016-03-08  1411  		netdev_completed_queue(eth=
->netdev[i], done[i], bytes[i]);
656e705243fd0c John Crispin  2016-03-08  1412  		total +=3D done[i];
e9229ffd550b2d Felix Fietkau 2021-04-22  1413  		eth->tx_packets +=3D done[=
i];
e9229ffd550b2d Felix Fietkau 2021-04-22  1414  		eth->tx_bytes +=3D bytes[i=
];
656e705243fd0c John Crispin  2016-03-08  1415  	}
656e705243fd0c John Crispin  2016-03-08  1416  =

e9229ffd550b2d Felix Fietkau 2021-04-22  1417  	dim_update_sample(eth->tx_e=
vents, eth->tx_packets, eth->tx_bytes,
e9229ffd550b2d Felix Fietkau 2021-04-22  1418  			  &dim_sample);
e9229ffd550b2d Felix Fietkau 2021-04-22  1419  	net_dim(&eth->tx_dim, dim_s=
ample);
e9229ffd550b2d Felix Fietkau 2021-04-22  1420  =

ad3cba989e8b1b John Crispin  2016-06-10  1421  	if (mtk_queue_stopped(eth) =
&&
ad3cba989e8b1b John Crispin  2016-06-10  1422  	    (atomic_read(&ring->fre=
e_count) > ring->thresh))
13c822f6d468ca John Crispin  2016-04-08  1423  		mtk_wake_queue(eth);
656e705243fd0c John Crispin  2016-03-08  1424  =

656e705243fd0c John Crispin  2016-03-08  1425  	return total;
656e705243fd0c John Crispin  2016-03-08  1426  }
656e705243fd0c John Crispin  2016-03-08  1427  =


:::::: The code at line 1404 was first introduced by commit
:::::: 296c9120752bab93151bd7220896dd302683a91c net: ethernet: mediatek: Ad=
d MT7628/88 SoC support

:::::: TO: Stefan Roese <sr@denx.de>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5469489854155704868==--

