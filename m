Content-Type: multipart/mixed; boundary="===============7032986590667755505=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/virt-dma.h:114:36: warning: use of uninitialized value '*vd.tx.chan' [CWE-457]
Date: Sat, 06 Aug 2022 23:52:01 +0800
Message-ID: <202208062314.x2YCeImu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7032986590667755505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/dma/virt-dma.h:114:36: warning: use of uninitialized value '*vd.tx=
.chan' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: d6905849f87596f94c2778c8337697df486de43c ARM: assembler: define a K=
config symbol for group relocation support
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220806/202208062314.x2YCeImu-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd6905849f87596f94c2778c8337697df486de43c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d6905849f87596f94c2778c8337697df486de43c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
       |   81 | #define _raw_spin_unlock_irq(lock)              __UNLOCK_IR=
Q(lock)
       |      |                                                 ^~~~~~~~~~~~
   include/linux/spinlock.h:275:41: note: in expansion of macro '_raw_spin_=
unlock_irq'
       |  275 | #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_ir=
q(lock)
       |      |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:399:9: note: in expansion of macro 'raw_spin_un=
lock_irq'
       |  399 |         raw_spin_unlock_irq(&lock->rlock);
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'vchan_complete': events 8-9
       |
       |drivers/dma/virt-dma.c:101:45:
       |  101 |         dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
       |      |         |                                   |
       |      |         |                                   (8) ...to here
       |      |         (9) calling 'dmaengine_desc_callback_invoke' from '=
