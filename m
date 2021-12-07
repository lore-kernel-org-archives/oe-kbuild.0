Content-Type: multipart/mixed; boundary="===============1584283103354569365=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 7/326] drivers/media/platform/stm32/dma2d/dma2d.c:531:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 07 Dec 2021 12:25:41 +0800
Message-ID: <202112071203.JsSvDngA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1584283103354569365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dillon Min <dillon.minfei@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   e6df6ad17c766f1e62e90332d143cd1c45567ffc
commit: 002e8f0d59277375154a054df15f925685c01a5c [7/326] media: stm32-dma2d=
: STM32 DMA2D driver
:::::: branch date: 13 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20211206 (https://download.01.org/0day-ci/arc=
hive/20211207/202112071203.JsSvDngA-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f50be8=
eb0a12a61d23db6cda452c693001d76898)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add mchehab-media-next git://linuxtv.org/mchehab/media-n=
ext.git
        git fetch --no-tags mchehab-media-next master
        git checkout 002e8f0d59277375154a054df15f925685c01a5c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/spi/spi-mxic.c:263:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/spi/spi-mxic.c:263:2: note: Taking false branch
           if (ret)
           ^
   drivers/spi/spi-mxic.c:268:2: note: Returning zero, which participates i=
n a condition later
           return 0;
           ^~~~~~~~
   drivers/spi/spi-mxic.c:368:8: note: Returning from 'mxic_spi_set_freq'
           ret =3D mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:369:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/spi/spi-mxic.c:369:2: note: Taking false branch
           if (ret)
           ^
   drivers/spi/spi-mxic.c:372:6: note: Assuming the condition is false
           if (mem->spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:372:2: note: Taking false branch
           if (mem->spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL))
           ^
   drivers/spi/spi-mxic.c:374:11: note: Assuming the condition is false
           else if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:374:7: note: Taking false branch
           else if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
                ^
   drivers/spi/spi-mxic.c:376:11: note: Assuming the condition is false
           else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:376:7: note: Taking false branch
           else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
                ^
   drivers/spi/spi-mxic.c:379:2: note: Loop condition is false.  Exiting lo=
