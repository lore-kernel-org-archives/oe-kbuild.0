Content-Type: multipart/mixed; boundary="===============1451535547491014137=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 11 Feb 2022 08:41:44 +0800
Message-ID: <202202110856.M812pOec-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1451535547491014137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yannick Vignon <yannick.vignon@nxp.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: 8a7cb245cf28cb3e541e0d6c8624b95d079e155b net: stmmac: Do not enable=
 RX FIFO overflow interrupts
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-c006-20220205 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110856.M812pOec-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 78c6b9=
0000292eb37aac5dead6ab26611cd76f42)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8a7cb245cf28cb3e541e0d6c8624b95d079e155b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8a7cb245cf28cb3e541e0d6c8624b95d079e155b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           roc =3D list_first_entry_or_null(&local->roc_list,
                 ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/mac80211/offchannel.c:423:8: note: Loop condition is false.  Exiting=
 loop
           roc =3D list_first_entry_or_null(&local->roc_list,
                 ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/mac80211/offchannel.c:425:7: note: 'roc' is non-null
           if (!roc)
                ^~~
   net/mac80211/offchannel.c:425:2: note: Taking false branch
           if (!roc)
           ^
   net/mac80211/offchannel.c:428:7: note: Use of memory after it is freed
           if (!roc->started) {
                ^~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3572:3: warning: Value=
 stored to 'irq_err' is never read [clang-analyzer-deadcode.DeadStores]
                   irq_err =3D REQ_IRQ_ERR_MAC;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3572:3: note: Value st=
ored to 'irq_err' is never read
                   irq_err =3D REQ_IRQ_ERR_MAC;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3586:4: warning: Value=
 stored to 'irq_err' is never read [clang-analyzer-deadcode.DeadStores]
                           irq_err =3D REQ_IRQ_ERR_WOL;
                           ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3586:4: note: Value st=
ored to 'irq_err' is never read
                           irq_err =3D REQ_IRQ_ERR_WOL;
                           ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4890:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4890:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5087:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5087:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5088:3: warning: Value=
 stored to 'buf2_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf2_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5088:3: note: Value st=
ored to 'buf2_len' is never read
                   buf2_len =3D 0;
                   ^          ~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: warning: Value=
 stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D stmmac_host_mtl_irq_status(priv, priv=
->hw,
                           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: note: Value st=
ored to 'status' is never read
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5655:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5651:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5652:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5652:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5654:15: note: Assumin=
g 'dev' is null
           if (unlikely(!dev)) {
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5654:2: note: Taking t=
rue branch
           if (unlikely(!dev)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5655:14: note: Access =
to field 'dev' results in a dereference of a null pointer (loaded from vari=
able 'priv')
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5675:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5671:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5672:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5672:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5674:15: note: Assumin=
g 'dev' is null
           if (unlikely(!dev)) {
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5674:2: note: Taking t=
rue branch
           if (unlikely(!dev)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5675:14: note: Access =
to field 'dev' results in a dereference of a null pointer (loaded from vari=
able 'priv')
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/tuners/r820t.c:1856:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D r820t_section(priv, compare_iq);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/r820t.c:1856:2: note: Value stored to 'rc' is never=
 read
           rc =3D r820t_section(priv, compare_iq);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   include/asm-generic/bitops/non-atomic.h:26:23: warning: The result of th=
e left shift is undefined because the right operand is negative [clang-anal=
yzer-core.UndefinedBinaryOperatorResult]
           unsigned long mask =3D BIT_MASK(nr);
                                ^
   include/linux/bits.h:10:30: note: expanded from macro 'BIT_MASK'
   #define BIT_MASK(nr)            (UL(1) << ((nr) % BITS_PER_LONG))
                                          ^
   net/core/filter.c:2727:6: note: Assuming 'flags' is 0
           if (unlikely(flags))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   net/core/filter.c:2727:2: note: Taking false branch
           if (unlikely(flags))
           ^
   net/core/filter.c:2736:7: note: Assuming the condition is true
                   if (start < offset + l)
                       ^~~~~~~~~~~~~~~~~~
   net/core/filter.c:2736:3: note: Taking true branch
                   if (start < offset + l)
                   ^
   net/core/filter.c:2737:4: note:  Execution continues on line 2741
                           break;
                           ^
   net/core/filter.c:2741:2: note: Taking false branch

vim +/status +5600 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5561  =

29e6573c61aaa7 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-26  5562  static void stmmac_common_interrupt(struct stmm=
ac_priv *priv)
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe C=
avallaro  2009-10-14  5563  {
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5564  	u32 rx_cnt =3D priv->plat->rx_queues_to_use;
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5565  	u32 tx_cnt =3D priv->plat->tx_queues_to_use;
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5566  	u32 queues_count;
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5567  	u32 queue;
7d9e6c5afab6bf drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu=
          2018-08-08  5568  	bool xmac;
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5569  =

7d9e6c5afab6bf drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu=
          2018-08-08  5570  	xmac =3D priv->plat->has_gmac4 || priv->plat->=
has_xgmac;
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5571  	queues_count =3D (rx_cnt > tx_cnt) ? rx_cnt : =
tx_cnt;
47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe C=
avallaro  2009-10-14  5572  =

89f7f2cfdd7ade drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Srinivas K=
andagatla 2014-01-16  5573  	if (priv->irq_wake)
89f7f2cfdd7ade drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Srinivas K=
andagatla 2014-01-16  5574  		pm_wakeup_event(priv->device, 0);
89f7f2cfdd7ade drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Srinivas K=
andagatla 2014-01-16  5575  =

e49aa315cb0182 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Voon Weife=
ng        2021-03-18  5576  	if (priv->dma_cap.estsel)
9f298959191b0a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-18  5577  		stmmac_est_irq_status(priv, priv->ioaddr, pri=
v->dev,
9f298959191b0a drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-18  5578  				      &priv->xstats, tx_cnt);
e49aa315cb0182 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Voon Weife=
ng        2021-03-18  5579  =

5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5580  	if (priv->dma_cap.fpesel) {
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5581  		int status =3D stmmac_fpe_irq_status(priv, pr=
iv->ioaddr,
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5582  						   priv->dev);
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5583  =

5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5584  		stmmac_fpe_event_status(priv, status);
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5585  	}
5a5586112b9295 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-24  5586  =

47dd7a540b8a0c drivers/net/stmmac/stmmac_main.c                  Giuseppe C=
avallaro  2009-10-14  5587  	/* To handle GMAC own interrupts */
7d9e6c5afab6bf drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu=
          2018-08-08  5588  	if ((priv->plat->has_gmac) || xmac) {
c10d4c82a5c84c drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abreu=
          2018-04-16  5589  		int status =3D stmmac_host_irq_status(priv, p=
riv->hw, &priv->xstats);
8f71a88d3619db drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-10  5590  =

d765955d2ae0b8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2012-06-27  5591  		if (unlikely(status)) {
d765955d2ae0b8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2012-06-27  5592  			/* For LPI we need to save the tx status */
0982a0f6d1be5f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2013-03-26  5593  			if (status & CORE_IRQ_TX_PATH_IN_LPI_MODE)
d765955d2ae0b8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2012-06-27  5594  				priv->tx_path_in_lpi_mode =3D true;
0982a0f6d1be5f drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2013-03-26  5595  			if (status & CORE_IRQ_TX_PATH_EXIT_LPI_MODE)
d765955d2ae0b8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2012-06-27  5596  				priv->tx_path_in_lpi_mode =3D false;
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5597  		}
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5598  =

7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5599  		for (queue =3D 0; queue < queues_count; queue=
++) {
8a7cb245cf28cb drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Yannick Vi=
gnon      2021-05-06 @5600  			status =3D stmmac_host_mtl_irq_status(priv, =
priv->hw,
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5601  							    queue);
7bac4e1ec3ca23 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pinto=
          2017-03-15  5602  		}
70523e639bf8ca drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2016-06-24  5603  =

70523e639bf8ca drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2016-06-24  5604  		/* PCS link status */
3fe5cadbd3494b drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2016-06-24  5605  		if (priv->hw->pcs) {
70523e639bf8ca drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2016-06-24  5606  			if (priv->xstats.pcs_link)
29e6573c61aaa7 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-26  5607  				netif_carrier_on(priv->dev);
70523e639bf8ca drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2016-06-24  5608  			else
29e6573c61aaa7 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-26  5609  				netif_carrier_off(priv->dev);
29e6573c61aaa7 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon L=
eong      2021-03-26  5610  		}
f4da56529da602 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan Tee Mi=
n         2021-04-14  5611  =

f4da56529da602 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan Tee Mi=
n         2021-04-14  5612  		stmmac_timestamp_interrupt(priv, priv);
70523e639bf8ca drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2016-06-24  5613  	}
d765955d2ae0b8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2012-06-27  5614  }
d765955d2ae0b8 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe C=
AVALLARO  2012-06-27  5615  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1451535547491014137==--

