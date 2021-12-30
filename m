Content-Type: multipart/mixed; boundary="===============0876708500931778373=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1706/9897] drivers/gpu/drm/mediatek/mtk_drm_crtc.c:160:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 30 Dec 2021 08:57:02 +0800
Message-ID: <202112300858.xcBDfsX0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0876708500931778373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: "jason-jh.lin" <jason-jh.lin@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 7627122fd1c06800a1fe624e9fb3c269796115e8 [1706/9897] drm/mediatek: =
Add cmdq_handle in mtk_crtc
:::::: branch date: 6 days ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20211228 (https://download.01.org/0day-ci/archi=
ve/20211230/202112300858.xcBDfsX0-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D7627122fd1c06800a1fe624e9fb3c269796115e8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7627122fd1c06800a1fe624e9fb3c269796115e8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (test_and_set_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags)) {
               ^
   arch/arm/include/asm/bitops.h:192:33: note: expanded from macro 'test_an=
d_set_bit'
   #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr=
,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/dma/ep93xx_dma.c:1131:6: note: Calling '____atomic_test_and_set_=
bit'
           if (test_and_set_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags)) {
               ^
   arch/arm/include/asm/bitops.h:192:33: note: expanded from macro 'test_an=
d_set_bit'
   #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr=
,p)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/arm/include/asm/bitops.h:181:30: note: expanded from macro 'ATOMIC_=
BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   arch/arm/include/asm/bitops.h:81:2: note: Loop condition is false.  Exit=
ing loop
           raw_local_irq_save(flags);
           ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   arch/arm/include/asm/bitops.h:84:2: note: Loop condition is false.  Exit=
ing loop
           raw_local_irq_restore(flags);
           ^
   include/linux/irqflags.h:176:3: note: expanded from macro 'raw_local_irq=
_restore'
                   raw_check_bogus_irq_restore();          \
                   ^
   include/linux/irqflags.h:160:39: note: expanded from macro 'raw_check_bo=
gus_irq_restore'
   #define raw_check_bogus_irq_restore() do { } while (0)
                                         ^
   arch/arm/include/asm/bitops.h:84:2: note: Loop condition is false.  Exit=
ing loop
           raw_local_irq_restore(flags);
           ^
   include/linux/irqflags.h:174:2: note: expanded from macro 'raw_local_irq=
_restore'
           do {                                            \
           ^
   arch/arm/include/asm/bitops.h:86:9: note: Assuming the condition is false
           return (res & mask) !=3D 0;
                  ^~~~~~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:86:2: note: Returning zero, which particip=
ates in a condition later
           return (res & mask) !=3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1131:6: note: Returning from '____atomic_test_a=
nd_set_bit'
           if (test_and_set_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags)) {
               ^
   arch/arm/include/asm/bitops.h:192:33: note: expanded from macro 'test_an=
d_set_bit'
   #define test_and_set_bit(nr,p)          ATOMIC_BITOP(test_and_set_bit,nr=
,p)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/arm/include/asm/bitops.h:181:30: note: expanded from macro 'ATOMIC_=
BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/dma/ep93xx_dma.c:1131:2: note: Taking false branch
           if (test_and_set_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags)) {
           ^
   drivers/dma/ep93xx_dma.c:1137:6: note: Assuming 'period_len' is <=3D DMA=
_MAX_CHAN_BYTES
           if (period_len > DMA_MAX_CHAN_BYTES) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1137:2: note: Taking false branch
           if (period_len > DMA_MAX_CHAN_BYTES) {
           ^
   drivers/dma/ep93xx_dma.c:1146:2: note: Null pointer value stored to 'fir=
st'
           first =3D NULL;
           ^~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1147:19: note: Assuming 'offset' is >=3D 'buf_l=
en'
           for (offset =3D 0; offset < buf_len; offset +=3D period_len) {
                            ^~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1147:2: note: Loop condition is false. Executio=
n continues on line 1170
           for (offset =3D 0; offset < buf_len; offset +=3D period_len) {
           ^
   drivers/dma/ep93xx_dma.c:1170:20: note: Dereference of null pointer
           first->txd.cookie =3D -EBUSY;
           ~~~~~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/gpu/drm/mediatek/mtk_drm_crtc.c:160:2: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           drm_crtc_cleanup(crtc);
           ^                ~~~~
   drivers/gpu/drm/mediatek/mtk_drm_crtc.c:158:2: note: Calling 'mtk_drm_cm=
dq_pkt_destroy'
           mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_drm_crtc.c:148:2: note: Memory is released
           kfree(pkt);
           ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_drm_crtc.c:158:2: note: Returning; memory w=
as released
           mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_drm_crtc.c:160:2: note: Use of memory after=
 it is freed
           drm_crtc_cleanup(crtc);
           ^                ~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/mediatek/mtk_cec.c:87:2: warning: Value stored to 'tmp' =
is never read [clang-analyzer-deadcode.DeadStores]
           tmp |=3D val & mask;
           ^      ~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_cec.c:87:2: note: Value stored to 'tmp' is =
never read
           tmp |=3D val & mask;
           ^      ~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:132:2: warning: Value stored to =
'ack_final' is never read [clang-analyzer-deadcode.DeadStores]
           ack_final =3D 0;
           ^           ~
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:132:2: note: Value stored to 'ac=
k_final' is never read
           ack_final =3D 0;
           ^           ~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.

vim +160 drivers/gpu/drm/mediatek/mtk_drm_crtc.c

7627122fd1c0680 Chun-Kuang Hu 2021-10-28  151  =

119f5173628aa7a CK Hu         2016-01-04  152  static void mtk_drm_crtc_des=
troy(struct drm_crtc *crtc)
119f5173628aa7a CK Hu         2016-01-04  153  {
119f5173628aa7a CK Hu         2016-01-04  154  	struct mtk_drm_crtc *mtk_cr=
tc =3D to_mtk_crtc(crtc);
119f5173628aa7a CK Hu         2016-01-04  155  =

4971593f8eb14fb CK Hu         2020-07-21  156  	mtk_mutex_put(mtk_crtc->mut=
ex);
7627122fd1c0680 Chun-Kuang Hu 2021-10-28  157  #if IS_REACHABLE(CONFIG_MTK_=
CMDQ)
7627122fd1c0680 Chun-Kuang Hu 2021-10-28  158  	mtk_drm_cmdq_pkt_destroy(&m=
tk_crtc->cmdq_handle);
7627122fd1c0680 Chun-Kuang Hu 2021-10-28  159  #endif
119f5173628aa7a CK Hu         2016-01-04 @160  	drm_crtc_cleanup(crtc);
119f5173628aa7a CK Hu         2016-01-04  161  }
119f5173628aa7a CK Hu         2016-01-04  162  =


:::::: The code at line 160 was first introduced by commit
:::::: 119f5173628aa7a0c3cf9db83460d40709e8241d drm/mediatek: Add DRM Drive=
r for Mediatek SoC MT8173.

:::::: TO: CK Hu <ck.hu@mediatek.com>
:::::: CC: Philipp Zabel <p.zabel@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0876708500931778373==--