vchan_complete'
       |
       +--> 'dmaengine_desc_callback_invoke': events 10-11
              |
              |drivers/dma/dmaengine.h:132:1:
              |  132 | dmaengine_desc_callback_invoke(struct dmaengine_desc=
_callback *cb,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (10) entry to 'dmaengine_desc_callback_invoke'
              |......
              |  140 |         if (cb->callback_result) {
              |      |            ~
              |      |            |
              |      |            (11) following 'false' branch...
              |
            'dmaengine_desc_callback_invoke': event 12
              |
              |cc1:
              | (12): ...to here
              |
            'dmaengine_desc_callback_invoke': event 13
              |
              |cc1:
              | (13): calling 'dmaengine_desc_callback_invoke.part.0' from =
'dmaengine_desc_callback_invoke'
              |
              +--> 'dmaengine_desc_callback_invoke.part.0': events 14-16
                     |
                     |  132 | dmaengine_desc_callback_invoke(struct dmaengi=
ne_desc_callback *cb,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (14) entry to 'dmaengine_desc_callback_invoke=
.part.0'
                     |......
                     |  144 |         } else if (cb->callback) {
                     |      |                   ~
                     |      |                   |
                     |      |                   (15) following 'false' bran=
ch...
                     |......
                     |  147 | }
                     |      | ~
                     |      | |
                     |      | (16) ...to here
                     |
              <------+
              |
            'dmaengine_desc_callback_invoke': event 17
              |
              |cc1:
              | (17): returning to 'dmaengine_desc_callback_invoke' from 'd=
maengine_desc_callback_invoke.part.0'
              |
       <------+
       |
     'vchan_complete': event 18
       |
       |drivers/dma/virt-dma.c:101:9:
       |  101 |         dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (18) returning to 'vchan_complete' from 'dmaengine_=
desc_callback_invoke'
       |
     'vchan_complete': event 19
       |
       |include/linux/list.h:719:14:
       |  719 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (19) following 'true' branch...
   drivers/dma/virt-dma.c:103:9: note: in expansion of macro 'list_for_each=
_entry_safe'
       |  103 |         list_for_each_entry_safe(vd, _vd, &head, node) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
     'vchan_complete': events 20-21
       |
       |drivers/dma/dmaengine.h:117:26:
       |  117 |         cb->callback =3D tx->callback;
       |      |                        ~~^~~~~~~~~~
       |      |                          |
       |      |                          (20) ...to here
       |  118 |         cb->callback_result =3D tx->callback_result;
       |  119 |         cb->callback_param =3D tx->callback_param;
       |      |                              ~~~~~~~~~~~~~~~~~~
       |      |                                |
       |      |                                (21) use of uninitialized va=
lue '*(struct dma_async_tx_descriptor *)vd.callback_param' here
       |
   drivers/dma/virt-dma.h: In function 'vchan_vdesc_fini':
>> drivers/dma/virt-dma.h:114:36: warning: use of uninitialized value '*vd.=
tx.chan' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     114 |         struct virt_dma_chan *vc =3D to_virt_chan(vd->tx.chan);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
     'vchan_complete': event 1
       |
       |drivers/dma/virt-dma.c:83:13:
       |   83 | static void vchan_complete(struct tasklet_struct *t)
       |      |             ^~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'vchan_complete'
       |
     'vchan_complete': event 2
       |
       |   88 |         LIST_HEAD(head);
       |      |                   ^~~~
       |      |                   |
       |      |                   (2) region created on stack here
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
       |   26 |         struct list_head name =3D LIST_HEAD_INIT(name)
       |      |                          ^~~~
       |
     'vchan_complete': event 3
       |
       |  500 |         if (!list_empty(list)) {
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch...
       |
     'vchan_complete': events 4-5
       |
       |drivers/dma/virt-dma.c:92:12:
       |   92 |         vd =3D vc->cyclic;
       |      |         ~~~^~~~~~~~~~~~
       |      |            |
       |      |            (4) ...to here
       |   93 |         if (vd) {
       |      |            ~
       |      |            |
       |      |            (5) following 'true' branch (when 'vd' is non-NU=
LL)...
       |
     'vchan_complete': event 6
       |
       |   94 |                 vc->cyclic =3D NULL;
       |
     'vchan_complete': event 7
       |
       |include/linux/preempt.h:221:12:
       |  221 |         if (unlikely(preempt_count_dec_and_test())) \
       |      |            ^
       |      |            |
       |      |            (7) following 'false' branch...
   include/linux/spinlock_api_up.h:46:8: note: in expansion of macro 'preem=
pt_enable'
       |   46 |   do { preempt_enable(); ___UNLOCK(lock); } while (0)
       |      |        ^~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:53:28: note: in expansion of macro '__UN=
LOCK'
       |   53 |   do { local_irq_enable(); __UNLOCK(lock); } while (0)
       |      |                            ^~~~~~~~
   include/linux/spinlock_api_up.h:81:49: note: in expansion of macro '__UN=
LOCK_IRQ'
       |   81 | #define _raw_spin_unlock_irq(lock)              __UNLOCK_IR=
Q(lock)
       |      |                                                 ^~~~~~~~~~~~
   include/linux/spinlock.h:275:41: note: in expansion of macro '_raw_spin_=
unlock_irq'
       |  275 | #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_ir=
q(lock)
       |      |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:399:9: note: in expansion of macro 'raw_spin_un=
lock_irq'
       |  399 |         raw_spin_unlock_irq(&lock->rlock);
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'vchan_complete': events 8-9
       |
       |drivers/dma/virt-dma.c:101:45:
       |  101 |         dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
       |      |         |                                   |
       |      |         |                                   (8) ...to here
       |      |         (9) calling 'dmaengine_desc_callback_invoke' from '=
vchan_complete'
       |
       +--> 'dmaengine_desc_callback_invoke': events 10-11
              |
              |drivers/dma/dmaengine.h:132:1:
              |  132 | dmaengine_desc_callback_invoke(struct dmaengine_desc=
_callback *cb,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (10) entry to 'dmaengine_desc_callback_invoke'
              |......
              |  140 |         if (cb->callback_result) {
              |      |            ~
              |      |            |
              |      |            (11) following 'false' branch...
              |
            'dmaengine_desc_callback_invoke': event 12
              |
              |cc1:
              | (12): ...to here
              |
            'dmaengine_desc_callback_invoke': event 13
              |
              |cc1:
              | (13): calling 'dmaengine_desc_callback_invoke.part.0' from =
'dmaengine_desc_callback_invoke'
              |
              +--> 'dmaengine_desc_callback_invoke.part.0': events 14-16
                     |
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from drivers/dma/dw/core.c:10:
   drivers/dma/dw/../dmaengine.h: In function 'dma_cookie_complete':
>> drivers/dma/dw/../dmaengine.h:54:18: warning: use of uninitialized value=
 '*tx.cookie' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      54 |         BUG_ON(tx->cookie < DMA_MIN_COOKIE);
         |                ~~^~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/dma/dw/../dmaengine.h:54:9: note: in expansion of macro 'BUG_ON'
      54 |         BUG_ON(tx->cookie < DMA_MIN_COOKIE);
         |         ^~~~~~
     'dwc_handle_error': events 1-2
       |
       |drivers/dma/dw/core.c:423:13:
       |  423 | static void dwc_handle_error(struct dw_dma *dw, struct dw_d=
ma_chan *dwc)
       |      |             ^~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'dwc_handle_error'
       |......
       |  429 |         dwc_scan_descriptors(dw, dwc);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'dwc_scan_descriptors' from 'dwc_handle=
_error'
       |
       +--> 'dwc_scan_descriptors': events 3-4
              |
              |  300 | static void dwc_scan_descriptors(struct dw_dma *dw, =
struct dw_dma_chan *dwc)
              |      |             ^~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'dwc_scan_descriptors'
              |......
              |  312 |         if (status_xfer & dwc->mask) {
              |      |            ~ =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'dwc_scan_descriptors': event 5
              |
              |drivers/dma/dw/regs.h:352:23:
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (5) ...to here
   arch/arm/include/asm/io.h:300:75: note: in definition of macro 'writel_r=
elaxed'
              |  300 | #define writel_relaxed(v,c)     __raw_writel((__forc=
e u32) cpu_to_le32(v),c)
              |      |                                                     =
                      ^
   drivers/dma/dw/regs.h:352:9: note: in expansion of macro 'writel'
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |         ^~~~~~
   drivers/dma/dw/core.c:314:17: note: in expansion of macro 'dma_writel'
              |  314 |                 dma_writel(dw, CLEAR.XFER, dwc->mask=
);
              |      |                 ^~~~~~~~~~
              |
            'dwc_scan_descriptors': events 6-8
              |
              |  316 |                 if (test_bit(DW_DMA_IS_SOFT_LLP, &dw=
c->flags)) {
              |      |                    ^
              |      |                    |
              |      |                    (6) following 'true' branch...
              |  317 |                         struct list_head *head, *act=
ive =3D dwc->tx_node_active;
              |      |                                                  ~~~=
~~~
              |      |                                                  |
              |      |                                                  (7)=
 ...to here
              |......
              |  326 |                         if (active !=3D head) {
              |      |                            ~
              |      |                            |
              |      |                            (8) following 'false' bra=
nch (when 'active =3D=3D head')...
              |
            'dwc_scan_descriptors': event 9
              |
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                                                     =
  ^~~~~~~~~~~
              |      |                                                     =
  |
              |      |                                                     =
  (9) ...to here
   arch/arm/include/asm/bitops.h:181:59: note: in definition of macro 'ATOM=
IC_BITOP'
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |                                                     =
      ^
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
            'dwc_scan_descriptors': event 10
              |
              |arch/arm/include/asm/bitops.h:181:62:
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~~~~~~~~~~~~~
              |      |                                                     =
         |
              |      |                                                     =
         (10) calling '____atomic_clear_bit' from 'dwc_scan_descriptors'
   arch/arm/include/asm/bitops.h:190:41: note: in expansion of macro 'ATOMI=
C_BITOP'
              |  190 | #define clear_bit(nr,p)                 ATOMIC_BITOP=
(clear_bit,nr,p)
              |      |                                         ^~~~~~~~~~~~
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
              +--> '____atomic_clear_bit': event 11
                     |
                     |arch/arm/include/asm/bitops.h:48:20:
                     |   48 | static inline void ____atomic_clear_bit(unsig=
ned int bit, volatile unsigned long *p)
                     |      |                    ^~~~~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (11) entry to '____atomic_=
clear_bit'
--
   include/linux/list.h:513:9: note: in expansion of macro 'container_of'
                     |  513 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   include/linux/list.h:524:9: note: in expansion of macro 'list_entry'
                     |  524 |         list_entry((ptr)->next, type, member)
                     |      |         ^~~~~~~~~~
   include/linux/list.h:717:20: note: in expansion of macro 'list_first_ent=
ry'
                     |  717 |         for (pos =3D list_first_entry(head, t=
ypeof(*pos), member),        \
                     |      |                    ^~~~~~~~~~~~~~~~
   drivers/dma/dw/core.c:286:9: note: in expansion of macro 'list_for_each_=
entry_safe'
                     |  286 |         list_for_each_entry_safe(desc, _desc,=
 &list, desc_node)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'dwc_complete_all': event 35
                     |
                     |include/linux/list.h:719:14:
                     |  719 |              !list_entry_is_head(pos, head, m=
ember);                    \
                     |      |              ^
                     |      |              |
                     |      |              (35) following 'true' branch...
   drivers/dma/dw/core.c:286:9: note: in expansion of macro 'list_for_each_=
entry_safe'
                     |  286 |         list_for_each_entry_safe(desc, _desc,=
 &list, desc_node)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'dwc_complete_all': events 36-37
                     |
                     |  287 |                 dwc_descriptor_complete(dwc, =
desc, true);
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |                 |
                     |      |                 (36) ...to here
                     |      |                 (37) calling 'dwc_descriptor_=
complete' from 'dwc_complete_all'
                     |
                     +--> 'dwc_descriptor_complete': event 38
                            |
                            |  235 | dwc_descriptor_complete(struct dw_dma_=
chan *dwc, struct dw_desc *desc,
                            |      | ^~~~~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (38) entry to 'dwc_descriptor_complete'
                            |
                          'dwc_descriptor_complete': event 39
                            |
                            |include/linux/dynamic_debug.h:133:12:
                            |  133 |         if (DYNAMIC_DEBUG_BRANCH(id)) =
                  \
                            |      |            ^
                            |      |            |
                            |      |            (39) following 'false' bran=
ch...
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dyna=
mic_func_call'
                            |  152 |         __dynamic_func_call(__UNIQUE_I=
D(ddebug), fmt, func, ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynam=
ic_func_call'
                            |  166 |         _dynamic_func_call(fmt,__dynam=
ic_dev_dbg,               \
                            |      |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
                            |  155 |         dynamic_dev_dbg(dev, dev_fmt(f=
mt), ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:257:25: note: in expansion of macro 'dev_dbg'
                            |  257 | #define dev_vdbg        dev_dbg
                            |      |                         ^~~~~~~
   drivers/dma/dw/core.c:243:9: note: in expansion of macro 'dev_vdbg'
                            |  243 |         dev_vdbg(chan2dev(&dwc->chan),=
 "descriptor %u complete\n", txd->cookie);
                            |      |         ^~~~~~~~
                            |
                          'dwc_descriptor_complete': event 40
                            |
                            |arch/arm/include/asm/irqflags.h:76:9:
                            |   76 |         asm volatile(
                            |      |         ^~~
                            |      |         |
                            |      |         (40) ...to here
                            |
                          'dwc_descriptor_complete': event 41
                            |
                            |drivers/dma/dw/core.c:246:9:
                            |  246 |         dma_cookie_complete(txd);
                            |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                            |      |         |
                            |      |         (41) calling 'dma_cookie_compl=
ete' from 'dwc_descriptor_complete'
                            |
                            +--> 'dma_cookie_complete': event 42
                                   |
                                   |drivers/dma/dw/../dmaengine.h:52:20:
                                   |   52 | static inline void dma_cookie_c=
omplete(struct dma_async_tx_descriptor *tx)
                                   |      |                    ^~~~~~~~~~~~=
~~~~~~~
                                   |      |                    |
                                   |      |                    (42) entry t=
o 'dma_cookie_complete'
                                   |
                                 'dma_cookie_complete': event 43
                                   |
                                   |   54 |         BUG_ON(tx->cookie < DMA=
_MIN_COOKIE);
                                   |      |                ~~^~~~~~~~
                                   |      |                  |
                                   |      |                  (43) use of un=
initialized value '*tx.cookie' here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
                                   |   78 | # define unlikely(x)    __built=
in_expect(!!(x), 0)
                                   |      |                                =
             ^
   drivers/dma/dw/../dmaengine.h:54:9: note: in expansion of macro 'BUG_ON'
                                   |   54 |         BUG_ON(tx->cookie < DMA=
_MIN_COOKIE);
                                   |      |         ^~~~~~
                                   |
   In file included from drivers/dma/dw/core.c:24:
>> drivers/dma/dw/../dmaengine.h:55:11: warning: use of uninitialized value=
 '*tx.chan' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      55 |         tx->chan->completed_cookie =3D tx->cookie;
         |         ~~^~~~~~
     'dwc_handle_error': events 1-2
       |
       |drivers/dma/dw/core.c:423:13:
       |  423 | static void dwc_handle_error(struct dw_dma *dw, struct dw_d=
ma_chan *dwc)
       |      |             ^~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'dwc_handle_error'
       |......
       |  429 |         dwc_scan_descriptors(dw, dwc);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'dwc_scan_descriptors' from 'dwc_handle=
_error'
       |
       +--> 'dwc_scan_descriptors': events 3-4
              |
              |  300 | static void dwc_scan_descriptors(struct dw_dma *dw, =
struct dw_dma_chan *dwc)
              |      |             ^~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'dwc_scan_descriptors'
              |......
              |  312 |         if (status_xfer & dwc->mask) {
              |      |            ~ =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'dwc_scan_descriptors': event 5
              |
              |drivers/dma/dw/regs.h:352:23:
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (5) ...to here
   arch/arm/include/asm/io.h:300:75: note: in definition of macro 'writel_r=
elaxed'
              |  300 | #define writel_relaxed(v,c)     __raw_writel((__forc=
e u32) cpu_to_le32(v),c)
              |      |                                                     =
                      ^
   drivers/dma/dw/regs.h:352:9: note: in expansion of macro 'writel'
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |         ^~~~~~
   drivers/dma/dw/core.c:314:17: note: in expansion of macro 'dma_writel'
              |  314 |                 dma_writel(dw, CLEAR.XFER, dwc->mask=
);
              |      |                 ^~~~~~~~~~
              |
            'dwc_scan_descriptors': events 6-8
              |
              |  316 |                 if (test_bit(DW_DMA_IS_SOFT_LLP, &dw=
c->flags)) {
              |      |                    ^
              |      |                    |
              |      |                    (6) following 'true' branch...
              |  317 |                         struct list_head *head, *act=
ive =3D dwc->tx_node_active;
              |      |                                                  ~~~=
~~~
              |      |                                                  |
              |      |                                                  (7)=
 ...to here
              |......
              |  326 |                         if (active !=3D head) {
              |      |                            ~
              |      |                            |
              |      |                            (8) following 'false' bra=
nch (when 'active =3D=3D head')...
              |
            'dwc_scan_descriptors': event 9
              |
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                                                     =
  ^~~~~~~~~~~
              |      |                                                     =
  |
              |      |                                                     =
  (9) ...to here
   arch/arm/include/asm/bitops.h:181:59: note: in definition of macro 'ATOM=
IC_BITOP'
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |                                                     =
      ^
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
            'dwc_scan_descriptors': event 10
              |
              |arch/arm/include/asm/bitops.h:181:62:
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~~~~~~~~~~~~~
              |      |                                                     =
         |
              |      |                                                     =
         (10) calling '____atomic_clear_bit' from 'dwc_scan_descriptors'
   arch/arm/include/asm/bitops.h:190:41: note: in expansion of macro 'ATOMI=
C_BITOP'
              |  190 | #define clear_bit(nr,p)                 ATOMIC_BITOP=
(clear_bit,nr,p)
              |      |                                         ^~~~~~~~~~~~
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
              +--> '____atomic_clear_bit': event 11
                     |
                     |arch/arm/include/asm/bitops.h:48:20:
                     |   48 | static inline void ____atomic_clear_bit(unsig=
ned int bit, volatile unsigned long *p)
                     |      |                    ^~~~~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (11) entry to '____atomic_=
clear_bit'
                     |
                   '____atomic_clear_bit': event 12
                     |
                     |include/linux/irqflags.h:156:20:
                     |  156 |                 if (unlikely(!arch_irqs_disab=
led()))    \
                     |      |                    ^
--
                     |
                   'dwc_complete_all': events 36-37
                     |
                     |  287 |                 dwc_descriptor_complete(dwc, =
desc, true);
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |                 |
                     |      |                 (36) ...to here
                     |      |                 (37) calling 'dwc_descriptor_=
complete' from 'dwc_complete_all'
                     |
                     +--> 'dwc_descriptor_complete': event 38
                            |
                            |  235 | dwc_descriptor_complete(struct dw_dma_=
chan *dwc, struct dw_desc *desc,
                            |      | ^~~~~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (38) entry to 'dwc_descriptor_complete'
                            |
                          'dwc_descriptor_complete': event 39
                            |
                            |include/linux/dynamic_debug.h:133:12:
                            |  133 |         if (DYNAMIC_DEBUG_BRANCH(id)) =
                  \
                            |      |            ^
                            |      |            |
                            |      |            (39) following 'false' bran=
ch...
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dyna=
mic_func_call'
                            |  152 |         __dynamic_func_call(__UNIQUE_I=
D(ddebug), fmt, func, ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynam=
ic_func_call'
                            |  166 |         _dynamic_func_call(fmt,__dynam=
ic_dev_dbg,               \
                            |      |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
                            |  155 |         dynamic_dev_dbg(dev, dev_fmt(f=
mt), ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:257:25: note: in expansion of macro 'dev_dbg'
                            |  257 | #define dev_vdbg        dev_dbg
                            |      |                         ^~~~~~~
   drivers/dma/dw/core.c:243:9: note: in expansion of macro 'dev_vdbg'
                            |  243 |         dev_vdbg(chan2dev(&dwc->chan),=
 "descriptor %u complete\n", txd->cookie);
                            |      |         ^~~~~~~~
                            |
                          'dwc_descriptor_complete': event 40
                            |
                            |arch/arm/include/asm/irqflags.h:76:9:
                            |   76 |         asm volatile(
                            |      |         ^~~
                            |      |         |
                            |      |         (40) ...to here
                            |
                          'dwc_descriptor_complete': event 41
                            |
                            |drivers/dma/dw/core.c:246:9:
                            |  246 |         dma_cookie_complete(txd);
                            |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                            |      |         |
                            |      |         (41) calling 'dma_cookie_compl=
ete' from 'dwc_descriptor_complete'
                            |
                            +--> 'dma_cookie_complete': event 42
                                   |
                                   |drivers/dma/dw/../dmaengine.h:52:20:
                                   |   52 | static inline void dma_cookie_c=
omplete(struct dma_async_tx_descriptor *tx)
                                   |      |                    ^~~~~~~~~~~~=
~~~~~~~
                                   |      |                    |
                                   |      |                    (42) entry t=
o 'dma_cookie_complete'
                                   |
                                 'dma_cookie_complete': event 43
                                   |
                                   |include/asm-generic/bug.h:65:35:
                                   |   65 | #define BUG_ON(condition) do { =
if (unlikely(condition)) BUG(); } while (0)
                                   |      |                                =
   ^
                                   |      |                                =
   |
                                   |      |                                =
   (43) following 'false' branch...
   drivers/dma/dw/../dmaengine.h:54:9: note: in expansion of macro 'BUG_ON'
                                   |   54 |         BUG_ON(tx->cookie < DMA=
_MIN_COOKIE);
                                   |      |         ^~~~~~
                                   |
                                 'dma_cookie_complete': events 44-45
                                   |
                                   |   55 |         tx->chan->completed_coo=
kie =3D tx->cookie;
                                   |      |         ~~^~~~~~
                                   |      |           |
                                   |      |           (44) ...to here
                                   |      |           (45) use of uninitial=
ized value '*tx.chan' here
                                   |
   In file included from include/linux/printk.h:555,
                    from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from drivers/dma/dw/core.c:12:
   drivers/dma/dw/core.c: In function 'dwc_descriptor_complete':
>> include/linux/dynamic_debug.h:166:32: warning: use of uninitialized valu=
e '*(struct dma_async_tx_descriptor *)((char *)desc + 44).cookie' [CWE-457]=
 [-Wanalyzer-use-of-uninitialized-value]
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |                                ^
   include/linux/dynamic_debug.h:134:17: note: in definition of macro '__dy=
namic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                 ^~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynam=
ic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:257:25: note: in expansion of macro 'dev_dbg'
     257 | #define dev_vdbg        dev_dbg
         |                         ^~~~~~~
   drivers/dma/dw/core.c:243:9: note: in expansion of macro 'dev_vdbg'
     243 |         dev_vdbg(chan2dev(&dwc->chan), "descriptor %u complete\n=
", txd->cookie);
         |         ^~~~~~~~
     'dwc_handle_error': events 1-2
       |
       |  423 | static void dwc_handle_error(struct dw_dma *dw, struct dw_d=
ma_chan *dwc)
       |      |             ^~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'dwc_handle_error'
       |......
       |  429 |         dwc_scan_descriptors(dw, dwc);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'dwc_scan_descriptors' from 'dwc_handle=
_error'
       |
       +--> 'dwc_scan_descriptors': events 3-4
              |
              |  300 | static void dwc_scan_descriptors(struct dw_dma *dw, =
struct dw_dma_chan *dwc)
              |      |             ^~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'dwc_scan_descriptors'
              |......
              |  312 |         if (status_xfer & dwc->mask) {
              |      |            ~ =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'dwc_scan_descriptors': event 5
              |
              |drivers/dma/dw/regs.h:352:23:
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (5) ...to here
   arch/arm/include/asm/io.h:300:75: note: in definition of macro 'writel_r=
elaxed'
              |  300 | #define writel_relaxed(v,c)     __raw_writel((__forc=
e u32) cpu_to_le32(v),c)
              |      |                                                     =
                      ^
   drivers/dma/dw/regs.h:352:9: note: in expansion of macro 'writel'
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |         ^~~~~~
   drivers/dma/dw/core.c:314:17: note: in expansion of macro 'dma_writel'
              |  314 |                 dma_writel(dw, CLEAR.XFER, dwc->mask=
);
              |      |                 ^~~~~~~~~~
              |
            'dwc_scan_descriptors': events 6-8
              |
              |  316 |                 if (test_bit(DW_DMA_IS_SOFT_LLP, &dw=
c->flags)) {
              |      |                    ^
              |      |                    |
              |      |                    (6) following 'true' branch...
              |  317 |                         struct list_head *head, *act=
ive =3D dwc->tx_node_active;
              |      |                                                  ~~~=
~~~
              |      |                                                  |
              |      |                                                  (7)=
 ...to here
              |......
              |  326 |                         if (active !=3D head) {
              |      |                            ~
              |      |                            |
              |      |                            (8) following 'false' bra=
nch (when 'active =3D=3D head')...
              |
            'dwc_scan_descriptors': event 9
              |
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                                                     =
  ^~~~~~~~~~~
              |      |                                                     =
  |
              |      |                                                     =
  (9) ...to here
   arch/arm/include/asm/bitops.h:181:59: note: in definition of macro 'ATOM=
IC_BITOP'
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |                                                     =
      ^
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
            'dwc_scan_descriptors': event 10
              |
              |arch/arm/include/asm/bitops.h:181:62:
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~~~~~~~~~~~~~
              |      |                                                     =
         |
              |      |                                                     =
         (10) calling '____atomic_clear_bit' from 'dwc_scan_descriptors'
   arch/arm/include/asm/bitops.h:190:41: note: in expansion of macro 'ATOMI=
C_BITOP'
              |  190 | #define clear_bit(nr,p)                 ATOMIC_BITOP=
(clear_bit,nr,p)
              |      |                                         ^~~~~~~~~~~~
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
--
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (34) ...to here
   include/linux/list.h:513:9: note: in expansion of macro 'container_of'
                     |  513 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   include/linux/list.h:524:9: note: in expansion of macro 'list_entry'
                     |  524 |         list_entry((ptr)->next, type, member)
                     |      |         ^~~~~~~~~~
   include/linux/list.h:717:20: note: in expansion of macro 'list_first_ent=
ry'
                     |  717 |         for (pos =3D list_first_entry(head, t=
ypeof(*pos), member),        \
                     |      |                    ^~~~~~~~~~~~~~~~
   drivers/dma/dw/core.c:286:9: note: in expansion of macro 'list_for_each_=
entry_safe'
                     |  286 |         list_for_each_entry_safe(desc, _desc,=
 &list, desc_node)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'dwc_complete_all': event 35
                     |
                     |include/linux/list.h:719:14:
                     |  719 |              !list_entry_is_head(pos, head, m=
ember);                    \
                     |      |              ^
                     |      |              |
                     |      |              (35) following 'true' branch...
   drivers/dma/dw/core.c:286:9: note: in expansion of macro 'list_for_each_=
entry_safe'
                     |  286 |         list_for_each_entry_safe(desc, _desc,=
 &list, desc_node)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'dwc_complete_all': events 36-37
                     |
                     |  287 |                 dwc_descriptor_complete(dwc, =
desc, true);
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |                 |
                     |      |                 (36) ...to here
                     |      |                 (37) calling 'dwc_descriptor_=
complete' from 'dwc_complete_all'
                     |
                     +--> 'dwc_descriptor_complete': event 38
                            |
                            |  235 | dwc_descriptor_complete(struct dw_dma_=
chan *dwc, struct dw_desc *desc,
                            |      | ^~~~~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (38) entry to 'dwc_descriptor_complete'
                            |
                          'dwc_descriptor_complete': event 39
                            |
                            |include/linux/dynamic_debug.h:133:12:
                            |  133 |         if (DYNAMIC_DEBUG_BRANCH(id)) =
                  \
                            |      |            ^
                            |      |            |
                            |      |            (39) following 'true' branc=
h...
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dyna=
mic_func_call'
                            |  152 |         __dynamic_func_call(__UNIQUE_I=
D(ddebug), fmt, func, ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynam=
ic_func_call'
                            |  166 |         _dynamic_func_call(fmt,__dynam=
ic_dev_dbg,               \
                            |      |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
                            |  155 |         dynamic_dev_dbg(dev, dev_fmt(f=
mt), ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:257:25: note: in expansion of macro 'dev_dbg'
                            |  257 | #define dev_vdbg        dev_dbg
                            |      |                         ^~~~~~~
   drivers/dma/dw/core.c:243:9: note: in expansion of macro 'dev_vdbg'
                            |  243 |         dev_vdbg(chan2dev(&dwc->chan),=
 "descriptor %u complete\n", txd->cookie);
                            |      |         ^~~~~~~~
                            |
                          'dwc_descriptor_complete': event 40
                            |
                            |   48 |         return &chan->dev->device;
                            |      |                 ~~~~^~~~~
                            |      |                     |
                            |      |                     (40) ...to here
                            |
                          'dwc_descriptor_complete': event 41
                            |
                            |include/linux/dynamic_debug.h:166:32:
                            |  166 |         _dynamic_func_call(fmt,__dynam=
ic_dev_dbg,               \
                            |      |                                ^
                            |      |                                |
                            |      |                                (41) us=
e of uninitialized value '*(struct dma_async_tx_descriptor *)((char *)desc =
+ 44).cookie' here
   include/linux/dynamic_debug.h:134:17: note: in definition of macro '__dy=
namic_func_call'
                            |  134 |                 func(&id, ##__VA_ARGS_=
_);               \
                            |      |                 ^~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynam=
ic_func_call'
                            |  166 |         _dynamic_func_call(fmt,__dynam=
ic_dev_dbg,               \
                            |      |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
                            |  155 |         dynamic_dev_dbg(dev, dev_fmt(f=
mt), ##__VA_ARGS__)
                            |      |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:257:25: note: in expansion of macro 'dev_dbg'
                            |  257 | #define dev_vdbg        dev_dbg
                            |      |                         ^~~~~~~
   drivers/dma/dw/core.c:243:9: note: in expansion of macro 'dev_vdbg'
                            |  243 |         dev_vdbg(chan2dev(&dwc->chan),=
 "descriptor %u complete\n", txd->cookie);
                            |      |         ^~~~~~~~
                            |
   In file included from include/linux/list.h:5,
                    from include/linux/rculist.h:10:
   drivers/dma/dw/core.c: In function 'dwc_complete_all':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct dw_desc *)((char *)__mptr + 4))[38347922].desc_node.next' [CWE-45=
7] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:513:9: note: in expansion of macro 'container_of'
     513 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:557:9: note: in expansion of macro 'list_entry'
     557 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:718:21: note: in expansion of macro 'list_next_entr=
y'
     718 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   drivers/dma/dw/core.c:286:9: note: in expansion of macro 'list_for_each_=
entry_safe'
     286 |         list_for_each_entry_safe(desc, _desc, &list, desc_node)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'dwc_handle_error': events 1-2
       |
       |  423 | static void dwc_handle_error(struct dw_dma *dw, struct dw_d=
ma_chan *dwc)
       |      |             ^~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'dwc_handle_error'
       |......
       |  429 |         dwc_scan_descriptors(dw, dwc);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'dwc_scan_descriptors' from 'dwc_handle=
_error'
       |
       +--> 'dwc_scan_descriptors': events 3-4
              |
              |  300 | static void dwc_scan_descriptors(struct dw_dma *dw, =
struct dw_dma_chan *dwc)
              |      |             ^~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'dwc_scan_descriptors'
              |......
              |  312 |         if (status_xfer & dwc->mask) {
              |      |            ~ =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'dwc_scan_descriptors': event 5
              |
              |drivers/dma/dw/regs.h:352:23:
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (5) ...to here
   arch/arm/include/asm/io.h:300:75: note: in definition of macro 'writel_r=
elaxed'
              |  300 | #define writel_relaxed(v,c)     __raw_writel((__forc=
e u32) cpu_to_le32(v),c)
              |      |                                                     =
                      ^
   drivers/dma/dw/regs.h:352:9: note: in expansion of macro 'writel'
              |  352 |         writel((val), &(__dw_regs(dw)->name))
              |      |         ^~~~~~
   drivers/dma/dw/core.c:314:17: note: in expansion of macro 'dma_writel'
              |  314 |                 dma_writel(dw, CLEAR.XFER, dwc->mask=
);
              |      |                 ^~~~~~~~~~
              |
            'dwc_scan_descriptors': events 6-8
              |
              |  316 |                 if (test_bit(DW_DMA_IS_SOFT_LLP, &dw=
c->flags)) {
              |      |                    ^
              |      |                    |
              |      |                    (6) following 'true' branch...
              |  317 |                         struct list_head *head, *act=
ive =3D dwc->tx_node_active;
              |      |                                                  ~~~=
~~~
              |      |                                                  |
              |      |                                                  (7)=
 ...to here
              |......
              |  326 |                         if (active !=3D head) {
              |      |                            ~
              |      |                            |
              |      |                            (8) following 'false' bra=
nch (when 'active =3D=3D head')...
              |
            'dwc_scan_descriptors': event 9
              |
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                                                     =
  ^~~~~~~~~~~
              |      |                                                     =
  |
              |      |                                                     =
  (9) ...to here
   arch/arm/include/asm/bitops.h:181:59: note: in definition of macro 'ATOM=
IC_BITOP'
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |                                                     =
      ^
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
            'dwc_scan_descriptors': event 10
              |
              |arch/arm/include/asm/bitops.h:181:62:
              |  181 |         (__builtin_constant_p(nr) ? ____atomic_##nam=
e(nr, p) : _##name(nr,p))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~~~~~~~~~~~~~
              |      |                                                     =
         |
              |      |                                                     =
         (10) calling '____atomic_clear_bit' from 'dwc_scan_descriptors'
   arch/arm/include/asm/bitops.h:190:41: note: in expansion of macro 'ATOMI=
C_BITOP'
              |  190 | #define clear_bit(nr,p)                 ATOMIC_BITOP=
(clear_bit,nr,p)
              |      |                                         ^~~~~~~~~~~~
   drivers/dma/dw/core.c:343:25: note: in expansion of macro 'clear_bit'
              |  343 |                         clear_bit(DW_DMA_IS_SOFT_LLP=
, &dwc->flags);
              |      |                         ^~~~~~~~~
              |
              +--> '____atomic_clear_bit': event 11
                     |

vim +114 drivers/dma/virt-dma.h

50437bff7f7374 Russell King   2012-04-13  107  =

6af149d2b1422e Peter Ujfalusi 2017-11-14  108  /**
6af149d2b1422e Peter Ujfalusi 2017-11-14  109   * vchan_vdesc_fini - Free o=
r reuse a descriptor
6af149d2b1422e Peter Ujfalusi 2017-11-14  110   * @vd: virtual descriptor t=
o free/reuse
6af149d2b1422e Peter Ujfalusi 2017-11-14  111   */
6af149d2b1422e Peter Ujfalusi 2017-11-14  112  static inline void vchan_vde=
sc_fini(struct virt_dma_desc *vd)
6af149d2b1422e Peter Ujfalusi 2017-11-14  113  {
6af149d2b1422e Peter Ujfalusi 2017-11-14 @114  	struct virt_dma_chan *vc =
=3D to_virt_chan(vd->tx.chan);
6af149d2b1422e Peter Ujfalusi 2017-11-14  115  =

9f91e6bfa86662 Sascha Hauer   2019-12-16  116  	if (dmaengine_desc_test_reu=
se(&vd->tx)) {
9f91e6bfa86662 Sascha Hauer   2019-12-16  117  		unsigned long flags;
9f91e6bfa86662 Sascha Hauer   2019-12-16  118  =

9f91e6bfa86662 Sascha Hauer   2019-12-16  119  		spin_lock_irqsave(&vc->loc=
k, flags);
6af149d2b1422e Peter Ujfalusi 2017-11-14  120  		list_add(&vd->node, &vc->d=
esc_allocated);
9f91e6bfa86662 Sascha Hauer   2019-12-16  121  		spin_unlock_irqrestore(&vc=
->lock, flags);
9f91e6bfa86662 Sascha Hauer   2019-12-16  122  	} else {
6af149d2b1422e Peter Ujfalusi 2017-11-14  123  		vc->desc_free(vd);
6af149d2b1422e Peter Ujfalusi 2017-11-14  124  	}
9f91e6bfa86662 Sascha Hauer   2019-12-16  125  }
6af149d2b1422e Peter Ujfalusi 2017-11-14  126  =


:::::: The code at line 114 was first introduced by commit
:::::: 6af149d2b1422e0e873d8558274713e6f63142c2 dmaengine: virt-dma: Add he=
lper to free/reuse a descriptor

:::::: TO: Peter Ujfalusi <peter.ujfalusi@ti.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7032986590667755505==--

