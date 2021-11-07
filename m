Content-Type: multipart/mixed; boundary="===============2329889255300481354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:342:3: warning: Value stored to 'src_buf' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 07 Nov 2021 13:55:01 +0800
Message-ID: <202111071349.M1rQdYCS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2329889255300481354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yunfei Dong <yunfei.dong@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Alexandre Courbot <acourbot@chromium.org>
CC: "Tzung-Bi Shih" <tzungbi@google.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b5013d084e03e82ceeab4db8ae8ceeaebe76b0eb
commit: fd00d90330d1d2a962d010fc93515e2d77739ad8 media: mtk-vcodec: vdec: m=
ove stateful ops into their own file
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20211001 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e50=
3cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfd00d90330d1d2a962d010fc93515e2d77739ad8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fd00d90330d1d2a962d010fc93515e2d77739ad8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:407:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EBUSY;
                   ^     ~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:407:3: note: Value st=
ored to 'ret' is never read
                   ret =3D -EBUSY;
                   ^     ~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:417:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EBUSY;
                   ^     ~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:417:3: note: Value st=
ored to 'ret' is never read
                   ret =3D -EBUSY;
                   ^     ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:342:3: warni=
ng: Value stored to 'src_buf' is never read [clang-analyzer-deadcode.DeadSt=
ores]
                   src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:342:3: note:=
 Value stored to 'src_buf' is never read
                   src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:405:2: warni=
ng: Value stored to 'dst_buf' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:405:2: note:=
 Value stored to 'dst_buf' is never read
           dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/v4l2-core/v4l2-ioctl.c:3286:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3286:3: note: Value stored to 'err'=
 is never read
                   err =3D -EFAULT;
                   ^     ~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/src_buf +342 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_statefu=
l.c