op
           writel(HC_CFG_NIO(nio) |
           ^
   arch/riscv/include/asm/mmio.h:144:58: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                                               ^
   arch/riscv/include/asm/mmio.h:136:19: note: expanded from macro '__io_aw'
   #define __io_aw()       mmiowb_set_pending()
                           ^
   include/asm-generic/mmiowb.h:61:31: note: expanded from macro 'mmiowb_se=
t_pending'
   #define mmiowb_set_pending()            do { } while (0)
                                           ^
   drivers/spi/spi-mxic.c:384:2: note: Loop condition is false.  Exiting lo=
op
           writel(HC_EN_BIT, mxic->regs + HC_EN);
           ^
   arch/riscv/include/asm/mmio.h:144:58: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                                               ^
   arch/riscv/include/asm/mmio.h:136:19: note: expanded from macro '__io_aw'
   #define __io_aw()       mmiowb_set_pending()
                           ^
   include/asm-generic/mmiowb.h:61:31: note: expanded from macro 'mmiowb_se=
t_pending'
   #define mmiowb_set_pending()            do { } while (0)
                                           ^
   drivers/spi/spi-mxic.c:388:6: note: Assuming field 'dtr' is not equal to=
 0
                     (op->cmd.dtr ? OP_CMD_DDR : 0);
                      ^~~~~~~~~~~
   drivers/spi/spi-mxic.c:388:6: note: '?' condition is true
   drivers/spi/spi-mxic.c:390:6: note: Assuming field 'nbytes' is 0
           if (op->addr.nbytes)
               ^~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:390:2: note: Taking false branch
           if (op->addr.nbytes)
           ^
   drivers/spi/spi-mxic.c:395:6: note: Assuming field 'nbytes' is 0
           if (op->dummy.nbytes)
               ^~~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:395:2: note: Taking false branch
           if (op->dummy.nbytes)
           ^
   drivers/spi/spi-mxic.c:398:6: note: Assuming field 'nbytes' is not equal=
 to 0
           if (op->data.nbytes) {
               ^~~~~~~~~~~~~~~
   drivers/spi/spi-mxic.c:398:2: note: Taking true branch
           if (op->data.nbytes) {
           ^
   drivers/spi/spi-mxic.c:399:14: note: The result of the left shift is und=
efined because the left operand is negative
                   ss_ctrl |=3D OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
                              ^
   drivers/spi/spi-mxic.c:78:31: note: expanded from macro 'OP_DATA_BUSW'
   #define OP_DATA_BUSW(x)         ((x) << 6)
                                    ~~~ ^
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
   5 warnings generated.
>> drivers/media/platform/stm32/dma2d/dma2d.c:531:33: warning: Dereference =
of null pointer [clang-analyzer-core.NullDereference]
                   src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   drivers/media/platform/stm32/dma2d/dma2d.c:521:2: note: 'ctx' initialize=
d here
           struct dma2d_ctx *ctx =3D dev->curr;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/stm32/dma2d/dma2d.c:526:6: note: Assuming the con=
dition is true
           if (s & ISR_TCIF || s =3D=3D 0) {
               ^~~~~~~~~~~~
   drivers/media/platform/stm32/dma2d/dma2d.c:526:19: note: Left side of '|=
|' is true
           if (s & ISR_TCIF || s =3D=3D 0) {
                            ^
   drivers/media/platform/stm32/dma2d/dma2d.c:529:11: note: Assuming 'ctx' =
is null
                   WARN_ON(!ctx);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/media/platform/stm32/dma2d/dma2d.c:531:33: note: Dereference of =
null pointer
                   src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
                                                 ^~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (4 in non-user code, 2 with check filters).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/qxl/qxl_release.c:128:8: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
                   bo =3D to_qxl_bo(entry->tv.bo);
                        ^
   drivers/gpu/drm/qxl/qxl_drv.h:99:25: note: expanded from macro 'to_qxl_b=
o'
   #define to_qxl_bo(tobj) container_of((tobj), struct qxl_bo, tbo)
                           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/gpu/drm/qxl/qxl_release.c:256:6: note: Assuming 'surface_cmd_typ=
e' is not equal to QXL_SURFACE_CMD_DESTROY
           if (surface_cmd_type =3D=3D QXL_SURFACE_CMD_DESTROY && create_re=
l) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/qxl/qxl_release.c:256:50: note: Left side of '&&' is fal=
se
           if (surface_cmd_type =3D=3D QXL_SURFACE_CMD_DESTROY && create_re=
l) {
                                                           ^
   drivers/gpu/drm/qxl/qxl_release.c:278:9: note: Calling 'qxl_alloc_releas=
e_reserved'
           return qxl_alloc_release_reserved(qdev, sizeof(struct qxl_surfac=
e_cmd),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/qxl/qxl_release.c:293:6: note: 'type' is not equal to QX=
L_RELEASE_DRAWABLE
           if (type =3D=3D QXL_RELEASE_DRAWABLE) {
               ^~~~
   drivers/gpu/drm/qxl/qxl_release.c:293:2: note: Taking false branch
           if (type =3D=3D QXL_RELEASE_DRAWABLE) {
           ^
   drivers/gpu/drm/qxl/qxl_release.c:296:13: note: 'type' is equal to QXL_R=
ELEASE_SURFACE_CMD
           } else if (type =3D=3D QXL_RELEASE_SURFACE_CMD) {
                      ^~~~
   drivers/gpu/drm/qxl/qxl_release.c:296:9: note: Taking true branch
           } else if (type =3D=3D QXL_RELEASE_SURFACE_CMD) {
                  ^
   drivers/gpu/drm/qxl/qxl_release.c:309:6: note: 'idr_ret' is >=3D 0
           if (idr_ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/qxl/qxl_release.c:309:2: note: Taking false branch
           if (idr_ret < 0) {
           ^
   drivers/gpu/drm/qxl/qxl_release.c:317:6: note: Assuming the condition is=
 false
           if (qdev->current_release_bo_offset[cur_idx] + 1 >=3D releases_p=
er_bo[cur_idx]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   drivers/gpu/drm/qxl/qxl_release.c:317:2: note: Taking false branch
           if (qdev->current_release_bo_offset[cur_idx] + 1 >=3D releases_p=
er_bo[cur_idx]) {

vim +531 drivers/media/platform/stm32/dma2d/dma2d.c

002e8f0d592773 Dillon Min 2021-10-19  517  =

002e8f0d592773 Dillon Min 2021-10-19  518  static irqreturn_t dma2d_isr(int=
 irq, void *prv)
002e8f0d592773 Dillon Min 2021-10-19  519  {
002e8f0d592773 Dillon Min 2021-10-19  520  	struct dma2d_dev *dev =3D prv;
002e8f0d592773 Dillon Min 2021-10-19  521  	struct dma2d_ctx *ctx =3D dev->=
curr;
002e8f0d592773 Dillon Min 2021-10-19  522  	struct vb2_v4l2_buffer *src, *d=
st;
002e8f0d592773 Dillon Min 2021-10-19  523  	u32 s =3D dma2d_get_int(dev);
002e8f0d592773 Dillon Min 2021-10-19  524  =

002e8f0d592773 Dillon Min 2021-10-19  525  	dma2d_clear_int(dev);
002e8f0d592773 Dillon Min 2021-10-19  526  	if (s & ISR_TCIF || s =3D=3D 0)=
 {
002e8f0d592773 Dillon Min 2021-10-19  527  		clk_disable(dev->gate);
002e8f0d592773 Dillon Min 2021-10-19  528  =

002e8f0d592773 Dillon Min 2021-10-19  529  		WARN_ON(!ctx);
002e8f0d592773 Dillon Min 2021-10-19  530  =

002e8f0d592773 Dillon Min 2021-10-19 @531  		src =3D v4l2_m2m_src_buf_remov=
e(ctx->fh.m2m_ctx);
002e8f0d592773 Dillon Min 2021-10-19  532  		dst =3D v4l2_m2m_dst_buf_remov=
e(ctx->fh.m2m_ctx);
002e8f0d592773 Dillon Min 2021-10-19  533  =

002e8f0d592773 Dillon Min 2021-10-19  534  		WARN_ON(!dst);
002e8f0d592773 Dillon Min 2021-10-19  535  		WARN_ON(!src);
002e8f0d592773 Dillon Min 2021-10-19  536  =

002e8f0d592773 Dillon Min 2021-10-19  537  		v4l2_m2m_buf_done(src, VB2_BUF=
_STATE_DONE);
002e8f0d592773 Dillon Min 2021-10-19  538  		v4l2_m2m_buf_done(dst, VB2_BUF=
_STATE_DONE);
002e8f0d592773 Dillon Min 2021-10-19  539  		v4l2_m2m_job_finish(dev->m2m_d=
ev, ctx->fh.m2m_ctx);
002e8f0d592773 Dillon Min 2021-10-19  540  =

002e8f0d592773 Dillon Min 2021-10-19  541  		dev->curr =3D NULL;
002e8f0d592773 Dillon Min 2021-10-19  542  	}
002e8f0d592773 Dillon Min 2021-10-19  543  =

002e8f0d592773 Dillon Min 2021-10-19  544  	return IRQ_HANDLED;
002e8f0d592773 Dillon Min 2021-10-19  545  }
002e8f0d592773 Dillon Min 2021-10-19  546  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1584283103354569365==--

