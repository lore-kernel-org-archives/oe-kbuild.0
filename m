Content-Type: multipart/mixed; boundary="===============7672947424871527974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/wm8904.c:1633:16: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Wed, 01 Sep 2021 05:13:44 +0800
Message-ID: <202109010536.ldNiap4C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7672947424871527974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0ee7c3e25d8c28845fceb4dd1c3cb5f50b9c45a9
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-c003-20210830 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b1fde=
8a2b681dad2ce0c082a5d6422caa06b0bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2f78788b55baa3410b1ec91a576286abe1ad4d6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f78788b55baa3410b1ec91a576286abe1ad4d6a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/usb/host/fotg210-hcd.c:1861:6: note: Assuming field 'hw' is non-=
null
           if (!qh->hw)
               ^~~~~~~
   drivers/usb/host/fotg210-hcd.c:1861:2: note: Taking false branch
           if (!qh->hw)
           ^
   drivers/usb/host/fotg210-hcd.c:1868:6: note: Assuming field 'dummy' is n=
ot equal to NULL
           if (qh->dummy =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:1868:2: note: Taking false branch
           if (qh->dummy =3D=3D NULL) {
           ^
   drivers/usb/host/fotg210-hcd.c:2715:26: note: Returning from 'fotg210_qh=
_alloc'
           struct fotg210_qh *qh =3D fotg210_qh_alloc(fotg210, flags);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:2722:7: note: 'qh' is non-null
           if (!qh)
                ^~
   drivers/usb/host/fotg210-hcd.c:2722:2: note: Taking false branch
           if (!qh)
           ^
   drivers/usb/host/fotg210-hcd.c:2733:44: note: Assuming 'is_input' is not=
 equal to 0
           maxp =3D usb_maxpacket(urb->dev, urb->pipe, !is_input);
                                                     ^~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:2738:6: note: Assuming the condition is t=
rue
           if (max_packet(maxp) > 1024) {
               ^
   drivers/usb/host/fotg210-hcd.c:2515:36: note: expanded from macro 'max_p=
acket'
   #define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
                                      ^
   drivers/usb/host/fotg210-hcd.c:2738:2: note: Taking true branch
           if (max_packet(maxp) > 1024) {
           ^
   drivers/usb/host/fotg210-hcd.c:2739:3: note: Taking false branch
                   fotg210_dbg(fotg210, "bogus qh maxpacket %d\n",
                   ^
   drivers/usb/host/fotg210-hcd.c:83:2: note: expanded from macro 'fotg210_=
dbg'
           dev_dbg(fotg210_to_hcd(fotg210)->self.controller, fmt, ## args)
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/usb/host/fotg210-hcd.c:2741:3: note: Control jumps to line 2866
                   goto done;
                   ^
   drivers/usb/host/fotg210-hcd.c:2866:3: note: Calling 'qh_destroy'
                   qh_destroy(fotg210, qh);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:1841:6: note: Left side of '||' is false
           if (!list_empty(&qh->qtd_list) || qh->qh_next.ptr) {
               ^
   drivers/usb/host/fotg210-hcd.c:1841:36: note: Branch condition evaluates=
 to a garbage value
           if (!list_empty(&qh->qtd_list) || qh->qh_next.ptr) {
                                             ^~~~~~~~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:2120:22: warning: Value stored to 'tt' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct usb_device *tt =3D urb->dev->tt->hub;
                                      ^~   ~~~~~~~~~~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:2120:22: note: Value stored to 'tt' durin=
g its initialization is never read
                   struct usb_device *tt =3D urb->dev->tt->hub;
                                      ^~   ~~~~~~~~~~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:4488:2: warning: Value stored to 'dev' is=
 never read [clang-analyzer-deadcode.DeadStores]
           dev =3D urb->dev;
           ^     ~~~~~~~~
   drivers/usb/host/fotg210-hcd.c:4488:2: note: Value stored to 'dev' is ne=
ver read
           dev =3D urb->dev;
           ^     ~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   sound/soc/codecs/wm8903.c:434:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:434:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:1552:2: warning: Value stored to 'best_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           best_val =3D ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8903.c:1552:2: note: Value stored to 'best_val' is ne=
ver read
           best_val =3D ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8903.c:1559:3: warning: Value stored to 'best_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_val =3D cur_val;
                   ^          ~~~~~~~
   sound/soc/codecs/wm8903.c:1559:3: note: Value stored to 'best_val' is ne=
ver read
                   best_val =3D cur_val;
                   ^          ~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> sound/soc/codecs/wm8904.c:1633:16: warning: Division by zero [clang-anal=
yzer-core.DivideZero]
           Ndiv =3D target / Fref;
                         ^
   sound/soc/codecs/wm8904.c:1807:2: note: Control jumps to 'case 0:'  at l=
ine 1808
           switch (clk_id) {
           ^
   sound/soc/codecs/wm8904.c:1812:7: note: Assuming 'freq' is not equal to 0
                   if (!freq)
                       ^~~~~
   sound/soc/codecs/wm8904.c:1812:3: note: Taking false branch
                   if (!freq)
                   ^
   sound/soc/codecs/wm8904.c:1817:7: note: 'mclk_freq' is not equal to 'fre=
q'
                   if (mclk_freq !=3D freq) {
                       ^~~~~~~~~
   sound/soc/codecs/wm8904.c:1817:3: note: Taking true branch
                   if (mclk_freq !=3D freq) {
                   ^
   sound/soc/codecs/wm8904.c:1819:10: note: Calling 'wm8904_set_fll'
                           ret =3D wm8904_set_fll(dai, WM8904_FLL_MCLK,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8904.c:1670:6: note: Assuming 'source' is not equal t=
o field 'fll_src'
           if (source =3D=3D wm8904->fll_src && Fref =3D=3D wm8904->fll_fre=
f &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8904.c:1670:32: note: Left side of '&&' is false
           if (source =3D=3D wm8904->fll_src && Fref =3D=3D wm8904->fll_fre=
f &&
                                         ^
   sound/soc/codecs/wm8904.c:1676:6: note: 'Fout' is not equal to 0
           if (Fout =3D=3D 0) {
               ^~~~
   sound/soc/codecs/wm8904.c:1676:2: note: Taking false branch
           if (Fout =3D=3D 0) {
           ^
   sound/soc/codecs/wm8904.c:1693:2: note: Control jumps to 'case 1:'  at l=
ine 1694
           switch (source) {
           ^
   sound/soc/codecs/wm8904.c:1697:9: note: Calling 'fll_factors'
                   ret =3D fll_factors(&fll_div, Fref, Fout);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8904.c:1586:2: note: The value 1 is assigned to 'div'
           div =3D 1;
           ^~~~~~~
   sound/soc/codecs/wm8904.c:1588:2: note: Loop condition is false. Executi=
on continues on line 1599
           while ((Fref / div) > 13500000) {
           ^
   sound/soc/codecs/wm8904.c:1599:2: note: Taking false branch
           pr_debug("Fref=3D%u Fout=3D%u\n", Fref, Fout);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   sound/soc/codecs/wm8904.c:1602:2: note: The value 0 is assigned to 'Fref'
           Fref /=3D div;
           ^~~~~~~~~~~
   sound/soc/codecs/wm8904.c:1606:9: note: Assuming the condition is false
           while (Fout * div < 90000000) {
                  ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8904.c:1606:2: note: Loop condition is false. Executi=
on continues on line 1614
           while (Fout * div < 90000000) {
           ^
   sound/soc/codecs/wm8904.c:1617:2: note: Taking false branch
           pr_debug("Fvco=3D%dHz\n", target);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   sound/soc/codecs/wm8904.c:1620:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < ARRAY_SIZE(fll_fratios); i++) {
           ^
   sound/soc/codecs/wm8904.c:1621:7: note: Assuming 'Fref' is >=3D field 'm=
in'
                   if (fll_fratios[i].min <=3D Fref && Fref <=3D fll_fratio=
s[i].max) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8904.c:1621:7: note: Left side of '&&' is true
   sound/soc/codecs/wm8904.c:1621:37: note: 'Fref' is <=3D field 'max'
                   if (fll_fratios[i].min <=3D Fref && Fref <=3D fll_fratio=
s[i].max) {
                                                     ^~~~
   sound/soc/codecs/wm8904.c:1621:3: note: Taking true branch
                   if (fll_fratios[i].min <=3D Fref && Fref <=3D fll_fratio=
s[i].max) {
                   ^
   sound/soc/codecs/wm8904.c:1624:4: note:  Execution continues on line 1627
                           break;
                           ^
   sound/soc/codecs/wm8904.c:1627:2: note: Taking false branch
           if (i =3D=3D ARRAY_SIZE(fll_fratios)) {
           ^
   sound/soc/codecs/wm8904.c:1633:16: note: Division by zero
           Ndiv =3D target / Fref;
                  ~~~~~~~^~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
--
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/omap_hsmmc.c:833:6: note: Assuming field 'data' is null
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
               ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:833:16: note: Left side of '&&' is false
           if (mrq->data && host->use_dma && dma_ch !=3D -1)
                         ^
   drivers/mmc/host/omap_hsmmc.c:835:2: note: Null pointer value stored to =
field 'mrq'
           host->mrq =3D NULL;
           ^~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:869:3: note: Returning from 'omap_hsmmc_re=
quest_done'
                   omap_hsmmc_request_done(host, data->mrq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1065:3: note: Returning from 'omap_hsmmc_x=
fer_done'
                   omap_hsmmc_xfer_done(host, data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1079:4: note: Returning from 'omap_hsmmc_d=
o_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1081:7: note: Assuming the condition is fa=
lse
                   if (status & CIRQ_EN)
                       ^~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1081:3: note: Taking false branch
                   if (status & CIRQ_EN)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1077:2: note: Loop condition is true.  Ent=
ering loop body
           while (status & (INT_EN_MASK | CIRQ_EN)) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1078:7: note: Assuming field 'req_in_progr=
ess' is not equal to 0
                   if (host->req_in_progress)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1078:3: note: Taking true branch
                   if (host->req_in_progress)
                   ^
   drivers/mmc/host/omap_hsmmc.c:1079:4: note: Calling 'omap_hsmmc_do_irq'
                           omap_hsmmc_do_irq(host, status);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1028:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "IRQ Status is %x\n", status);
           ^
   include/linux/dev_printk.h:229:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/omap_hsmmc.c:1030:6: note: Assuming the condition is tr=
ue
           if (status & ERR_EN) {
               ^~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1030:2: note: Taking true branch
           if (status & ERR_EN) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1031:3: note: Calling 'omap_hsmmc_dbg_repo=
rt_irq'
                   omap_hsmmc_dbg_report_irq(host, status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:965:1: note: Returning without writing to =
'host->mrq'
   }
   ^
   drivers/mmc/host/omap_hsmmc.c:1031:3: note: Returning from 'omap_hsmmc_d=
bg_report_irq'
                   omap_hsmmc_dbg_report_irq(host, status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1033:7: note: Assuming the condition is fa=
lse
                   if (status & (CTO_EN | CCRC_EN | CEB_EN))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1033:3: note: Taking false branch
                   if (status & (CTO_EN | CCRC_EN | CEB_EN))
                   ^
   drivers/mmc/host/omap_hsmmc.c:1035:7: note: Assuming field 'data' is null
                   if (host->data || host->response_busy) {
                       ^~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1035:7: note: Left side of '||' is false
   drivers/mmc/host/omap_hsmmc.c:1035:21: note: Assuming field 'response_bu=
sy' is 0
                   if (host->data || host->response_busy) {
                                     ^~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1035:3: note: Taking false branch
                   if (host->data || host->response_busy) {
                   ^
   drivers/mmc/host/omap_hsmmc.c:1039:7: note: Assuming the condition is fa=
lse
                   if (status & (CTO_EN | DTO_EN))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1039:3: note: Taking false branch
                   if (status & (CTO_EN | DTO_EN))
                   ^
   drivers/mmc/host/omap_hsmmc.c:1041:12: note: Assuming the condition is f=
alse
                   else if (status & (CCRC_EN | DCRC_EN | DEB_EN | CEB_EN |
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1041:8: note: Taking false branch
                   else if (status & (CCRC_EN | DCRC_EN | DEB_EN | CEB_EN |
                        ^
   drivers/mmc/host/omap_hsmmc.c:1045:7: note: Assuming the condition is tr=
ue
                   if (status & ACE_EN) {
                       ^~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1045:3: note: Taking true branch
                   if (status & ACE_EN) {
                   ^
   drivers/mmc/host/omap_hsmmc.c:1048:8: note: Assuming the condition is tr=
ue
                           if (!(ac12 & ACNE) && host->mrq->sbc) {
                               ^~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1048:8: note: Left side of '&&' is true
   drivers/mmc/host/omap_hsmmc.c:1048:26: note: Access to field 'sbc' resul=
ts in a dereference of a null pointer (loaded from field 'mrq')
                           if (!(ac12 & ACNE) && host->mrq->sbc) {
                                                 ^     ~~~
>> drivers/mmc/host/omap_hsmmc.c:1312:24: warning: Division by zero [clang-=
analyzer-core.DivideZero]
           cycle_ns =3D 1000000000 / (host->clk_rate / clkd);
                                 ^
   drivers/mmc/host/omap_hsmmc.c:1431:2: note: Assuming field 'req_in_progr=
ess' is 0
           BUG_ON(host->req_in_progress);
           ^
   include/asm-generic/bug.h:183:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/mmc/host/omap_hsmmc.c:1431:2: note: Taking false branch
           BUG_ON(host->req_in_progress);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/mmc/host/omap_hsmmc.c:1431:2: note: Loop condition is false.  Ex=
iting loop
           BUG_ON(host->req_in_progress);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/mmc/host/omap_hsmmc.c:1432:9: note: Assuming the condition is fa=
lse
           BUG_ON(host->dma_ch !=3D -1);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mmc/host/omap_hsmmc.c:1432:2: note: Taking false branch
           BUG_ON(host->dma_ch !=3D -1);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/mmc/host/omap_hsmmc.c:1432:2: note: Loop condition is false.  Ex=
iting loop
           BUG_ON(host->dma_ch !=3D -1);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/mmc/host/omap_hsmmc.c:1433:6: note: Assuming field 'reqs_blocked=
' is 0
           if (host->reqs_blocked)
               ^~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1433:2: note: Taking false branch
           if (host->reqs_blocked)
           ^
   drivers/mmc/host/omap_hsmmc.c:1435:10: note: Assuming field 'mrq' is equ=
al to null
           WARN_ON(host->mrq !=3D NULL);
                   ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1437:19: note: Calling 'clk_get_rate'
           host->clk_rate =3D clk_get_rate(host->fclk);
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:842:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1437:19: note: Returning from 'clk_get_rat=
e'
           host->clk_rate =3D clk_get_rate(host->fclk);
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1437:2: note: The value 0 is assigned to f=
ield 'clk_rate'
           host->clk_rate =3D clk_get_rate(host->fclk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1438:8: note: Calling 'omap_hsmmc_prepare_=
data'
           err =3D omap_hsmmc_prepare_data(host, req);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1363:6: note: Assuming field 'data' is equ=
al to NULL
           if (req->data =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1363:2: note: Taking true branch
           if (req->data =3D=3D NULL) {
           ^
   drivers/mmc/host/omap_hsmmc.c:1365:7: note: Assuming the condition is tr=
ue
                   if (req->cmd->flags & MMC_RSP_BUSY) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1365:3: note: Taking true branch
                   if (req->cmd->flags & MMC_RSP_BUSY) {
                   ^
   drivers/mmc/host/omap_hsmmc.c:1372:8: note: Assuming 'timeout' is not eq=
ual to 0
                           if (!timeout)
                               ^~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1372:4: note: Taking false branch
                           if (!timeout)
                           ^
   drivers/mmc/host/omap_hsmmc.c:1375:4: note: Calling 'set_data_timeout'
                           set_data_timeout(host, timeout, 0);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1309:6: note: Assuming 'clkd' is not equal=
 to 0
           if (clkd =3D=3D 0)
               ^~~~~~~~~
   drivers/mmc/host/omap_hsmmc.c:1309:2: note: Taking false branch
           if (clkd =3D=3D 0)
           ^
   drivers/mmc/host/omap_hsmmc.c:1312:24: note: Division by zero
           cycle_ns =3D 1000000000 / (host->clk_rate / clkd);

vim +1633 sound/soc/codecs/wm8904.c

a91eb199e4dc8a Mark Brown      2009-11-26  1576  =

a91eb199e4dc8a Mark Brown      2009-11-26  1577  static int fll_factors(str=
uct _fll_div *fll_div, unsigned int Fref,
a91eb199e4dc8a Mark Brown      2009-11-26  1578  		       unsigned int Fout)
a91eb199e4dc8a Mark Brown      2009-11-26  1579  {
a91eb199e4dc8a Mark Brown      2009-11-26  1580  	u64 Kpart;
a91eb199e4dc8a Mark Brown      2009-11-26  1581  	unsigned int K, Ndiv, Nmo=
d, target;
a91eb199e4dc8a Mark Brown      2009-11-26  1582  	unsigned int div;
a91eb199e4dc8a Mark Brown      2009-11-26  1583  	int i;
a91eb199e4dc8a Mark Brown      2009-11-26  1584  =

a91eb199e4dc8a Mark Brown      2009-11-26  1585  	/* Fref must be <=3D13.5M=
Hz */
a91eb199e4dc8a Mark Brown      2009-11-26  1586  	div =3D 1;
a91eb199e4dc8a Mark Brown      2009-11-26  1587  	fll_div->fll_clk_ref_div =
=3D 0;
a91eb199e4dc8a Mark Brown      2009-11-26  1588  	while ((Fref / div) > 135=
00000) {
a91eb199e4dc8a Mark Brown      2009-11-26  1589  		div *=3D 2;
a91eb199e4dc8a Mark Brown      2009-11-26  1590  		fll_div->fll_clk_ref_div=
++;
a91eb199e4dc8a Mark Brown      2009-11-26  1591  =

a91eb199e4dc8a Mark Brown      2009-11-26  1592  		if (div > 8) {
a91eb199e4dc8a Mark Brown      2009-11-26  1593  			pr_err("Can't scale %dM=
Hz input down to <=3D13.5MHz\n",
a91eb199e4dc8a Mark Brown      2009-11-26  1594  			       Fref);
a91eb199e4dc8a Mark Brown      2009-11-26  1595  			return -EINVAL;
a91eb199e4dc8a Mark Brown      2009-11-26  1596  		}
a91eb199e4dc8a Mark Brown      2009-11-26  1597  	}
a91eb199e4dc8a Mark Brown      2009-11-26  1598  =

a91eb199e4dc8a Mark Brown      2009-11-26  1599  	pr_debug("Fref=3D%u Fout=
=3D%u\n", Fref, Fout);
a91eb199e4dc8a Mark Brown      2009-11-26  1600  =

a91eb199e4dc8a Mark Brown      2009-11-26  1601  	/* Apply the division for=
 our remaining calculations */
a91eb199e4dc8a Mark Brown      2009-11-26  1602  	Fref /=3D div;
a91eb199e4dc8a Mark Brown      2009-11-26  1603  =

a91eb199e4dc8a Mark Brown      2009-11-26  1604  	/* Fvco should be 90-100M=
Hz; don't check the upper bound */
a91eb199e4dc8a Mark Brown      2009-11-26  1605  	div =3D 4;
a91eb199e4dc8a Mark Brown      2009-11-26  1606  	while (Fout * div < 90000=
000) {
a91eb199e4dc8a Mark Brown      2009-11-26  1607  		div++;
a91eb199e4dc8a Mark Brown      2009-11-26  1608  		if (div > 64) {
a91eb199e4dc8a Mark Brown      2009-11-26  1609  			pr_err("Unable to find =
FLL_OUTDIV for Fout=3D%uHz\n",
a91eb199e4dc8a Mark Brown      2009-11-26  1610  			       Fout);
a91eb199e4dc8a Mark Brown      2009-11-26  1611  			return -EINVAL;
a91eb199e4dc8a Mark Brown      2009-11-26  1612  		}
a91eb199e4dc8a Mark Brown      2009-11-26  1613  	}
a91eb199e4dc8a Mark Brown      2009-11-26  1614  	target =3D Fout * div;
a91eb199e4dc8a Mark Brown      2009-11-26  1615  	fll_div->fll_outdiv =3D d=
iv - 1;
a91eb199e4dc8a Mark Brown      2009-11-26  1616  =

a91eb199e4dc8a Mark Brown      2009-11-26  1617  	pr_debug("Fvco=3D%dHz\n",=
 target);
a91eb199e4dc8a Mark Brown      2009-11-26  1618  =

25985edcedea63 Lucas De Marchi 2011-03-30  1619  	/* Find an appropriate FL=
L_FRATIO and factor it out of the target */
a91eb199e4dc8a Mark Brown      2009-11-26  1620  	for (i =3D 0; i < ARRAY_S=
IZE(fll_fratios); i++) {
a91eb199e4dc8a Mark Brown      2009-11-26  1621  		if (fll_fratios[i].min <=
=3D Fref && Fref <=3D fll_fratios[i].max) {
a91eb199e4dc8a Mark Brown      2009-11-26  1622  			fll_div->fll_fratio =3D=
 fll_fratios[i].fll_fratio;
a91eb199e4dc8a Mark Brown      2009-11-26  1623  			target /=3D fll_fratios=
[i].ratio;
a91eb199e4dc8a Mark Brown      2009-11-26  1624  			break;
a91eb199e4dc8a Mark Brown      2009-11-26  1625  		}
a91eb199e4dc8a Mark Brown      2009-11-26  1626  	}
a91eb199e4dc8a Mark Brown      2009-11-26  1627  	if (i =3D=3D ARRAY_SIZE(f=
ll_fratios)) {
a91eb199e4dc8a Mark Brown      2009-11-26  1628  		pr_err("Unable to find F=
LL_FRATIO for Fref=3D%uHz\n", Fref);
a91eb199e4dc8a Mark Brown      2009-11-26  1629  		return -EINVAL;
a91eb199e4dc8a Mark Brown      2009-11-26  1630  	}
a91eb199e4dc8a Mark Brown      2009-11-26  1631  =

a91eb199e4dc8a Mark Brown      2009-11-26  1632  	/* Now, calculate N.K */
a91eb199e4dc8a Mark Brown      2009-11-26 @1633  	Ndiv =3D target / Fref;
a91eb199e4dc8a Mark Brown      2009-11-26  1634  =

a91eb199e4dc8a Mark Brown      2009-11-26  1635  	fll_div->n =3D Ndiv;
a91eb199e4dc8a Mark Brown      2009-11-26  1636  	Nmod =3D target % Fref;
a91eb199e4dc8a Mark Brown      2009-11-26  1637  	pr_debug("Nmod=3D%d\n", N=
mod);
a91eb199e4dc8a Mark Brown      2009-11-26  1638  =

a91eb199e4dc8a Mark Brown      2009-11-26  1639  	/* Calculate fractional p=
art - scale up so we can round. */
a91eb199e4dc8a Mark Brown      2009-11-26  1640  	Kpart =3D FIXED_FLL_SIZE =
* (long long)Nmod;
a91eb199e4dc8a Mark Brown      2009-11-26  1641  =

a91eb199e4dc8a Mark Brown      2009-11-26  1642  	do_div(Kpart, Fref);
a91eb199e4dc8a Mark Brown      2009-11-26  1643  =

a91eb199e4dc8a Mark Brown      2009-11-26  1644  	K =3D Kpart & 0xFFFFFFFF;
a91eb199e4dc8a Mark Brown      2009-11-26  1645  =

a91eb199e4dc8a Mark Brown      2009-11-26  1646  	if ((K % 10) >=3D 5)
a91eb199e4dc8a Mark Brown      2009-11-26  1647  		K +=3D 5;
a91eb199e4dc8a Mark Brown      2009-11-26  1648  =

a91eb199e4dc8a Mark Brown      2009-11-26  1649  	/* Move down to proper ra=
nge now rounding is done */
a91eb199e4dc8a Mark Brown      2009-11-26  1650  	fll_div->k =3D K / 10;
a91eb199e4dc8a Mark Brown      2009-11-26  1651  =

a91eb199e4dc8a Mark Brown      2009-11-26  1652  	pr_debug("N=3D%x K=3D%x F=
LL_FRATIO=3D%x FLL_OUTDIV=3D%x FLL_CLK_REF_DIV=3D%x\n",
a91eb199e4dc8a Mark Brown      2009-11-26  1653  		 fll_div->n, fll_div->k,
a91eb199e4dc8a Mark Brown      2009-11-26  1654  		 fll_div->fll_fratio, fl=
l_div->fll_outdiv,
a91eb199e4dc8a Mark Brown      2009-11-26  1655  		 fll_div->fll_clk_ref_di=
v);
a91eb199e4dc8a Mark Brown      2009-11-26  1656  =

a91eb199e4dc8a Mark Brown      2009-11-26  1657  	return 0;
a91eb199e4dc8a Mark Brown      2009-11-26  1658  }
a91eb199e4dc8a Mark Brown      2009-11-26  1659  =


:::::: The code at line 1633 was first introduced by commit
:::::: a91eb199e4dc8a2ab3fb7a53f1a23ce82b29fc04 ASoC: Initial WM8904 CODEC =
driver

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7672947424871527974==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICA5GLmEAAy5jb25maWcAjDxLd9s2s/v+Cp1k02/RRvIjde49XoAkKCIiSBoAJdsbHkWWU906
lj9ZTpN/f2fAFwCCantOY3NmMMRj3hj6/S/vJ+TtuP+2Pu4266enn5Ov2+ftYX3cPkwed0/b/51E
+STL1YRGTP0OxOnu+e3Hh5f939vDy2Zy+fts+vt0stgenrdPk3D//Lj7+gajd/vnX97/EuZZzOZV
GFZLKiTLs0rRW3X9bvO0fv46+b49vALdZHbxO/L49evu+D8fPsC/33aHw/7w4enp+7fq5bD/v+3m
OLn4Mnt82F6tz758vJo9rB/ONtvpZnp1tr58+HhxdrZZr6cfv0y/bP7zrn3rvH/t9bQFptEQBnRM
VmFKsvn1T4MQgGka9SBN0Q2fXUzhv47cYGxjgHtCZEUkr+a5yg12NqLKS1WUyotnWcoy2qOYuKlW
uVj0kKBkaaQYp5UiQUormQuDlUoEJbCgLM7hHyCROBQO6P1krk/7afK6Pb699EcWiHxBswpOTPLC
eHHGVEWzZUUErJlxpq7Pz7oJ57xg8G5FpfHuNA9J2m7Nu3fWhCtJUmUAE7Kk1YKKjKbV/J4ZL/YC
IxqTMlV6VgaXFpzkUmWE0+t3vz7vn7e9ZMg7uWRFCIzeTxpQkUt2W/GbkpZ0snudPO+PuCXtiBVR
YVJprDkqFLmUFac8F3cVUYqEiWdwKWnKgn7apARV6h/1ookA/hoBk4MNSx3yHqpPDQRg8vr25fXn
63H7rT+1Oc2oYKGWD5nkq56Ji6lSuqSpHx8m5iYjJMo5YZkNk4z7iKqEUYGrubOxMZGK5qxHw7qz
KAW5cOhyEdKokVhmaqQsiJAUicwjMCce0aCcx9I8gveT7fPDZP/o7Ji7bK05y8HWt+gQhHgBG5Yp
6UHyXFZlERFF2+NRu29g23wnpFi4AK2icAamCNxXBfDKI2YJZZYjhsEu2Usy0R55S9g8qQSVelV6
f7tdGEysHVMISnmhgGdmSXgLX+ZpmSki7rwzaag8c2nHhzkMb7cnLMoPav361+QI05msYWqvx/Xx
dbLebPZvz8fd81dnw2BARULNoxaJ7s1LJpSDrjKi2NKnxSgj+qT9vArJvKLzL6bbmUCYCZN5CjPI
s3a5Iiwn0icK2V0FuF4M4KGityAJhmhIi0KPcUBgzKUe2gikBzUAlRH1wZUg4WlEpR0JD0yhstfX
7ydb1L/4TmKRAJ9aOPUeyc2f24e3p+1h8rhdH98O21cNbt7gwRpGeC7yspBewQwTGi6KnGUKFULl
wq9JEugiMLQq17z8NHcylmBiQKJDUPXISyRoSu486w3SBQxdak8ljJBCPxMOjGVeguFDL9Yzi7S/
878oqgLAnXneBaj0nhNTsgF067MUmtQISfTzhTPyXir/YoM8R8UeOWIIX/ICtI3dUzTqaODgBydZ
aLtQh0zCLz6bhk4SAoYIxS/MQXzB3pKKYgyStdrWMT1J6OEO9LkowCGBoxeGn0OHoFLQyZAWSoev
qAdG1FXE/UOnud00OEQhDLy/8AvUnCoO2lU1bsczr1rmBm4prl1nD6ijF8Pcd9YXJH/hP7xy7ocT
8LFxaU+nw8YlBPCeidIiNyco2TwjaRyZhgvmpgEdL+1P48i37ARCKiMAYrk5juVVCevyT59ESwYL
aLZMepgD64AIAWGIEV0i7R2XQ0hlbXwH1buEyo6expIH47S6SaEI6JDUu1od+mGk38+sQg4BCRfG
jHxk8i6D+AOsmqHCkt6YETKccwvrd54HNIqobzJaz1BVKzfcKcLZ9KI1102+V2wPj/vDt/XzZjuh
37fP4BQJWOwQ3SLEGbWzb4b3PL1O9l9yNDw/r9nVoQUIvt8BQE5CFKQzfi2QKQlGEGXgk8w0NwJ5
HA3HIea0zTkMXFLGMSRDBQEsnCZkQeB+LNOiKK+NE2RHLGbhwIwVIo9Z6oh6q1BoibRnswI8O53r
zq4Iz88szkX48cLkqo+qOOw329fX/QECxJeX/eFoHWARosVfnMvq448f/jAQSK4ubaSJ+vHDnMPF
1M/l4sIPp2fTqYfz1ccphl1mxAIHUgeFMN/Uh7h+B6PemXOrM8+SGokPgoeQhpAUznZq2MjCOS8h
sAbdTWxePbzSx9OiAKwtfw/KtKdNqNACD2kmNQ99eG7tuGUkc5O13hTcyyxixHB052eBmZLCxBzD
wzkpKpFB1AG5aMXJ7fXsj1MEkC3OZn6CViX/iZFFZ/HLBIby8vpy1tUeJOTeizpKlWVR2NUPDYYR
cUrmcojH5A7iuiGizfCSFYWUSlmHZ/h9ItK7xtUaJCRr8sq8VNezq64eVMeaOWeqiiH0AwuBSmx6
I53w681wrT8LqKiDGHT5kgVmEKBJmjVgQirygJr2e15XhnTiL6/PGpV/Wh/R4Boa380z521GbUhG
EV7d3sYksuIMhH68BaBXcRF7dTmGRUWgxdXVbTiKJuCsxNUfl14CdcNhRgNbhi8FSxQWfJK/YDkS
vVFf8dptWooe2xqUHz+qecFyU/uqUoeSBZaBbM8eQOQem2jvJNlZWMmC/Ws6ycPZPxID0RiNXiiu
bv3wHX3pQ1ff6zcWC4Fp4HXGvpEtzrOxPdMFeOV5CZmWN0YkBaQBRBBM2o1awCQ+bP/7tn3e/Jy8
btZPdfrfe3AwWbGgN2OpuWd0y5g9PG0nD4fd9+2hPXwcgGD3DcMii/GGeoABMRkbxqISKrTssqtc
Zuy0d+UOyzZW3JvcV7Pp1BQ3gJxdTr3CAKjz6SgK+Ph8Z3J/PZs6likRWHIxNJ6oBCLGMh2EJzZm
kDT4qZJVVWaMFynl4Mto5Ngvmmkj1ZRUk1wVaTn/JxoBvy1dSwjGXgFJQ20FXr2VTEqICNLAtHAs
TemcpK1ZrpYkLWl/WYD26GKhwzo71QL47GODGIkDdCwoExaDQ+g8V1Obb8DnXeSOgaEGOlFMj7ie
feoyQqyaojet7vOM5gLspeEvQx7p+4O+RE5vwSk2AZG0ig6g1ifC832n8YAK3l6HUhzLFCyi4R4R
kAaWXpgDNSfiWqk+m8N6QaRLBHlmbXiar/B4sV6gd8iX1vck19Mf59P6v95Dw2nkcSypu8UGBsZt
nHHNVQREHMIdaKI8I4vkTkKY3xNMHQKlywHtiuwiXLuMq3ZMt53O7nWxH1jZkqTs3ipGtgnC+rD5
c3fcbrCa9tvD9gV4QbblsUoY7+Z1JmIVbj6XvKggAaK+ndejaAxJDcOItcxgHvMMa2xhSKWb1UJ+
rO+DFLikQK6IEXJrRgwyXIwKYRbuvcnCDXNqqKDKj6iheK8VO7UcjY/LLNRmigqRQ5SZfaZhs3sm
mZ61Hp9ARjQMGCVsDXqURrk9STworGLxXVv2swl0NI4CWA2uiSSveB4112nu6gSF8JZA6Kyj4Wav
K1Iwl86qEfQpP473wbF+0fCMSu6ejp5yLw1WFlHNwfrD4Dr0BDdOvWgsLP8DSW07UQXsvVoRkC/M
BvR+ETitJVFgCvlg02GqGYfQisQULGJxGyauY1lRssCqDsXqDglvSib8r9O2HC+j2ntNz45IGmIG
cwJVgUrVgX8f0tWYMY3y3Ha4quK94jApQHyaWRQ0xLKDsd15VKagHaiPNI11gcvDn96idGb1LSBK
hUe+9XAQxZxbR9bvgZUvnko2DT/Wj86WkDqBWTJGhil4vgqLZisiIgOR4z0zm8sSFpxFAzhxFLxJ
O2sdxK30zX6JM2zXbpSkWuhYma/2Y+ABGk8hVreezZMKjIiyaXoRcZGnSorocSqVVxE3DhLzXbN2
5m6/lvGxkridZdb1RdRNXeLqnEyYL3/7sn4Fn/RXHTi8HPaPOze0R7JmIacWockaD1S1pdW23nXq
TW5R7B98XldCVRXHOrfpPXTBV3J8+8yIgGuF8UW9jSpBbAopNziJ0ioYBXgGvjXLbNa/FAJl3fiB
KWEGTzho7CSIAlULK8FXHoHKQFshQhYpKQq8IYWEWqBrkEXtAvWh0B/bzdtx/QVSG2z8meg67NEI
BQKWxVyhahvFjzS2688NkQwFK9QAzJm0brhxLLoUb8w5NqE6v99+2x9+Tvj6ef11+80bujQZgBGK
AgD2ItK5A0TLrnHGHgVIXwtnBxeUFrrqbu9/k3+Y172tihYp2I5CaUUDcy2vL5xBAaqLnU01oNr+
hCMXVT3SiVYFRTGwrD1nc0Fc2wYeYV61umoEimgkgtIKsBeSe2bQNtdoG81BLFGWri+mnz521RIK
cV6BlxjgqBbcOm5wrZkuX/rWZt9ZwmNtXvykw9IUAgmEW/K6KyjeF1YYfR+Uhv2/P4/z1LqRutcK
noeeN7aRXV3sawJSc6wO9/RRYFy48Bft64LfEmJK8yoA9gq3ChyHsg4AJFH3Up008IrWjpykHr3H
9LYwlrzAQ9MNWaYNHVel/kjNm41FgPkjzdoQVOtjtj3+vT/8BXZ3qIggsgtq3YzWkCpixH+NB5bP
59duowKTywW1N8oAj7MEO+rbSYBiJx1GXpyYHXWAgN0tsOtPSgjVLYweAs5VBwhwcLywVA8outjO
BXVJrbkCMFS+2yZlmKJAsGhuZWA1pOLC3yLQoMOYe9HLFHz71fRsduNFRzT0b1iaGqYDHozbBaJI
agVE2PIALieliPCd59mlwYsUxt1akeSW1DFKKc728sIHq7K0+UXfwjOsLZkaYVDWgmLXscIa5xeP
ui7WyvnN2/ZtC1L+oelJsZqVGuoqDG5sQUJgogIPMJbhEFoIq/zcQHU7gXWR22KE9y63xco48A2S
8c2JQYrepL5RKohPjAoDOZw3SL6XE8Fl+jvbGpL56YVFcqiyCIefptvvyIXwzYPfuPNwN2oRNAcy
GBsm+cLny1r8Tew9Lyza+xssWor4ZkjkMiELOlyk/4VJEp98XcFGWgwbPFg3DBhP80hHWkp6OfBF
yt3pdDfohvmoYw2voLbIImZxrkM3o0ba4Bre1+9eHneP++px/Xp819wDPK1fX3ePu43Tqo4jwtQR
YgBgAuA0ZzYIFbIssptiBjTxamThiCytC9oaoOsuQ2gj7gP+Qi59NQMT/dE3Lk7z1cmJB8WYtrfD
HR+n4Ryvo5weGMRR7t5TOQMhtLW5AaAq8pSFdAifW9RzTSryYEjImRDmRUMLlwSvIYbwjPhmQeum
bWtBmgtz0xeXYBHg2JFl6wkWrsQhFB30EGq1nBmvgIRzCGcx9U1ZlRnWDhbU16rYb69y9ga46Td5
hLBBnTCkDUWjLTZjFbZBpceegXZbNiH0N+xEmcQWzxw/NRhpbFOcYLqy9Mxw2UeVDkQHlB4w5GpF
4NZ/IJFieUfje49Ngfkcz+1ThoR/0b7UuEJPx41vJn06lUhDM2+Ecp4qySMHAmJhvlPDeMJGDlTc
YsJ4V9mdf8FN941CkxFMjtvXY1v4aTKOAcpBmFmEcY9JuCCRV8JCU1XgoRJkZQOC0M5EATT3WWVE
fJ59Ov9kD4csXwfjtfMg2STaft9ttpNIXwIbuQ4SLwfTWd4OQBAb2wDIykKseGIzrN2YjliiPs1G
phundMh+LgYgWWYXzOUb4r8jjMPwjz+mziQRBLtBfOAiJQp7fJ2tixn+NLtBEcyHh6ZBJhdrplw6
M7Ww8jMZueTW2Dy2iyMGsAqlebClBAODzYaP683WOdgrTGiAwOZDufQAZYTAM+dUPJSLJcH7lRpu
rzgMSKXn411UgdcVnmHlYJ/azoXh8uyRdTkXFgkO19+m6RH9TvXNch+2XNJIWBARo7mzMlggy+hI
+qqqhEW+sAYx0mEz8omMxkQ+SwwYLmNl+RyADapKAJM0jZtv2kzGMSWqFHRYpKovx5/etsf9/vjn
5KHergfXUgT44ZoyL8xwO0JuPd+ExHpOQhYo58wNsP6GobnpGNm5ltJ9U4fgajHGXShfQtJSyMhO
khp4yM+m5/74uKEoQHV95Z4GHXvXG6nUZxDbyZyHnqmkJQ2JGPmaQZMs4f8RaRHL1GGJoEr6PRKg
iUrOF9Yew9Z6NgmgJRG+AFELQM5rV923T4yJVs91xfAacyRhE/GCjfT3o2P/5NfHkDBvLhCb9Ys4
hNBlzqzaCwKzkNmAJLQ8EYJkEqXhQI+y7fowiXfbJ2wC//bt7blJ2Sa/wpj/NDtgdZprXsxf9EIc
FspnI61SiI+9RkePzC7Pz91pa+CIle7x7Cz0DTyrRk4eCRqJcyC2A+mgnhdIhfuOmJEXZLfF8GQa
YMPQZHcer0R26QV6X69RV8MlGtHevzrbriToS9jqFKcBpKs6tTGnEhOW5mNJAVWJyvO0jbvH7t1D
/LDjM+uaFseCvyJE82IUMUMeMuI+Q+6A3yaxLuwowt8268PD5Mth9/B1O2hUrV8zbFQt6zvchKaF
mYVbYGwNTaxvo5eKF7HlPltYxfE22N9qqkgWEbxh9zfpivqdMRN8RUTdzRMNdDneHb79vT5sJ0/7
9YPuyWzPaKX3xFxF3aHWMrRa1DrqujGlXqh3Xj0lXpwNK1iNHLrzauegL8Ix5GuvKfvp4T3RagQ3
BtWxlWBLc5ldxCXM2+YaijFHM6ByWxwLXt3kslqU+EG+/cF9DWvGFe7n+N1Xy9hFAsGCbojq0ZCY
NveArbOgc+uitH62rUMDkynjnrHVajYAcW4WuFue4mbIE0QyWll9OBHH/kcQighmGsd2Aw0iY5qF
9TWcv6V3RK+6nsbep7SHLbgO1fA+NRdVagVOs6q+tzA8OoBufVFEwiRLGTxUqf3XB9DJVzRgZ34p
limkAngsvkaDhLkXtw1oGJhaDZiudYUfmXsxKUAaBp+9Z9J5ggBZWPePGghRjR8hmYj9mDK4HSC4
6q5eivXhuNP+4WV9eLUML1DBKf2BXVn21SAiIAL9eH57WyN9Wwg0TYusn0EeD8daBLoZTFSMkzlV
I/ePBp0SvmgXCVCuCzjudhoGCuRdf3B7AhWBnuAJ3tX9Jde/zUYZ6JZM/VGaWRkdkmH7Yp6ld2b8
OTwHfTwl/Drhe/xOu/5oTx3Wz69PtUdP1z8HB5Zb/VvN/iiGLQug2xz/YIRoz14Q/kHk/EP8tH79
c7L5c/diJFTWHoexT/UQ85lGNHTsHcKxc98DBkZYLfT1HrfoLMdu1dHjRpIAnOEdXtKvvJ+HtWSp
QTacxpzmnCpxZ2PQPgYkW0C0H6mkmp3Enp3EXpzEXp1+78eT6POz4XrYzLebzPc1e4e88LC5Gmiq
OrXJOt22Mv7unHkkVeSbFEQ+5ATLUrHU0R/CHUDuAEggaaZMjToh3XWz0/rlBWuiDRA7oWqq9QY/
/LPVCkMdWCWeA3YluCqW3EnuylgDbHof/bi2Z/3Kblk3SVJq/FUlE4HioKXh+syHzmP/K9GT1rtn
W9EGjc23BPbfH5OalHPKWTZmFjqiguV1N5M1GSUvL6dTZ4JOXN/DKpLl2R0E0gN7gWVNOGevP/6n
863/RMb26fG3zf75uN49bx/+n7Mr6Y4bR9J/Rad53Yea4r4c5sAkmZm0yCRFMDMpXfKpbc20X8nL
s13dNf9+IgAuWAKU3hwsS/EFVmKJCAQCd5CnaVpSSmRdmaGdv7L2D6u1GindIkaykgD+aSmEPvT5
5x+/tV9/y7HOhnKk5FC0+cEnO+Ht9gmDAGgi6oBHinYLnq8FpxIRkiiuXD/ern010MnMaCoyCJoo
OyvOdhLYDh0NeCPuMwdjheBgmYPKfMVDDt38b2HB+3+Wb9dn15vZdjmPHb/HKLbW53//Dhv58+vr
yyvv3bv/FssQfIof34Cq79s8H+gAEDDrISPKaGE6eRb6VLINEpoj2XpQQQ+UpW1hmIQnInf0A6Xo
TdZfyppCWJ2jkO5740hWplnxrSrt+ryZPoSZRzueMrtMyVlQ9C/rHX01VuGq9m8wXfaR66BhZqu+
zZhTnYG36fKB6qciu1Qn1Za3frBxTE/Fvnmz9tZxLEo/n0a6ANSnQody21pYULOiP+BAWXukjtCn
vmgS6oBUDw2N792gqR5dWMla+uhqYcHdZ6tC5tnauvRlRXnKS2rc9xnLlqtfzeefH/XlmLPhD81i
anznit23JzUyHAEKOVp2cXwHL/dF/y+HqJjBjHdk31fN2243zKu7cG/Pc9hp/gf2FvOuu7w6ynIZ
lWYxXuI+xHOuO2jC3X+I/707EATuvgiXWuPMBwvibGrPPPDIjLMOshTxdsZqn5139q3++NiVPW1C
KAZpqMuyGF5sP1WDfvYFZNAdIdmOyg1Q9LMflItcQBSe0yR03+4+KITi8ZQ1lVKrZZzINMVi1OKF
JVCvL6g8yv5/AkDPEIUmLkRIOpW4e4SRHqa7b/yWlxoSYiVIvsycBOxEb8xgNiZJnEZUOtdLqCVs
hjH0R7fcrDldmvKOSdFZ5tEo05fZbpqyQPNgbc9udcX8+uJ48t3EIvTC8VZ0rdI8iWw5SijOTfOo
fosqZ6nvscBRFD2+Dd8YozKBFaxuGZ6n4ifE8+c1N24ey1vYaJTNmpPR8a+Xw3FkXcHSxPEy2aeq
YrWXOo6vUzxJsJ+7ZgAERH4T2B1d4Q+xmsUnhJeZkmeYxyaP/FDZFgrmRgml6zJN4h4x+M94Y8W+
tATHuHQYZsRiaoQf9+Wj5nDgTcNXrIklrDmNuR4KOnwvT9K6JyLejs8f5WpOQJONkS1Ix8SS+vkY
bTGAjnhL0mNXMjLKmGAqS9dxAmWdVtshYnC+/PX88676+vPXjz+/8EBSP//5/AMUi19olkK+u1dc
2D/BPPn8HX+V59P/IzU1xfRzsQxvAGSoS3f0AWyZH2mXaLw5desHNlqOGs9421fuE2X+L8OC3+Es
lk2R5ayatSwiAgyMIeFXuCppRAIRkbYsyzvXT4O7v+0//3i5wr+/U2Gk9lVfoj2fVAE3M1k2zCyv
TkPLjtMZhzTNrxXIm5nqOnQqB8KhRdT56/c/f1mbX52UcMz8T+5NotP2e9xvamVzEogIWXuv2FsE
0mRDX40TsphPXzG4qOJ8tDRjStaeWQnNIQaAYPjQPgrHMi1hedlKVV52PMqG1Ct2LV4kgZVl19p8
KaTKbuBQV4axRqzV4lfC5UBO/G8edCfLy1y+WC9DVTeU9yR0zE7XTFWuJfR+N2TU1JJYOlj8mHzE
NWHi1OJ2zWBLCszeH9pzfmQ5yD20FjD1V8XoZb5vqoAbOIwRfHz+8YmfXFa/t3c4fJWtXrlFQkg3
Ggf/81YlTuDpRBjH97tCp9bVrmMGr+J6KUjTRjZ27CYSSDso4tOyCBh9+izqwDy8AUPtmyKTPr8R
1ck6qpJtjXGlOtbpAHeSpGvJDYS2Op45DwkdsobfziSXPOoLLsshtT6JqQib0fNHWCcoB5hhoPy6
pyGKh9PaeSEPXaaeoM9Ip3ipVl1TzWG7NSqXQ8RZIYngrXXZXsYhsS5zs3y/z9S4sJxBD8isYIz0
R+IYD9detHp5HV5XaPd7jXyfg2zXyCIk6/AOK9I5gwKeQA2Lx9GCTknRt8/AgLKj2jzvzdcpYgJB
EvFTq1aND7WguyzwXQoQ/uYUwi0WcoevkN1aIfGQ5pMVL8fHU8uogrH/KDpsKGzQoo+vaJ4PPXml
dmUZq+5YcuvM5FSD9vi7j8RMmWVh2L7wSgA+1yBJyAs1kHWAvPeCUZaErPkrjjXwwejrCuXlXsPm
8XVR7MNDDv+6hu6VQY/WJCeqKO18QnigOc0qKkMVUE6lekFdxk/nSztYBgny8awtxV+g1mjrGB+p
3Nng+0+dF1h0TdhJ6kfFyWSmCMvF6qi88V3m3uvPjEdwGoSTkCkfQhVMsVD2fMG+4GIQGnCU5cvL
p9M0ao1C8AiplMUViM15XIx1f77+AsXi5S9oAdaDH61QlYF9bye2Jn7nqjypl4SnbG32xRUWZRvp
6iEPfCfaSNrlWRoGLpVYQFQ82IUDlPqhr41uQP8flViUm/xNPeZdregqm10op59c5dAdSs2Yqf5M
vLfrQ6vESp2JXb4sPVjYsq+jrw2hB/FyqzE8Fh497ng0/bt/oKfOdCr4ty/ffv56/d+7ly//ePn0
CXTR3yeu3759/Q2PC/+uDQwuVWk15fuTRhtS4+shDeMbYxgv6Ua15Utm41hleha7HPR5dCGyJEL8
vj1pFcQTEybflOaTBee3GpOTD4nl8EEZJxh9nHshqmeCGsgbZ0VNcztnqA5V3tZtr7e13MNuammn
2ApDNaepMUomfBLPL9p84J48tPjDh87hWMMyZnF85Gt4Q768wBGY152xkFVt54/GIvDhKYgT6l4N
gvdl09XacALJ2rvXJminFdUMUTiOOi2OPHMZuUTBONLXBzg+Utsc36OEoKYW0uKY0KZ0q+rnSLlq
KwxMbvJeEscaGLGU2wkHT1oFutGYKEASo9GShzB/qodsC/1QnixCMnD0VUVrlHxx83MvcG1floGy
CAtdrU0RVjVDmes1QZc+ezmdzUqAoG1/5PLpPtBK58TYKH44++TVLw6eTxGI/t7V6D/2eHo4gwhO
aT6I88O+265rOj3l+QSyZmVNOMO3vVr9xWFFJV+bQS9AKMyW7MfaWH/Guks3JkkPQq2xy5R/gXT0
9fkVt5vfYaeDneb50/N3LjLp51Zi8WsxZMhZXzaIIxFeZrtrh/356enWapqawsZftNFMmgrDpcKD
K93UxFvQ/vqn2Nqn6kubpb7VTuKBpUf3rJIFB+v+rYwrc/+Y9ktujDYGG8fwKA2P1Cz1EH7f07al
JBcIyhmbSWfNXmqIUXdf+n45XpsGyuptOesnV5W8mkI6erlhXUO6PDM5+CSrFGlZmLBAyVddTVby
62c0vcvfErNA0Zk0VmgBeQkP6FnHGrqJXaiKHZvLMkVszCeveRjTe66F64VM4DQN6IrNTNO2v5Q6
vbX47YdcsECHDur07eMfRI2g9m6YJOJZsrV7VfqtGNSXvFT0oe2rB3NN+MrDrXXHx7ra8aeubMGO
7n59g2QvdzAFYdn4xP2BYS3hVf75n0qgcbXgzhLNXGOriiHxOt9/J29OO9aZvbh0lq5IzBcjJuAm
XpWSerc6CRXJ5Ef9Y44cq6bA3+giBCDZA3ggRVE2NYamWmXMjz31KY8ZAYkdRhd5lDyzNAWVcte4
CSnhzQxFloTOrTvLocRmDKQ9N5GlrBlo8s7zmZOoCrOOmgiDwaW8bTTTRzd0iHJAJthTxWdjDPKk
YyJdVsOyZtKhXJClcqqH+vvEoQ82Z442L+uWnPwzw7WmcmYhKbgscOwQLWApRV1UO3NoCKPkIdhs
wswVbg4/wROZxeM938SlRgJH/JCqGdcPDduEwZY/Hk6gAcI826ibPvUErTNUrRXz9BwJnu6NUndl
X1cnutf9eOvbipS33SGQ49gsJevayzJ8x4wkeiHN7MXU7GANMYC6h8SJAguQEEDVPQSOm5IAnRUH
4oAeCw+R4yYbPQa1TjwvohIjFEVb3Y0caUTMm6Zo0sgNyU5KxphoBM/KJeYAB2IbkNqySq0pEqqt
DzkLSK/HlQEN/GwHao/iRbWsH3nsJtS6UjQR1UNATwKig6CKbkjxw2fidOFfDDLOz+efd98/f/34
68crJaEv6yxskCwjn0+Ysz7euj3VJE7XbEQSiNuzdSXAlGVTXuiTPZmrT7I4TtPtvWBl3PpIUnaO
rVIcj9N35ULtdAsYbheRhu77WhQn72y5/646u9u1ira2IontjcZFVJwIk42UqlY4oSMGmIzxOxmD
rdVq5vIzYtHonzKy54D+ziEcbO5MKxu5aa/we0t712gIiJauYL79kYPyXR85yNytQnYE2j+dLGnY
MfZkl0Idi8htbkHTNzsP2KCE97FR1medybf0MGJhvFHZOHl7xeNs1DmRxuRnlpWKN8PenbFnrf3o
y0YP235j7Ar6HZ4ZWM6ujXYKBO+Db3bHyhZt7QDcAKsa3CUIzd6bpaBdFbbyNNkUe4xzfgXYB97W
7jLxRISEN5liA1Iam8A3hjjnOmqrA83VdG4Yb7IN1a3CgKnk88sz02yYpeq8GG3rYltPWhhBd3kn
J6uL7Y1TznN7qq2cI9ua81Jzot0b7XW31k6JzyPXYLlGyqec4vR/+vw8vPxBiH9TPiW+zt0obyfO
MrCFeLt4NL1plRM/GeqyviLndDN4sbPVAfxcyqeTArI1f5ohcX1KswC6Ry64WBt367s2QxRHZJYR
yB50lhEIJZuDijdkezPHKkfxG22NLd2UuMmWCIAMKflJk9Cl1b0h8vU2LdHsLQPOzKVu8+MpO9DW
5Lkk9AwhNG7QweKa0ho5QH10DiQ2gJLfLxUDylCZyNB0lzh2yPlYPpyrutr11ZlyL0IdCFDJKCkI
/CIFBgu64Uvpg/y2arvX9Ko5SdU/TDfCNDum1aDDj7j527Z2OKc9lTlmXMrlVLT1+c7qOiPuSH15
/v795dMdrwuhc/KUMWyyPBiNrcDFh0JNJ+xg9jZMdjJm8boRPMMxTrWW9JBwV/b9Y1eh34WGSh4T
anEIjAdmdbcQTLpnhejt5fKg9hXqjsWuS5m+OF5clXD9nFZW4rRXJzcaYT/gf47rGKUuFvLprN06
DnpzRN6O9VUvumo7o4y6PVT5xdpNhkF7pk53gZWBt0siFo9GEU15eoIF3laEeESXSMY9IKypRmPc
j0yjoL1H/gxq/t1IhbIQAy/Pen0sFuZAA5k5CwsP1pp2d7blxap9JR+NTsRW7z12woMxxdFL0Km6
w+J0G6+kdDcvKrkcSZkTteu6K81NIp3MgkS2qnOiJC/K5BGH6Y3pw18c2uvE2hyBT7RgL1aFprjt
9SMy9aEWamFb/MY49eWv789fPylS1hTdogvDJDEqNNFxQd+oWXGivFzEfLzeFD8gaVnW+5RTPWLw
C/p2HbhDoW9dlDgcm8tKl++TMLYmG7oq9xJXrykMiXTaYqXzdK2DxY6zL97o+L56UlzdxIpcxE7o
JSbVTTzzI+0KaJvbXK2bY5GlTuhpuXFiqBEXty1tZez81KKNTXgS2zsf0TDSi9Llp+Vbq4dzEjkk
vh8/stuQKGov0d07VI4h98Mk3RgBDMpNIqNkDiSRPeFDM5prybUOHN9sxpUfAtBT2xxB4lYY222P
rNU9Rh6oRDJ9Nh8OsPJmmo+h8jXa/F5+C+2q2ByvLkaMM9Q997d/f56cZprnn780mQsSCY+SW8E8
mFzk91KZElotWZkay8PxcjbulZIkVg5VmFjp7KD4BRGNkxvNXp//Jd8vuM4etPiAaaPkL+hMXOeQ
qywAbLhDGb9VjsSeOOGR23b0U5QKq+vbc6HMeQqHbK+TgcQJrbn6lLlK5XDpXAPfXlffB1GCEupU
roTOWXgWkDnTzq8qh6W+SekENsSNiZE1jaBF28P7SjyogXxAvBJXbxACQ3FfVxZ0HNQBSvWVuETk
LPnmFJmZRc/RWfBXHkbMko3wohB/vJFdPeReqt6rl2E0EHikzUFiWmtDgNR9JBkXAucbJQgm4uKZ
Uo3F0ZYs6InafPqSB2ls2kJJN5UnobRRR65i7sVkECMMKdFoBSnp8e3R+pGmCkOABTtelUdPuiIT
+EoCSSBJvVAn84i4M21pzS4bYLF+vCVJ1yQRGYUBXQYP/O29LnQiabrOabN8SNIgzKh886vnuNRq
PDPgGqAeQsoIuX4oDER9ON2jsmRk1JW5gWynBp7LTtlE3qjE7gGHwGjWYgJUFy4dPBYPVD1nuBhu
Z/jC8OlwRG11BUiqPt2LXLAlR7LE4oZbHQ0jyo2VK30a4lkQz1W2hrmjQaWAkeRTS8zMUrEOM17z
nQE+uh2fyhaFaNJwMDOoosqaI//OJlAPfhS6VEnYuCCMt8oqyoHfQhG8URiRTZlFdhJJyVbyDkjp
I5GZRzixNDvy9ZOJB8ZY4Mp+TwqQErVCwONnnQQQq05qEhRCKdv1AO2CLi5MEwKAhvkBUQ2hiFBZ
ccRzY3OYHrLzoRQbYkAsJYe2LvYVO1Izqx9CZ3MM9wOsiiFRf9g1ZDFtpp9z5jqOR3aj0Ha3urFI
01R+4FPbKPifoPEUOmnymxe2aBEn6fnX538Rj64sEXuKOHClkhS6IlevSOM6pHVO5QjtiSlxWuVI
qRoBIHe1DLhxbCku9QJavVp5hpi+/qNykCUDEHl0yYPFuUTlCIlc0V+SzJPlFrvowjFWtz0+Q9We
hr6t6Ux0i73OMIydS6XEKLTdxfIuwsSTw4+swieve/rgQ2fsGGU+nbkKFlGRqTBwlEd8D7E/Qs/m
FowckxicZqQPm2eWfRz6cUgbXhaeAVTl84Ab/EaLDnXoJrLTqQR4DmuoCh5AqKIM1hLuERmKW5Qn
EzlWx8j1ySFW7ZrMclNfYulKahOYGT7kATklQF7tXc/bmhMYej47lGaVlxNKAuLrPTGPBBBbAVWa
U8CU7BwB2UKzLDywE2/NUeTwXHIkcoj0YFI4LI0NvIiYKwIgJzRKM6SMJTNETkQUxxGXWKU5ECU0
kBIfA+i+G9OjESOpbS94nMNPrYktnnkKDykuKxz2eqdEjzd55zse3eP12Jf4FA+lLy9x9/IoJHbk
pjztPXfX5Is0YGbfx7CI0IbrZTw0ESXnrHDsE4OooTYqoFKzq4mJz183CTU4m4QsLSFLS8jSLHO1
eWuiNulbHZWGnk87Nik8weZs5xzkbD8NubCIVoy2Pi+M+QDKM7mmIpSSPvALh35/YgFY5ntk37V5
fusSPfCIuZ7jYRL5GGenhotYEtBklN+8KKJqwqGYMjksQkmJzo/EjgHb1C3f7zuiwOrEujOopR1T
b0oueO+H3uayAxzqtY4V6FioRftcMFZHietvLbh144EyHRHDHLeemJTHJwgDhZxryzmGxOsnrm09
d1RHXXVJJ13DJBbPEYs4iYSEsCYW0IScGogFAekYLrEkUUJtNB10B5lr10RxFAxbHdSNJexr5Kx4
CAP2wXUSi2v5snp3eCllcxMHltCPYnLXOudFSj/fKnN4DtHVY9GVrkcuE091ZHvpb2n5tdH3JYNH
9srhm9BGNeejSFLi3g2MuiS94MeBGqRAprdVAPy/NmsOHPnWAC6b3A0cYi8CwHMtQIT2UKKaDcuD
uFE8+RZsGFgc0o1omijaVkNAsXG9pEjIy2ErE4u1Y/MFgjonHn3FZV0cM8+hfDllBtVnR0L87XVz
yGNi0RyOTU7FGR6aznWITuR0n6oBR7Y6BxgC6pshndIogR66xNe/Jn4c+weqDggl7paGjRypW9C5
pp4NsFQjJdc6geCMRl/IzS8OrDWsw+STYCpPJN8S4KJLptgYJhL1iqTBw0BTrjDsKRmdbWIqm7I/
lKf8cTk5unHX9lvD1gd2ZmZDLJ6BloqPOIMYGx9jl96GvlLFgZmjKEUsokN7gVqX3e1aMSpEDcW/
RxsHf6TvrZz5E46s097q0xK8neV7K4l8u+x04D+Mj6rVaMWL8rLvywfp4xtfDIWQSrZWztD01uFS
ZR6aewKJmmJwJqMYICZNY9LvfZM2O9eYiHgQiBjA7HxKturUt/k9f1TByBL9Bi1UGMA+Vdh91d9f
27bYKK9oZ68JOdcM/iwyk44mrsgjOmK4l4hTbONfL68Ys+LHl2f5KgIHs7yr7qrT4AfOSPAsh/Xb
fGvwVqoo8cjkj2/Pnz5++0IWMlV+Op6nOmnlyRtQZzb6ERmY+sXnFyBtVbDETjdrOo/yir8Zak6M
yqRhoC1iwCI5oEYKAuHWMOkzUPyp5r3dgP+j7Eqa49aR9F/Rqfsy3cN96Yg+oEhWFZ+4mWQt0qVC
T9Z7VowsOSy52z2/fpAASGJJsDwXW5VfEmtiz4W7P3/4+v7j9c+1zraxSFMQxCXCSsmS+fTj4YW2
M97XIg8rz5LJ/dlLo3ilLZg1GDba9nTMwOXMgd2Q2xMwfeZOFMMh0Qw07YnctQdMV2Pm4f6CmZvN
S9HAkpMjWbRd0TD/MjQ1ORTMzGAYDbAGPD18PH75/PbnTff96eP569Pbj4+b3Rttu9c3WUjnVLq+
EJnAVI+UQ2Wg+4DqOlPTtt11ro40suECxiaviyJRsyEs/J0eCEJtH7s796HdjnPq2BzCn+1k+Zi/
FQ8PK1/z5wdEuNik7dsADwG4CuU6mXs5L5tyzIgS12u+RDQTAGV9J0rRCrKxfV6roHBtbiZ7X5Y9
aHuZCCMPHVaUiqaUK+pR03kSLcPMJZZGHxxTrzMOdepFzlqNwJFQX8NZGykhgAOp0zPaXNw8IFhL
XdibIElvR1p1x8VyFa4KMWk5IcSiS/0z1icsypxJ7ppz4DgJKozMwyiC0J1XP2JA34Rj5GKJsUBm
CH3yKI4KIFclXmvRgR7WfNC06UdMvLlhA574EHsWgVn2kpFvKdq8z1z5nu5bPSHRCyU+VJ1KpFPa
ARsO7Zn0o8oKriZhw4GK3wh2Omvl4S4dzZyYsok28pgb9MvuvNmsthDjwmaVvCRjcYsJ1eRFFsGE
9RFaPTJWZIjXx7fwoAJ1QbUGOdrfE6VRhbka3qZgU+SuNcFsAIwMhjF33RQbimy/gmU4GT2uinwW
gtzJVeAmDXof0g1wwIZWjr/fC9dUluaa7O3UnGSqruZIsdjxE13kd12eqbS6gypodUh+/vxpSCH4
v40caw3o6nUhnmvFD3WFtuRkXfC33x/enz4vG4Xs4ftnZX9AebpsrS8gLEo7DOVGVWEd0DBFtIGI
zC6R1V+XfUuHMx3pWncSEfXnUpcdrpjAmIYtHSu4o0E5kV1NsktWYxe6CpuidMeRQgqZwzyN//Hj
9ZHFOjei8k5dtc2NrTTQJt1TbHbZ5iIiya5T1DvYd4Mfy+o5E03zDwgmgczAy+JKhH1GRi+JHSPI
jMoEPsEPA0GdXHIGiO+2rYpzpsS8nqF9lRmV4DHhao1M2zhMHfn9jlEnEyijCc+d55wtMQOAQTdD
WmiqOgTrI920eyb6GDHBiOrr7EJGQ5yzfisz2fcJdBpTiD0jRNnICz4W23CjIqbuz0SN8MecGcae
ygXohkbV8qqx1QsMJW83fiq/kTE6d5FSdWQY9OR2dN0En6PDZWcJiMR6L3N9oZts6/POi2SNOkY7
00x7YyjRbUpIt0MGfV9GAZ1cVTdqAgjD8wQsd3sj+EOGvkTKBCAtrfY4BKmVn4bIQwMJU1D3sQ40
puruOBgxRIiRc9ZFnyv/GlTNLG+hhihVNn1bqPKV/UxNAl+vNteDxh6GZ9QzxJfrDq9+pLrNY+Qx
8lE3OROY6k0xHRhVsmJtJ9FhA6tSJv1wafgKiqqnN1PVNYYlUSdnfQbkCrt69fosHEPUxQZDbxPH
aBFxTLGtOUWmR1QHahnE0RldwwbEAlOG61BVDpiJ1sDHwHB7l1AxVZYzsjmHzpWFCk5EKyh3CN9n
aMBjYNBMyYFG96Ok9n065MchM6YJbjir1w90+RNbC9MEq1qXGc0zLah8u46s387Vw2VLZU6JNTGR
7FkNauogVEWxfCofM/dFydzOV6mtSMZaX2FIi36WuvatiWDwrHo5golOhz72BjudoE1xnhByyNUX
GgpETnBFyE6V68W+wSP3f+2HvjYVCjtkjagZEbOPTc1Ptk/QDcklomUn4wV6m5/q0HXsOwCAUcVw
DsLsq2ZzMlyVCmpgUb4QsO8ay7fBEjorK/xp8qqqDf9TkKCeS9jE1+5rbmNvzK0CUW3y1W90hAd+
rzrDM/wCMgh77eUs7HhtJLo1Bsopy1M/sG4S5mt+6fAt7hnn+VqOi2Q7rSxXBUKtSr6lEST91LsA
2/Jc0FWyrUaihqFaWCAk3YFUoKs/HGo0hsbCDG+x7Cl2ZsdypXucHZ9aMEjdKGlQ5MQYBkeyRJ3j
JDAPfYvxksTU0P+6a0xi4FZ5i01dJiOVFbChtJSLnQfX09EMhhfEPHBJmD4mFEgdFBpkSxA5x0ni
Zdj74SyW/oFDCqqOo7B4LioVDHFR2SZN6IeyMZSGJYmDF8iyxVkY+DED/5hjx9DHp1KFMUSt1BaW
cqjoSQytAWhperFL8ELQpSxCPX9ILOaCJYF0gxSjrcoQz5IrGENeyVXbo6iITULEFuZKg1Z8sV7P
n/JEssfvBTLPWCoWqu5GFJAdw1YzNk9lCpZEQWpN3eIpXeVJ8ZlxOZXhUIjOLsuxzFKR9bZA3Ulr
TIljy5lini35rHNpI+J7IYmtCwMXD1wvMyVJiHs8VZki3P2TzPQpTq/1Pz204vMUd31gqS/FQmyL
rrKkaNfrxxMJ2ZQWICNpEFqmRcyEGmPbJmdUM1hmOdwXLr7Md0c6L0d2KLFDqaXg7LWo7+r9aqG4
ATPd3q0kAjHFj5sDtjtcOGX1YymS+IWMEDwLT52d+ddTpXtarOb9GCSOZS2ymgvLLPXRs7Tb4NUd
QRXqVZ4BF+whrJM4ii1pM4Pk9aSX6wQTq3b0TIRLEN/Gb9pWj4Wlsxz7Yrs5YFqXOmd3QpdJ4zQg
Q+xQcznW8p2UhNO6OZFl+aZg4gXXph3GFWNvIQsP6PC7kW9ZsKcLiysZAZuH38epTHRm9rHKSpce
luTh8uMXSgG3IddL4a7VF65OridhOZ4snsLMo4/he1A6Q4FyM14k08cYPvNUZFNuFMfQfWa7zMiW
20Dp3TEvCUPgQIIHPuM8ApeOuDKZHhkrJfLchG7y/shC8g5FVbAIOYs/6enQ+vGfb0/KY6UoFanh
YQcpmMZID2lVu7uMx1/ghVf7kZ5bf4m5Jzm4pbvWMnkvtY6WxOQC9RdyY25xUDbZJ7LaaFNJjmVe
tBclErVoxJbZ0lesb1gbH58/P70F1fPrj583b9/g8kB63OTpHINKml4Xmno1JdGhnwvaz12pwyQ/
6vcMHOB3DHXZsKWx2cnhXFma7On3UlGmrOLPSwp6aianSaJ1sHpJsrYEJ5RqrTUtwiNLq6pnLJTw
bv54fvl4+v70+ebhnXbXy9PjB/z9cfPXLQNuvsof/9UUc9g82EWMNRZdjTzt5nOhI53F6HVRt7L9
oPRFTapKPMmroiVr1XLSw+vj88vLw/f/GGrWPz4/v1FhfHwDv4T/dfPt+9vj0/s7xECEgINfn38q
r+a808fjdEurknMSB74hcpScJoGyC5kBN01jfIESLAWJAjfEbyUlFstrOueoh863XX5yjmzwfXSH
NsGhr5rPLvTK9zBdAVG26uh7Dikzz9/ozXKgtfcDo7XokhHHSF5A97Hjrxi/nRcPdXfWkxva5u6y
GbcXji1q87/U7zxkVD7MjLLciwwIoQtqgs50ypfLrCWnps8yaiwsmeybbQJAkGB3EgseyT6fFDKs
lxiUqJ4jFAC+sWa3Ac/5eoqUKLtqmomRQbwdHC0OgRDfKologSM8asDcCzH+TCDjhnSwO5U48G10
rInGYxe6gZkUkEOj7yg51lwQCeDkJajN+ASnqWOWC6hGwwHVNXI+dmff8wxyTc6pxy44JIEEkX9Q
RoQumqwB1T2umAPOXpjo3n3ktQwdAU+vK+Mpxh1iSLis5SKNkRgfOjHK7ZvdzsgpSg5dFx8UFNAH
hcGV+kmK6Z8J/DZJENHcD4mnOnzWmk5qzuevdP761xMYl9w8fnn+ZnTfocsjurd3iZ4NBxLfzMdM
c1kw/5uzPL5RHjprwssNmi1MjnHo7Qdj6rWmwE1h8v7m48cr3XZoycImFazZXbFETHYxGj9f+Z/f
H5/oov/69Pbj/ebL08s3M725rWPfQSbYOvRi9EzGYWQfSfe+ddmVuRjy077EXhRe367UC7jUTcfU
nfF4aJZNcfbj/ePt6/P/Pt2MR94gssbfwn8ZyrqTVR5lDLYlImQijiZeugYqz/9GuvLFu4amiexc
RAELEsaR7UsGWr6sR89RDaV1FNfE0Zl8a/Ka1wwNddFrIJnp0+gqOhQyds48R3nkVbBQuSJSscCK
1eeKfhgO1kIzPLYfFAVbFgRDog4aBYdRannVMKUC19SQ2LaZ47gWAWCYZysIQ/FrXaQcqOqgxFaI
hrVkRdfCq+KUJP0Q0VSMSwhRkANJHcdS1aH03NAi6uWYur5l7PV0LUGO9XOP+47bY1eFiqDWbu7S
xpT37Aa+oRUL5KkPnZLU85p5OGOT2e77w7cvz49yMPq5+GCXXHaHo6nyMrPkasAWvnhRGr94UG1o
JTKjb78/fH26+f3HH3/QWTeXPhBpbze4PNXdJS+HDt0MoWlyC9yHx/95ef7zy8fNX26qLJ+uRpZq
i+Qpxi8R4IaklC3CAZmuaBYqOFyvyt1+1L9atM9njtsx90J8lCxMXIfoChNXFMZ02BUWVZFuwcST
3pVMuIlMhfpQXLhIDg9cDtYiDFI9PC7giu/mhcnUqVQaSnOIJn1HmrztsTPzwmM+DiwY5np1rpWm
hL8gerRhqazH0HPiCoumsjBt8sh18Cz77Jw1DQYJlR+0gQolQsSVETB9v89rJQSCMUPM28T20Mge
PLQfl0lBSiJ1Wa0S8poUza5sChPan/KiU0lD8ckYlUDvyaku81IlUuHt+oKOyHa7rVqiFe432kom
5VI2HbOyVdRUAG2HARw+IP0n6nUx9MFYJXpGtnyW3zUENPzZzeagFocO0UtG+nz4p++paU7X6G2V
wy2qJe0jaC0PtF37smFBFZU02DWr5Uvaygcw2OyRxj/U9Z1Jhsa/FMeiGXHMpB7L3gTq7hA47uWg
OOhndTlflAB2rAbMTkdrtKl8Sl1J1bbYwGMpo+UYO3LUSYPiBI1Voy9JdTnQ/Zfi0meuiCb6tMtq
0njnYDpH7PO/sVOavEjONGUkgLf8vmAXsXRzcl/8MwrUKnYddmHEkDP4MBLNp3xzQK21hDRnJdG7
oGuz20LrmC5nd7TZVmuaNjMIc6C3lSEPbNOwNRFiCBInMl/ApYd/wcChy0uziCzwFsk6vWEmKLun
a2jsuWl9ThM/jOmQ1KN04V/1YxgF4Tq7MIJCY/cBPpkpQrJo3bK7XXMY9LLTz5j1Lv3kctqXw1ip
k4/CLIymtULws/JbJm5v/3j7TndVT0/vjw8vTzdZd5hv9bO3r1/fXiVW8Q6CfPIPxf2AqMF2qOha
ikZwkVkGgnQ7APUnpFlYoge6hJ1xbBgsqVlkBKCCFwGtAJ2+t6XF65TEds6O9n6Qyu3tR9ThsOCC
HTmsNXlNzKICCFU/nPXCMpdSXbYibvAtH7Va94tFX+vT57/X55vf38BwFO1aSK4YEt/DdWZltmE3
wlEY9QMos9m7h7DhoBjo6E1SGk0yobDbQU8SqyNAaToP/ExHnuuYA/W3+yAOHHwQz06RNItXHROe
HvzYueS2GZvXZodXcseKWKIuDDUmcMWCNOIOYinT5YfOWFYO1kE0lzWUf4wWsaNzFZ0vIYBnMxZ9
Az7DyNrUAGwwnOleve0quvmokJwZD8zDaLYMZb6/tn1ZNHl1d6naZnehm7LC4gFdfAp+pjZjdhxQ
53fLsosuhJ8UU9mJyuwiL1S6bJB59FTxsvuUOBEy7XGYAOxGJgwueZFEBf9l2FiqACu17p15SjKD
F7aVzpu8i63PN/3T69P7wzug6mXtdW6kTCV69zLD7VYWJPNzijMvYGtiAUyoCz6ZgUeu6Pp2UxjL
98JDi9F2Rb/y2i/zc1G2DwQ9vqpMv9QZ6gphkY9y7qaxfn78/sYUF76/vcKhkCm33cDC8iD3iPSY
MCcDWnBsHuiVR+L/R6L8eunl5d/Pr/AMYciBliuzos/avNAlmPm+Y4DQBzLw0LnCEExbTu1oBgCr
pK1FWd4kZ1t60NCqSSe3xlrtJF0KWfBNz2diwGg9MNIzWg6+GLBtNzh1W0CLS7iclHLO/zDzmLzn
kEE/ukvgMSu3mDQyXz111uXInaJRa777uPn388eXX24BloF+v/HLDaqnZqrr6ciFyPorBlrl6nun
wdCdB9S7ss5HBz2ZBd1ITvirouK6OnkJNnagu8BCwwIG/conq/IObOO22xH8GFN6MMTo3908y7CK
YA4S56Wpqnht1ytEsjTmfCtlozurw+UwlhU6FwPq+rFhiYqxxfqJf0HOViRaQbSoHRIqlB0wxHUT
O3LZn1ZAnp3ZBreBi7thXhiCMLF8Goaoy/6FIVKcDkv0AKvibegnyB6G0sMQq3iVhZFqGTFBm9xL
IjRe5MwBkRKR8ZsNflip+sEqtJYo59CvkmYgtKeKhpKaOQKvCixFolDoXpFgzoW0OAeQJmdAjPQd
AH5gK0qEhjiQGGIHTzJGRgqn4+MEsPMZkQkBWL/y9YBBEoQHwJAZUixNUODDqgUBAzxkxy6OjdjW
RaBeuFmDY+vH7EYL6bVcc2sy0Yshdv21IUwZvABdxuACwF2TWn5DYJaF0/EO2o115KDZlU3TXvpb
3/FxM4D5ODRZLV6GtREBKlyJkyDFY4gfxsgVDINCBxneDJH1JxQg9WyIjw2xCbFN2TM+5KdrVfRT
VNp5edfOcPVQJyk9IJ6yHN8kazxCmx7LjG463ShZG1vAESfI4BKArSUYnNpcBslcCXZ0FgAuihT0
FTMzDbB/RSuLCM+ErNQFnDig8dFkFu8nmjYAeJHooEHHYV/RBRKZdvuRTpEJCBeGhRF2ywB0PK0w
SpB1h9NFHkZT9CPdAunSjXG57pUxADwhlj0l4zWcLiwRpKSnuRw7+UwI3v4zKh0HDRZQJbsQ+m+5
La0PihIrcg08XYOIPf61rbHlynUYak+xKJeBCNuYCsAm1xQOwggNFjRxjMTH1kmg629v4sriMhDk
tDGSwQuxbQ4DIgsQG09/E4BtVigg/PAYNQUodnFTBIUHDx24cNDNMVYkMI1wkUly3JI0iTFgMR1Y
BW1dN7P47vlKtWbOtfcNwZVnZzdAl6Vx8Innxbgy0sLE93hrGQFLiLQhM5jA9ufMGYuPiP2pTkIX
LSwgqycMxoBulQFZvUEFSw389gAQNOauzIBNxYyO7EOAHlj4sdHH6Ig8MaMTZGkAOrYEUHqCbaU4
HZ9KwRbSwfNOLWmlka3z0mjt9gUYYkuSMXocBiSxxD2aWAaS4I6MJo57dkWTRp2HNBns2uIwxTJn
fgAsAZFklvUXO8qieZIwWBpyoPv+tWMecIT4+AYowUMUyxxY3TmAjqaxIxAGVo9nNilPKvdNSrJ8
KYW3xfmOCIdVgK+vu550+wnlGh9lbl5V70vlap7+nGN1D2NfNLsRczpA2Xoi7U4OeyVGNk1E6FtM
eQ/fnh6fH15YGZC7NfiCBGORWTK7kCw7MFcEai4k6w9nhHTZbjVqp+jCz6Sy14iDqtXAaAfQfrEU
bFNUt/KzI6eNbWcUYVPuNkVjkLM9eFrQ88z2Jf11Z8lUBHU2PmoP9GBp+aYmEKHgTs2869u8vC3u
jDpnTOvXln3nua6nVYO20ViCMuDG0UYXg++YWo0lQSpMu7bpy0GOgDTTeJMpyRX1QKmW1IqKNMYH
VZG1mP9FDrYG/z1tFQv7rqg3Za/L+1Z+xmSUqu3L1hSnfVuNBR6zC+BjeSRVjr/0sWTHKPFtnUwL
jYyS2ztN9A8ZPS9rjmRL8I5ejaiuGi9XcRpaJaQIK85dP4WhUtIqIe6CJalyLHT238hG1ZdV0PFU
Nns0li+vdDOUdKJqtWFYZUzzRCMWuU5o2mOr0WjrwGSkl3KiX/LfLGWZOegP1W3ajKhyq+D9od5U
RUdyb41rlwYOLv2AnvZFUQ3GNFMT2uE1FcdCp1djr7dcTe6YTbte/77go9LaUXWZ9S0EeLFNQi2o
VxTaLFQfqrFE5LYZS53QlzuV1PZ0MGmTGmkg6hAdflJXS0RkPumKhrZNg/s84Awjqe4abGvEYIiv
kGmSJYiLSrSRq2AAdWhrxhNPkdtmz47Od9CHZTZoBehLuiVTaX1BWXNNCPo2y8io0ugCY7TsQOrh
0Gg9AObXyrYHzLGtkzML/ABBC7VExoLUevtQIhVluo0obFWnpekqc4rta0wvmU1X4MiIDLJ+6Uwy
xsxQk378rb3Ts5Dp9prS1dBYVuj0OhSoRQND93Qa01aRcd8fhrEmg+KzRKYi4nyA3dmlG3A7Dsbh
be+LHnMSyBcCriSkrg5lWbejbU4/l3QEqUWHDETTCepEMVr6/i6n+zZ9GuJBMf+Psmdrbtzm9a94
+tQ+9NSSrzln+iBRkq0T3SxKtrMvmnTjbjPNJjtJdr723x+CF4kX0Nkz8/XLGgApXkEABIFh38co
nLAhgIhX/JclxhWNtRdKJrSEMuShcv1AZFKVpQIXliEAhiPpNjpAUigXfvklu0KRGjAk1lfG4YZr
aUBh+oJTbHTe1j+gNafek3wo8q5jykJaMamuMpvrhMsB4OhdpcEgwInJgAHaF00+xOYGETVUlS8Q
JeB54qx9RIc9McfPriiqKsaaSTpU6Um+v3Dzspmvb2G8nYAxUJdKYNakLc1pZ38qY1+AXF6cS+Ye
Lzxej/F0wtPDuuOOVklPugL5GKCTnPKcqOlZeh2yte6pDQ4APvy7tOU5Upw547GLesZgq0Rkb/09
NL9oJZKe1vrL2/uMTBFlkKRtfEbXm/N8DvPlaeIZVpo9nQLasP9kMiAMOzkXGl8UFbKx8w0KJyjN
ByYT/JjG/bWCkDXUbI1MgmlXl8qO+Sb63IfBfN+4fc9pEwTrM45YrEMXkbFlAc68DqJGB1dBRapV
H67LncU34kSmM+9KHwmLhixwq6ZBBjlbvB/j+Tg/qkH6aXkraRoy1BlTsj9usyQtPiClmNVhxIrM
IQ57qyjPBgIkH/XIt7xpsQ2CK+uq3Ubr9epmI6fdKKsya7F/7+mVOuD7ZrIjBeVBvEpDFnQqVuYb
4BIyoyN5un97c3MNQVH+2Cu1VuEpKU1AV45WoYrJE/8940PR1UyzSGcPl2/sOHubwcsOQvPZH9/f
Z3FxC3x/oMns6/2/6v3H/dPby+yPy+z5cnm4PPwP6/fFqGl/efrG/em+vrxeZo/Pf76oktCZ/Ov9
l8fnL9pLYZ1PJmRrvgBn0Lzxv0PmCyKpqG9tl12/sCcQYDznlLdGTrGLkl2KqVMjRQLBzdu6sOZR
4Mx4ZhzO5z9pCQau3WOKI9xWuDRjO5wzpnm6f2cz8XW2e/p+mRX3/15e7bOF19Cx/1vPrzAj8R3a
+E5cju8hXwfSOZUgTy2+ki/qMmIL5OGihdDgKzmvh7rSrWX8yyc9ZZKCcAkIAWODyREfDCan+dHB
FEf1jGKSKq+otq50R4Rga9dbAZbBrq4wmX+koR3S94OlP0gEHvaY7549RFRJMYujOi4367l7hoKj
Yp8Q+1uSXuR0s4cRoRNTonYRWpV/RmAdce9dlCn2lG54iKaR1pRV0UJpma9DuyUMGGIOTVz2S/pO
t4RzTpgeaWrt/iLd1Z1pFeNg94CRFlv2d0PWuCIpyHiGZ9/4JsrkZMrZHbzYLVCLHu8NmOYhygII
sWNDOXQos3zImOJL9lG7s3gek+nZn+POOu0KS2jq2ojpE8c8bmW+CXPC61PUtnmN2Vh56dTd1+me
suXDT9QsP3c9GtVUrCYwBGUns0F3rIA1eeknPlDn0AQz/QD+hqvgHFsYyvQR9o/Fau6cNQq3XJvh
yAwiMMoMbMB5uJ0rxxIb+Jpa1vGRAARoIQvkFeM86F5p/vr37fEzU7z5SeARJfbaxCs25GKquhHi
PElz7c20zJzEfkFEUalUmjhWDaZs8uTOngDZXbQ/1nahESh4TXyndMwrHGeh+2qLJQVZYo2e9VK1
RpRtsMSb2p90uhQVGFYHz1jrdQreZ35H8kNEfJAY+b7fX2rIKF6Qje3ALw9DBCuFt6HqyyHuswye
2Ifayrm8Pn776/LK+jOpq7YocV1RgSebsIEsrQs2ji01KFUMOV92LUC9W0QJ7n4CQ3q3qsLpLMkD
nvhtLJ5RHmVbLdjCYe60aoCUayZ+aQv6gPkgADJOiPyYKZWgkkiVdmG4scZcAs3XxNpaEM87LBOH
yBt8FCZBU7yA4Au2ImTuBXT1GAdFHkMAgJqKGyp9LQzsKCwsltsPKRx+NtAKHCuKV6S0QSkCSh0Q
7WNqb8/M2V3Z0EckwGBw5EfkzkEdiQ0yQ1EI2N42bma4lif+abdKQd3ejxhnEHTM1HnbtChI2ooJ
CZ4FOtWTOqLoiGv27FjxseqRKmMzP1Bf39zJ0FDurFjIaXrwFnIq3ybUqOTk+SqxrMmeLx0dRqdh
5byjR/ru/uHL5X327fUC0R5fIMHz55fnPx+/fH+9R8ywcA/gmHlh13jayLaZI3F1+6vTD3hk5new
FD1FBN9xdlZfEbjg9sOx5mlYp5U+Quky4+fHEOfmqj1gh2/OnbuNd8MpjUlk7T24NRrFAYN3fjzB
o5R01+gvP/jPoSNNicBIbgPbLtgEwR6lBf+y3KlGHN2hDd4nC0plcNxJWBOV8QSPaExlQUDBEBGI
HLZWWf70HHJmoNug+/fb5Vci8t19e7r8c3n9Lblov2b0P4/vn/9yL5ZE5WXP5NJ8wTu0WoT2HPx/
a7ebFUGQ9+f798usfHlA0oWLRiTNEBWdaRcUmOqY8xwGIxZrnecjxipjSvRAT3mn3/eLLCPjaDen
FgI1pQyM7geJFz5wyESyckpRE8aekvxGE/Y/xmN+4LoDivuCVAGOJnt97Y4gpjyCqxrTm42IWhM+
Zr/EJdywCOMcFIYOBoPptkZOirFAU3SZwcUmFMQE4PLQtUYCVQr/wipnuH1xSrzV0yZqz5gv5UQF
bj6VHhFNQwkTOYbiLYIIKPink/royYM6knCV6WrL6ILgtduxGDASuE35qHYpuSLFYya63NbV9fZl
8NdIUz6iyryI00iPdaKtsKatnY6V9TnC835MDbZqE6/R0UVa0tIEI1cyAN7VRZLlFA8zxatbeHKt
agPd+pZvV/JXIq21tgDsNNppGsAgrzLMEZrMVdFM8V4YoV2LeuLuqUB/nyN+j9vVhMZFn2Z5Wjg7
jeFcO6yJ3+eLzc2WHEMrJq3A3qI5uKFze/ijv6AB6LGXaq7ZTbr3z1MPw7RmPBsNegtf6quzxQvJ
wWGPe3owATLEGL6Bzmnl8TLT+JNlX0JIonK9wg1efAec8MhZZVrSLie3SH/BBQEu4qeu8Gt5K+3L
BBuUG52L4U5vpC501xWOjlswEVZge92fwNpW7dLRhxvCoToHNy+mAppatUVRF4TmI0sBr5jQtLrB
WJTAt7keykXA6GK9XEU29BTO9Te9ohMQCU5/1TdBVza069s2p2w+q9yum0ejnWPA0OmRG7nWwhpv
+kfgTXjGqlrPPS+lOIFIeej7Fr9TP9szQeqYiU7DoY9THNNGBwsB2Qyxrkq4z72G08hosEa3IGv8
EgGunIFpVlZIdQVenc/SOcg/OgUPyetrGG/8yq1cwq92CmjWC7esNyDxiHW6qOebNiuD2AyeDJ2i
e91idYPfiHB8hYZNEai0O8e6B5XcVzlZOM3oSAQ553xVdQVZ3QTIJKlErVdWrz/H6biTVv9Yjaw7
6wQSVaVVFgZxiZ2xnACCTrM9ZlWW00WQFYvgxt4kEhHyflkcTwTeeXp8/vvn4Beuc7S7eCYDRH9/
fgANyHXpm/08uVb+YvHMGO48SqdTTG4gNXY3JdZguZ07PKwszm1qzysEd7N5Xc5Gt0eCl038CLca
j/hwg8VDEJXLbIj2mDYOC6W7ciHeOI5j3L0+fvniHivS48w+3ZQjmhN22MDW7BTb15hcapCVXeKt
Ys8E8Y4Jwx9WontZY3gR2w7/SES6/Jh3+JWWQXmNOSka5WTIJ5iP7+O39/s/ni5vs3cxyNOCrS7v
IiubNKfMfoa5eL9//XJ5t1frOOZtVNHcCHds9pRnI/Qgm8h4wmHgGHcy8vJZBeFVWOXBKpv3OGpC
C87jvLDGVeLTJCIDY7/gRUlJq7v4cpTjldp2xAzDDICSBMv1Nti6GEskA9CedDW9w4EqsPdPr++f
5z9N3QASCrePe4zDAVbdkRlFqiMTIh0TEcPMHp/ZZP95byUbgDJME8ngWxmanFcRGBOkQ4c+TwcI
Em63BdJa2he6owMyNAl5j6fKYVHycSI0kr6iiOJ49SmlC7PlApPWn26wJkfx+XqliK/mWJYuNiF2
CCuChAaL+QYrKjADYdurb7GFqxNulr4qNsvhhMY11IjWVhp6idnfldvVGjucFQU7v9c3RurgCSHT
qDu1Xsu5YNDcoFmcJwqVO93C8PzPCJiuyALvZ06LIJzjD35NmqtTKUnW2CfODIOZrxS+IRm8kceK
ctTc4/hiEC1+hOhHaLZX53wZdNs5OrMcYy83hyxONkwIvja58WER3qLcQyQNvjaQdqZ2VXJKRezU
Spm6djPHFFBFkZV2NKxxWTHegL7T1ghW2wBZj6xguHLhacnU4Q1Cf1yI7ExuExhmgWsJE8l2O782
qXRVoiOTMBa0dfg1ZAkz+bV+DLiRDIEesv65fN7hRUyZDd3OC/iwPxlPQbQ1G1rJHI1RuzGvLU03
gavtIWWNrCXGMcMtus0ZZhWgqdg1ghW6zYENb1dDFpV58QG33yzRIQqXemSHEW6pnAYcWX+0uw02
XYRw0HK57TCGC/AFUhPAVzcInJbrcIly4viwtBReez6bFZkjuwmmGTmGKAk3Z3zPe+zq2ppSCXec
sp/uqkPpepS9PP/KRPvrCyqi5U24Rlo6GbZtRL6zjXMjV6LFkHXlEBWR/uR7HOeUYruFg4cj++ni
pI+uwx8JNgwibcJVvnNslwHqADWOR3cTtGxIMBkCcDQqkRU0hXSwv9dtV1hVyjLsHijn5Q2a6Hcc
rSPSMBGIfnt2Uc4l1DhXHfvXPEDPEFLvb+bBAk3eN23LssHKihCJVwoWjWUC1BDSuuEKAeX2/MHM
+m69xvZWR4RzitshBN6FmwDlCGDf9BgiJpLN+qpgdob1gpyomwXGSnjQbYS6SwLDSjRtabj5/F0L
bUIvz28QiP26RnP1ziphK8zzwJCh4j5zXxXSu4oMWa6/vqAnDtXHtZfFPR9lKDZJx3So6i7PcDOE
JKNpkYE2h3uUSKJ9GjUWgbypt7qhmhz1Z8fdGhyszTftyXK52c4R45XEIIsBkitElOS57WLOfoaY
ottELU8v1USVfv/Afyrk73ML3NZ8BlYmWFydAOelke4pLrBxXXcj7idN5Zf9HuICcnchTdQJjGHQ
EPzeB+2e0a3eNJqwn0MjWW3eHnBPIEaTlGmJ0GgUPHFMEZNhZ8Rbd1DcIr0KdFGFN6LtqfHk7Zih
dq9jzqbKyYUFX9iDslixsdVOUKDWLyXEb7Ah9w7wmDSRA4whCZV+uko4z5vm1luao6uBmYgJQQhS
7D2xohYNmEpz/25oq8MbeAaBt5c/32f7f79dXn89zr58v7y9Gy+7xyzB10mn7+3a9A73Q6ddtMv1
KAxsQ6a666b4bXtvj1BhneTMJP+UDrfx7+F8ub1CxrR+nXJukZY5Je4ikMi41hPzSaD0zDGBanPb
cEqZOFY1DjynkferDSms+HQaIsSvhHUKPIavRoFqwxN+q4dH0sFrHLxFwOViY8YTkxiIwsnGO6+Z
+AaDcK2pgpbJIov1D5OuFzapScg20VaX9nSw2+skIiiU6V0lNkEMM99ebwAvjBfdopmctHJYyxOI
aIk1sgu3uqiigQMPeImDV1hrAYGLWBpFiInxCl8ykSnqkLqzYoVmOVZTDV5qeR2Eg7vuAJfnbT0g
SzXn7/jD+S1xUGR9BpWpdhBlQ9b4Mk4OQYi965f4ipF0QxQGK3fGJM79GkdYbN9CBWs82M5EVkRx
Qz7aLmx/Rpjn0oROIlO2njCleZYiFP11Cu47csBNioprrtC3gtMnSK6zT7s4icU2GzxZLozdep2m
ArLDACGTf4gQONvyY1IxSx+S8cP+KtGhj0RMr+jQfEDK35mIMfOP7TZcuWyAAVcocKCRA78Vf407
ralHHbLLGLit+86QCrgXfGmqmlJ0GJzofiLNzfPD68vjg5E2W4JUpTs6QDYVEJ4NwbXK6R0Fd1HM
SQwEJ/6upkqrTvc4BERlvu/gMJ7b11fTMU/S2qokycvQAlkxg8Elk5e0H/GLPOT3b39f3rG84RZG
feKcF5Dbk41GnmmN4U5+/IWbfk23L8HfCqQ5KiPlKLWrJWeJUY8VCyNgHSvIlRtrkE4Q1wvTLvZ3
4C+43sztZ4qY2jtqLS1bRGOQCpMbtDU8xMGmIi2KqKrPSGI44Qsx7OuuKXQBVMJN7lwXbBef62CD
hmzt2ywivrZxNXQghSeW4ok2eVXUph+fMAk8vXz+e0Zfvr9+xtzgwaWBqX5TwwWE50zTdl5xS1ui
lIxplfG8qVbyaeUP7LpLqKRUTp7miUJZIl0aRXEaoiZ26866rmznwfxK5fm5WZ7P3pq50XJt96Y+
FTaoTSIn4TZPRmYBxUNXCyjMh277K3ZKba60Tlp17erkxCQxxIFgs8ZOU2PZFA1lugFS7eS70DHt
fXOFoDzTK1gedi/0Nrti67JN7VaDH/KOv0dnk+mOhezUmKcSP6UEkch1h2Z7j9ryuCm5R0OuZyAX
+YCb3OAyMkkwfq2oviUiAg7NCXtVpUzlTnfqcxXRoW2QYVRD3N06KwrSBfpG5n+Br0MPMDayl1uY
lGYGUAUvux61ZMrXt+w40XPWqVJdqZktUtlLGWzJmrazdsjvtwtY7WVrXCuO0ADXPSW+6VGs+DTP
VHvHjpIOX5jj+gArtGflEzaEwRzhGWpeIMInROuAsV4vxSGjQlljfHUsGOVFXGuWXGhtaUAUmx/K
vTaywu4/LIAVtCe2mmShybQr03lyBLboiy5lXMcuBgcl4x6eQpBTN5xbDZR9cEJA8FdhUUPA1w4f
WDgBmoT4vgarnWkMB+t7bGut4TnGzoTytJlWb3gT2NexszpnJ2XP2qctTAGanKyEFHR5vrw+fp5x
5Ky5/3Lhbmvum25RGuyEuw7i19n1ThjBcYxz20MyWrZRu/VHTbOr57Yv1JNK4WUgwIjSjglA/U7z
0oeUpkClQeCxjBeG+ICpJSnai0k2PMmnqnJiSYsbpiaRk1vQJIn8VcNaUvUKt7PL15f3y7fXl8/I
DWkKMT3lkyIHNhBDjmWaQ1rlZDg2PePdRhn4KCVGLlHks6I5376+fUFa0rB1rjUCfnKLug3TP2Ug
+BbY8TAmDIDxc042WqGnlhotGqcIlJBTzt8fyTTB358fTo+vFxkKTb8FUrQq8pEoUJPZz/Tft/fL
11n9PCN/PX77ZfYGLsp/sqU8PTsUytfXp5cvDAyJV53BEbfHJKqOupeNhBa37F8Rk5VTG7XjOaDz
KjNEboErRxy64bDmiHayDlwe8GZCtoPxYm6U0njIBhDz2blkeCdqKFrVNf6aRxI1YcTL441126Sf
aTeBSNGGqZQjlmatmrf49eX+4fPLV7yTSsa3gotDHfx9i37ry4Gjn+JUAVCNFYzdQL8rAuWdm9+m
JPCHl9f8YDVuOgj6nJAhrZiejz2MBZFs1+taeNJETFplP6iKfiWb89FHhWvzf5Vn/2JgZ/y21Ot0
yIUnKlND/vnH1yOppBzK3VUlpmpSdHEglYtbm8vD4313+dv3WXUm+1hslbURyQy2D3B4HD6c2ggT
vyXroma+BYCWJQOizUebydt5+H7/xFaLvUxNkQC0ZPALSzBTq+CYjKcPZowuAacxFtmS44qCaMxf
PIpPwFm/aIzrGI45lLkHwxjy3vkuLRMP/+boE6koVazElL+MzYSOjnaKQpo1Id9jJ4U6v3etZgfQ
TvWEnf65mX2+HrUh/NiGTDCg4jGp8lgXHYQ5InXfFHg6NUW9cKjtj3Zo/FGu/Aqup9ja+fHp8dm7
y2Q25SPp0WWIFDab8anDt9+PHYKjClCC6Sxr04Nqtfw5270wwucXncNI1LCrjyobTl0lKax3jb1p
RGwJ8tTShq+QQQAsmUZHDxoe9NAm8pZmwmR+TO2WJzZnZAKvfPY7SFuh7LCGB+0IRU4jBIm39Ucg
Blh9oKpJ8wFJ0+hirUkyLvkk07SH9NyR6XVL+s/755dnFR8WiaYgyOFJ6SfrUbxNktHoZok6kkgC
+arRLldG52C52mCP5SaKxUK3wU9w/hYOR2yXLsL2dVbgrloZd1USLngaOxX4PTnS9rbb3mwW2H2n
JKDlaqVfT0qwCleHVMlQhEdTXaCp/Eom4Jsph6SpJ2kjT7wNQZDGeF4aKeIwUSLD4zbEXTAUTMjo
sDRKXT5EaZkbWQwYDEBoZVzx2jXom0Me8xvWsBWRHsQesBBVaTcQvFogyTO8++Dvt50PVYp/FI71
UtsfSbRlAkmStKzDul4lzEltY7zLF+a6rCQhjK8Gl6a10lo0sGdXyxACp2GNkZuatmYE1txjM7QM
d0Icaw+zz4xPu3FqGAa4gcaqiiHTXULBga6NgE7/uDDORTk+uGpc8gr82NtDk+Nvi0c61ogr1rr2
UxRwGuOgLMItaYqEfwRbg5Sxnblst6XudqS3O6S+td9Sp8ZpyNvDGEGCdT5BwzYBn2eEkOpEtwYD
tOrK/6vsSZbjyHW8z1co+jQT4deh0mbp4AMrk1WVrdyci6rkS4YsVdsVbUsKLdHP7+sH4JJJkGBO
z8VWAUjuBAESixvS1UwslgosZQniPXW8rKpyjYpdnWwwawy3TvFZzHTECsf+VI8tgGPumr5WNRKD
nCbMO5XGiG7zkbpyafCuXfCOXAq9lE3uJlAzUF9pImD8ldBkzhq/aVP+NUijYVgjRq0aXXbA5NZ8
Wl9Ngql2Mk4lMOg6WVwSs18FtjbhXmFaEdfp+kTDCeiariQ2fBo2vgT4CC0LV20wcUZKT8J2tAmb
L8cglWDFfIRsq6gX53MjCsIfPhfPUaCNeLTyLjPO2H5n7L6KwYd13jONRh8C/uUenxLNGlL3wuSJ
gaLxYjjgmfXm9qh9//qqBN2JYRqbeRrb1QGCUFBncG66aASbhaQO+aojSiailW01J/ZjEMt1MUaC
dT7R73HoNc+/GwP+KvOfjQ0CrypRmuBPEOwFruRLHZp4nmhY7/KALCRanAgvTGuIPEVrJOk312yq
3VphZ2tBIjX+SDllkY8UN85UpEx7rYMxXf1Sktt12bdzLcIHgrbxx398OMaxGGbrHsqWGbGyPTFW
K6nfJhWquRUdJ3mOeGY9mJb6faH91Q4ZQ1c1cFTyL4gunT+sLFEL+5r1fiBEInez+SFKCXZ4EfWZ
RoLW228HLN/dhKRq8woU3zXmESkoVyWtUec0W2qLgafKan6/WPnDq53Q6PNouGl2aA06OyeGtAFp
JrL/jIfNx3OlQOS9yi4WsCZ9YKuVwyKYJaOlcigZ2th37GHjkl2qEDNBxfVODCeXZaHCmftVjMgZ
3oI0XOuK+nR2kBUBVhprN75VB81FaO9GDbXAXRvSilqFoh2KtID1dEyxVSLzCo5K2aTSK0/JXFyn
zHvg57PjxdVs5/QV3exCVCS9iiMfGYGRoi3rdljJoquGG48VOaW4GoOHUpMYwVKXBLeXl8cXu5ld
2gj1KsQME6aAwvP4NDjfXKLxEkT92nnTM10L4pZO2yw8zkcSc2JxKC9wKuKMyJ/Wo9EbabxBK+6l
CCLtt/c8Qd1WxQyW6YjQBwqVB87rGxUWfW7JjHLYzHZ0aU5p/SOKO+EnncrLvUSb2Wlv08UptBWG
KHp2ToRnhtAbiy7bnB1/ZEUjpboDAn7EmIO6xV1cnQ31SU8L1rcEwdGRFpeLCw+urjyM5kU5MkjI
dVZLb/xUANsT6veojxTUcK6lLJbidia6akA6x0E0JYqdeN7FFuFEJXWsV1ec1XfP2sPXVU+pVO1U
i/e0Cf/GkjjjBj9QlCaKgAid+1zDV3sWlmlTRVIw+kaxqZtkVYV+8X7qsC5uKzRYqfkZ99Qx4auk
6pwLF3MTJVckk68mt0qDxMf7IqzO4qHAaJVo2uZViWeWrY8+1XxeYUVz7yfBdyPGa4TXVBQyVTNm
aPTuQ+NVNqK35RJBE/TXN6sLYAzxOsZXcvV9dLzQ4xYGdl27qqjAPOj1NA8Grv3iwwYpg56gGu3Y
uj16e7m7x1RlwWUctUrrCrRQ7dBJjpyvEwJNwzqKUEkTKKit+iaRzntwiBtjcpFOTPhV14iEGzLN
A2i0dAsb1h3vlDsStB1nvjyi4cRiy63ZB7IRPdnu2Dyq4ZA7l8TebYYFt8TPHX7abKVDWbF50JHE
5O+lkRodBEl868B9EwtEtV7GLQVbSjRP56475fhKBX+S50AzCi54ZATodlLncidHUwk3/HhotdLv
BpGuP16dOJoCAmmPETL6atpXb6bc8cQA1lA7/KnNqCkc/lZvZ5FgbW2eFeRiEwHmtZw8K6vYwPB3
KZOOh/ohrH3cZcGxppCqjBcPamsEqVpctcDXT6NtmHuRTjDjOW/kWZFo0ehOoaRzN5Wj9urwEh17
b4BqiawOP/ZH+gQnr4I3IJSnogN20aLvZ8u2BHFVm8E6SpyJkTs0W6QnqoUNS7T5hxXCe/Kgo/iA
FFnJBXfHbA5l0tzWmJPB3WGY8SjrbukWM8BoqPiJYtlnsHdAa87WpcD8YMRdWrv9T5DUB2Qa4EWU
XImRzjH/qdgbHUwOvGrPSK4SDRvoOOIxNLCWkxX0JRe3pIgJNjQyzRpcc/CfWyBHIvKtgNNoVeV5
tZ2tCrqeurnRHEwhO5FU9a3lRcnd/XfXKG/VJiLZSDplChRO2GTDrAvRd7qv+/eHp6M/YQEz61cZ
SLIDpU0nN1meNtJZRNeyIVlErFBoeXJR05lQgGn5c2xcUexE17lOQ/1advnSLdqAYJutiY1gsUqH
pIGD3PVrUf9Ny8JK4uFYjOWg/zfuK3QrkIW7OhqMwGDLshtVbS8eZAIyED+2P1ar9oSQW4g5u48D
+Bb2nNT5w5ivtujTjvuS7hyNb0EiEg1/GTmWoEacmQ9NgHdXmDoROAiwIWQkbVjPlzzjNSqNzr9w
J5fGNWibH5bY9MvIw6lpFmbtAHGk5K8IXaIa0x/G4qG6hBgWID4OimQlbkAqhP64LU4aUax4Bg0S
s1owvLqJCeJYYVx226q55pdhmdMf1vr702+H16fLy/Orfy1+c9EJtBu3ynB2+pF+OGI+npLAZxTH
+rIRkkvXUMTDnEQx59EqL8850xdKQt+0PNyCHW6PiLvI8UhOY42/OItiZrp1wTvDeERcJClCcnV6
Ean9KjoRV6exibg6u4r15aPXy6ytcH25fvbkg8VJtH5ALShKxdHhy1/w4BMefMqDI20/58EXPDjY
FhZxFZ3JsRPc/SshOIsVvuADmyLJdZVdDqwfnkX2fqmFSJANCZ6bWopEYgKHSMGaAMTrvqnoQClM
U4kuEyWDuW2yPHf1d4tZC5nTZ48R00jJWz1YiizBZLt83IORpuwz/qGODEnGJu21JCDZXmduwgtE
9N3KWf99mSU06bwGwMnUFKASfBF4Yo7eQK4MQjQJ7WGxv39/Obz9CuNyYc5Yd7DwN8ifn3vM0auE
QP6AkU2bwfFRdvhFA4IIfxB1Db6OpapYzghL6xCGwBUBQVnYgFQgGxEIBohUAn2WaCSnu8qk1yoH
SErKqqFrMlc7tQSuvLQCxQi1B309Qy9toKZEqRV4WGsrbaZa6y41VS/cIOJt8ek39P17ePr78cOv
u593H3483T08Hx4/vN79uYdyDg8fMPD1N5yrD1+f//xNT9/1/uVx/+Po+93Lw/4RL1ymaTQm+j+f
Xn4dHR4Pb4e7H4f/qFRz0xwnybARrVJjQJtsYAlnXRinnKUyGQhH9SpDgxa0eEL5iGrTI0rkuS09
clFFSLGKOB0aFYDykzjR4meJV7DJo7SjqwA7XBYdH+3RVtvfTuMY4mquRkXr5dfz29PR/dPL/ujp
5ej7/sezSsNLiEEUq93ATBoo8jXxQyTgkxAuRcoCQ9L2Oslqko3VQ4SfbEhuHgcYkjYk3tYIYwlH
8TJoeLQlItb467oOqa/d2y9bAmodIWkQg43Cww/MDYMjqbv0oNu3ymczHoLQ+0DuOvT498kp8Xq1
OLnUoespouxzHnjCtFH9x8bkMUPUdxtJ4zIaDBsev37/+uNw/6+/9r+O7tWC//Zy9/z9V7DOGxLB
RcPScF1J12NmhLGETcoU2RZsn/vmRp6cny+ugvaL97fv+8e3w/3d2/7hSD6qTsCuPvr78Pb9SLy+
Pt0fFCq9e7tzLzZs0TRRqo9es3lU7bcbOGHFyXFd5beL0+NzpuVCrjOM6BwvpJWf3aTu4/BsBDDF
G8uMlsrp/OfTg3v1Y5uxDMc8WS1DWBfukKQLuZdMwm/zZhvAKqaOmmvMjqkExAB0HwuX/cYZTW8s
MaFk1xdhg9EhxY7U5u71e2ygChE2buNlxLNtho7EJ+1Gf6QdYA7f9q9vYWVNcnrCTAyCwxHasVx6
mYtrebJkmqcxM8wG6ukWx6lrgm+XNFtVdNSL9IyBcXTnQ11zQ1lksJiV/Rn/Dm85TJHObhTEexar
I+LkPBLLcKTgfUTsHtyIRciKAGh6FCCgPg58vmBO7I04DYEFA+tA+FlS20zLudfN4oo3QzEU29qL
hadZncoEH24EIRmZRWKYEmYJVttVxq5NjWAC5dolKDB8UsbGOLQUOmYWibzv4DiOinA25ps5k2TL
fLRS/88NYCvyVsytEcvsmdJBmKg9+09/usM91G0rdlwNfBoWPZNPP59f9q+vVDOwXV7l9HLb8Owv
VQC7PAtXaP4lbB3ANuHK/9J2o59lc/f48PTzqHz/+XX/oiNXWMUlOATLNhuSumHfomwnmuXai5Hr
YjYc69YYjpspDHfeISIA/pGhuiPR7qi+DbAoK5qwIn7HLEo1It63kSwqvY8UWgKP1oNydyJuOMMW
n9QoFdGiZKlE3GqJBhC+V6vPmcScXIudH0z4BVdz+nH4+nIHmtrL0/vb4ZE5j/NsybIihJsDLgzH
H9KwOL1dnc/9Tk1E8Z4pmlH2nG3LRMai00g37bEL8nX2RX5azJHMVT8jgk4dnSTV+S6PB5xf1IZ7
xRTtbVFIvKBRdzto4Dk10UHW/TI3NG2/pGS78+OrIZGNuRaS5qncbUJ9nbSX+GZzg3gsJfqcjqQf
bdTzSFEflTqE5bArH1+wMR6H1E/p6h3NXFiFp+z+5Q3dvEHNeFXZG18P3x7v3t5f9kf33/f3fx0e
v7mR9PHZxr1Za8g7YIhvMW47xWp10xmv4PuAQj1ifTo7vrpwOinhj1Q0t35zuCs5XS5sOUxA2HbR
lk8Uii/gXzrwvH16/gejZYtcZiW2Dia97FaWu+RRtoKxzkUzqOdYakQtYpYQywykLox06gyhdVwC
gaxM6tth1SjLbJdtuyS5LCNYdMPtu8x9l0uqJiV24U1WSND1iyWJG6HvTYVzK4A5Omz6PocBJKDA
wulFQF7YaKDRmgC76ZMh6/qBFkAVFPjp3lNTOOxouby99CqcMJEg5JpENFsRPXmQYhm5qwfsBZcf
FOBnXlPYzLLZMtTOEuf2flTHHHvaMq0KZySYYkG2Gl/Fp7IQmsoQjk/jeGpS0e2LPiw8KEhyTMkI
5UoG2Y2lBomOh/PtA1mPIVdgjn73BcH+72FHk1kZqLJsjgSRMySZYKfYYElSognWbWAnMfVhzF5O
nTfoZfIH81FkmqfOw9gVzhUWQVQRuCNqWzahbshNjma73DAYFAhmFc1J5kCxVDd4+TJxpGDRYtAr
4CE3GHeucfOd4CNBVhHjbQ1S+UhIiiaEp24HS1W/yr8yANdbdxsPhwi04UeB0Y0eAmBobi4atLjd
KFHbaWyTbFRdKskM0q6qJmB1PJVOd+uTIBbGu2YqQ1RZlRYxFKTHiB1RdVXlFNXIgNpYejEYlLG9
3BQEPLhx4Np1rpeBQ/zZqX2dV0v6i2HJZU5NpMb1pfLPuqYJSf5l6IRTIrrbg2zo1FjUNDI3/Fil
TmVVlmJycTjdm1tmCmq0GidvICMKMGq4FHPBAPc5yFoMXa+T6w6rvG831sZtPA3hRE9lXTktqtGx
zymoWv4h1kSbwlfEcj0fgjGQLugTnpXmFPT55fD49pfKPvjwc//6LXyfTbR9+ZBX6xzEjHx8NPkY
pfjcZ7L7dDbOg5FigxLOnH7dFssKZWvZNKUo+AhF0caO9wuHH/t/vR1+GjnsVZHea/hL2DWjPxY9
XuFspBtnd9VAI4ataMpPi+OTs/9yhr/GeMbYYCKfNaCr6iCZLX8bv5EYcQPNJGHmc85I0Owp2Iz4
rl5kbSE6lyX6GNW8oSpz1yBVlQF8Ba37+1J/oJbncHqy5Om2Ulzje/qYeduKuf90QElMUrPO0v3X
92/f8PEye3x9e3n/uX98cy3OxTpTCZvdOB4OcHxB1XP06fjfC44KZNbMFTFDHD5O9Crn3KSCmM63
wXC0ioNt8V93bkcsPqopggItstlp9kryrfjGc0kdazCH1+uUnPb4m9NQR5aybAX69JZZh5l+hMvw
FM4tTBN3Xow7D73EkJjc3YhG+8GQNFQtqSLwGPeCwM6uBTr2aHMrmVHH6gN11byfj+VO60pZZIHm
KMuW2IXrwhDrn1EUYXlC8DKsCq62paskKVhdZW1VEjVyKhPYwsqHA1OX5M2KgKk9DUuBFgYza8+S
qcDQ3LxSMrTGjLUFXdA33iUcpQC2AVxjxkOBknujuyD7wSwEOFxz4Eh+m/4vOB7KSuDR1wSLi+Pj
4wjlaJ2xCiZnpFFWKG1C95Ph0MpypMczjbtlgJMkNTSyTP2DRRdxU4QQ9SJHZYQR1SzDZgC4XoOW
tebmeBIkNW3WdL1gtpdBRCdORyBTxi3hx9coAqHgn88sx0223vCOf86kq+FCj4EVMM3IiFv0PDsV
rStAeQgcYrr9jc2Rxoa3kxqLWwSlrrKa+G6aGt3RN+qZmJJ3rm90RCf94IpER9XT8+uHo/zp/q/3
Z320bu4ev1HfBYGBJdA+3fOT4fDoqdPDWemIVdWqQx+aHi9eOtiCVSR3hUIOG3Ql70TLGyluP4PE
AXJHWvEeGfOd0maAIEY8vKPs4PLuyayJQdNRRKZ2LWWt+a2+TEOzgumI+e/X58MjmhpAK36+v+3/
vYc/9m/3v//++/8492zoeqSKVGl2pvjqdlwbzPJp3I/IPZxCNGKriyiBU/PXcgqNWqS/nVFH7Tu5
k8ERYPOg+PAI+XarMUMLuwLUkE1Q07Yl5vUaqhrmbQOEgS4S7jyDiPIHrZhBC6SsuYpwcNWzkc2G
SuvEuDPoZBUE6p/6Fr+sapNV+L3Vgf4fi8KWp5xhUY9UTNXT1BRyginRG40H+7KVMgWOr6/XGCap
z75AhtG75S8tIT3cvd0doWh0j7fIJHKqGsmMkwdqBM9w3pZblhqlrVfJfa06psshFR1eIDRNbz3r
vP0daTEtP2lgTMoO5O/WblOQJViBTe+npPf3Hsoept92fiJrBSkxypwMrrsIifs5MzBIAtKaU5Jf
R+AsTbDyc8t5q7ltVBbAw1otMxCcsoqPWkBHytvzn43S1ng3R2VV6wY23uk3aoHzWGhVveFp0lvQ
yGGTr7w9oAvQu6ZQEiAMIL4OeCQYGA63iqIEcZmkFlMUiflQl+LMuGoORngdvLp1rQnllupqxPcm
0+Fxkd5LxQoC664b2m2GqrTfcacoo8m1W/d6rAYZvIAdAnom262gPnuT5VdkCMMTaBztcQ1hLjc8
/+w3vNssnW7+ZVAJpyGBQWOUSxCNp6ZOHyrZNvrhZpuLLuihWSFmFbTB7LalqNtNFU67Rdi7CW8K
lsBxMYKmzikd2INbuCiB2Ql8GdQfsDmE7RJXiyWcRnqp3N6W3SYgxUBiQJ+t14St6s7rRZiVf2gH
dcc7wa6dYSmhcYVoImExnfXIUnrViVzdYpt859PqMHPRCeCFdZQVOpW5pOwQ4MoO2CUZjBm22GIy
W3ZGHAVGR1gxNypTKvnnp7/3L8/37KFSJ6MB9FY2jfsuoV5izRYAyQakpgvnHhK/lEWfqwUTNRpR
rpcoCrt3sWTFw8jvYNQ4Zb5oM3wVVI8MceEGG4LcBSV4DCdxHeau2RUV5+KzxKSiiquR7YAdE03O
+MATmrpL+6Jmz6VwwN2L5W7/+oaiFkr8CYaAv/u2d7x8eq1Buj9t7h8fTAdTw+ROrRQWp84WKlta
+WZQk282XkZN/KqVOnXi9LyPlex0sJB/+oG+ahhbMLfUr5PKNaPWyieonAA2G5sapyI9zy3gFFUH
hdZOgmTo01qURfQZYW5eiRhcZG2LtaRV0heUKWoxeZnpYSLqsvce8b/J6c0YbuABAA==
--===============7672947424871527974==--

