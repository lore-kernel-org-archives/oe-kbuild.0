Content-Type: multipart/mixed; boundary="===============0038505846505657429=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pinchartl-media:rpi/next/bcm2835-isp 44/49] drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1767:21: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 16 Jan 2022 11:37:53 +0800
Message-ID: <202201160725.nBqyGa4k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0038505846505657429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Phil Elwell <phil@raspberrypi.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   git://linuxtv.org/pinchartl/media.git rpi/next/bcm2835-isp
head:   97975aa0732da0e2084ed69d140656c2162bec05
commit: 7f222c74f2582ba9fbed520c29d6b105be4858b1 [44/49] staging: vchiq_arm=
: Give vchiq children DT nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220112 (https://download.01.org/0day-ci/archi=
ve/20220116/202201160725.nBqyGa4k-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media rpi/next/bcm2835-isp
        git checkout 7f222c74f2582ba9fbed520c29d6b105be4858b1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:3: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
     ^
   drivers/mmc/host/omap_hsmmc.c:821:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&host->irq_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:262:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/mmc/host/omap_hsmmc.c:821:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&host->irq_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/omap_hsmmc.c:828:6: note: Assuming field 'data' is null
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
               ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:828:16: note: Left side of '&&' is false
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
                         ^
   drivers/mmc/host/omap_hsmmc.c:830:2: note: Null pointer value stored to =
field 'mrq'
           host->mrq =3D NULL;
           ^~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:864:3: note: Returning from 'omap_hsmmc_re=
quest_done'
                   omap_hsmmc_request_done(host, data->mrq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1060:3: note: Returning from 'omap_hsmmc_x=
fer_done'
                   omap_hsmmc_xfer_done(host, data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1074:4: note: Returning from 'omap_hsmmc_d=
o_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1076:7: note: Assuming the condition is fa=
lse
                   if (status & CIRQ_EN)
                       ^~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1076:3: note: Taking false branch
                   if (status & CIRQ_EN)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1072:2: note: Loop condition is true.  Ent=
ering loop body
           while (status & (INT_EN_MASK | CIRQ_EN)) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1073:7: note: Assuming field 'req_in_progr=
ess' is not equal to 0
                   if (host->req_in_progress)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1073:3: note: Taking true branch
                   if (host->req_in_progress)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1074:4: note: Calling 'omap_hsmmc_do_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1023:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "IRQ Status is %x\n", status);
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/omap_hsmmc.c:1025:6: note: Assuming the condition is fa=
lse
           if (status & ERR_EN) {
               ^~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1025:2: note: Taking false branch
           if (status & ERR_EN) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1057:6: note: 'end_cmd' is 0
           if (end_cmd || ((status & CC_EN) && host->cmd))
               ^~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:6: note: Left side of '||' is false
   drivers/mmc/host/omap_hsmmc.c:1057:19: note: Assuming the condition is t=
rue
           if (end_cmd || ((status & CC_EN) && host->cmd))
                            ^~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:18: note: Left side of '&&' is true
           if (end_cmd || ((status & CC_EN) && host->cmd))
                           ^
   drivers/mmc/host/omap_hsmmc.c:1057:38: note: Assuming field 'cmd' is non=
-null
           if (end_cmd || ((status & CC_EN) && host->cmd))
                                               ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1057:2: note: Taking true branch
           if (end_cmd || ((status & CC_EN) && host->cmd))
           ^
   drivers/mmc/host/omap_hsmmc.c:1058:3: note: Calling 'omap_hsmmc_cmd_done'
                   omap_hsmmc_cmd_done(host, host->cmd);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:873:6: note: Access to field 'sbc' results=
 in a dereference of a null pointer (loaded from field 'mrq')
           if (host->mrq->sbc && (host->cmd =3D=3D host->mrq->sbc) &&
               ^     ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1767:21: w=
arning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           child->dev.of_node =3D np;
           ~~~~~~~~~~~~~~~~~~~^~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1753:22: n=
ote: 32 is not equal to 64
           pdevinfo.dma_mask =3D DMA_BIT_MASK(32);
                               ^
   include/linux/dma-mapping.h:76:27: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                             ^~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1753:22: n=
ote: '?' condition is false
           pdevinfo.dma_mask =3D DMA_BIT_MASK(32);
                               ^
   include/linux/dma-mapping.h:76:26: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                            ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1758:6: no=
te: Assuming 'np' is null
           if (np && !of_device_is_available(np))
               ^~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1758:9: no=
te: Left side of '&&' is false
           if (np && !of_device_is_available(np))
                  ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1762:6: no=
te: Calling 'IS_ERR'
           if (IS_ERR(child)) {
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1762:6: no=
te: Returning from 'IS_ERR'
           if (IS_ERR(child)) {
               ^~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1762:2: no=
te: Taking true branch
           if (IS_ERR(child)) {
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1763:3: no=
te: Loop condition is false.  Exiting loop
                   dev_warn(&pdev->dev, "%s not registered\n", name);
                   ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1764:3: no=
te: Null pointer value stored to 'child'
                   child =3D NULL;
                   ^~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1767:21: n=
ote: Dereference of null pointer
           child->dev.of_node =3D np;
           ~~~~~~~~~~~~~~~~~~~^~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/sof/sof-audio.c:874:29: warning: Value stored to 'desc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct sof_dev_desc *desc =3D sof_pdata->desc;
                                      ^~~~   ~~~~~~~~~~~~~~~
   sound/soc/sof/sof-audio.c:874:29: note: Value stored to 'desc' during it=
s initialization is never read
           const struct sof_dev_desc *desc =3D sof_pdata->desc;
                                      ^~~~   ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +1767 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c

c683db8860a805 Phil Elwell    2018-09-17  1740  =

405e2f98637d79 Stefan Wahren  2018-12-06  1741  static struct platform_devi=
ce *
405e2f98637d79 Stefan Wahren  2018-12-06  1742  vchiq_register_child(struct=
 platform_device *pdev, const char *name)
405e2f98637d79 Stefan Wahren  2018-12-06  1743  {
405e2f98637d79 Stefan Wahren  2018-12-06  1744  	struct platform_device_inf=
o pdevinfo;
405e2f98637d79 Stefan Wahren  2018-12-06  1745  	struct platform_device *ch=
ild;
4de7edc5cd612d Dave Stevenson 2019-06-18  1746  	struct device_node *np;
405e2f98637d79 Stefan Wahren  2018-12-06  1747  =

405e2f98637d79 Stefan Wahren  2018-12-06  1748  	memset(&pdevinfo, 0, sizeo=
f(pdevinfo));
405e2f98637d79 Stefan Wahren  2018-12-06  1749  =

405e2f98637d79 Stefan Wahren  2018-12-06  1750  	pdevinfo.parent =3D &pdev-=
>dev;
405e2f98637d79 Stefan Wahren  2018-12-06  1751  	pdevinfo.name =3D name;
405e2f98637d79 Stefan Wahren  2018-12-06  1752  	pdevinfo.id =3D PLATFORM_D=
EVID_NONE;
405e2f98637d79 Stefan Wahren  2018-12-06  1753  	pdevinfo.dma_mask =3D DMA_=
BIT_MASK(32);
405e2f98637d79 Stefan Wahren  2018-12-06  1754  =

7f222c74f2582b Phil Elwell    2020-02-03  1755  	np =3D of_get_child_by_nam=
e(pdev->dev.of_node, name);
7f222c74f2582b Phil Elwell    2020-02-03  1756  =

7f222c74f2582b Phil Elwell    2020-02-03  1757  	/* Skip the child if it is=
 explicitly disabled */
7f222c74f2582b Phil Elwell    2020-02-03  1758  	if (np && !of_device_is_av=
ailable(np))
7f222c74f2582b Phil Elwell    2020-02-03  1759  		return NULL;
7f222c74f2582b Phil Elwell    2020-02-03  1760  =

405e2f98637d79 Stefan Wahren  2018-12-06  1761  	child =3D platform_device_=
register_full(&pdevinfo);
405e2f98637d79 Stefan Wahren  2018-12-06  1762  	if (IS_ERR(child)) {
405e2f98637d79 Stefan Wahren  2018-12-06  1763  		dev_warn(&pdev->dev, "%s =
not registered\n", name);
405e2f98637d79 Stefan Wahren  2018-12-06  1764  		child =3D NULL;
405e2f98637d79 Stefan Wahren  2018-12-06  1765  	}
405e2f98637d79 Stefan Wahren  2018-12-06  1766  =

7f222c74f2582b Phil Elwell    2020-02-03 @1767  	child->dev.of_node =3D np;
7f222c74f2582b Phil Elwell    2020-02-03  1768  =

b55340554c4e9e Dave Stevenson 2019-01-29  1769  	/*
4de7edc5cd612d Dave Stevenson 2019-06-18  1770  	 * We want the dma-ranges =
etc to be copied from a device with the
4de7edc5cd612d Dave Stevenson 2019-06-18  1771  	 * correct dma-ranges for =
the VPU.
4de7edc5cd612d Dave Stevenson 2019-06-18  1772  	 * VCHIQ on Pi4 is now und=
er scb which doesn't get those dma-ranges.
4de7edc5cd612d Dave Stevenson 2019-06-18  1773  	 * Take the "dma" node as =
going to be suitable as it sees the world
4de7edc5cd612d Dave Stevenson 2019-06-18  1774  	 * through the same eyes a=
s the VPU.
b55340554c4e9e Dave Stevenson 2019-01-29  1775  	 */
4de7edc5cd612d Dave Stevenson 2019-06-18  1776  	np =3D of_find_node_by_pat=
h("dma");
4de7edc5cd612d Dave Stevenson 2019-06-18  1777  	if (!np)
4de7edc5cd612d Dave Stevenson 2019-06-18  1778  		np =3D pdev->dev.of_node;
4de7edc5cd612d Dave Stevenson 2019-06-18  1779  =

4de7edc5cd612d Dave Stevenson 2019-06-18  1780  	of_dma_configure(&child->d=
ev, np, true);
4de7edc5cd612d Dave Stevenson 2019-06-18  1781  =

4de7edc5cd612d Dave Stevenson 2019-06-18  1782  	if (np !=3D pdev->dev.of_n=
ode)
4de7edc5cd612d Dave Stevenson 2019-06-18  1783  		of_node_put(np);
b55340554c4e9e Dave Stevenson 2019-01-29  1784  =

405e2f98637d79 Stefan Wahren  2018-12-06  1785  	return child;
405e2f98637d79 Stefan Wahren  2018-12-06  1786  }
405e2f98637d79 Stefan Wahren  2018-12-06  1787  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0038505846505657429==--