fd00d90330d1d2 Yunfei Dong 2021-08-06  292  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  293  static void mtk_vdec_worker(str=
uct work_struct *work)
fd00d90330d1d2 Yunfei Dong 2021-08-06  294  {
fd00d90330d1d2 Yunfei Dong 2021-08-06  295  	struct mtk_vcodec_ctx *ctx =3D
fd00d90330d1d2 Yunfei Dong 2021-08-06  296  		container_of(work, struct mtk=
_vcodec_ctx, decode_work);
fd00d90330d1d2 Yunfei Dong 2021-08-06  297  	struct mtk_vcodec_dev *dev =3D=
 ctx->dev;
fd00d90330d1d2 Yunfei Dong 2021-08-06  298  	struct vb2_v4l2_buffer *src_bu=
f, *dst_buf;
fd00d90330d1d2 Yunfei Dong 2021-08-06  299  	struct mtk_vcodec_mem buf;
fd00d90330d1d2 Yunfei Dong 2021-08-06  300  	struct vdec_fb *pfb;
fd00d90330d1d2 Yunfei Dong 2021-08-06  301  	bool res_chg =3D false;
fd00d90330d1d2 Yunfei Dong 2021-08-06  302  	int ret;
fd00d90330d1d2 Yunfei Dong 2021-08-06  303  	struct mtk_video_dec_buf *dst_=
buf_info, *src_buf_info;
fd00d90330d1d2 Yunfei Dong 2021-08-06  304  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  305  	src_buf =3D v4l2_m2m_next_src_=
buf(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  306  	if (!src_buf) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  307  		v4l2_m2m_job_finish(dev->m2m_=
dev_dec, ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  308  		mtk_v4l2_debug(1, "[%d] src_b=
uf empty!!", ctx->id);
fd00d90330d1d2 Yunfei Dong 2021-08-06  309  		return;
fd00d90330d1d2 Yunfei Dong 2021-08-06  310  	}
fd00d90330d1d2 Yunfei Dong 2021-08-06  311  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  312  	dst_buf =3D v4l2_m2m_next_dst_=
buf(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  313  	if (!dst_buf) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  314  		v4l2_m2m_job_finish(dev->m2m_=
dev_dec, ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  315  		mtk_v4l2_debug(1, "[%d] dst_b=
uf empty!!", ctx->id);
fd00d90330d1d2 Yunfei Dong 2021-08-06  316  		return;
fd00d90330d1d2 Yunfei Dong 2021-08-06  317  	}
fd00d90330d1d2 Yunfei Dong 2021-08-06  318  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  319  	dst_buf_info =3D
fd00d90330d1d2 Yunfei Dong 2021-08-06  320  		container_of(dst_buf, struct =
mtk_video_dec_buf, m2m_buf.vb);
fd00d90330d1d2 Yunfei Dong 2021-08-06  321  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  322  	pfb =3D &dst_buf_info->frame_b=
uffer;
fd00d90330d1d2 Yunfei Dong 2021-08-06  323  	pfb->base_y.va =3D vb2_plane_v=
addr(&dst_buf->vb2_buf, 0);
fd00d90330d1d2 Yunfei Dong 2021-08-06  324  	pfb->base_y.dma_addr =3D
fd00d90330d1d2 Yunfei Dong 2021-08-06  325  		vb2_dma_contig_plane_dma_addr=
(&dst_buf->vb2_buf, 0);
fd00d90330d1d2 Yunfei Dong 2021-08-06  326  	pfb->base_y.size =3D ctx->pici=
nfo.fb_sz[0];
fd00d90330d1d2 Yunfei Dong 2021-08-06  327  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  328  	pfb->base_c.va =3D vb2_plane_v=
addr(&dst_buf->vb2_buf, 1);
fd00d90330d1d2 Yunfei Dong 2021-08-06  329  	pfb->base_c.dma_addr =3D
fd00d90330d1d2 Yunfei Dong 2021-08-06  330  		vb2_dma_contig_plane_dma_addr=
(&dst_buf->vb2_buf, 1);
fd00d90330d1d2 Yunfei Dong 2021-08-06  331  	pfb->base_c.size =3D ctx->pici=
nfo.fb_sz[1];
fd00d90330d1d2 Yunfei Dong 2021-08-06  332  	pfb->status =3D 0;
fd00d90330d1d2 Yunfei Dong 2021-08-06  333  	mtk_v4l2_debug(3, "=3D=3D=3D>[=
%d] vdec_if_decode() =3D=3D=3D>", ctx->id);
fd00d90330d1d2 Yunfei Dong 2021-08-06  334  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  335  	mtk_v4l2_debug(3,
fd00d90330d1d2 Yunfei Dong 2021-08-06  336  		       "id=3D%d Framebuf  pfb=
=3D%p VA=3D%p Y_DMA=3D%pad C_DMA=3D%pad Size=3D%zx",
fd00d90330d1d2 Yunfei Dong 2021-08-06  337  		       dst_buf->vb2_buf.index=
, pfb, pfb->base_y.va,
fd00d90330d1d2 Yunfei Dong 2021-08-06  338  		       &pfb->base_y.dma_addr,=
 &pfb->base_c.dma_addr, pfb->base_y.size);
fd00d90330d1d2 Yunfei Dong 2021-08-06  339  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  340  	if (src_buf =3D=3D &ctx->empty=
_flush_buf.vb) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  341  		mtk_v4l2_debug(1, "Got empty =
flush input buffer.");
fd00d90330d1d2 Yunfei Dong 2021-08-06 @342  		src_buf =3D v4l2_m2m_src_buf_=
remove(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  343  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  344  		/* update dst buf status */
fd00d90330d1d2 Yunfei Dong 2021-08-06  345  		dst_buf =3D v4l2_m2m_dst_buf_=
remove(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  346  		mutex_lock(&ctx->lock);
fd00d90330d1d2 Yunfei Dong 2021-08-06  347  		dst_buf_info->used =3D false;
fd00d90330d1d2 Yunfei Dong 2021-08-06  348  		mutex_unlock(&ctx->lock);
fd00d90330d1d2 Yunfei Dong 2021-08-06  349  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  350  		vdec_if_decode(ctx, NULL, NUL=
L, &res_chg);
fd00d90330d1d2 Yunfei Dong 2021-08-06  351  		clean_display_buffer(ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  352  		vb2_set_plane_payload(&dst_bu=
f->vb2_buf, 0, 0);
fd00d90330d1d2 Yunfei Dong 2021-08-06  353  		if (ctx->q_data[MTK_Q_DATA_DS=
T].fmt->num_planes =3D=3D 2)
fd00d90330d1d2 Yunfei Dong 2021-08-06  354  			vb2_set_plane_payload(&dst_b=
uf->vb2_buf, 1, 0);
fd00d90330d1d2 Yunfei Dong 2021-08-06  355  		dst_buf->flags |=3D V4L2_BUF_=
FLAG_LAST;
fd00d90330d1d2 Yunfei Dong 2021-08-06  356  		v4l2_m2m_buf_done(dst_buf, VB=
2_BUF_STATE_DONE);
fd00d90330d1d2 Yunfei Dong 2021-08-06  357  		clean_free_buffer(ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  358  		v4l2_m2m_job_finish(dev->m2m_=
dev_dec, ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  359  		return;
fd00d90330d1d2 Yunfei Dong 2021-08-06  360  	}
fd00d90330d1d2 Yunfei Dong 2021-08-06  361  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  362  	src_buf_info =3D
fd00d90330d1d2 Yunfei Dong 2021-08-06  363  		container_of(src_buf, struct =
mtk_video_dec_buf, m2m_buf.vb);
fd00d90330d1d2 Yunfei Dong 2021-08-06  364  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  365  	buf.va =3D vb2_plane_vaddr(&sr=
c_buf->vb2_buf, 0);
fd00d90330d1d2 Yunfei Dong 2021-08-06  366  	buf.dma_addr =3D vb2_dma_conti=
g_plane_dma_addr(&src_buf->vb2_buf, 0);
fd00d90330d1d2 Yunfei Dong 2021-08-06  367  	buf.size =3D (size_t)src_buf->=
vb2_buf.planes[0].bytesused;
fd00d90330d1d2 Yunfei Dong 2021-08-06  368  	if (!buf.va) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  369  		v4l2_m2m_job_finish(dev->m2m_=
dev_dec, ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  370  		mtk_v4l2_err("[%d] id=3D%d sr=
c_addr is NULL!!", ctx->id,
fd00d90330d1d2 Yunfei Dong 2021-08-06  371  			     src_buf->vb2_buf.index);
fd00d90330d1d2 Yunfei Dong 2021-08-06  372  		return;
fd00d90330d1d2 Yunfei Dong 2021-08-06  373  	}
fd00d90330d1d2 Yunfei Dong 2021-08-06  374  	mtk_v4l2_debug(3, "[%d] Bitstr=
eam VA=3D%p DMA=3D%pad Size=3D%zx vb=3D%p",
fd00d90330d1d2 Yunfei Dong 2021-08-06  375  		       ctx->id, buf.va, &buf.=
dma_addr, buf.size, src_buf);
fd00d90330d1d2 Yunfei Dong 2021-08-06  376  	dst_buf->vb2_buf.timestamp =3D=
 src_buf->vb2_buf.timestamp;
fd00d90330d1d2 Yunfei Dong 2021-08-06  377  	dst_buf->timecode =3D src_buf-=
>timecode;
fd00d90330d1d2 Yunfei Dong 2021-08-06  378  	mutex_lock(&ctx->lock);
fd00d90330d1d2 Yunfei Dong 2021-08-06  379  	dst_buf_info->used =3D true;
fd00d90330d1d2 Yunfei Dong 2021-08-06  380  	mutex_unlock(&ctx->lock);
fd00d90330d1d2 Yunfei Dong 2021-08-06  381  	src_buf_info->used =3D true;
fd00d90330d1d2 Yunfei Dong 2021-08-06  382  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  383  	ret =3D vdec_if_decode(ctx, &b=
uf, pfb, &res_chg);
fd00d90330d1d2 Yunfei Dong 2021-08-06  384  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  385  	if (ret) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  386  		mtk_v4l2_err(" <=3D=3D=3D[%d]=
, src_buf[%d] sz=3D0x%zx pts=3D%llu dst_buf[%d] vdec_if_decode() ret=3D%d r=
es_chg=3D%d=3D=3D=3D>",
fd00d90330d1d2 Yunfei Dong 2021-08-06  387  			     ctx->id, src_buf->vb2_b=
uf.index, buf.size,
fd00d90330d1d2 Yunfei Dong 2021-08-06  388  			     src_buf->vb2_buf.timest=
amp, dst_buf->vb2_buf.index, ret, res_chg);
fd00d90330d1d2 Yunfei Dong 2021-08-06  389  		src_buf =3D v4l2_m2m_src_buf_=
remove(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  390  		if (ret =3D=3D -EIO) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  391  			mutex_lock(&ctx->lock);
fd00d90330d1d2 Yunfei Dong 2021-08-06  392  			src_buf_info->error =3D true;
fd00d90330d1d2 Yunfei Dong 2021-08-06  393  			mutex_unlock(&ctx->lock);
fd00d90330d1d2 Yunfei Dong 2021-08-06  394  		}
fd00d90330d1d2 Yunfei Dong 2021-08-06  395  		v4l2_m2m_buf_done(src_buf, VB=
2_BUF_STATE_ERROR);
fd00d90330d1d2 Yunfei Dong 2021-08-06  396  	} else if (!res_chg) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  397  		/*
fd00d90330d1d2 Yunfei Dong 2021-08-06  398  		 * we only return src buffer =
with VB2_BUF_STATE_DONE
fd00d90330d1d2 Yunfei Dong 2021-08-06  399  		 * when decode success withou=
t resolution change
fd00d90330d1d2 Yunfei Dong 2021-08-06  400  		 */
fd00d90330d1d2 Yunfei Dong 2021-08-06  401  		src_buf =3D v4l2_m2m_src_buf_=
remove(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  402  		v4l2_m2m_buf_done(src_buf, VB=
2_BUF_STATE_DONE);
fd00d90330d1d2 Yunfei Dong 2021-08-06  403  	}
fd00d90330d1d2 Yunfei Dong 2021-08-06  404  =

fd00d90330d1d2 Yunfei Dong 2021-08-06 @405  	dst_buf =3D v4l2_m2m_dst_buf_r=
emove(ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  406  	clean_display_buffer(ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  407  	clean_free_buffer(ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  408  =

fd00d90330d1d2 Yunfei Dong 2021-08-06  409  	if (!ret && res_chg) {
fd00d90330d1d2 Yunfei Dong 2021-08-06  410  		mtk_vdec_pic_info_update(ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  411  		/*
fd00d90330d1d2 Yunfei Dong 2021-08-06  412  		 * On encountering a resoluti=
on change in the stream.
fd00d90330d1d2 Yunfei Dong 2021-08-06  413  		 * The driver must first proc=
ess and decode all
fd00d90330d1d2 Yunfei Dong 2021-08-06  414  		 * remaining buffers from bef=
ore the resolution change
fd00d90330d1d2 Yunfei Dong 2021-08-06  415  		 * point, so call flush decod=
e here
fd00d90330d1d2 Yunfei Dong 2021-08-06  416  		 */
fd00d90330d1d2 Yunfei Dong 2021-08-06  417  		mtk_vdec_flush_decoder(ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  418  		/*
fd00d90330d1d2 Yunfei Dong 2021-08-06  419  		 * After all buffers containi=
ng decoded frames from
fd00d90330d1d2 Yunfei Dong 2021-08-06  420  		 * before the resolution chan=
ge point ready to be
fd00d90330d1d2 Yunfei Dong 2021-08-06  421  		 * dequeued on the CAPTURE qu=
eue, the driver sends a
fd00d90330d1d2 Yunfei Dong 2021-08-06  422  		 * V4L2_EVENT_SOURCE_CHANGE e=
vent for source change
fd00d90330d1d2 Yunfei Dong 2021-08-06  423  		 * type V4L2_EVENT_SRC_CH_RES=
OLUTION
fd00d90330d1d2 Yunfei Dong 2021-08-06  424  		 */
fd00d90330d1d2 Yunfei Dong 2021-08-06  425  		mtk_vdec_queue_res_chg_event(=
ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  426  	}
fd00d90330d1d2 Yunfei Dong 2021-08-06  427  	v4l2_m2m_job_finish(dev->m2m_d=
ev_dec, ctx->m2m_ctx);
fd00d90330d1d2 Yunfei Dong 2021-08-06  428  }
fd00d90330d1d2 Yunfei Dong 2021-08-06  429  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2329889255300481354==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICDc5h2EAAy5jb25maWcAnDxrk9s2kt/zK1hJ1VW2am1Lmoftu5oPEAhKiEiCBkBJM19Ysqxx
dBmPpiQ5m/z77Qb4AEhovHdbtUnU3QAajX4DnF9++iUi38+Hb5vzfrt5evo7+rp73h03592X6HH/
tPufKBZRLnTEYq7fAnG6f/7+17vj/rT9M7p5O755O3pz3F5Fi93xefcU0cPz4/7rdxi/Pzz/9MtP
VOQJn1WUVksmFRd5pdla3/28fdo8f43+3B1PQBeNr9+O3o6iX7/uz//97h3889v+eDwc3z09/fmt
ejke/ne3PUfb3eN2NH7c3N5s3u8+b7fj0fbz49X26vPnyeT9h83tZjyZfNltHv/xc7PqrFv2buSw
wlVFU5LP7v5ugfizpR1fj+B/DY4oHJCmy6yjB1iYOI2HKwLMTBB341OHzp8A2JvD7ERl1Uxo4bDo
IypR6qLUQTzPU56zASoXVSFFwlNWJXlFtJYOiciVliXVQqoOyuWnaiXkooNMS57Gmmes0mQKEykh
HR70XDICu80TAf8AEoVDQQ1+iWZGq56i0+78/aVTjKkUC5ZXoBcqK5yFc64rli8rIkFYPOP67mrS
8ZoVuAnNFK79S1TDV0xKIaP9KXo+nHGhVtqCkrQR988/e3upFEm1A4xZQspUGw4C4LlQOicZu/v5
1+fD8w50rV1erUjhLt4h7tWSFzTA2IpoOq8+laxk7kaoFEpVGcuEvMdzInQenLhULOXTwLxzsmQg
OpiblGC2wAAIIG2OAk41On3/fPr7dN59645ixnImOTWHruZi1Z1GH1OlbMnSMJ7OeeErUCwywnMf
pngWIqrmnEnk+97HJkRpJniHhh3mccpcXbWQZiIY1ZtCSMriWkO5a/uqIFKxekQrW3dPMZuWs0T5
Z7B7/hIdHnvCDEkkA73hDcOOC8HjoaCaCyVK4M1q3ECmhgLEnWvlsmdMcFGimaAZuKyZM9b7b+Bb
Q8c8f6gKmFnEnLoTgnMADAceg6pm0EHMnM/mlWTKsCTDQhpw05pgkbgnCFrLAFT9ZiRhNgI/Q7tA
qk6tW2YQXOaF5MvWYkWSBHnyJ+6mKCRjWaFhx3lYFA3BUqRlrom8DxhgTdPtrRlEBYwZgNEv1ful
RflOb05/RGeQWbQBXk/nzfkUbbbbw/fn8/75aycEzemiggEVoWZeq9Yto6h8Rk86dHBDUxVjYKAM
nA6Q6vCuFQ+K8T/gt/XbwClXIiXufiUtIzU8Xw2CqQA3lKAHhB8VW4M+OzJVHoWZqAeCsKTM0NrI
AqgBqIxZCK4loWzIk9KgmBioMpH7mJyBF1JsRqcpV9rHJSSHqO5Eug4ILpckdx5iKkR/AgMCzU/J
/d0N5BTt6ZmVBZ3iGQTUtbeXykTxbGqUqT5n/5xaz7qw/+Gp3aI9MREKenwxh+k93904O0XnIB3j
8hr9UNvfd1++P+2O0eNuc/5+3J0MuOYqgG21bSZFWXhOEyIqnQU4mqaLmtxJiMxvy1EHTQiXVRBD
E1VNwceveKzn7qJSuwOCtlWvVfBYBbirsTLOyIC9BLT7wY0qNTxmS079nMIi4Pz7Jt5jgslkMJ3n
pmtYxhUNrAuR0jFFQRctimjiBRzIoiD0gtcJMTNndFEInmsMLZCUOtmsVRJSatEcmZtpwTHEDHwF
JfqCtCWaR9gRgh6A5EwkluHBYGHoxPG/Q2zTSoA3z/gDw4TDCFPIjOS9s+iRKfiPwGwY37STZtnf
4O8oMyHDGmyH7ztCk3hAjig9Ec2YzsDcm+h5KWMFOb5Gkdh8JhT6hOLrOhlwF4agnOtFWKjlhcBE
IC9LSp+FhoESCknHMPEnWFAvm7BgmhVrOnf0khUidQXLZzlJE8eaDfsuwGRgLkDNwZs42RwXng8U
VSl78bahjJcctlUL13GCMN+USMldc14gyX2mhpCKuDtooUZkqOGaLx3VQC0w6ZC7hQV1Sy5YncWx
69KMBFGFqzb/bM4SgTBntcxgYeH4gYKOR9eN7657AsXu+Hg4fts8b3cR+3P3DNkBAfdNMT+AtLAL
+sG1jEsJrdgGgf9wme50lpldxWZjg6S1OeG0nNrVw04bqlCioYAN67RKSagyw0k9c0xFmIxMQSHk
jDV5rKN5iEPHjwlEJcEORXYJOycyhtjq6W2ZJFAnFQTmNqIk4F49J6NZZrw1dih4wmmTrzmmjF2E
QTpZH4df6TfzXk2mbnkjIXose8VQlhEIc3lcASWUv1AzfngNT9Z34/fefJWaOg4gy5ykbEnMKCe3
KhrIdQcBkUC5oJi+G/1FR/Z/HgsJGBbYacVy7H70+LeF5GU0SxnVTVmfidgtoQ3FioBOmlyIpNW8
BE+dTvuTlEUhJGy/hEOYMsdOIOWkC5vC1USBYpKkfCohMtY54pBAldkQOl8xKPKc+RLw8IzI9B5+
V54fLGa2L2Q6BKpLWDGlg7jssGazuwMFPXnabf12IeQNcP4U8sc5h5QESgaZcOnFUCRRoJ3LcJGG
6CWXOqih/qpN2RXtjsfNeePx0yUNRr+YlGgXJAWnkRsXe6kmGk5mZiueNmd0UtH575ddt19ztHJ5
NeHuFmvo7TUPpRpGgUD4cWpaNZ1fahEkD5WmYDfF/F6hmo5nvi/KilBtUOZsWChZeXBFKtqc5en7
y8vhiH3jIit7G7TkJjgVxixbWQVGtVpWeJS+7NwA41QGTeh6qMajkbs5gExuRuEOxkN1NbqIgnlG
AbHMH+7GnXNo3U+1HI2dCMvWzE2SJVHzKi6zIhC+ugLGtD0OsNzhBTXH2RbNYtPZ/dlpO7IkpB54
xBAbsjqH4ms3BnhIcHUfGlfXNUfc5a3mHv4FVRZE183X3TcIrkPmCtcNZP1SACCQ+WAmHLeodg8x
YE0vNBahlAmwNF14czWuybb7vERz9Qk8xopJkAwEL45xvo6h4al7U0EE8LTu0r6NVJL98du/Nsdd
FB/3f9pcxsCJzCJlSmW8ETkfD0+mNZJ103BMSh43kKsUx8P5sD08ue4ggyon4xhotaAi9b1CjQRf
nyt0psbRcRHKNduJjEDaTmy7u/8Xn31eCn/+cL3AZbYikmG0yEjIz0xpdv1+va7yJWim19OrEQqk
kQUGzoSY4ZVGvYITviyCQvVoyjbtB+UajU0BkSvxKqqdxGsRW6pl4ZWKtv26+3rcRI+Ndnwx2uE2
Li4QNOiBXnl3KJvj9vf9GeIK+Is3X3YvMChokdbfUK96Ni6pB/sNPFIFeSPzFA0SCg1msWDgLCB3
Sfp9ZrdKWPSzEQuVTIcRForXPkmviK3LtpyaCtfc6EA9/hujdRLaRCWT6HD5CTKymRpmPN0NiKGc
C7HoIeOMYCGv+awUZagXBTLBdnh9ZTAkMEgsJEE62m0dmWXxwg1qe82T+8o2+AMEMLDOBy8gY8h6
MGckRXBr9rrNXtxVqznXzG8qWlKVYbZZ33/1j0IyEB/UEDZ/xP6vaQMHKun6SPBG7iKVKdNwyhAc
i9B6mToGDnbkaeIr2ECJ25EpRrE4ewUFzgJTOCd5Dg4xvKIPZtTWSK5tOJjQlaMW5gahNyMqHFtr
o5QL7xbKoAMd+x5FJlCaZb9Kt+AsDqgRWG5dJPKHoLi8suq1kqxXjplqpbll0aKIxSq3A6C0EN7V
dAqSgGSDLsBBx16wrqtoUx2arQejGKwmTMsL6qIFpN6oAKt1j9cAxbB47qxLgw3r4GyvoPrDwa5K
8AIeDZY6bn+hL9O2hKs7G1B1Ni0N6+WpWL75vDlBSvyHTQ1fjofH/ZN39YNENYcB7gy2uetvrsia
8vyV6T3lwNcTRVrOmvSqV97/IAi1mTEICZtwbgwwOanCRs7d2OnOG1mGusE1xt7lpODKXW87rW8L
2p+LCqzISNQolI9qmukrjG4+Cju/UzUb3No4OKieh3AOJj2TXN+/gqr0eDREPwivNdOAwa0LrVPP
+Ie4KnWv6BG/muoBoMo+BQXA8RqO5fTey7Q6fELBuxc8DiVq7izUu4PyUIX0e6J2C6jy/at0h0BB
eSAKEur4Itq+bKmAcXlf+BlBEF0loAjoeBrjKjbH8x41NNJQRbrVC4FYbQNcXaZ4STckTHlHE3JS
fN3hO66ESjxwN2PGZ+T1GTWRPDw4I/TVoZmKhQqxg1e9MVeLQbKX8Rw2oMppcFqnrZICU6paf7gN
M9C9TYH5TMLfLhckS+PsBxOpGX91r+DeZVj2qszD4ltA3XJB9m5Z/SPG7tXy9sMPiOqK/RJVU2T2
tNLV6exTXd/5qu5W28YFVnORxliEtbdfjc5DadjekzoaDxNzYS/TYkgj/SdjDnJxP/WvkBrENPkU
fhLjrdeqs8qdzgioh7VVVfAcfvlO3I+TREPuQiso7wKhLsu4WDleubsRNXtnf+2238+bz08785ox
MjcE55Pb2pvyPMk05kkhp2ORikpehNKIGo99Yec8fgCsROp5lxr1gLiwZ6y5mINBxVWfzCeq72Wd
DAvGlFkRPKpL4jHyyXbfDse/3WbAoMIM97S7qr9ul2ckL4M+vWuZWxLHeBtMAFSXpo622vXdxyXt
mBQSy0IbC6EFFHrXveSTXvAr5jZAMlRBLxKD35a9RWwZWXUXU42fUaF+RZMym1QZ/C4EnFjeXY8+
3jYU5o0IlEzmxczCa4bQlEFwImB/wZ6w+0IAXFyvB9eCEuUDzX2vDwJNI+quvV95KITfhnqYluEb
8oerBNQ7jFL28i7UxKmLanOrAB5GMlvzdk4nbi6tmtopdGZMoshQPdyKHtKR+q1o33wLjR6IUU7a
15Extu3Jdrs7naLs8Lw/H4428+66lSS74McvjW3wly3KeRfBhq/54t2f+63bZPRqa+rdGsDP8AMu
SokcdqpMOr/f1nNHom/hpFzzlBOwrqnbJSltgTNnaeHW0R4YjkvPvV41ZLA6Ky6kf3BqeUzS3rO7
hntpZ277iObxbnNmbbvs6bD5YhptjQNaQZqMj406FqH8lqTrFrrstdS2VWF3EW5ntpToQyRT4XeP
fb4aHurSedk6Zy8zBBNZedigE8FEOpZ86e6thrKlZIMbdLSAegC4NWwYeA31T5Awdu9Jvea8HVNc
em/apobUVxHJZl7fyv6u+IQOYCrlWWBstRoPQBjvh3O6r32bOSl10gLs9tXhc1omiZ/QIDKBosH6
lvCd3gU7sZc130/RF2OiXmKB3XFbAeIVe5WGgsFUj6HQcqtKBKw9i55zBSYIP6rUf0XeOUdYJa34
urherysWelDwCfQUMHzihEaeFehTM//YsjkPApxbm+aSyNl262tz5Q7VrYl2Ke7L5njyE1Edg6ze
mxzZf68HiCnNbq/WNr8P+w2kctPsy1Qi+QGBSTBkxTOIM5qEIoxDpeXa26nRr0Kl7T4cFOiduYJ4
BWVbvZjG2I7Gm/HFCSBfrl9u+FXqkBD7wyJPg/fAQIxaYW6CO9EPKpLmuMwplvCfENkwtbeva/Rx
83x6Ml/7ROnm78G5QqkC7qi35an7wDM/nHfR+ffNOdo/R6fDt1203Zxg9nLKo89Ph+0fyPvLcfe4
Ox53X95GareLcBLA24neujaX6HCdmV9C8IsYmcT96RrLUUnsODGVIZ2/RSGKgSq3NSA4oQy/aJCD
aCxJ9k6K7F3ytDn9Hm1/37/UV0M9sdKE++v9xmJGza2KD4e8qmrAvsVAfUviZd01DXbdNLJZ4KvW
RWWetVZjf/IedvIq9trH4vp8HIBNAjB0b/jZ2ABDsljpeAiHXIIMoaXmvWPqXTUaUPCS0fioqWK5
dq3kleOyFdTm5QUSwAaI5ZWl2pgcsXemAv3xGuUGNfGsZzPmzYafEjvguo9+2bHVZCL5Icms4MKU
JBekoOjNZETjwmcPslaD8KFa3dz4zzDMSlCkgeSCYfZHErOvhnZPj2+2h+fzZv+8+4LeoI5DYWOB
BJ9IsNKeyajUnr4ngwEI/t+H4csJLTRJzcNdr3KrsUyaDjdix5MPA9c3ceJivD/98UY8v6G4yUGe
78ktFnR2FX7Q9EOBWFcLCbYvGoT0LoON98oZYvoHV4Ptu8D7aiW5Dr++conryu6CNjVUimSq9Mps
Byl0EUZM1ujcZiErJiuzuYGHZZSC1L6CnJqnRwGJAFFPvWtopVZQdEEO2mc1QAAa98osUzp3PUmI
rQZnjs0wnxZol/9l/z2JCppF32xJGVR8Q+az8Ml8m9lFhHqJH0/sTlJOe6aEsXiVmvtohW3Ivk3Y
YM2m9aeck1Efhx/4BbwbomZpCXnrRTVr04CLFPN7qOIggQ1VUdo5ofrdT/sLe5T6QrEDWPzAJ9ZT
5U5gGl54S+UBbU8jiFqI6W8eIL7PScY9rowzZspfyKt4BN65Q0q6xMTC7ZhZhEiX/qpQ+0nv+Sdk
Jv7ziRoAlciHD+8/3nr9hRoFju062Daz6BxzUK8bVl9hDSwyX2YsUn1bRGjjmbosDoHmswZsLYQT
PSSZr7JgT88gEzIFf+SI00JpD6CJhCJgsLoFwzaVAnUvL/NQE6aQCV7ipCa5sDTAcbBrpp6obIax
P22DtWd8M7lZV3EhwklBXGbZPWpROCmm6uPVRF2PxkE0NnUh+KmQU4cyOhWqlBD+QCE5dRsRpgil
gkOl7X68YMDoAWThSIIUsfr4YTQh7jcSXKWTj6PRldcZNLBJ6JEm5GtKSAV5SDqBTMQd1aCm8/H7
96+NNXx8HK29ijyjt1c3k7Bk1fj2wyQ0oZdHYFctX1cqTtwXoti8r6AUcypLrP7hHwt2X5XKaRTQ
ifuQmjHzOm4Q0iwcTmzi5N81MGUz4l8A14iMrG8/vL8Jna4l+HhF17eD+SDNrz58nBdMrQOTMjYe
ja6D6UuP+foF3V+bU8SfT+fj92/mY47T7xsoAKMzVpxIFz1htPwCBrB/wf/0n9f9n0e3eocvgwhW
EIXX8GZ0Hnpi2Z5YfTqdn1wWJOc0nOW6VmtTWqp4k7MNDhGReLniTi8Jj83fcAjFNTOg/44Bgf6v
yn5S2NkEwvCrzd4NfcdhzZp5gh39CtL745/RefOy+2dE4zdwhv9wvtCuXywoj206lxYa/ASxQc4C
cQPfX7w2hs4HW2l9UbjfbIWUY9/5Qk/IkKRiNrv06bQhUJTkFVH3OQ0LTTc653loO7Tgrx+iwj/p
gQS9k0N4yqfwrwAC/0hF/fc0esvJYrhcV0X0mP3Jl8Kq91cfuIGbZlPv/sggykTNaTxgwYJNDYif
Rl7aN5BVmle/vZ+MWWiOC9rQos0DEBEcOS+CX1w16ObPf3RPTv0pLn8RZtDDt9i94fPLsu/Zvxtw
Scj1BN4OubDMfiUbM3yl6IGxV0qkB0J/MhpAxkPIkOj65taDtQmaBzVydd9ImVtMz9ANZChgH12b
tNuP9gmMJeItAIeMgly43W3kFWfmJknzwIOv2AnX8eCDBjMycS8jGpr6PUZGcjJj0rwH7P1lhh6l
fROLdw/ha01cimPVxpXr0PHpDD7qVdp842C/r+5wJf5FH164L8wAagzDg6icFFC1+UA956ZxuOT4
aNgrd3GS/tE1MPA6n8IbMM2C0Dg2DVZmponiL5ra97Tu4Ixf+JM/gEPV9CZ4YFL8m7Fva44bR9L9
K3o6uxtx5gzvZO3GPLBIVhVbvIlkVVF+YWhsdY9iZcsh27vd//5kArzgkmDpQbaUXxJ3JDKBREL9
nrIlxE6SzCSknDu5oaaoLWKi/BCUThGsQNDkpBRwN6V/VNLgxHmnpQUhe0Jf/i6nRc/6BaiTdM7d
Ne+Tk5QzrGy8XzqlSppDI7ae7Kw42Sjy3lGfwNeKQybS0A9VnClIa2R9BE2dPZsGs93FfZeyLLuz
3Z139++Hl/fnK/z8h6AgifdLsmuurvSzQ9JWIjybb99//dT1L+GUoDnrx/Knp/cv7Hg3/3t9Ny/w
i/nQijVmf+K/k9Iu2CEIgNV8v6edJjgDrPVNRxscnKGNr6QRg9ik0kICaoGAVMqXi/kHbTJxK7nE
zY1i1EWDnqMdZfNObXCuvJxOnW09m9I/Mx7KdSQuM7VVZ9pYdb4fkektLAVtlFCduwwoarjw8QJm
xtPnn8/vglE+D3p5kl8oCYFek7tobPpH6fSIW2qMTN01SNEGwaUefRLmmdM9v788veobg9iMcbFc
35W7HoDIUQ3lhSz4Fm6cG4kf2AGY3fF4iYEkecKLTAcUOPc0lixXs+gClbFxMM48ZVaNZULqfAJX
1Y5ndgjqUWiLlzHKbGEhM8oGWIjTjPKZFtnirkH/rgumRVc6vUqO5lJbdYXpG1MbZeXNJsrrxL3J
1PZOFA032erSFAZPYAIpYUfDcKOlyj7ww5CuL8yU5pTLd3iEClXHrBK3UUWwGWIaYK4apmbcJ2Xo
hLa5yOhdMFk1/1jOtr/9DT8GbjYZme2sm/f8+7jcg4wuLJuafis4T4mtNl7u5i/3ks3FZpt5Wnvw
Lb5EvRgpoU2qNzBHQNTF+tgus06xpwT6R6qVFE0X2vbmGJwOkrZYWDdvMeTlZhYALy1sblec3gXo
VkSFZ4iqs4FzEU+2woFKYZJrbc3J62eO3lCc4wPNPnFSVTawKmJZ5jl1OP1dZxiIplnB240j654C
0Thuy66kaEb+Sx/x82uKvLE2qTJQaSQWtoL4jAMf6ZICVtOcsrTmlJKkGhp9VDDyRsG7xA7yLtyS
zLAO7rM2jYnmmny1iHRnL64PVG1SVn/r4yMO3Q3BxRnJZVTAWMCLmlrZRaZ9fE4xMMo/bNt3xMh5
BO8HKlEOHShkm8WfDgCabq6BmobMcHs6lKA5S6z6UJ859PZqCVHeJuYFADCQLbxdVZEEOgpMYkOt
VvBDEh+MzoE5y+bHPAH9lrL157Hbg2qlV4OTzW0C2uEn2/WpydC0G7pc15euZsPM9A+NkUu2P4/b
g6S+6ksz0Iy1gXlJFAmoHxg+ebHPwIgAQ0s1XFV0pOeTzGMqIi5n5BicAZywy8jSBN/MRDbw4g4j
mT5qMZO+LZitqRWh4qcBadwKOx3VeEoLYVwd6yI95LDS9eIOiUidTvy1FqjORSF/dbokqxP3erwI
VFJzU1uDHYuQng1YCh5xT9h1WWhTAOdAOK1CekbNrqaBXNZE+P42tYTkTbmEOSbSYfB90o170S1m
MoaQzhg4uJ6kN6B1w7oh4vSJtZD6mLC7t0C5UQx1k2YqzL4Xy7J+t5/CarINsvYgh624apHYFhKP
JpjXkmvGiu5jz7Wl7l8g7tFNVnhlMkZ/EdIBjbWtjgmdC5NYm9/PmrsOiONrJWfDY1V3FIIdStEx
ykgvx0tYsAQmrBQIYUEGsAEz2WSDLioz6lipT+CnKekmAMD0CT4WoGxyMqqY0MyYOzD4Wp9yJxBZ
ZpOL/D4HSpUZ1GyRsTpf6p60QJCLzOMC9cRd/YGOfzqn3vWu+6lxPMyGZATVpHhUBI8Mnrs9Cc7t
3Z5hXcazQ36NhhTj+l4a36uFQmk2tHSrBFtnX4MQR2c3mcz9ZBUai5J4kYnleZit+PLX68+X76/P
f0JJMHPmqkmVANSiPd/EhCSLIquOmZaosvCsVJ6hQi76xHOtQAeaJN75niQ2ZOhPSvbNHHmFa6Ce
apsdZWKabfKXxZA0013W2bVhq7HE76c7YrhtKSfcyVeBWLsWx1oKHzkToa7LSQFktuzZ4tUUsodO
+eCfUkf8iIe0vvsn3maZvI7//evbj5+vf909f/3n85cvz1/u/j5x/e3t29/QHfk/lH5n1oFSPLaY
KLR+Z+sUjNmJke8xfC+sFFUfK00dD0Meq10NJpUTuT69GnIcFi1DCO4Jv68rpdT7Nim7fq9MELz+
M41bKY80vsDQoFUUPnwwtC67r7dx4M84Z/1ezjkrs4ujkNja4stEqnBsIoqn+aTxwAfF8QQWtXRN
kNPFEyomnMujmg2urUWjSEoRrxtuEwu03z55YWTJtPusbORr4UgtmsShXVvZHMR12TTR+8BX8y37
MHCUEVheAtAxVMahU0syqWLGstS4StIrAoPpLREGXZXxDrNa3EoVkWpQy9UM1F4TItzdMFG6sM1z
Zalo712l+p2bOJ6tdBDo9iVIoUKR6V1e9pmSIlqOCqVXy820rgPlQruiofbRuQrysXGu5jnXPVYP
Z9BN6YuryGHe/1zQcd+oEQMElnnv/SbDSF83QRYMRxb3ucFERo5rSRnGiPCdEbmBh6JVCc1OHdZt
EguRIUCz+AZmIgB/hzUHxP/Tl6fvTN1Qz8y4hKpBRoxnJ9GkYFFR6jOTnI0T2Iqs0pytWcnqfd0f
zp8+jXWXH9Qc+rjuRlBsDbn0efWouh+yNs7R872mrn3XP//FF+ip6sLqJ1dbXOLFirVYogSjw1YZ
dUcOmQ6q+FwCmawnqaZVW5oMuD5qU4EvmpkaFZJgQid+dObfWKfQGQcFmGl5Ygyocaj6EfPiOXdq
nXQfrtyldemuMZj4iv26Wi0dGfBVvm8If254qlV9gxzaqEDa59cX7jCre0FgoknBIqreM5uWLsfM
w86l1/YSEP2+wYpNS/lSnuk5urd3sUgc7RsoLd4Q1VQ9gEbbjyL+lsgSGm6Z+99YyJPm9IjvZ2HE
0yrr8aEzvAXHzPWuj0u8hXf38w1qhxdUn0E8fGFXYkFmsGx//D/R5VgvzVIYVX2eg11MwLi8VLJ+
IFkDAj9q3XMoRvkL/I3OQgKmoHNqkeaixJ0bOtK25oKApgpd45EDamEqqR3TGd2XdiSqPTM9jSM8
lj03KZVxGu+sgPYJmVnMx8kzRwmS2O2sSDYUVZTKHjToewxDvlmADoaKYSlbWAbbt7aK2OToB3gS
rcPl2748DESx4yEEhY5oUe38ewbqJCtEV78lqSXaeicbqMuH14Jqnc43RM5eGEIyfPYC7yyi+Krt
JNPHo0cO0AmkTSKVK9gap2ha2fJBloS51N0IgUM9BZMgO7r1sUMORAb5Nz8OHL3dOGBO1QloH6ll
OLFLATgwNnJPHo8V2ImS5JoxVVZxWqPZbSvmYEIbueHXZFb7rC1Eb15RsllkC7APxv3RMz19Nmep
W0DqFBY9SwSi45PDAZFwU2qJ59VLRZqHyAroKYAQfS1v6ckHz7J3hMQwp8qgcFvwA09gbY5sqEvk
OAEhegAIAkIKILALyD4r0xKQcCs75BBVbzHVISQryjK0g82KMh6f9paSeMItCcM4dp6hzjtDK+12
5BR+SDrP2up0Zgh3+DpBU1KLQpeEdkS2MyBOtCm/kwg+JaZhl5ZkpwI98ohu6dLB98kilIFtb8t0
ZHG2RDK0ne1ThSlVb0cBccl9/FXliDv0VclnnbIFPfXH04+77y/fPv98Fx0vdZUClLMupo7tluxP
Y3OgeorRR3qJBhBVQwOK383babokArCN4jDc7bbacWUjhq6QBtmkCx7uPpTFdiI7w2MeBCN9iVUv
1vYauCa4PflXvg/muwu2R7fAuDUgBTZ7q3MI9WAFaSmw4uFHGz3+UFG9zezceEuotZ9iop5AJSrY
fjo6pPq6luSjNfM+2FketSWkc7nbpdpqgJUr2e41L/vgSPTijzLutxnbT9XtlLpT6Fi35xKyBdvK
x8J2S7AAU0iZSwtmmByIuaTKMKN++JEShtEt6cqYgo2c3Pj2QGVVcT/SFgYx3p0GV9zRMq1t2gqk
RnGZgcUhQCsvRzBW3kZ5V6aAKDHbrR8oHcRNAhqQ9udFKig0u4jUW1R3Lwk4eM7W2Jt4gp05gdDb
0hcnnoBQ3Bl04pKEgsqGe7cZMD/UsT4f83q++6aVl9r9n+IFf3l56p//m1CBpiQyfNBV8hlZ1FsD
cbwQUxLpZS05ZYhQgyHKKcgJLWLJYIdipBxmyFa/ln1ENi7SHaJhsQg2WaEgDMh0AlhLafouNBZ5
e7MMCxdsiytkCbcECDJExIhDOqVhMDqp3gPiBltSERh8mzKI+sCd2mCJrmsYf5ruXienKj6KN6CX
VNEbhTDiwcQKC8qcZAA1BhgQmYAdKUv6srmE2xtm2cM5x0ccc+mhRtD4pStDE4FFVcHrrVPgJd9e
HmSsD4qdMH+Stw+4DygWj+8Zq9s/C8wO2lkIADOcKJF/REx7XJBR1fCxjIg7nq61eubwGFVfn75/
f/5yxwqoyRz2XYiBUeXQsTzOneK4wYnK7qNAVHdHOdSfxEnKSw/8+6xtH5scHTsUVPe9WMjDsePb
bSqmOmbwZoXhWol+iJw63ZNRyOlVijTLaFmunlZzsuQnxz0pevzPsmn1Q+zILV8PztcSrSg7W3BS
cVULltdqWxb1MU8uiVZe85nADE9XUKTxtY+CLhy0xMqs+gQS3Vz1skkgM9o7gjMw14sNfKCPByeQ
2izg12XxaQShF+UPFecIGcTTcFOy3JFcokznIAoZVL7YTx2QT/X+rGLaRZeJXG80VFfhWSDMflPR
iOEKQm4crtKDtpNMSkS/VUbULvmtVDuidDCOd14knlQwon4HkZEvOWbbq6P5mqQ711NH3ICTZuzU
ebm4OMjFHArKiYZLIYyxIQfB4TMm7V3Hc5UWlwPSUwJ08Y9j1Oc/vz99+6IL1jhtfD+KtFwnujHC
2MRUGatzvI7c7UAX/5Y+PZHuGOc684h01ZafqHIovRUJ9Wya5BD55IY9HyNNnjiRrY4SGDq7qcyC
g4DSqnw5O6QfaG1HLxgovJ9gOTEVbJ+Gls8OlRSqHYkqzUoleKFB7PJ6Ueh4Nus7FNHXCmlwk2HY
4vwmi2h3J5o1U1en+ootHITqAwM0a0qh4hKicCLVvWWSKGVDOYPwHk1cP9qp46lvusB3bLXpGDkK
SO6drbZd/1AOUaBKDrYZrRP5CcI6mfXhw4N2d/vtYbX6CYnJEZ+x5C4v7z9/Pb1uqVvx8QgCXH5Y
nvcHLCJndQnRvYLILOZv2KMArCT23/73ZXIbKp9+/JTKcbWnGNtj2jneTmg9GYkcCoHVmP7Avkqa
0QoZteOVpTvmpBAmqiFWr3t9+p9nuWaTW9Mpa9XScKSjr0AsOFbc8qUaCkBEpskhFlEe47TcSt52
TckHxuQdejdQ5Iksev9VSseldVSZh7rJL3O4xoK6LmgolMOvzBXRTeCL52UiIPkEy4BtKkuUkUd/
Most2cnyuBKsUPaIM0aSJV/KZig+ylXI20IC3Ri7S2Ji0VkFuziNOS5VkYk8Tic7kz1nYob3cQ9T
7nGMoqaMAovWN/HiB0bowmXVCmjlfE4oTvpo5/m0Oj0zJVfHsqnNjJkB+1LcXRTpkYku9b2EUOvp
zNCJoYnnmkrEOUCZRJw/3z84oeQWrgCyI5UKntIHqtAznPbjGbod+hAD3m61F6gSLtUuit4h0G35
QHdGQBOwQ8ujNAGFhUiWIY5oUM8NmncNfiPmOEPwUbSzqF20maNootAJqW8NrjZr0qznqC+L3g18
SratDIlnB/Jx2IzxUIE1K7vtBT5lDgnVY6qV3ias4rKrwgL1gUueYs4M3FWh3O/1ZGHweLZP9AED
dkRBEHB8soERCg23ZwQeHzLcKC1yRIacfeUwVYQCcl9imaTl3vVCfRQe4/Mxw/5zdh4pE+Y7yBtj
vO19y3X1Arc9CDefEBiJE7q2Tj8nnW1ZDlnBdLfb+fSJ3SpNUez65E6nsjywP0FHTFXS5LTNtyR4
uJ2nn6AqUiGvplDOaejZwgGSRJfG64qUtuXQQX9EDp9KFIHABOwMgNjYImDLgZAWYOd4FgX04WAb
AM8M2HQjABSQIa1FDtlgliFqTVw4Tj1ZoMlfTyMn8h2mBRjwGQEWR6hv5bcKF5YWZEtCXgtfk5f3
fhd6PzREpvhaV3PpqcwmaIwLyJaOk8YZ005y4V3JNq+nljJf/KBlKQ1UYvKpz/EZzWGrQw7oDeYf
9CIhEDmHI5XqIfTd0DeEUZ54ysR2w8i9UfJj4dtRV1KZAORYnSme2cQDCpYputPCsTWYp3uDlV7/
U34KbJfoq7yPiNn5WyLqEjMVdNbWdqgeZ1F5jxlV8eXEaqPcfGEgJBEHiAJOgKzKSeCOKiYDiJox
zcInhyxCDqkZSxyOY/zYu/lxQMofDm1JcNR1HKJ1kB5YAdGgDLEJCc6AIKKBHZ2Ha4fUkMIY/KSc
Y4BLZx4E1IhjAP36AYN2lB+tXEJqHJRJ41pkCYuhzY70FOqTwPeokvRN57iRwQhbUs6qg2Nj5A7T
Cx8LZxuCqHDJEVEGlFK+wqHhs81VDGBqhpUhqVcUJelVK8AulVhEze4yCuksdttZ7OjJVu62W2fn
Oy7ZgwzytjuQ89Bq9yIgkyikjQSRw3PIWld9wvfF8o6+770wJj3MVKKVEQhDcuUECKz0rbVjuiJA
ftzF7uYjJXWSjE1EC+M6IYjsOGInydumNEXlWD664lsrpiB+nEc8vL410YQddBXZ911OtUS3bzd1
sA4UQmKgA5nWhwBw/9ysEHB4NzmSrUUiLTOQ0+SQy0Ct8Ug7X+BwbFoYARTgptFWc5Rd4oUlXfUJ
220NSs60d6kFqOv7LqTX7K4sA9IzZ1XtE9uJ0sgmFrw47ULpGGkBoMIRtWrkVexYxLKGdHpGAeI6
m8ZZn4T0YnMqE/JQaGEoG9sillJGJ4QGoxO1Bbpnka2LiMEfQGDxbVNcXs5y6W3H3k7lGrlh6JKP
ZQgckZ1SpURoZ9NR8AQOx/zx1rxgDKSk5QgKKnR62k6iCCNfDi0tQoHojipAgROeCBOHIxkJKadw
bJkRQ7VMBPb8PCw/0htjM5aVWXvMKgzmjXvX9eHAHxkYy+4flsqs7ITM5Pqg0zCMf7wv8AXrvCHy
TTMeCeVY49s7WTNe806yNCjGQ5y3/NVsegue+IQ9nA4WZkIdns4fyGnrhb1ZSGTYx9WR/bNZNnOZ
1n2r5jyzk3iaXQ5t9rDJs3bvuTA9OTLzyG5o7HmvdSgtKWJYGSLHFY3KUh+C965Omw/HdeShbvMH
nczfS9XJ5yrKdfLsF0QgCZUMo8IUcKla3+ft/bWu042qp/V89Cl/GgMhjbd7kt0k30gbvYfXpKeX
IX4+v+L1//evUjR9BsZJk9/lVe961kDwLCdu23zrqwJUVvyF+fe3py+f374SmUxFx3vJoW1TLTNd
Wd6o9+RcaPgYVNetb4Gha6VP5/fhTYU2PPBmrFufj12dEAKXnDkYacjdHAfI4d3kIBtsHUttDBYm
zWJ8hI5siO7p649f3/4wV3+6/UC0sOnT6V3NPM1jKMUf70/k4JxbkQX8gQZmGVCCa4kIRDU3Q12Q
LnydJFtisyisLA+/nl5hqGwMcHYyxDIRW8D43fzZEoqIKDq78GEe2fcnECi4z3FmG8tEAte4T05p
TSpX3R6W+K7L90qg7Y56iQImUSyyC2T5r+lttzpR5mg8hZEdy7yhDUDG1B2KuKMfThUTOZZxMiYl
+XCWyKbc3ueY6gKwxlD8/de3zxhAxfxa90F7jRoo89G7TOXvyBybOJXagn3QuaFN2QUzKN3zQgda
wrGO8ca9E4WWKTIQY8EAfudOCXbNEXwK4VBkQ0I/Kb/wnIpErwQ0pr+zyINCBgseeXK2Q+NYgzF0
J2viKXgT7ZOPHIuXnfQdp6pJiwmrtyQWoksRI1/Ngd+NoCyzFXX07s4T8rIK9izzIBiU7lbdBzCV
6VRF2n5Z6L5OC7RyMCpVkAmUrqAzWlEphUBf4Huw1F2Fc1oC2KVzNdtj3GcYu6gbj+SLvKznEtuV
vDkEol7lsnECZ6f1/gAFaOmzG447sGR2caqkdsoDsHTn0ANSkgD5/sAg6iC4x2Bp2LmCugw0KK+0
4YQp5Q9d4Cj1U51Kkcb8gSyLIvoEMZDf/eWTYLA9P6T2zCdYicmzUtX+51T5uudKN9wzXxgizzTW
uOdJSCQb7Rx683XBycOAFY2UGjB/Di0jdjXLlM68hy+nJPmgCvSqHzKFtc36s5plkxx8mHymFoGu
1IZ/23uReNrOaZN7hJR4m/i9H5m7o72PLCr0CcMqvw9spdm6LNHeNmf03AuDYWu56XIY0xkf8uq0
1bdiGbX0LZsgKde/GP3+MYKxLcikeD/wl07UNZn5R882Evzx8vn97fn1+fPP97dvL59/3HH/abRo
3n9/gqU+1XwykGGqw6rPfjwhRRXAqJitGFqc0ZX7H0gDmyEuXRekTt8lmqxSXc45LQqjSEulKPVB
GBclGdYDnb1tS/RdYu7fluj3wCmhJm84PaKj0qwMO9rndWFwbPr20lwbqKR6R0Tn8Mn9YCEPtZlW
33e9RDvbtM7rvvEiVR/4gIBMl4Po99fCs1xddRMZAsvbYMCUr4XthO7WhCxK13eVEbPeD5BrzXz7
Tenod1KZbsNvdpBEvSGYguR4asbX0rct+lLwDBv7gl0zCOVsrqW+EgDNs7SVAPdMbU0ZVRjUZXHy
/dVqJ9x4kCTR1Ytsk5rc1qeS32nRxP+EyDdj5G/kQGwCBrr3UJ7p6LaTeHQdmDKmKJkrD+PoVOGK
GpEqtOUYgKxB1Btl3KRInMCiiXqbrjauanNNDnqjuvoyO5wpUXrjdOVZNzzEwPAmC3DZHMyOuIFa
S66tC9HoXr5yHPIB31asiz4Wg++vDHjZ5MxfFurOpXh3b+XBDWO2XyxyEcUBFfEI0m2zQKvCSSeA
OialKq1MaP5GohuKDMmWsYClvis74QpYBf9RV+8ElslXzpAAM6K3E1jGIfH9dPdsMwHtJpoCDca0
J8t4M/XJBqZSV61DBSF7YrEIKcSWz60lzCElr8JiUwkf4sp3fbo4DJNira6YumuzItxS2ywOZ7n4
Lpl03hVgupIlAihwQjumc4ZVNDCoHwLThhOcwAUqXEg2GEMcQwHQFf9mAVAF2h60i7JIfc71gluZ
AFdABg9cedAG9cVrghKkXYVUUfLoW2KKAm9nSF2O1ShD0c415osW6Y2qMy5/W6wwntA1lUDSS9R6
b7XYzpRkiC4/Zsyh05y2VmTDScbDiM4SoGhnGKZl0tjQfTeaqPE9my5WE0U+3bGAiHdUReQh3BnH
E1j65E6rzBJsfE46wq0szT6PO6pceEnb8w0JN4doMAQmFpnOnzKbvIMgMF1AjJrKz8BbFUCeHTll
mmtJkZmG1Tblic50uiKTIsuNGnJW+iE0hevc7ceL9PDOyiD6g/X1OTl1SZtlFSzx+PIAXcpp32Mz
Y1Smyfx6L7JIEb7s2VA5sr2b7QyhSLT0AsTxfFPCD47t0hdaRK7yQvr3SQkFoW+Y2p1TNjHpCCbz
dLah/p1fRqEhsJPAxS70bOeibQMJWHEEW9Ii25AbNPu6xtvOZoZLmx3254OhEoyludK3OkU+ZiLd
5GK24XgpS8oAFRihxlZgUE4AjBxvW81nPGFF1bpvOt8OXEO3z1tDm6kjk+PSI5dv/zjkWkLtKSmo
7dIbAwqbc2MqUzs9Cgpq8O2c2D7OZk560BXBuENvMQpQtxkkxKOH81UJ0awIzCLe59I1xXVPV6BU
dZ8fpNKWWZrHDMPr0NIrGCyJU+iKx5OMptoqSOSvpsc1RT3aTsyh1cspMwZwZ2XhkRtBiDRygp0Y
x4YTeCBEgTSH1JlIuJQ056LLIkRlehvnVXeK0/oqY7xVtBaRyGDcF73elN15n7YX9pBclxVZgp+v
8QjnnYaff30XgyhMvRCXeKC5ZrtuZzAc7OSiPo79ZWahN3wYL75g1uP72B9hbuMUg4zc5OvSluKS
eOZoW+ZqsLvyZGZi5Dy5peY8Lnma1aP0POLUdjW7Z1dky4tKl5cvz29e8fLt1593b99xm0docJ7O
xSuEsbPS5I0pgY6dm0HnNrkKx+mF7weJ9eUQ3wQq84rpLtUxo/bkWfJlVjrwM9VvTQYx5ioxFpBS
Ar8ZkzhcqzoVZj0jxt1jJZ1sUG0jDNLPb99+vr+9vj6/Cy2ndA/BIw5z2TNtOia5+/3l9efz+/OX
u6cfUHI8V8Hff97924EBd1/Fj/9NdAvivYxz1jwAWXPDWu4okm+lEx3O6NDoteinuiJpycdWfiTT
K+OikL1fIIt1DnDPFENnrd3NubQhBaP52MJol290cjCpU/paIYfRX7MZ6FdiFo5o/K0hA5txDtbk
fXbPuNTCLeClORuxMm3M30ENMm2WKfBm6hNLlxCZzPOIvY1c8LeRlQaY1qbMSTdaSViIxuOHOdVm
3WAtD5QqOJVwcMasLOOm1Wo4JzF5Yhw7rSVhpRz3ad7pnwJwusQGMhdiB20wIpxmRR/rDblAY7k5
nqZ3BsZDKt5dlrHf9P5ePksaPe8ZvHQNrX1PbLNXcHukwpJxJqjGpSEGCqcbd/s5E1PCLll11luO
OSrLQ5FgaOseRrWKsbzTUust9EHVuhyISSfJeVkYC/L56dvnl9fXp/e/NB/iX19e3mDt/fyGIbb+
793397fPzz9+4Htn+DDZ15c/pXPzKeNLfE7F4/uJnMah52orLJB3kRgmYCJnceDZvl4rpDsae9k1
rnLEN0nGznVJ/4cZ9l3xWvJKLVyHGN19cXEdK84Tx6XfkOZs5zQGo5w2KTgHKPAheWdzhd2dnv+l
ccKubOjN4GkA1dXjuO8Po8Y2O3x/qFP5uyFptzCK6+8sdmKwqyIyE+nLVQMTU1M1pumdF4LsUmQv
GvT2QSAgg06teORpg3Aiy2o/h/YYHZog+oGeO5AD2heC4/edZQrUOg3jIgqgAgF16La0eWjbWjtx
MtEgbFs/9Gj/oHm+Nr7tbQ0pxkFuzC94aFn61L46kRx+aKbv6NhDAhzoie12er0vzeA6hDiIh53D
dtSFoYeD+0ka++ogZK0YDpo4GBw/8qQomcpgFnJ5/raRtnwvWADItxeEKRDSMyPURBeSXY+cMO6O
JPu2tv5OZGo6xOnOjXZ7jXwfReTwO3WRo252S224tJfQhi9fQSb9zzPeS7jDF821xjw3aeBZrq2t
hByIXL2v9DTXFe7vnOXzG/CAJEQfADJbFHih75wkL//tFLgPWtre/fz1DUyaOdnVq0yB+Kr88uPz
MyzI357ffv24+9fz63fhU7V9Q9fS+rX0HSkswqTky88Dz/oauuXnqeqDM+sM5qLwBeHp6/P7E3zz
DRaQyUrXhXvT5xVuBhRqkU6572tTHYwRR7ywulLFAEkCVZPPSPXJFEJCHiHd4KK2MLg2fTa6Mhg2
4QUG2rt1ZSCPbxfYszUBW18sJ7YJrae+OAEZTm6Ffa3RkKqvwIyqiRmghrrSVl/8wCOLA/St2jMG
86LH4IhKN6DPi9fPdMHJqESF/GBHUEPH18QjUEOHEHZA3271kCyO+tTUTI8if0uZQAbS5XGGYQV0
qHR3SiEJhs1G3fHnhhSq7Ub6jLt0QeBozGW/Ky1La1ZG1g0EJNv6GgXkRgpItpB7Ou3e1icQkC8W
mfaFLsmFKEnXWq7VJC7RiVVdV5bNQLNd75d1odmJTIMJ7ZG/nKEasGmclOR5nojbxIe/+Z7h9aup
Lv59EJuNYga7erpA97LkuGmW+Pf+Pqa9Eic1KyG3xhiW9VF2H4nLLr3wsDWpAJp+f2vWX/xI1xfj
+9DVZUJ63YX6ioPUQBvpQI2scLwkpVhIqSSsbIfXpx//EtZJzX5BHwqzbowevYFWfPRQ8gIxYzkb
roQ0uapKrFqIhsl7BvoGAfv6+P70/V/oCE+8x457jnlzvhgdlNNWOF+HP5gaMqbiQxtITZsxPg+j
dPov0DGwo7JBzlAWf7GkrratcJcVBzx+kBO+L7vxlBWN7Fi5fgUZl6A09XVTF/XxcWwzw9sy+MmB
nRBs3bxHrqKO0zFL83Q85G15jcXt6qmukiqOtGNWjuzO5VxUpQomDL/rTrgfSqFdcmIRBpcHFib1
/A7mGK2H4lfAiGeDlmi1zfQuL2zxYbSZXg0N2/vZyWa8BqtPaQrPFJjKxhX7ttTVUUz9lBZJqmbJ
iNAu9XU8V2nWtmdTX5VxAaM07xrlBTLW7nWZqRvxs5UgFEfuqr2QmgBcjpkyPy7QrTJlebmOT7y2
TySRsrL4GBU8zRLjCJx2jst8UEfEhICgWV6TzSaTjVnU+/eXL3+obTx9dErL5aPu1z//pslkgffo
pGTGedOQ9ENeJiTAtk5ruhZdEhf6vF63zY3z+JyS4R4AYSEj0utcVxUpLqnSaU1cZUsEh/Tlx/fX
p7/uGjCwXpWGYYzM1xnPg0B+yJe1BZbu3I2fLAuEUuk3/lj1YErsaN1x/WpfZ2B+oV8i2Ir0WYbM
3F9sy76ey7EqbqUNUhwEkKHFOMvUMMTH/BrZ5sdZkafxeJ+6fm+LF1xWjkOWD3k13kORYSly9rG4
PSWxPWKslsOjFVqOl+YO6DeWJh44c17keNIE/+2iyKZOagTeqqoLWJ8aK9x9SmI6wd/SfCx6yLnM
LN8inf1W5uk2RN9ZsmOhwJFXx0mWQNtYuzAld0KFPsjiFGtU9PeQ6Mm1veBKJy1wQkFPqR2Rbw+u
H1T1hR3LsbFoGwosMAVB6NBHmCt7GVd9PoxlER8sP7xmhseT1w/qIi+zYUTRDr9WZxgR9DsYwidt
3mGg8dNY93g3YkcpwwJ7l+IPjLLe8aNw9N2emu74b9zVVZ6Ml8tgWwfL9SrRs2flNPgz0g3Yxo9p
DjOyLYPQ3lG+SSQvbsmRedfVHoyEPYzI1CU55pPGuK9i1x0SZ5OrC1I7SG+wZO4pdgySYGUK3N+s
gdw0NrCXt7JFlknd3M46imJrhD8938kO1q0xJ34Yky9NE7z1AVKmC5zl9/XoudfLwT6SDKAAN2Px
AEOwtbtBNH01ps5yw0uYXm8weW5vF5mBKe9hlMAs7Pow/AiLa2hfPKWKk8FzvPie9kxYmfsUT95g
VF67E2lJC6ztuXicVsBwvD4MR4PsveQdKOT1gPNh5+y2pRkIjiaDjhqaxvL9xJluaky6nbKIi5/v
2zw9ZlQrLYikB6x3iVe9Sip8klYYfptymmbwKW/qKhvzpAoc2RmXw9AzPeSO2rpLHwoxvikIR1wN
YOvSb88zw2RabYBUsccZjJwFes2A9Cn6aGc7VJgZmWsX6KWX0fNgWoFhlYafILAdZXyizjEqniZM
p8+OMbYchpxMmwEvRxyzcR/5Fpivh6vMXF0Lg6mKNkvTV64XaFO5jdNsbLoocDQ1ZIE8bZUE2wl+
cvjKNOgB3VlibImZ6LieSmSX86kB2Z/yCsOWJYELLWRb8iVdxlF3p3wfT6eJZIRygk0pgYKGm2i0
hYpbNQyFpfLQeLqagY4RVeBDT0WmpUNgCfRUm9R2OstW8uOulyDhYH4Eruyar+Ih/c6nxJY25vSh
tZXc0TzWDu4UQN8vYIKjPKVN5HvBBjT+Fjq2uv9AmTcTccpJE4a6JJOKWh2zKleKOBFx20ixfF3V
NgT145Jruz4TeStAH872QVHRgHDYKz3QJs3xrKZ/LG3nTAdKXqdYqu5rNYWty7L+kjlGhR/U1lgp
D3/h93hQpnqZpOpkztNOqd+nx+qhbGCUdee9VqUzFUCVFQKForIpsejIWdWzDa3x4Zy390p++FJz
G1dpXc7L2+H96evz3T9//f778/tdqu7KHPZgLKb4wsCaDtCYe/qjSBJ+n/bJ2K6Z9FUCP4e8KFru
bC0DSd08wlexBkCDH7M92Hca0maXscmHrMCYvuP+sZcL2T12dHYIkNkhQGd3qNssP1ZjVqW5GJ8e
oH3dn1b60oOIwH8cINde4IBsepD8OpNSC8nnFYhpdgA7BEad6MuFOcbJfZEfT3LhS1hWpy3FTiki
7lxgZfu80oOvSUPjX0/vX/736Z2Ivoa9sb4cLaael5R8BQDmsMKacLdwU0Md99SuAwDNpXWkytag
DeK2tlrTzk7Z3UpTDiykGp3HtQR1w5dyuZY96iGt2jHNENviAomstuz8hmU5QZ/soenR/qV3trBv
SvLaBX7vJvK4dZNpB7zNjhjSV5kIcigfRumS80HtLmUnTerJPcijofd8w+1I7CLzK1I4YmPl4j3Q
ppgK9AdlhqZKXcpV2bd1nHanLFNmNNj5rhy5CodCGTeUPlSixJUcbmeKfDth9WkH+KA4Fc6nOZT4
5LFXnz7/9+vLH//6efd/7qCb52sS63nMlDhugbCbAnibIBe9ThGZPdRX6jLH1a+W4q4c933qkEdW
K8sSiIb4vLnSj+zNuBokT0bkh/ZmhPnfXgvxsaQV1O9prtgUa5EcfhJXFJGvQCg84nH/CgnR26iW
ClwrNkI7utwF6G4+LXYkptBgzK1M8wXLG2yG61pCZhdox7BoqJrs08C2QgoBmT0kVWWoZJaS0+PG
JJhzYWelyjI1QZN2u+QJ2ndNZqWdeK7fdPW5onQpvKVSn5JcXofXvIVbLDIRxjAPsb5kgVS889O3
OeV7jvC5AMtUOizlSVWVElMNydDap/EUd+MpSSVEYasqqFuSjVV2nSTBcugk+4fhs8za7SpMYg7D
js2ed71aqQMknFd5j+HzQLmk/ABYKo9VjCEy2e2pTk2k7k2NAsjYtHV6TvqCyB1hEMwsRH029Flb
YXz7M7VJMfVAx7qAvTXY7fWeY9f9zqCyVymPoP8PR4R5ry7PX5/efvy8S9YLVFo4OtaDQThYltZR
44Aji6am+2MSNwTQwM90VYJC18VAaiWeEzSfqV0YQ9nfkx+WF1Adtj7E0zL1yyn0NymKEM+mypu6
fTg7tnVqpvaRPsW3Ue1gUL/WeNzA2cjhAEMHstA7oCa7ZabyKPbaMFzQntrek1ncxFH2OyS8aBLX
MeihEiOGCL7NxcKW32ZLwfquks3CdyeyzPwI1phDUnUsZAny3moaXZlhctF2Hb1DuiKy7Q0yDAFF
ZLZRHAS4tax9hOxTTGyp7Ehnl1xx6THWcL66BL+fpHZYxATX++6S16cfhHcTEzuJUummZdeMZOI1
Vbh6dpDOw7LXffafd6wJ+roFGxXW0u+w9P24e/t21yVdDkroz7t9cY/LwNild1+f/prvCj29/ni7
++fz3bfn5y/PX/4LCv8spXR6fv1+9/vb+93XNzDwXr79/iaXfuJTm28iGy9ciTxgahd9dr9WbyIw
gdxoEm1JOu7jQ2wWMzPfoc0yOly2yJV3qXS8JmLwe9zTUJemrbUzFRFR0j1YZPrtXDbdqTZkEBfx
OY1p7B4fqKCh5LEBOxcfGY2TPc2CgaHP+8DxlVqf40VNwAGcf3364+XbH7pXDlsT0yRSWw2W+raW
+pPJAtytJK6TzxhlibDU+rOr8iONRa039j3jOMbpkXx3fuFIMWwf2HTa8OXoxtgtmYxI5b2KFdgs
G/6zXTamNQllY53RvD79hIn49e74+uv5rnj66/ldPGZaPuzhn8CyaWtoTb4zBPVfOM4D/ZjywjBf
4l2USibvyhhExZdn6d43k2p5PdZV8Whet6tLBhZ2jNe1TZrkVQzcPVOY9qz2AwM2+4FxbPYD47jR
D1ztu+tU0335HhdhosyLE5gK3GePMEMrbUgycI3FsVXk+jBtapNpdJvVRRucKBV7Hagh0qM2Udic
PuH1lEwRTzN1PKeJASm70oBAGQzIEWRZm5tSnGOJaFpiKG8GLCIPe5J61oTNiq4LyaMEJlqhFPJz
HiuVBf6sC7MuMbFNddnMYe1eHYpz0Mn3JrC9d207MJRwnxX3ObXXLNbi5Ho2mfb1lPfZKYs18T7h
GM0ElJ0kKzJD7AcxmwYU9IHMZ17aysiQUVaaru4LTIc+BbWW3A0RuC6gSbZkKfImfjDkn1PRJMXy
gcjRrU8FHMUgOWK5I9uRAz/JoG+IeSmOMFAbbnVz3lzpap/PhrxRbjVxNTapSTbJjGTy90VHV/se
98THLjENrjLpx7PjmqTRzIUbx6YU6i68NbMZU+RpBtyMDufbI7uKL2Ws7Q9NYFM4rmU22Sauus+D
yKeuxwtMD0l8pifQA6xouEtFgl2TNNHg01h8oMUKAmMTp/+/si9ZbhxHAr2/r3DUqSeie9rabPlF
9AECKQllbiZIWfaF4XapqxRdZTu8vOmar39ILCSWBO25lEuZSexIJBK5JKl/JTPsKq1rcs1qsfc5
x0lu8lUZY53uzRplrjertP5M6OX4oFxfRxZeWcG7KI7KC1ak+G6Fz2jkuz0klhKSJM4sGd+uyiIy
nLz1Hobs2WveWeRtlZwv16dOCnC7WTg/M3GP+kPQVRFGTsM0Z6hZicbZkUwBRJK2CRfljtuhaQCW
pZuygWSWHti/vJujgN6c07OZj5P2BC6QJXnZcm/U5VGQZuGmJBUYBihjKaSTEt3la9atCW/ApWXj
zyfj4s9u40lBWaDXEmJvQdMdW9WkQXNMy8aX16SuWRmooEBPEZuELU8bpchYs33T1oFMyDho6dfX
kQJuxCfejKW3ctT2wSm0bUE+Wk0Xk31M27jljMJ/ZotTb74MZn52OveGixWXnZgCyLjm+P0oKY+U
XBwpAxTUj526cRRK9u7XdPXt58vx/u67uj3h6phqa5VlhPEQU5SVBO5p6lq06FQgghjwkWEApb4X
G7Uh210JSLuwHqiStK1ujEo+tkRA9+lmB1YLBNLtiSaNPD94SgB4kNix9Nq/r3++nZ+fn/pl9S8t
I6Ps9F9eu/xmKujovdsmAQuONHhPcClibxKaCqagS8TR5Kr6NdZoSoo271bteg2PTwOdJ9c76+zw
fHz6dngWYzC8ELjLTKt6PU4EOyPk/EZf3aKJsmSDa32jcrWTWusZ+chSXgYqlmpPpueYhQYg8114
fwPYLOBrvKiAVGp349oGaGTsFFmJr5GuiQN5Oj2PfaTnb88E69gHXF0ZZe3iT0VJm+c3/fODvbLR
eXV51UqIVlXJHUMLOYmhotcsIZ8Qh5YrnxGvuxxe+QcVrINbcx+yZYkPamigX1X/XePq7M3dl6+H
15On5wMEzXh8OXyBIIJ/Hb++Pd8NQQat0m7TOnbHUrMUNLMtKMhicTh+3Y8PhV4NDZzP3umxiVzZ
N0YJH120G5jOLo/yl3CwN/C0F6hQFFRVFxNeNU2sqdfpipKYflvwNpvbWov5/ansj6abKnV2oASI
tROJFq7QLeW42K6/lgF8l/htVZFskxnnECgI6Zui4KDsnHg5QRRKJ5VxNSn9Om5+Ph1+oyqDzNP3
wz+H59+Tg/XrhP/n+Hr/LTTJUYXn4CPGZpJdL2ZTf2j/19L9ZhEIpPlw93o4yR+/HNAMu7IZ4E2d
NeELVdiUSInOShGHWMevmZBk7dHE41znaQ7p6C0lv4G4N4n88OPx+Sd/Pd7/jeRmNZ+0hbxBClm+
zd0Mdryqy26VlejFLucKhVX27vN8X7l5bWptAwqwmQCLgQEi7QekWRUGU6Fd7aZbuFwIbOKamKGS
vaRb1SCEF3CX2V6DTFtsBoduMKAJxk5+FpokSTApZqfTxQUJmkNqhhoyKuT19HQyC75Z0fxsNsWU
DQPaDiEiodJy7BQDToMKlJVZrHwZJGEalnR24cZykXD5vh55P1fzUa7EZHdXLWozapPUrnpPoiLW
U6pJkOZvHnZOgNH0Ixq7ON2H3RDghcz0AZZE8W/9tDAGjNu4SSxkuFgswho1fLSHQHM289daHwbd
LVCZ/8UnQhkBRquys1hIiJ3Fy1l+ydTJpaLGoJkt7Khpann3+ZhtaJA1RUILHi5TIXHuV6gBl7Is
ogTi4nsFNRldXEyQKR7JmtNvisU/XmllMz0Nh7rPfhori/HZZJ3NJhdhMzTKsznxuI58/v/z+/Hh
718m/5KHSr1ZnWizvrcHiOXAnw73RyEVC6HHsKqTX8QP6aS0yf/l8a0VXOn9KfZTa6qVAFl0w1We
Z/s6ouOXeEi3Fp0pmWhzsNMLGIs/iQBUEcicYoIEnGpEq4Dv9Ynvws26yYNxVzFgIEZD8/gsZIQ4
9yekmUwvwlIJFyxzgWnhJRoMf88uUD58dopmPVQ7ECy8F/62bJaLiQ/km3w2kUryfiE1z8evX8Me
aHM8/0Q1VnoykWEEV4rD0jGacLB5kwT9M7htSupmlRJMh+IQ2h4TeFG0wozjHBIiLi071txEGupa
dzooY3w5mB0en17v/vx+eDl5VcM57L/i8KrCsmsR/uQXGPXXu2ch4f/Llhvd8a1JwcEpKL6R+p7K
tAbv01WkYLjXgkfWgMHmu4OnIxJHmt+gWllKhRjFVhD24caMnOBPd3+/PcHovDx+P5y8PB0O99+c
WEo4hSk1TQjFzFfqhkZj+SeQ3N6Y3QawXk4OMTtHhAZziMD5SmYD6Jp9lxbSABZERumgbeT3oVRB
snGctADW56xU37kt7Mr18BuE4xqe5TdOCGuyZ0DqXAvhU9APoumrAMnJZLI/deuSmZadUq77wpFi
0upiJmSjxLXYW3N4Oc3xBcryDRgqRexKmPSsZgJpe75qaCkuWE63L2ed8zuna1mxBWGZYC5tA9bp
hCLwvQfPxe3fLSGHIEpuB/Ndt4/4aed7HulasarWeiiH0lU6JK/4HigutkhBCp37H1V14tc8IJUo
HkzjcIMFnfT0tCPVKlqIopmcyknAKVgefK5RJquPbLetLDJwbyL2oFZyx0opEAdPTH9Smstuy2NN
Ayy9wtsGuFYcQ6L3ToVSaUESRycnYVtYoF2+ybFTa6Cwtta1HHovi4aGOrO4lssPKdboh/1p3wIk
Fccjx41ZVGwlfPtaOuegJfXtyGphwf62+ZVjY9UwlfGjLjlf2dmv1abOVH963kq/Hw8Pr452peeu
0Sq9AHQ9l4VsRIlV+qpdh64VsvS1FxiKX0s4tpBVOR6nFZAuL3epdrhFR02TxR5UNNoE1HMPAcAI
UaniSL1CVF+DspU0kRh61udA3KS4otCho/4+Mq7p7ij2B1C7DyKwwRus80i8TeZwHAXCvobbXYNT
gnDKGDwzY4IJTabWCFWklmY6lY4L1oNV3CCJ/OPUA9elnPWFC1bqHrDt447uutIxvMqmx336NDRY
d1ZcpsR5vUZabBM4b9sWQqqtkG+9brWODxIrBcuod6CHZ/WVi0ggRiGGqOqWO2tpt0Z1DSCZdEg2
nbpxRUEFgdsvJoPv5HspIJ1vJJTHFNMKLfmG9vfS7vTBJS0/3j8/vjz+9Xqy/fl0eP5td/L17fDy
6kTU7ENxj5MO1W/q9GbVYpIkhQiFdtI0+duXIHuoujfIjcpu0+5y9cf0dL4cIcvJ3qY8tZaKIs4Z
px2SCMmnY5x8hExy/2haJU20nNqJqC2gECOd1awwl+pvxrBXPU1juJz/rYR36Z74IexwwgIyvbQN
6vAmmKI4Bzx7ljR3VUCaSFlQB4uLPHx5fjx+sReRAYVFrEpSY+xqw7t1tSHAPRzRR3BjXtmHomKN
4hJz2e0zIeyI/1zf1hYPzeWmgEfNQlwVneGTKOmgick4gExYPvWKcvKyrWiuCnDlFAGeLmeLbke3
zNHDSkBHxU0JZR0ynYf6NlKYkK7tp1Uh4cFtA6JBrO14CSzNEmkbYGep2+agW4c9yrWz5iAx1HSv
cZajONJGKEOeA45JmXGQDyFdxSo7AeS2Fiux95ayOGSY0VFHg3LG2wDrSlzoQrBoWWMNQ55mGYFo
W6F3ltLAdduyqTI3YZ7GoMy9zCoqLjJOBowtEUKMWHUhRDQnFWs1xRarkbHo98f+aUkqKiFka334
6/B8eLg/nHw5vBy/uq/SjEacAqBGXi19zwkTufpjFf0fqzBxN7hEN5qVO9zmMBb6Yo7mFrGItuxs
YWsfLRSnOYsgXEcJG8UWsznuU+hRReI3ulQTPK2CSzTH4ly6JOenkfau8slyifu4WFQ0oen56dl4
NUB0MV1EKqJ8enoqJEg82p1FCDqIdZbuISr3B0g5eZdsk+aswDwnLRplzYLPdp/aGflsz+DvJrWE
YoBflTW7ckEZn5xOlzIPSMI2kVGSl+fxlmYl3RZkEzl71JMPVnS5L0hETDAkO7rA91leTUMlor2K
kvMJHunLni2V+zO3ZWA5htIehbvA8lpM7cL2ieuh5yj0wn0XkK0i7BKsnrHIoBIvDrTzyaRLdlXw
qTrr4h92ZzNXFrHh3UZcbEe+vSwLgg40EwcHxUqlN5uijciCmmRbY++ABltwrI/wQjfyEa/dgbai
s6LN3zLB1c7obubMkIe/iKK8p3YXe4a+xno059F6zy+WdOc9+7mnAG4fU6dg+LtlPMbwVyVYtmJy
2566x7GcYPD/yhFYgcAqBHZlDmz28PXwcLw/4Y8UcYg2weToxnqhG45uCwuK5khGFJ9susDuBD7V
2elYVefYIPtEy2gR+wkeKNqlWdpvhwbV0FbPxxBGHxtDZP1YvoQaCXET5TvrqAwl00c0h7+hgmFu
bMY6uH6iAkwzPT9FuZdLM5mOFDCZCvZcidZ+pBxQ3whS/BRQFJ+rTZJSRTRSZ77e0DWmLUNI83dL
26kqP1TcLi1Gm3d2foZnY/KozrGouB6N/cgdoPqORQlGR1tS7N4Za0Wkevx+p84Fl/sQ1btdX05m
EVlBoM7Oo+0FJIgSH2quJFZj9H57BKlac+N1yzn5UGnD0OMk57ORms5nH61pOVbMcqbkrg8OlyCn
xK92hPijYwukVSsfQWInqEf27uXGoieRoHix0gvsuA2J310NS2SORmgRHjRG/dE9uZxcfGBPLoVg
9bH7tHPoWOeSVpSqO/eP749fxcH3pH3wnXRIHyG31BS8IbX4l84mYjjF5WZ8biom6Ok2epO4wkOM
9IzJ8cmRMql6CXvnBqxCzQ9bmc/o2by3DXTlNL6odvBYiuF0spTZdDGKn7vIvsEavXA/R2e/Jz2L
kXqE8/EmL+bT0/FWkTo/m3+oLuDfXN3q7dcgjRXwsnWsO3S8pvGyFdE00kaJnc/eGzWl7lizXUT9
DGK0fL3kJQW9Lv7mDg/yo22V1bTFnvmrUQLF/0p6Gb+tKaIK/Ouk1cZYBT3Z0r5yBdgLC6vbQJ0n
GwFku249oUKA5oDEe94Wi1PWEVgHFHsPMgQTUOUENfSo+r0atmfjFWzPJme6guDDGql5LiseKZMF
pZ2JT2YTpKylQExn8bIAP5tFPlzOmtEvt5EPd7NgVhx8kk6DHghwPcfm4QIaMjIa8KFbmsUrxdWG
JE6yWoAaaw9/wWebHC5d6Fxrs49dZClYdSrLEEzNf80rVmjnhABmDBb6Ii2Uf5BgNLDR36UBm513
iSLbeMvTvGuXSo9lncX88e35HonzLC01HbMxBanqcpU6E8Jr6qnSzPOMsfbs22k0TgqDGxCo0HUh
hcGzjXK88G1JwcisWoV1rpsmr0/FjoyVyPYVnL/BhzIyz9lIU0HZF8fWyVg3FaOINUmxiS33uqic
foOG7hqY1pHKiorm56aLGIsnSQphRZuGhqUTnl/AyR/9WK2AZAXBpeQp0Lo7UwULj34Pxm5ePwux
muvUh8JpuZHe9GKifaRuBS7TKZzgJrNp9KwGCmUUl2G736zzyvUjILUeMfyIJTIPAGwbXi1P8QcU
QbM7z6VNDUN9omSsctEzR45RQDRIgOmMzmnkeF7IF40m90dPKuS7uuLILmgu48sUpBN8Ij7DzUs3
2lBv9VjQHIPmTesMrbErK8Ws4FvIfNnkOFdP+8GPRBvRbe2z+o0RVXvMbmy7nMHOy2vLXaqHuVGZ
NLjC26oaCrlaZb6CBt/I/ToFZ3N8NTVUDPoEYwdmXBmnu3CeqTggmxEe0usuY1xU40XzS9uQzsAd
oAwoCNG8YIWczVe2JhQ9lqz1SFi2KnE/JCaO8dbYdAdGGPXhx+Pr4en58T487eo0L5vUf/IYoDH7
BNO7XdWK7aM+tzYOp5XdNaQFqmVPP16+Io1yX/Tlz85+nVKQoSIHbNlXmeqdaqyNBAGzIZRPMGTi
anLyC//58nr4cVI+nNBvx6d/gR39/fEvcQdPQidWOBKrvEuENMSK0N/c3N75I8V8RyESHiXFzg6H
rKFSQ014a5sO6NB5e7hBsWJdIpihLcHJ3qVppKkOVW4XP1jvIB1RPZSPt3gHdZgCMJgQG9xx+7ZQ
vChL7ATSJNWUmK9dBNbKsDE2p7iYwEcdwwXPHs/XdTCRq+fHuy/3jz+8jtqCnpQAKwj5g3NvUbL0
NI04d0r8SNhpECWrHE/TgLZOxdXdV7+vnw+Hl/u774eTq8dndhXrwlXLKNU2wJgcWhEytSKF9JW/
V4Xy+/l3vo9VDIfApqK76fjylFMH73B25UG56oFOSLj//IMvSi39XuUbW9RSwKJyeoYUo9MQgw/T
SXZ8PajKV2/H7+DD1HOK0NuNNXboC/lT9kgA7JQcuuaP16C9xge9IzbC0o4/T67QhQVIwexJhTrJ
N6C1WddEqXMtKMQl6K5r22pdM2ZHcT/AXN5koYc3KDv1u98d2Z+rt7vvYp3729CsYHAigKstgfD3
ThQiiYKjq+PY4lZovrJUORKUZZQGxYjjBrM3Nrgq8QrhuZ1QW4MSIA2K5jnHVLAK5zN9lWuEFpwP
7FWPIDpO9kYaovAPh7+QssDvAdt6N5yaOPkOaEnOzy8uFih4jhOfYuBzJ/60RY6/jlsE+HOiRYC/
hlgEZ5ipiY1HW3xxNok0GbPqsNDuA7uFQJ/nLTwJ2qGyLOHFzc/fG7r5e0M3H+/JfBapmY53ZJ5O
sAGdExy8csZZSJyXUo7e1Ji/QI9mpWI1lpBoULiIJA9+dYOMHs/G32tXZo2MUF62VTZy3Ev62Si9
Te0GgJbahVBckWxwf/x+fPDPt37zY9jeR/RDAq5pFgxVulvXaW/6on+ebB4F4cOjzX01qtuUO5Pz
syySFJix3TGbrEprMMmFwIG4bsymBcmKkx0qm1h04DfPK2JnmnKKIZyzXer3J4itApoM/aiijaj1
MFh4EFyiSKW7ClDDkHYpBAvHhkYiTO1FSTHpGKWtqrwNu61I+vWfrK1TLt03dPDOTv95vX98MAkf
gjFRxJ7DtwbmZD+b2d4OGl41xWLiRtfQGHWoCTFCumagL16Srm6WF+czEpTM88XCjpuhwSY2IYag
oYm5jYRITDM7voY4uMvazkSZuJpCpZNKapLHlBNAkK4w/bSW9YVcbUekXTWTLhNiduPcluBdIM0Z
xvHAq1BgLNVWTgR3rHKKgHp3m0H4g+w4sFJWERNHUKCBaqtIm45iDQACtrZqU1ZkXZHmjugkBcEc
10vJ9HkwuqLfuG5Z68bqiqKjoBSZ65xOYbQdvq61gpEZUrs0gmSoA4CjXxQ/lCuhCwrGGYCxHIw9
rttCwsSwAoVs7CwYAIYbYWC1ahDw6oB2ShNETGwlNq0z++SUMLVaXaCVF9OG+lsMgMrn3YVp3awL
3LLVrvE7xHLMmk1h9pOQej/FAkZqXNdUXp3aqXbjg6/42dTOiAdAZbPpwi7TNF/ZTpwAlNGUZn7b
soqCtTaEAY+0MIiqqYCchxA0YxYgpSYnOvvywsc47g2gPlemkZEWOmmMAVA0+zRYhJLpJHlcwQpE
MiAT6iYisXtv8C0jaCEPpB7SuZ9IiOYajZ3WWSL0WejtY99SRQKlRYMHy6ZLWrkhkCUckmtF++q/
eNooO1K+AuRumLEeiL/WaHTlNxQe3VyQySRhg1jqpGvTsG3tOTQAfMfA8hZNEybRjf3gyuqrk3sh
YYYhCAXGHX+I/G+Hw4RIIoIxOy64n+UTC7HJzAyLHUyBuHIkfoMUlblabn2Y3JKJRGIHip5iWfJQ
ZMPnSyGWO82yjZwdhKlnu+ReMYJsiOFAWGL70QGHEnjepM5bIECLJrdDj6uHDbdktVwFY2COjCOl
Q6hVyFwrVrgvIVlZFhtQ/VYUfPVQNRA4PdZXjnLMn9y+qUL4vnQzQfYZGUra2K6LysKf2iowB0Oa
7flFANzziRstU8GlcnWO8RKN9441De0PNr84LZ+JXxTN4qvdExwHOQUTk3UewOQZs7kOK7qcRhId
KXRGxHbDNXeaQB0p0RbmdFt14DC7X4SVBydFiFVWsOJOgwwSPLSPNK1/nY7WoKKFlK5bvYWq0HjR
isB1ifG+rm830wzEeohiDuqxaDGuq6GGeclpNFQZroWVSbOvkXHoXRaijbBsfFB4t8naoD1gujPA
tE2P8ZoBr50oEjxuDJeGOOj87c8XqRQYWLSOUOyGjLeA4tYmTuHEQQPYSDhwDysbVwgW6H5J+KHl
HaqYL56MT73Ju6BWSgoVCwxi2dvDCEhle+IER9XgM+Z0w2mDMubCA+BrPFjF+aHH5dDAvlmqTAKR
r82LnVyjU7dhQ4osgwxL79EzyKqKjdVASvYbSYTVAjg5BEDQkYJkZTBnHmWCR+EHSv3ABe3a+qUo
P7qx1iq/Nz+BQG9DBWMRRu33vi/42KgXfKojNyTuYMiMC5w0BAEHC0e3Uw+p20ljWVTWtReVDqHC
lp3BqYQz0b72ZCTbobdUQSOv5tJzLexDzvbiPIoufsUiRla/YjBhucoVEIPDYQriR7B3wcNPnI9F
iWwFI1wF5aljsdvV+ylYYQWrW+NrIZT5ewhSTiZkdr6QWp+sFaJWHcksIWdbyg3Y4lCIcGilTkVU
IBrWNvbhYmOX0gI+GAyFptVkgn0sbkTddFnkMtVIBIWxDEDG5zLPqxnSDYCG9Uj7KGTFyHhga1yJ
ZPB7Hh9mGYksCUYL3gflIuUeRkk0IFomdnRC+RGpqi2kPMmTXCzSUxdb0jQrm+FDp5VS4hwZKimU
sOpqfjq5CIdMiSxiLQYTIDG4ne2ADpe/hKvUMhEELyrerdO8Kbtd/GNG0QYppFw20XkbasIe5e0x
WZ6e7ZFlJF1HYFT8JtREpsWJD7aMwib2/ww9ZAeFtvy1x16dHDrJYsIl5uLDOXDxlLNQ5nFJkp4E
b+/ICdjTmHwFFk7f4pJKBYnxi9douVmCeDYYpd8MV/jRatMWTT/jUAQDZpx4QoyqWfJddQI7dfay
7sgBbtPM3MJ7VHgYDHftbbgMIZwWKG4mM9FmMXwjAsZAOkdIHUK2nZ+eIzKn1OGoa0mwJ6VuZnIx
76op5j0AJEpTHhSb5MsJtvlIfraYR1jd5/PpJO2u2S1SlVTeUXUvd4VtcZWBcD7BbpRZLLybrHOO
w/VXK0q7NM+9xe3iPQlwIJAuD0KGiEk8A1VYhRMJ09ZkuBcgq1p4caQE49k5dRoofvoGqupqdXgG
n707iK7z4/Hh+Pr47MRXGwQSMYP0TAhclW/aa9o4UpJ12ySICaIVisvUVyR16VvB+WG6NG1CLI1T
sXNMWeTP/vmjL16BpcaKYdYsA76kZeM4kei3o3TdRgJzqm/NHTMFW9V4FYZMVeKgwAjf1G4mUYga
smKftoBVVSSlW446stfQAOtebvi3V1APR5oCtwmvKXpgJa+AYFl20iXDykwN3tDs1meCjcnyxkw8
0Y7yYgfZFzaVbedDp+BJ4dFLQ3i0jBpZIfIWVexqkhudw/b65PX57h6Ssge6YW4/CYkfKqIXxGq1
RdEBAaZljYuQ2a/ssQEgL9uapsaCEX9ENER9gHW7EMVcmi26b5AemXK1zsj61eWbGtMm+ThwrMMf
llVE66oWcpd8nsUeZk1hwPE6tKpVzZINvtEkPlnjz7FO0XnVRd05e0LpcpAFhIbMDfEifsrsNUm6
6wovM5BFkhN5c3Mf+y3Etl35pWoM4dHHbIvGjUoFKE7L3IOsUh12z6mnpLHnZqwzMrlOlaV7qbhS
Fp1WpqXQcLzddyTZnF9M7ZDb7d4bCoBoP7XBtBIptz8kBR+qLC7EWemGfBS/pb1LJMUKz1juqv0F
QBtlOgbcMi2Z+H+R0gaH6kTpztazccsc4/ohVREvXsXzwZCyxSUX58cs2oYxUzFatn7eNTMjrlMI
hJKUV7Ak96BUBW0cAgi7Fjkqy8YRYvxLocVaGztxqUpIk4plCDF8ua0LFSDmxplO983UybKnAd2e
NE0dgiEroFh71LFOMUie0rZmDS4+C6JZF1EPCNwcz3MpSs1XlNCto/tmolcCY7e7BwpS6niv9xjp
1gIWtKgSvi/T77qNsruPoM0AOBKNRKHd3gcojdisuZ6VQQna1DHqgmUh/XoaI78ti9QMnsWzQNDD
JwDpdLoHhyN33SiIymYm+IhbPMtSCJ53yQrMkGMNsYppfeMlsHbA4sjb+E22sKzIIHS5/I3XIE4g
b2p6YDS6+ECxapng0YXggZuCQA5ibrdTxS8fIEkPsLiHBAVpfYbWkJEo6Fdt2WAHp4QrYzEjGbRN
ueZzZ3MomAMC0c1bA7RFTeN1kGr741IMSkZuvO8HqNgUCauBTYo/aH8wWpJdEyHKrcssK6/f+4oV
SYr70VhEeSoGp6zC2Nf07v6bnYqkgByeVm4UFwwx4u3Z9viRBvR01vpSiNjqktggAfAADT8cfAZV
B1Rnkt/EHeH3ZJfIIyE4ERgvL0BVb8/g5zJjbvLiW0GGpxpO1maiTeV4hcqetuS/r0nze7qHf4sG
b5LAOc3JufjOgex8Evht4n1TIRNWEEt+PjvH8KyE8PBcdPDT8eVxuVxc/Db5hBG2zXrpVnEp7leN
l6Nb9sU7JSPVvb3+texrKhpv00mAF/FcwuprFzALPpt12e2+28tc8c6lT1MPXBpdL6PTolQVL4e3
L48nf2HTJU9Od7NL0GXk5iGRu9yNh20BO5UlCK5plUcAz+Q2O5NAmGshF4mZsZPnKTfVLcuS2g4B
e5nWTuJdzzqzyavgJ3bEKYQnC5Cabg2b4OJ+sUmbbOUOTA9Eb9/5OhFnlLhXpl6hWyLEaraBRyvV
3wGv/gxHttEIhRPW1wOh7iULkXkrbM5dQ54Gb1mSJJAHNEgsTKQbZB3Qp/LgxQWOrVed+F1lrQtb
hSKJBMVY5ypsQUze+bzupSMPoreilSqgx1yLQz9V+dLRQ0YR8jbPSY2f2H1RcglF2wVPgLCnQYYp
KxOM1yvl1ssI4KGzW1zXr7A1WGCO4dsVw+xSdPsgM6+4hBdp2CyFq2pWRqV+mxDSM7xLtCa7sq29
HpmTaMWCaTcwsWJ34EaSqBEd+RqGy1KnGSiMMQbmTeKDCYxoKC303ximETZy9IY0dKVttikwAgLr
ARMcapJ7spuEKOEbd9zXFF5WQX7VEr5F981u7+1bCOS992W+PLbttpX3+VWxn4egs2BGNTC282td
pXPFkzDIdSjmf3UTTbbs03mDERRTNpifpyIDNaq9NCrI2576v3sZ4RIiFKxuhGDxx+R0Oj8NyTK4
tBt2EJQjFu0Ycj6K3FIbPZzhimA5H9gQdpgrKtgI8UpGive7ZoYEf2QLe/sx+vko/diIGHqk6U6f
3y83KPHT9//Ov91/CsqloQraJ4GIFmN4sZsxDdwN3zk7rPV2nPqtjjeHQ43suLQugx1nYNgVxSeJ
HYA9wa1tCF7YiRzFj2EwQ1Ee0OYu0Im7gPthjzmfOTFxXdw57gXrEC3RJMceyTRS+9J2ivMw8XZ5
CbBjRFiAao8k2q6z2UjtWFoLjyTarbOzKOYigrmYxb65cH0Hva/w6HAu0RwLqOy2y86MDBhxF4al
1i2jVU+miw9MkKCKzZDM04bXOsHBUxw8w8GRHi38HhnEWbQ3huL8XYqLdykms/dJ8KhhDkl8z16W
bNlFgsIZNGZbAUjINSkOd1K4QydTUKZZY78+DvCiSdu69EdV4upSCHAE98PqiW5qlmUMM3I3JBuS
ZljdmzpNL0OwuFhnnst1jypahp1fTucZ1v+mrS+d3E6AcLUnbcFg3TunigKJ60Odk4zdSnm2z9WI
KiqcRw0Vkulw//Z8fP0Z5qCE1AB2dfC7q9OrNoUXFFCjYWd1WnMmbsVFA/Q1K1yt8kqXg3zZ1GAp
mphqzSmmdNABXPzqkq2406U18XKsAErqerWE78Yh0FcEyELIpaF/UzPUWdB6bfAgjvrDlFekzXVZ
XyKYijTWzMrMVVtSJ2khOgXqalChdiQTQjVRCphB2eGT4ZptcU0C1bd6W0cf3kkjbXzTGi6B2zSr
7GcrFK1a/en3lz+PD7+/vRyefzx+Ofz27fD96fD8KehiVpJE+YaFA61xYiZFQ/H2GdIb4uWRNQhO
1uBZwTAHP6sicTkrr4su43mkJQNBl5I6w8dTvrBIOtB1pVkn2y0v6f8LvQovydAM5JFPJDaBuynJ
vMeUoROC+UTuX32Nw9z2oOFlxS51QBN+k+cp7IXY/mR27mAGqYZV/LSuonXHkr24eFkFC3yT5uBA
iw8aEBQblMai4GwgcSs3F78e++n44+63l+PXTxjVVtzCO74lji8zRjBd4Ac1RruY4OJRQHtdfZiU
57PIUNhkf3x6+XY3cXoqrxxdVYqj7MbvZJ2SRKMihZOqqglz7Z1suEwxWxH8VmSvBW8ZuXMmTo42
VRtP5az1TxjZT8ZluvptA3+we83Oes0XPzq4/4h7Ttsy51SWqCRR9yNsQZsRHY4EO9c3MJFP3+8e
vkD4yF/hny+P/3n49efdjzvx6+7L0/Hh15e7vw6iwOOXX48Pr4evcIz++ufTX5/UyXp5eH44fD/5
dvf85fAAhkvDCaujiv14fP55cnw4vh7vvh//ewdYK5cOlVpreFzsdkRsMXg5EVy5ERzD0l5jVLep
KzJJIPiFXca5mEUjziJTEcplHEK0LvmeLLhUP8YRd3lDvBayVpS2j1qGDpdBx0e7j83jSzqmR/uy
VjotW2kvM3C7TywKlqc5rW586N5+OlGg6sqHQObvM7EdaWmlDJXyDQyhem18/vn0+nhy//h8OHl8
PlEHrrUoJDE81hMnUZkNnoZwwQBQYEjKLymrtk4AXhcRfiI5EgYMSetig8FQQktx5DU82hISa/xl
VYXUl7YxlikBlEwhqZDbxX0zLFfDox/03MxLnq6pNuvJdJm3WYAo2gwHhjXJP8jsSiU3DeDu06sG
qqCUZglWb39+P97/9vfh58m9XI1fn++evv0MFmHNSVBSEq6ElIatSGni+C8OYI6ZYfToOkHq5Dky
Km29S6cLlZJP2Wm/vX47PLwe7+9eD19O0gfZNcEGTv5zfP12Ql5eHu+PEpXcvd4FfaU0D2cPgdGt
uBeR6ak4bW8ms9NFOC/phnEx62Ev0iu2Q8dkSwSbdN4cVMhUGdcYxPKXsLmrcMzpehXCmnBNU2Sh
pjT8NrNf1TWsROqosMbskUqENKDjXfpjQCDRetOi2XN0AyHqmJnq7d3Lt9jA5CRszBYD7lWz/abs
BG0wFcnx6+HlNaysprMpVohE4LaNuvI98M94d1cZuUyn4VgreDi0osJmcprYcazMIka5d3T55skc
gSF0TCxb6QAbjmydJxPHd15vgK0doXAACpEcAy8myOG1JbMQmCOwRggcqzI8jKSo3p/Fx6dvjmFw
v4fDERYwL8JgPyXlNWTpHptuSiCNNhthfZSoDOu5bcBn4cIZAGg4cAnS9LX8G2VlCKeqKxVZzx/o
cG0016WbtNyFD11SA/744+n58PLiysGm5Wv3FmjYkP3crGHLebg2stuwdfKlKoDqN2kVSV1cAB5/
nBRvP/48PJ9sDg+HZ19M1/NfcNbRChNwknoFtilFi2NQ7qMw2NaUGIxvAyIAfmYgxqfgaGbLrJaQ
1umgt7b0+f345/OdkLWfH99ejw8IG83YCt0FANc8yMSyGKNBcWrdjX6uSHBUf/BbJfj7zSWM7zqg
w3YMwA2LFGIQu03/mIyRjPUlymqHjo6IE0AU4ZEShWzJbXhsgyOIuK9ds6JAhFzAqsxKNNx+NjIM
y4cR+SfbKDFsqPj8OKQNuvd6CvfxHEHH7UgRWnyj2xT45gWKDDJJxxojkSPPvhat9jOuY24SVqmL
SGp6a/plDESxp8cHQIdK9NxdAwKxJD9SDpsinK/HphTbu04l09P5OxVdRdbsFcT22JJIBYBNC3lz
I1kkgydKbW7J7zaq/+BDbRBX9fcbAeHR39stLN80KY0vTu1whvF2QPc5QJA1RtbpnqbhtRWQlAp5
K9JPGZ6Ep7hDlz3peVZuGIWYPu9sUjJFrtSAMf7PJeVSYFPsEasMoYRL0HttxD4T96nx9tofbSki
JYQ0UmiQG2BqMXhX+SpjHKDIql1lmoa3qyhZU+U4zX5xeiE4bq2f2NLAEaq6pHwJlos7wEIZPoUp
G/vyHNxoObzv41hQYcDH9tTB6wYkM0mVLwx4lawRAz8l5ByeXyEct7jtv8gcsC/Hrw93r2/Ph5P7
b4f7v48PXy1vWWniaz9Owpvm0KQQz//49MnDpvumJvaIBd8HFNKc84/56cWZ8wZUFgmpb/zmoMtS
lyxELXqZMd7gxMbn4ANjYpq8YgW0QUxv0ayN5JhFRUal9LSVoQbSrdKCipVsv5qCmxGpO2lHbdvB
EencNABWTFzhwOvVGksTPU3c7gpa3XTrWoZWsVeQTZKlhYelZZ048XhqsEQt2nwlKrLbD+vKDrTY
x22jzHcBhLCh2iDf5TVUcEUhnaO8gU4ceU7sxeD2TjvWtJ1zC6OzqfezNwYI4IIBpKubpdekAYNb
iWgSUl/H3vUUxQq1gxC4M0cepe6vc3sZrHrtyUBgac2UhsRuvlgySZlbfUZaYNtiDmUBNElDONgs
w/XIvXfeqluBB8UNSAGKlYxblAampBY12j7cZlSCMfr9LYDtMVOQbr88QwZLI2WYjor6xXSM2JOp
gaTOMVizFXsIqRiCTGG2ORq9op+RjyJza/agbUlhmAW1pJ1Vo2SR/sCDxC9iR++EnFXXdphpeFhj
bngIBQLD9M7Z5QBP7AfyAlJoJfAySippYWHnS5DPuTQj0lZ1K+/nLpbaRQGgSmvBhgxCKR0Pf929
fX89uX98eD1+fXt8ezn5oZ7I7p4Pd4KB//fwf62Lu3xNv02hJLCqAhcY+8G+x3PQ2klLamwH21RW
ST9jBTH83c8lQj1jgYRk4ljPYXSW9mAQiFfmunk54I47l1AzC/1pgxmRbDK1cCyenpUr9xfCTftF
15Q5c7lbdts1xFn0ECBY3OQx8TWvmOMgYVtrDCxxnVhVlyzpanhNaOwUChyCh2ROmkyItFPaLqzS
ywoecK+JkxweQElalY0HU3oicTaKs3Lam9ZzweSdPVBB4D/HBqhcfSYbXOAI5AV/RFlZp07xBiF1
T3ybJWwWRdZRZDaGbGleJfb7qY0UZ7iMq8PlQrm2Y1cQXkzAUq1MhggT/Xu0ESgl9On5+PD698md
GIQvPw4vX0OrO6qM1ztx2cmEgJP1z6DnUYqrFpxN5/1a0tJzUMLcFg7zFRiEdGldF8R3YNJzFG1s
r6w9fj/89nr8oYXEF0l6r+DPYdfWtaipuyZ1IZ00hjVWswrSAkOrbEe2FIKUgy+yWIX2e6iQg6Wl
Y854ThqxmKHIriwy50qgWIEyrFq3BdVe7mJjdWdzLCSe3BfXpGh0Q6tShqRwfY5tDMradrkQYSEy
CMF1LnazrlNyCWy0o34WVyOWf3SM5YxI9fTx3iy95PDn29evYArBHl5en99+HB5e3bR1ZKMSrNZX
yHDohnJkTPUWiOpGejJ4/paUOcTsGKlEF6gd4fpDVZ7JYlYuN8kqBu+u9muwV7y02JamH0xXgU6+
waPtlejLJLoo4HRvV5xAlNKCNXBwqQVpOZdx3xJZT+GHJsUdDmUTGI67n8fHtiLqy7XcioEJiItl
WnAV98ErDvDyzMPMeOHb8tpRB0uYWPq8LNRVzCuvLhPSkJh41g+kIr62wp6FkP4+1Xg+zPK3Z5aj
gbIU2zRXFSvOoJQ2yCrWiLHrgku49nRYLnYka7dLCFbCHyCDyLrbmN7PJQVBrGpH4uK45FqpaE6F
/uWCZ+3Kj8Ygt5peleL0ywTDCofAYEaaquSIFs4lTPqiW0g4K2nSIumDzOBLZ5d31UZaB/pzvcvD
xglqeLP3zdVDqhrX7ll1iivfBjckjDXLbzmrm9bWG/hgf8PL/FjSSg6TkJXp3yUBxhQ+MSksrDax
WwVnHVhXkvS+hK5t3cBE3AbyrUpOoe8dguikfHx6+fUke7z/++1JnUnbu4evdlADIrN0i3NZBavB
wBBNqbXezhQSdlLZNn/0kiaY5rWwwRuxfu17HS/XTRTZm6zaZLKGj9D4TVPld1sIydoQfmnPoTbM
Nai+A5OpdcEaqhoIZU3IzEZpdav6kbm+EgKLkIASHVS+D2c1NkXK7UNIE1/eQISwT45BPpQ7MvYi
prButlQJG2K0GJtLpBp/lcNwXaZphQcv0meV4L25NFJQ2kYwfRqO0l9eno4PYA4l+vvj7fXwz0H8
5/B6/+9///tfVo5gaXQPxW1gRwwO5oPzZ13u0EBKrq0/9DLaUtAMtE26T4OTiIsewvc+PEJ+fa0w
gi+X19qHxD9xr3maxzmSbKx3q1Ue7FUAAJUd/2Oy8MHS+oxr7JmPVSy7qYkQZhXJxRiJvEcqunlQ
ERMnXkZqbSWuqKZ+jzX1CKdWN3ExaGmK53U0xcAaAJWBOf+5OyaQYgAu4MZisq9mmJe44MDpOvze
3Hz/h7Xrd06w4dghJMdZDrPTWLgZgZl2W/A0TcSuVWrS6MhcKinBZfZ/K9n1y93r3QkIrffwMOCk
JpWDymzNiN63GJBvfIhy13KU7FJiKTopUgp5r25N9DKPy0Xa5o8crVPtWBOG8BULD5OfvQnUUJDL
IGMRBo9/Uafr6Fcgu8kbbn9wTCdOqf6kAjC9GonhAE2Ubm3dRu47ISCyMrHHzu2yx3iu9PW0lhdT
TxiECEKyrVCyvAjb4X5kddTlcgCMMNy1/AB/viKQIiicrOfjy/3/c6bLVrc0h5dX2FVw2lHIoXv3
9WB5NEL0KeuWKINRDfeG4T7YR6nCr4sSne5lC98jk2Pl3zw1hVn2oIUpwXfjs9JsWOJSjhNZasC1
dCiIlzeQ6nBaVi3DRBCW8YxgN2BAqbufd5R4xfVOin65XU4uU+M4inswAhUrzfqPNWINbDdev6Ww
8MXvS9fjQonGQiAWYL1mK+ddBOixjSUuWPAiCPMJK1ob9Q3SwWXSYKxVvljLN1juhLSR8JwVcNFz
7J4lAmhjhSVsZyubV4b3y0MpOLJq+eYRX6k1PFbwMishh1WUSuq8hADajRdmVOFj56PtDuMyRNm7
bbp37/3AzYCDBPp3NVAKqxxXeTiOTc1phbm+KUsCgW/KvVdm/7rtlUVJgaYJBmSvEHe/Ace02Cd7
8+TkfgJBFtdemEYbX4Mk5d011ch5j6ISyBLMSEp10+jszZ5i4vot+oE9zcsP1qzOhVDh1+vHlRNF
CEaUJT3LtdaajgGOM1kz4bI8NFygsmVAEZbpgO/okicygCn2HYia/rGsX/hRejWpSZrZb4VqV+K3
fLXN05wSMeDB2pWWDSzgCmmOQKWfHPBin8lBuFHxidvQAeB7yaHHZH+pBJkxZ5zDpkpK2sILnFWh
kilXTJ0yHCnePHr8f30hwtfn7QEA
--===============2329889255300481354==--

