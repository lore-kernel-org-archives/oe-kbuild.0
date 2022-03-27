Content-Type: multipart/mixed; boundary="===============6599231971816488392=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 10:33:08 +0800
Message-ID: <202203271039.JdwgSWt2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6599231971816488392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yannick Vignon <yannick.vignon@nxp.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f022814633e1c600507b3a99691b4d624c2813f0
commit: 8a7cb245cf28cb3e541e0d6c8624b95d079e155b net: stmmac: Do not enable=
 RX FIFO overflow interrupts
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220325 (https://download.01.org/0day-ci/archi=
ve/20220327/202203271039.JdwgSWt2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8a7cb245cf28cb3e541e0d6c8624b95d079e155b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8a7cb245cf28cb3e541e0d6c8624b95d079e155b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           do {                                                            \
           ^
   net/netfilter/nf_tables_api.c:8888:2: note: Use of memory after it is fr=
eed
           list_for_each_entry_safe_reverse(trans, next,
           ^
   include/linux/list.h:763:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:563:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:708:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/net/ethernet/microchip/encx24j600.c:292:21: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct net_device *dev =3D priv->ndev;
                              ^~~   ~~~~~~~~~~
   drivers/net/ethernet/microchip/encx24j600.c:292:21: note: Value stored t=
o 'dev' during its initialization is never read
           struct net_device *dev =3D priv->ndev;
                              ^~~   ~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/net/ethernet/smsc/smc91x.c:1333:2: warning: Value stored to 'sta=
tus' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D SMC_GET_INT(lp);
           ^
   drivers/net/ethernet/smsc/smc91x.c:1333:2: note: Value stored to 'status=
' is never read
   drivers/net/ethernet/smsc/smc91x.c:1334:2: warning: Value stored to 'mas=
k' is never read [clang-analyzer-deadcode.DeadStores]
           mask =3D SMC_GET_INT_MASK(lp);
           ^
   drivers/net/ethernet/smsc/smc91x.c:1334:2: note: Value stored to 'mask' =
is never read
   drivers/net/ethernet/smsc/smc91x.c:1335:2: warning: Value stored to 'fif=
o' is never read [clang-analyzer-deadcode.DeadStores]
           fifo =3D SMC_GET_FIFO(lp);
           ^
   drivers/net/ethernet/smsc/smc91x.c:1335:2: note: Value stored to 'fifo' =
is never read
   drivers/net/ethernet/smsc/smc91x.c:1337:2: warning: Value stored to 'eph=
_st' is never read [clang-analyzer-deadcode.DeadStores]
           eph_st =3D SMC_GET_EPH_STATUS(lp);
           ^
   drivers/net/ethernet/smsc/smc91x.c:1337:2: note: Value stored to 'eph_st=
' is never read
   drivers/net/ethernet/smsc/smc91x.c:1338:2: warning: Value stored to 'mem=
info' is never read [clang-analyzer-deadcode.DeadStores]
           meminfo =3D SMC_GET_MIR(lp);
           ^
   drivers/net/ethernet/smsc/smc91x.c:1338:2: note: Value stored to 'meminf=
o' is never read
   Suppressed 18 warnings (17 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
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
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
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
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
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
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:242:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5796:6: note: Assuming=
 the condition is false
           if (!netif_running(dev))
               ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5796:2: note: Taking f=
alse branch
           if (!netif_running(dev))
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5799:2: note: Control =
jumps to 'case 35248:'  at line 5805
           switch (cmd) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5806:9: note: Calling =
'stmmac_hwtstamp_set'
                   ret =3D stmmac_hwtstamp_set(dev, rq);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:621:2: note: 'sec_inc'=
 initialized to 0
           u32 sec_inc =3D 0;
           ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:625:9: note: Assuming =
field 'has_gmac4' is 0
           xmac =3D priv->plat->has_gmac4 || priv->plat->has_xgmac;
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:625:9: note: Left side=
 of '||' is false
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:8: note: Assuming =
field 'time_stamp' is 0
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:8: note: Left side=
 of '||' is false
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:6: note: Assuming =
the condition is false
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:2: note: Taking fa=
lse branch
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:635:6: note: Calling '=
copy_from_user'
           if (copy_from_user(&config, ifr->ifr_data,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6599231971816488392==--

