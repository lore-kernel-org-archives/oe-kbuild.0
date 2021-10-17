Content-Type: multipart/mixed; boundary="===============3174216941368686678=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4127/8410] drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:342:3: warning: Value stored to 'src_buf' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 17 Oct 2021 14:08:56 +0800
Message-ID: <202110171453.fRkMVwHc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3174216941368686678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yunfei Dong <yunfei.dong@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Alexandre Courbot <acourbot@chromium.org>
CC: "Tzung-Bi Shih" <tzungbi@google.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7c832d2f9b959e3181370c8b0dacaf9efe13fc05
commit: fd00d90330d1d2a962d010fc93515e2d77739ad8 [4127/8410] media: mtk-vco=
dec: vdec: move stateful ops into their own file
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20211017 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3=
ef19fe82d7ad6a6e1515317dcc01b41515)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dfd00d90330d1d2a962d010fc93515e2d77739ad8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fd00d90330d1d2a962d010fc93515e2d77739ad8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           test_free_pages(&pages);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/test_lockup.c:323:2: note: Left side of '&&' is false
           list_for_each_entry_safe(page, next, pages, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   lib/test_lockup.c:323:2: note: Taking false branch
           list_for_each_entry_safe(page, next, pages, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/test_lockup.c:323:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(page, next, pages, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/test_lockup.c:323:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, pages, lru)
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
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
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
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
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/dvb-frontends/tda10048.c:493:3: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/media/dvb-frontends/tda10048.c:493:3: note: Value stored to 'ret=
' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/media/dvb-frontends/cx24120.c:1225:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.=
clkdiv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/dvb-frontends/cx24120.c:1225:2: note: Value stored to 'ret=
' is never read
           ret =3D cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.=
clkdiv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/dvb-frontends/cx24120.c:1229:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cx24120_writereg(state, CX24120_REG_RATEDIV, ret);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1229:2: note: Value stored to 'ret=
' is never read
           ret =3D cx24120_writereg(state, CX24120_REG_RATEDIV, ret);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1471:24: warning: Value stored to =
'state' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct cx24120_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1471:24: note: Value stored to 'st=
ate' during its initialization is never read
           struct cx24120_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/dvb-frontends/si21xx.c:830:2: warning: Value stored to 'st=
atus' is never read [clang-analyzer-deadcode.DeadStores]
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/si21xx.c:830:2: note: Value stored to 'statu=
s' is never read
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   mm/debug_vm_pgtable.c:98:28: warning: Value stored to 'ptr' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long val =3D idx, *ptr =3D &val;
                                     ^~~   ~~~~
   mm/debug_vm_pgtable.c:98:28: note: Value stored to 'ptr' during its init=
ialization is never read
           unsigned long val =3D idx, *ptr =3D &val;
                                     ^~~   ~~~~
   mm/debug_vm_pgtable.c:178:8: warning: Value stored to 'pte' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           pte_t pte =3D pfn_pte(args->fixed_pte_pfn, args->page_prot_none);
                 ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/debug_vm_pgtable.c:178:8: note: Value stored to 'pte' during its init=
ialization is never read
           pte_t pte =3D pfn_pte(args->fixed_pte_pfn, args->page_prot_none);

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

--===============3174216941368686678==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICIGxa2EAAy5jb25maWcAnDzbktu2ku/nK1jOS1J1HGsuvsxuzQMEghIikqABUNLMC0vWyI42
M9KUpHHi/frtBngBSGhysqlKbHU3gAbQ9wbz079+isjLaf+0Om3Xq8fHH9G3zW5zWJ02D9HX7ePm
v6NYRLnQEYu5/hWI0+3u5a93h+1x/T16/+vF+19Hbw/rq2i2Oew2jxHd775uv73A+O1+96+f/kVF
nvBJRWk1Z1JxkVeaLfXtm/Xjavct+r45HIEuurj+dfTrKPr52/b0X+/ewX+ftofD/vDu8fH7U/V8
2P/PZn2KPl5/eHj4sPo4Gt1cXdx8+vTwcDO6vHi4ehhdf7z49PXi5hKA71fvf3nTrDrplr0dOaxw
VdGU5JPbHy0Qf7a0F9cj+KfBEYUD0nSedfQACxOn8XBFgJkJ4m586tD5EwB7U5idqKyaCC0cFn1E
JUpdlDqI53nKczZA5aIqpEh4yqokr4jWsiPh8nO1EHLWQcYlT2PNM1ZpMoYhSkhnNT2VjMC+8kTA
f4BE4VC48J+iiZGfx+i4Ob08dyLAc64rls8rImH/POP69uqy5VBkBfKlmcJFfopq+IJJKWS0PUa7
/QlnbA9QUJI2J/jmjcd0pUiqHWDMElKm2nAQAE+F0jnJ2O2bn3f73aYTH7UgRbdjdafmvKAed0TT
afW5ZCVzWWzxVAqlqoxlQt7heRM6DWylVCzl426hKZkzOCSYmZSgc7AubDVtThcuKjq+fDn+OJ42
T93pTljOJKfmHtVULLrp+pgqZXOWhvEZn0ii8UiDaDrlhS8yscgIz0OwasqZxF3c+diEKM0E79Cw
3zxO4SbdE0BIMxGM6k0hJGVxLYLcVWNVEKlYPaK9BncLMRuXk0T517XZPUT7r72jDZ4PyAtvGHas
AV4WBZGcKVECb1bSBkdoKODwc616Y1E7NaezaiwFiSlRr48OkRlNnZWoZEaJnqy46O0T2NiQxEzv
qwImFjH3ZBqMBGA4bDAgqgbpUk/5ZFpJpszyMnysAxZaZS2SntQzAFW/mbMz3MPPEOtI1alFy0w9
OMA3Ysq8kHzear1IEjO2ZtJfqRlXSMayQsO+jTltV2rgc5GWuSbyLqj+NVWAn2Y8FTC82Swtynd6
dfwjOsGBRSvg63hanY7Rar3ev+xO29237gSMsMCAilAzh6cFKKlGHEJIc86KTkGByHzSV5WxitFH
UAZ2C0br8L4UD170f7ABxzYC81yJ1JgbdzpzFpKWkRpevIZzqwDnsgw/K7YEUQ4dtLLE7vAeCByX
MnPUehZADUBlzEJwLQntIXBipUFO0cNlrl1FTM7gFhSb0HHKa79XH6W//26zfGb/ErwXPpuCQeyp
Yesv0TmC2kx5om8vPrpwvIqMLF38ZSepPNcz8KgJ689x1aPhecyWQ7tlZc1Yr0bS1fr3zcPL4+YQ
fd2sTi+HzdGA670HsJ6xVGVRQCwC8UyZkWpMIHSjVsQ7I+ZhAsdBJ1KUhWOGCzJhVh1dww6um056
P3thgYXN4A8ndEpn9QpODGZ+VwvJNRsTOhtgzDl10IRwWfmYTncScAHghBY81qGIQuoqOGe9UsFj
5U1nwTLOSDiMsfgEtOeeyddIpuWE6XQcOvACwhytfCMqKPJS487eEpjsOadssA0YhiYqsBMwBslr
bKKxP7taxhUNzGkCh+CkGDtC4AE2MzTplNFZIUBB0E1qIZ191Fa41KInK+Db4IZjBm6CEu3ffR9X
zS9DEsBScucLJJyiiUukIxDmN8lgQhu4YHTcGda4mtzzIrhnwI0BF1w6rtL7jHgmOq6W9+fmSe/F
uVmuHXMZV/dKO6yPhUD/iX/3Eh1RgOvj9wyjRCMIQmZgBjz33SdT8JeQ84AQQ6fgXCgrtEld0cB3
q1mv45gCjA5BlKV3X6ARGbiHJmAJHoO91ABFYwxsyOlpj1B8GQi7PJvsZnOegWRpAocnw2nLmEAM
nZRneE1KyOADK7JCpE5aofgkJ2niya7hNolDgzGuTZzrVVNrUduxhIfEhIuqlF58Q+I5B/brs/QM
Dsw4JlJyFkooZ0h9lzkuoYFUxN1XCzWnhHqm+dy7GZQAE2MGdzqjWeHdRDZmccxCpCZUQxGu+klD
QS9G1403rSsvxebwdX94Wu3Wm4h93+wg8CLgUCmGXhB/d0GUP2PLiDFwFgk7qOYZbFTQYKD3H67Y
LDjP7HKNf/WdD2T+RENGMwtpYErGnjKl5TisQKkIeR0cD9cuwbfXcb8jYYhDn4axVyVBwUR2Djsl
MoZwxjfE0zJJIEs1kYM5K6JF2Dvaqks4EjE2xTgI5QaAfhGlIb66HLuJpQRXNe+lkllGwJXnYJ85
hEgZJOefXsOTpRMMmvkqNeaOTcucaHZOzCinblM0kGsvkILkCjz67egvOrL/+AGcydJBGyuWY2mp
twPFUkZ1UzbJROxWKwzFgoAwmfiSpE3M0Z+kCRJLOPwxc3QHwnE6s6F6TTSMWa217AHBnvCxBJ8L
suR515ZAldkQOl0wSJKdRRKw24zI9A5+V17cWExsqc1UaNRte8oYO4PHd/i1YfSegnw8btZ1rbUT
TQisMk4hvppyiIYgyZIJP2PskVbxBGxYSH8AOefSS038VZvMNdocDqvTyuPHkyom4egIKAoYgLyx
mY0NtDjLhrtWcGKzZPG4OqHxiU4/njfdWubu5fzqknu+w0I/XPNQhGYkDC4iTk3ZrLNMLYLkd4GB
gC6xLgrCCsGBI2GgVMX0TqGAX0wcwVSZE+Pl0sS9nXZOhS7S0kTKTmJZ5myYmWJ64/wCNlWdlLUi
gyYcbDmmdiYZQqKKOw7W5J5AYbI/44RAMCXYOjot81nPxkCmTirayN3x5fl5f8AGQZGVvQuw5MY3
Flnp3mVgVKsRhUfp363r47x0sTm3++piNArKNqAu349CnvW+uhqNvEKWmSVMewu0TsjaGMlqProI
OXi2ZM5dUUnUtIrL2uv7HrRLcE21aw8z7Z9RyB13TbPYVPO7wjVLOFix0pEsgHixIUgfeLSsjuT4
0g8vuqKXu6BVq/2fkHeDS1992zyBRx+yU7j2KrNRgweBAAzj7TiAounM+92YSFvo9cKCxWewWwsQ
T5YknHKMHmoPHgp2B1OBB/Ik6ty2zKaT7eHpz9VhE8WH7XcbKhk4kVmkTAUG21qnw/7RFLWybhqO
gc7XFcQ/xWF/2q/3j65kwnjI8TKO/l8LKkKRfUdjdlvX05861v9fTPizFx0HvlVskM7SoeSDy2xB
JENflfU6IokfniEAzHhWpCwJxWO6hPAbog6xrORCuxUTml1/XC6rfA5i6xUka4SCHWRBJZ8IMcGO
Vs3loJQIuhH9zP46bXbH7ZfHTXfb7bn9EilrmzopRxVjyg0NEAJxC4HIPwFWqiTuISVWWjNWLSQp
Cq+dgdi2Gmb1tgv/AYepbCqwcocJrZYinHghKSWFQqdjyc+SYQcgnG8ziMtsK2oGIYLmk0H91ZtI
Un5p+3+hpA0IYvAMGLIUFP5eZ/215P6Tg3eKmNmyilW46oA4RcvBFevNt8Mq+trM/2DU2C0pniFo
0AMD4PUxV4f179sTBB9gqd8+bJ5hUNAyWktPvRKPcQYNrN3HzMakgSP9DfxEBakH8zQVQlYNsjNj
YNYhOk761+vmi7N+vGuhkukwwkIrCEWTXnnD4JMyN+FNZRqxFc9/s+GOW1THUJrLz0lKJmoYU3ft
TEM5FWLWQ4LcGMHnk1KUDoOtzsCZYEOq7vgNCQwSyw9wOtotpLXNtQRY4sldU+YaEqBa2IzjDDKG
ABqzEtcAOluz7XClZQlEiynXrC7pe6Qqw6ixblv3r0IyOD5IQ22Ggu0X04Up+LkrwUb6WSqTyOOU
ITiWKOpl6shksCNPEl/BuiWQARnExpjfv4ICu53qXsXMYs4JuGEb/Rlch3Bq9QO4qz4OBi9JBFPx
VIum0+cuiKLJltqI72zYS/v7blsm8NzLOAjOhuC4SZMZhYzIiSVtxqFMcI8VPDz6gLgalKln8Pvg
tXg1gNfqB73agcm7mwaqFkUsFrkdAPmw8B6jpHCOFfY5wCfHoYKPKWWYgwtGRbCaMEVXyPBnkDGi
oC2WPV4DFMM6T6fFGmyF9mdzZKSHPMeVM1OdAHp8vYLCLN4thPVPvi1Z1JU4MmGmrNSkXRMq5m+/
rI6QQf1h04fnw/7r9tE2hrt4CMjqfby2B0PWPAdqGulN8emVlTxpwgdWmLQ2wXuvePU3nrPNGeG8
sKjsOieTuSisQd5e9MS/rw/2PYgJiQaoMg+C7YgAcmiahza7qyfXBQBJm7dt5+r7DeWZxm2NRs2Q
aM3RCJ0vOLRk2J0J8NPiz/Rc+mTYVzm/GorgAptiCgxb1+uCWMwIq3d6JpYAwdXT2zfvjl+2u3dP
+wcQnS+bN30TZlrxKcQCrrse103i9ues7U0uMAbyUdjQGqvJoLPu4Lx3VV0TTLOJ5DrYH6tRlb7w
ygMNwT3cTBw81YYCIgGh9ZliLxItxro/M4Cq7PMZ+voEOD6VYDm96w9uurMUgoCCn2eunYeKM8mB
R1XIYMPFbhPtU6L881OQ8ouCpH3+7GPECliXd0XwsUexOpy2aBIi/ePZL+5AxqW5DXbqskJIUlUs
VEc6yNlacFcP6K3o7iP7bEqeXPjbM3UP+wJPdE8UnPAfxnFhW7oxxIKmZvPkaF2Hnt2Ngy2oBj9O
PsPIZu3kc9XcSa+djyi3O+3u0GeyLZSQmGg3ZFD5RferzOu7UgXPjXV0tdH3UURDdEEryLkdC4BG
3A6GC4PYwH1KARrMsnNI4xrP4FqPlWVcLBx9bn/bNP+vzfrltMJEE58tR6YzdXLuZ8zzJNMYHDkC
kiZ+vlYTKSp5obtLaHmo8ZDq+ErcgcOaZfH4tCBUgQYW+gXCc9sxe802T/vDD7cGNEhGX22idA2Y
jOQlCWFCxDYNdS7ATt6+4nLHpBDcFdrcqylzX/cGjdGv1ErZunwDsgEi7VsKN3rsZaCm5SQZCqYX
fAdes5qLtF0n0zgyQwN0Nh2tmvirhs6Ucy5NHGzi34yjhYrl7fXo5oMT66YMjBYBtQ3V1SAN0f5j
Iuq/m4Cfr7w7abFJ8OEJYM2zAm92OABG1O3FTQO7rxloZzWANjiAdKnZJ/yJHijIytlBvccdfz/g
0/XlP13h+h8PmIa08OwA/93JObLbN/97PD286TNwXwiRdlONy7CDDhJfJSIN+bsgscp6whqgQh6f
Vo+P+/WAz/ZZbEjpzCTOzGM3l7VsdrbS4cRZw8KMCQks0BRyTFsUHJ1kXp3FaKkp8mCNqYPbug8i
ndy8ix1s+wuXDCnIBNxm/blB38oXmtns2zONjEqmrWk0VjjGtiRZrzfHY5Ttd9vT/tBLxWKS9Wur
tXk/N7bBn7fwzrsz/82c5Wnzfbt2GxlutlZQv0tEQ+3QglLiPhEraAbn0F2v/W2yrYpy1RxGQd+u
V4eH6Mth+/Bt07ZQTCa4XdcMRaLvpkqbD09ZWrg+3wPXCYUjshBn66zov+JvM3CSxyQNp1CgtGbm
tqdhPhhpNtHWgR/3qwdTQW5M9aKuuHcstiAjgDE+jHXiiiUIZLuI07rrRpkSXH/fQXSVgO7UT0a7
V1gtZWOKgnLW31GzUF3JmbuxR6MFJuEL485BMR+IJZ/7hbwazuaSha/KEqAS1qPBi2NVLEhsyIi6
y2lDbNLNM68Wxm4hWbKJZ0/s74pf0gFMuYXUFpYNgRh9Dmd0P1VpRlPqBK1Y61ZTEAojMUnvwACZ
QKJk7Vloa42htEVnUYhUTAIvUQy6fiXgV2WGumhbzy/H6MHYDkc5sUFoM2J82VSlfmNOX0DCGX6N
ZXDLkHXJxFIz7eZFU654yuFHlRY0OBuykFZ8WVwvlxULtRU/gw4Ahl861to0IbEzjJLg5mFTjqBw
P9w5BaeglveVq5kqWDeJtSNVInH/jhmW7n/iBmD8PiDW45CXAiyGXVgu8WaynjKImonxb70F4ruc
QLoWnh/jVrAf3hyeIIvE9A3lHITWSw0sQqT++0eAgg7LlIQezQCylcvWu0sM3V+rqgz8XD7P2LBr
i9BeA86AzMNc40V8eELGoC2qD/W/h5qbLyDlhOmgzHic2Oxse1wHlCl+f/l+WcWF8MTfAaM9ClVs
HQq0Tq0nBiOc3fU/4IHt3Fxdquvg0xQC4UtaKUW7ScDapEKVEt8xSXxm7ynLhE3BmNBgvDzlH64v
L+YfRqM+D0YdqeBgyIKvmQ0evwOUhcMJKWJ182l0SVLnQrhKL29GoyuXKQu7DL3VUSyHkFxVGkje
v/cqeA1qPL34+PG1sYaPm5HXHZhm9MPV+9Br91hdfPjk2B1USDjFitHiavA8XdnHDfWvJT4JXVYq
TphzDPTSfeLHmHn3cBy8TzBwuNBL5418B3w/AKZsQujdAJyR5YdPH9+7x1tjbq7o8kOo6d+gl8vr
D4P5eAwp3M20YGo5wDF2MRpdu29berure/l/rY4R3x1Ph5cn86b4+DsEMA/R6bDaHZEuetzuNtED
aNn2Gf/qN/r/8WhHF7ETSTCALEJiy+jU8fj47YlX4CvmBcl5+MG0ZxLs202qeA0Z3i4isWbTSYUk
PDZfbKsOZqj6xW8E9kjss4xu1Xo587ou+hlO4o9/R6fV8+bfEY3fwn384tTM6qK2clihU2lhnh1r
oeFahVOTD34kUw+m0x7vrXkabDvHON/tPxg4hEOTXhpo4IqS3AaPA1dizkQ34nHs3QJY3OC5K/zU
/gw85WP4IziADDkDOH6Bjq8cQlbJ0MiiXax7h9vjuzcvBPHmGfG5OeNp7+jiaSVjQt1LbeBTiGIX
4WSrpmBZOHZr8CQtSVAzQnrQuSsn71T4QhgPyslUAAKBxlhgOxyfp7iHi0jT5gsdACILk8LYdN0+
rMNSefTn9vQ70O/eqiSJdqsTxMrRtnmw5AiHecw8pbwqwOTjR0aOJ0Mwz5Y9CGVz0gMtMWDvwT4L
yT/39j1hGc8dvTavpc0HzFaEgdV1fw/rl+Np/xSZj/qG/OMM48w1DQAJT2TIejvH777HJJ950oKI
bH7uvCUlsvkqvfjbxSwZF2/3u8cffVLnNSrOXKcGNHGqFOaG+6ULAxxclwFDXOpgvNrF19Xj45fV
+o/oXfS4+bZa/6jfj3mNqiyUCtiwsReRagpu0nY6ncNDKLbiebheiujC6EoImwpRYIEgEKc2NzAu
amSzO84Yiy6ubq6jn5PtYbOAf38ZeiL8bGDBXfPbQHDKS9cevTqhXXL3/HIaOj0n0SvKYUlrujo8
2GeD70TUN9H4PzDwZBABaIALFYrWLFqShaNfBlS7fhjVxwAI04fBAElr6t7akBO/traALBdoVNGf
UJX5NQ8xMCksFx28HGx7QjI2zKHqiwkdYHtpoSuxdwJx02oNdsNJZTpx1KHcDtkiqfXzpfdSghdZ
+7/NCEowUQV+jzCjytKOz/iTHHQanwOfI/SnG+uWyEkpimxcf1JsSgsyIdSR7+mi+xasi/8boP2E
kQtIg0MpUUs2JtdXTme1Q1hbFViuaToHMPjsVeYTGuZI6ewqJG8dRQY5eh5iJnO/EO3AbHmXCxXi
BI/fK960mP9j7Eq648aR9F/xcebQ09yXI5PMhSWCSRFMJe0Ln9rWdPm1bfnZrp7qfz8RABcsAaoO
epLiC2JHIBAIBNA3daBtrhtTWQ695h23ImPdXWACbtZklNzvPhJjcFEZC7yu3k4YO0nRTVdqpFB5
2QfRqMoqZ/qKodO4fzqU8NNRvQ77uOY9DHgMIsWVZlvoNgXNQopqLwdWfwMlcHMFVy139lyU8jQo
bYmtGTXhH0gSGgXjNOlk6YZn0MQ9xydt5gKZ3UZyMiI2m6jxEjvl0RCg964UBmuRiy//fP0Ba/3X
n1qpQQafr9r1xoXYlSeKqBk3jYTXzFbhh7Y9as3BOtRjfKkCa+UR7SuvXvwDLYNy1X/3X19ff/4C
peTl6z9ePn2CveXfZy7QVf728ffP3//brNcgh7ZKEwLKoA25b1PwJipGxsG75iB72qFotrEjmMax
NlI/lCzIwljnO6DegTEXzO5F4OHaFo7+O/Ql48PBGCk4inFl0vOoiqe6LWuDeMS74OK0RWhCLlBU
VM9GQRXtTCt9VZ/r8to4bt4ix5Edn+hDZYEKYRc7Ki+qaLSXWJCXiGK/CZ9ix9eoJTcwvY+9Xmm0
eeuUmp31mqPMbzprMtfXLlSXD6T99iFKM0+nPRxZpx7KIg00j+BBT85YGQRpSOJxtETAkCYBZVIU
4FMCa5pRKjZyM5F58XakcsXBwfXCXLVjG0G5N2ayIAnW0eHs5q51y7BupOOeICZtmeRJ6QrDJs7o
zr6uS3Og9g+hq+o8LINIOByqxMvEQB7qUR8EULPhSGk9Aux6Q6zwQS+b0BdOEUVMjS9vbQIqaXCv
rSK8bx9voDa5J504NXKUUWDToWNG395a0AJqMVm0tBb6RAd1QRZ0wC2GmrymhPidGa0gja8Gren1
Ao1Nl5vjWmxjV58zWJO/PX/BleLvsM7BIvH86fm7WKj1q4TXX78DcWNT1hNzNWLNWHYN7SaC+Im7
BuPqtqitiuQKaHTncKOO1QRkC+V5QRK2W2MUCQQPuG4yAJ4uqcVprzPqyMaCy7ujOJJh2V0otTRt
R3Wo3sGtWo6UiWHwQUUYV3eVvNnDnkqSzuquFsClVA6EtSNjtBcaF1+RZOWAtM2VBP59x55/4sDZ
bFG2F4cwRhraxEYz7AwC6PMwUgawtGZe0twg9ayoiilM9TvRkpvRNkSBgXpy44V622v9ZgIBUVlN
U4zSpHpsz7Vq+ULaorX8hyAWt9FiTrSVUCFOF64dlM3Q9GhT6+FQtEZflaB+GwGDFPJSL0eblE3H
U98fzRGx6DGawQCR+2SE3dJB4Wbw1SAeBp9IB0/dqxq6krQjY6N3eGqjl+zEjSY58QY0BavjkLz0
qMaPugzGneygS81CCYyfQDKFI738Ilc7dtOpOY7uRp21MIUC+hL8PhllQZurxvabrnAiqemyLPKn
Xj2lX+utXhdYiLIptBIj2RwDGoPQq/Cv0mEWV3lO1FouOKQq9lWnoSJmNjRs5KfWoQKLJu6EefHm
yEjAnexa7TtQXof6EU+MnUlfYT2vyfgYAoXRGETmoBvqZS7qSaG7jO95D+7MetorGDFo7DAwe0oQ
J/7oGlmg+gVmE8MW6UFEujWKt9BxRDuS64laPd7oy8wCW9RHJweohqhcO/LjpZ/VPPECM1NUHnl9
pRUmyeBK8gLi0x7y7hAxCGpK50KZisoQIkLLJEiEZMYDMV5GBhFtpBYpsZp8Xz0VE2Y0T2rV4Yn6
aeB7QuA5qix4fD8y20l+68EYaQpnG69MoIM+6O2h6MAKdcRjXoNkKLCC1liDdhyOLS/g16k7u5aZ
D9Bc5IREgHXT+XFP1hX60cemz/zx5dfn719e/gRNhjC8iF7QDUvrp0sci1knMjQg+EEjlS7V1xOQ
o7rfEY3dHJNgtBQboauSDcK0UcvkMhYmqac3DwCMg9hkwt+OdoS7kLp61+lxMDu+F11y6JDDaiek
ffzyWfo42M2LiZaNiJvyIGzWZOIKF66xZCbzcwCvP9R8JDp0UITXj/+yrZAATX6cZTLu63pRd904
fRM3W7rLe1hyRTyT9jhg+HkMXSNs7HwoWIeX6H69QnFe3sH+CfZWn8SlLdhwiWx//o/q+mGXZi1M
3ZZDT4Q8n4HJCgZbtzA0SX6grxfw9S/wLzoLDZgv95pFWopS8DANlLOelT52gZdr/iYLAlo49B19
C2JlYvSGcsEPzM8yOojSwlIVWexN3a2jROLC1HSwIqnL/QKwsgtC7mW6fdpCNb3TRLVJM2PLorxb
dLy6SpoGVobRjz2i1F2NsQMuqva5fjKwE/EF5ATLeUkW9SHzKDvjgl/LY3MdiOqvkdy4rgivH96J
gcRjfTO30lMyytUK555HjUrdXK3Tp3PkhmI3lNiQ2O751ACydocKkISOL5LQJ0eNgIJspx0ER5w5
Uk0CF+D6IkjIggiDvCV7Daby/bm98UmKJCuJlgz/uoLdRA+algfuFDtzaTardOybuqW+Rfm1N77k
l9PhHJXEUJ8txMREHAsqN1Tf472CIkNKiSPOCBnbPWZeEjmAjADq7jHy/JwE5qSILgcojXYKDRyJ
BwOX+BjKnQUB5ZepciSJZxcJgZwEKgb01AH4MZ3UmJK1E7n4ya44Fjxx+EYl8jRxZpDvNZ/kSBwt
kGc28FjyyCOrIzZoQtfraP95nRGjAiIjIY7L1M+Ixgd6QNMz4B8JoGKye23JXrEs2ltgeDXGRG9y
lvhULyM9iMmcWObH+9oCjlMy9KLCEMZExZuu4ByPvhZdsQf98+fzz3ffP3/7+OvHF8Vsbq6voHKh
36Xd9pepO1F9IugO+Qgg6nkOFL8T54o01GdFmuY5sVptaEQKtO3jvcZb2dJ8LwtSAdjgN7pQYaRO
/uyykCvclsrehN+4/L0KJbstmrxR3+QvVSPf7dOM0I42NH2jBMVf6tRoJ4+wIHSt/kPhkxrnh4I+
+N4YzgEdscYu1O6yvrHt9VC017RRuAfuz5ao/ItDOTr+pTEQ0e254Qf/jXZt9xkwJX5JA++tSYFM
CdHlK+YQAIBB6q5KCHR/aCxs4d5SuzDF6V5O2d6itDIlO0mEb04cUSPHCBKYcwDxyxjqLbG8weNY
eKyVomD8Zlw9nyHpXLK3CuLJP6XwznZfAtBsrSoVdIY8SwjZsZhd7UVaugIE+f5SLrmSfK8e0n8g
IjtxBt9O4CKFAJ0A6/wwfrugwBanOxkN9VRflwDuVhKL+dWyhLGXT5+fh5d/udWQI77xonlUrnqn
gzhR6gPS2VU7yVWhruhrQsVhQ5B6pMwSB0bhbrsJlr3OYUPmU1tvpAfk1Mfy+JRX6saQpNRqjnRK
qUF6nlJ0KDs5uLFwyd5IQIaUHG+IZLv7E2Cg9ARBjx1Jhsn+8AWW2N/d2g1JmMvmXsNEOEalpVVf
y0tbnIue2BWht2lh1wX2RGmTE+JEAmSbD6x7SlNHNPZVKD7eanxJob5R3rSob2vnsDNBXBjFO7zz
26Hx9kbZ9WRo6csndf84P1m5FkKaX02DywoL3z4RNscNl8aFZBWzQvULqhl/QBBZMaahMDqqMZ2+
Pn///vLpnSigJWLEdyneddGjDwi66RgiiYbhTiGu1kS9dsI9xF35Hj4+HPv+PfoTjLTZVTBSXqU2
x3jm0gbmatDF+/SrRl1cNAyq5XshyNW96MwEjvXqKqcX6ugIMi58Pgf85fmULqL2PnHHSMI92eJ4
vOTO9NLcKYO7wOprZ2TRXM91+WSOv8Uq/9VIG+hhQB4uyxF6yBKems3Jju0HlPpmYqwrIQ93YtJx
waw8G51dLz1IVYo4a3N2neHGqY1a6bSnkSpzrlDn/lIeFKyIqwAE2PVAuVBIpuXxEo3Y4gEbTH+T
TpUfxNs03smoCYtYgn+NDhdHyUbq8mw6S0xWHmWqcV8Q7fNmQX6qMa+hNsjivuLEzdlknkVLYmNK
vIJV06m8GNS6GsIgCkd9XXMKw9UzX1Bf/vz+/O2T4UUpM6u6OM4oE/8Mt3ZHn+9TR0bcUgS22YCC
GthzqyuLPCY9fjc4NRPrylMWWzNu6OoyyHyTGfozn894FEdIo1nk2nKq7OayGkvfLkrpW6VerJ+T
mAxQC5/dnQtiVeReHFsJS/9010dNF+ZRaIq2LkvD0UoJyXFC7TDn7qnsVbEv4yHOQnsGNkFm+t7q
HcGT2LMnFpID3WC/AVlCu75tHLl7RRke2ajvjCX53kRe6PzqzrLQWgbv0uCqzjJ7WKwuGLvDBVQQ
XzVKLBMh9HPf7iE5b2h7iGQow9B1+iynRc2vnPZgkKIGxF3k0ZscmYMIO0Tu8onKikZ4+vzj1x/P
X/Y0seJ8BtFeGNHm5wzLhxvlhzlL1/mq31oKMrflm7u/XNr1//Z/n2dP7s01Zs357s9+xlPFgyij
tl8bCyy86nhVv/XvtBK08Tj1542Fn+lHookqqFXjX57//WLWavYrvxx7asewMuCLW0adJIDNQR69
6xzKyZABTPi6gxmCTePx6dGnp0Nt7jSOIHSV33AdoDMgJYLO4TvqGDpzBghUGEpL07kcrRerh1gq
IO8skVmmGWWl1Zrj6EV0stnRT9WZpY+rdS8rnjwSr+EoG9yNuPjh0NhQBol2NqeAuGHBfY+2PTZw
2NDQO2SFT4Z8kKTriXqvWOPWT6kMRDw9rLnpqxzS72RtDLI0DVQ5jx0WY4VvzuhNvmUlfZNx516x
yjbrxmT9JLa2pKuKvbxtRWTUH8VjwxhEWf14TldB3ypkGaSqszGGDmOu1OWHGG+7oXYElztT9wLi
X1hXKpM0X7qRVhAZOk3GNCFuH60RsKo09Gl/MoUl+isstOq4sTDfI68V6hzK4bQOJC4gdwCq/FMB
P01JIA+0i+QrMKSj7wBCFxC5AbJUACSBAzCcUTWIWuhWjstAlgK9dsgUeWle/LR5xno6Fe3u22Ur
7/zm3F4RpcnKLuMwdkQ74a2X7mlwAlPRQKZqnKgZF0FEB9iH2J9WPAmIVsJYbwFRhHmPY9ExcvoY
U816QmeQ2OGdr/BkwYmKl7WxxGEacyoHVvphmoUwJBx+7ksSA2hrt6EYyOfIFq5zE/uZ6jKlAIHH
GVWCc5p4pMf5hgfkd/J6NXnNY2a51JfED8kBWw9Zulvh38qIjs4iYRC7vR9QvY8vIxTnIwEotnUr
O7Fwkl45Okfq/jh1BIY0uUwHfhUmvUl0DrIzAIp80v1D5Qh8cpQLyHHMrPG81T5RkFAdIgBiPsKG
0/cpmYpAQAh6pCdeQkxhgfg5OcMQSigDk8qR09mFvvTyplIFjFTkFZaElEMCCImlTwCRK78kIR21
NA53NXKiZ1jZhR5VwqFM4ogqBuiDQZiRDjprosf2FPgHVq66j12ZPo1pl4pthSx1O/g6mFiy913D
UmoEsjSkE9tdhAEmmhOoGUXNyIyzkKTS85Bl1DnoBlN9CFRaIrCc3uoqDHFAeo1oHBExPCRATMOu
zNKQkgEIRAEpPNuhlCaDmg+uq5ELaznATN7rf+RIU6JkAMBGllDTEMjVTeoKzD7ONsCLMCAXtSs+
s5aZywDNlk/84HjpfW2zUxbnDv8kZsTGNr+9Y+Te1i68ei7onJ+UfdVmOgzkrakNhy4llC3QbCkd
7DJQggjI4Z8kOfqTLPllKPeEU8WOILWJWX0ERSzyiMkKQOA7gOQeeD5ZDMbLKGV7JVlY6Nkr0UOY
7wkEXl7iBAMqytiydishTq2jAgiJTRkfBp7GVD8wllDrLshpP8iqzCdEYlHxNAtcQEo2XAGNmu3u
NOu2MC5YqQh9A3djCIOAzHcoSU//Fb6wMian/MA62MbufYoMxPARdKJxgB7RgwqRN7Z4wBL7e/Lx
afADn0z9noVpGtJ3G1WezCev2iocuU/sCgUQVK6cSadjjYEYfJKOcg79VeydI+BNmsUDJz8FKDFC
IWwgTJsLZcvTWY6XE/m9ONbZ+3rxqV8/FQtgQQXwuBdDeamuysn0QjHiiKzk9no3XnldIRnaUUSv
m1/Xqgiua3dsxeVOTMRTTL8Lg9vxZsupF7dZ8SGXOSXLVe/+/Ovj759e//mu+/Hy6/PXl9c/fr07
v/775ce3V/UIZ01yS2o6X5+IcusM0NqNZrh2sLXXK3UA5GLvMHi4YtIm2JY3mjb2/xg1dj3/w6+n
YetxdWipgKNRN98ptHMEKztROWkJIcYWAknoAgK1bDMgzywt8rYLILEPXpKTFZVzZ6/scvKoRVw/
niP1Ux+vPB/quscjiJ0cBM47uiNm1Wjv+zVMzzgSLVlw0NgTugJ4R7gH2PN20wcuXrB8JNpW+sBE
RL5LXByqVqfhXg2ev5vrHPyM/L667ze6jGizzyOiiuxydO0YeV62P7BFYEOiYR7CCUQSAfRtPCR+
RrXlrR2pL5bgtlQPzif++xXhsE5De4wY3WavNtITiOhL0NICcnChESB0FA3P99Mk2O3kmo0wySvt
yQCgpbemQzJZG3Ydi35wwnxA/7Xdaoo4c1SRxW09I+FViGBYnvN4OJASBkGieY5VXQzHBzKzNULl
XllnFz0i7fla29x6BrH/UCBdEQLCtdNOhQ/oPOeTs2yNr7cnu4bK93N6AIjLBzvfLs5kVMPxMvTD
IzVJyhiHlFpp6TRkDqNDySIxa8junK+NT7KV1I+Ed6pzdAFD6oWZE6/ZuatK99jtsPiec4y1UxH4
ZqFurNkVlPwwdVfO60OjhnnjB60vgEk+J3F1GAuAYX4/zXHt/IDvhNoZHeTjpCrTkpFBnpNntRpT
Q6YqouIYRE4RW4q4lJsV5VSy1oFqR+GH9ZXU1dEa49L87x/fPor3n+fQ55aDDztVix68dSrQinLI
8iim3ZqRQcZxP3fGwYuaBA9TX7nmuNA0dwMRVWb1ylM5iyHIUs9Q0gVChOOTdAzHhxHWSjVg4wZd
mrIqdQCaLc499f6RoC7efkYGGJtkNFIWNBHtQ6Ob/ngbTY8MotCNcw3RM3gFwac9YlbccVtoxclr
aSuaG+2+3XrQuq0uQ6PXUKPV/RSRc9adXYGUFBb6sGdliKmUE8pSsIIh8YlP2vwRRA/fh0OYh57e
c/Ium7yfbfbHGRY/DN/DpzP5wrXozdJH3cToYknU476ogBwUWmasC+jrSgIcoYh9YY5nUD9i0G6Q
rmUjHzGTd/a/EoCIBmVUFqA4Hq2AACvPBZSvTowMym8DQKhT11R6QepHngRG45hBnJGWZR3L9Mgu
G9k1oAWaeGbbF6MfxWlqte+szzkHqmRwDiAJq16yGzUPCWqmXv2dqVnuUQXL8sA9qwVOWjY3NDNy
GpIwsVpTXrRypbPsQNWvjh9GdOmmNvxCeCCm59wO47E0hxbsv6kLBgh15SmGqay030KZtNG+UsU6
aKQPw2B0ROIUaxcV6EIv4BDBPnoHjr2QGvYCXL2uVeJD5mVWM8itkyMdfiyJ1Y/XUZqMJCBeAhWT
zFxhll23QWWx5xMkQ7UQ9If3GUyiwKyBdPVyBQ0pDmPseaR+gVs4yo9sVi0wHndfMqMQhvMb0gYM
zBeGIKcGXlri0HSwl7QszTIrlYbdrFFUNKyg7XTo1+d7MT3EpNMf6ewuodSQULa//UY11+fZCT81
eOvt3oBNjtUbqEoiGZFhllCFy31LeMx0ayGnmeigtzMLCHr1FZnFBkCNmwUrbpXrCal7k3iRZwXg
VhK5N36QhsQcalgY6x7CIs8yjLPcLU7k5QVHXpvXjKlh9/UH3JntNd/Cs6dO3VkWkaHOZjD0LSVt
NhK6NbCZwdJW1rsVFo1SYO6uCEZSANyjzDfGWn+9MLyMM9/iIxC8pmPms33luMKjMIFiP7Ib7ZE2
y6UwgEljxZK0eAQHNySUtD7oRTci6Mn9iPSspohUSz5ciqpAfxPXqolBYKcChe3REIHCBCR0KUXm
LRbaOWy0lpd8hpr5nuPNKdGYnN2ocgq6NViXazh7G9Itnf54vjUF/dhIaS2JSGmvQ32q1bDzSO30
wG0zST6giA+akPaKqi4EJ/ojy+dptQTKSxo6HL0QlmazgjI2bPDZDwrg2XoJoVmJUShztI2Jx50B
DLVZLNfTWIjJi5Nf9SoS1dMAfKJvcMRSXRgPVf8k3kPix+ZY2sdT4s7+0s34BqtqdZANXTCx710L
o6FFWzRXEOdPLga0Nw5Fs8MB+yPx4hwJ8qp3Qcu9ZheOwXe1NlTDFOhVVpri4+sP4g3cp7o6Xif5
GpXeOlfhZtyo47p6Omyropaplvh8sevTy2vUfP72x5/vXr/jnPtp5voUNcpGf6PpCqRCx14/Qq+r
64KEi+rJfA9CAqd6xOfU6xZmXV+05/+n7MqaG8eR9F/R00Z17HY07+NhHiiQklgmKZqkZFW/KDxu
VZWjfdTarpnu/fWLBEASR4L2PCmUX+JGAgkwkSmHvmF5fm6LrQivpSF1UXvwckDpHIawS7NzRTPm
scg09KbhjwxkIguKK/cb1j/KaE3xKebe04RgHiIYGfuCMrN1xfUBJk82+31rHy63rxdIyWbN99s3
5gT4wlwH/2HWprv878/L69sq48usHDBLdhNsbQVjyu+/3b/dPqyGozk3YJLVih8HRslOdJCzdoBN
z42ka38K5l+aDO6E2DBjdlWMqQCnwvRUAz6FqV4E7u+UT6SU50BPMOM0mpqCVFZeYcwHHlzux9qi
N/V0aq4PG0/bTWY6IhqMTufjXr7unZG85iNd6iLA86uzqtrrUjUl7KUvApK8Da3yAYPS5rWJXwOj
raNsk+xwLkNc6WzcdnTdOQ46RPayxwBOgyhdx3yP0ttTq9edkhMm1/IGw6HpCxLAtpGZuY7tYSGP
OscuIvQsaIMKYznTYFHQIktPWpNlXKFYhM0qI/pkGjf9wsv1XpJ2+PN2Gcb7UuaoN/gpQlTi5J0L
kOnO3mFjbuL+c9sbfUY1D6pBl73RDQDsWNBnvYYc4CJtMXmZOfOiGrCXFJxj/BS4yVtXr8CIfcam
y5SQ4G5cVK5j32Lmc4JpDI3RbTN9vGgDjq0x/JwqrWkKypTzY9GgtqiiYw5NUi5NMM7Q7eFtC1qn
vDbkdoCQGgiR9IpKDyvy0nozf2yjutQHFyamO1lWpWNZE2MdLKmImYyaUENN8ZwBoYmG47jfjkGb
V5+mSM6/rDIezkzbBSEGNKR8NFQ82UkHJ90+3d0/PNy+/I18Y+P67AAu1sdaZD//uH+mquLdMzzF
/5/Vj5fnu8vrK0QfgDABj/d/aXuaGKOjcfGh4nkWB76h1FFymsgv/AS5yKLADc2ZAHTVRFusI33r
Bxa3V2L36H3fwW40Rzj0ZcP3mVr5XmYKyFAdfc/JSuL5mH7FmQ555vqBp+d6UyeKKftM9VOzacfW
i/u6xW95hKTtmy/n9bA5G2xicnxsULm337yfGM1h7rMs0py6zO4a5ZSzpi/npmvmzCWz0bccwB85
zBxBglliznikOpRWADiALiZOAmOqCjIk1aE1eJ1DiGGkDzIlRpHOedU7yqsoMaWrJKKVjWJjXc2y
2HUNmeHkkyFKcEcYB77ZFyOid4Yh2W3oBkvTj3FYfBlPHLGDWlML/MZLnMCQ9ps0dXxE9oCOv1yf
Gdyl+hzbk++pH9ikCQsicatIjD51WV/HJ7Nq5OSFdD1D5UOTBqnAy9NCMap/RwlI8A9xkgyhHoNl
PMQmuS9/mJDIqY9xh6rVuQK8I2apn6Rro6irRLl9FSO66xNP9bWkdZ3UnfePdH371+Xx8vS2gnDQ
Rr8e2jwKHN811A8OJL68sdrynHfL3zjL3TPloasqXCKixcLiGYfeTomduZwDdweUd6u3n0/0qDxm
q+g39ADsuXGIzjk9KdcL7l/vLlQleLo8/3xdfb88/JCy1rs99h1k7ahDL0aftIpzlnlNQ1UgiN6Z
i1Bpo9Zirwpv5u3j5eWWFvBENyszCL2YMu1QNnA5VumFEtIzslH/XRmG2IeR6ZjoqdFuZrqLfTeQ
4BQ5c3pyHJOZGgd4EUsdW4OPJzSZ7+PuICQGzDxhhkNjNaDUwPXM0vZHx8vQz4gj7kWyD/WZGhrd
A9TE2MwY1VCRKDU2lcX9MURLo1QkB0qNzfnA6Pg3mpHB8kp3Th+jdYhDrP/CKLUPxv4Ye/JbrYka
e8iWQ+lRsFSzWIucNme3mCwB9QUpLUksbnRHhtRDPV9NcBSg1UmX+zel+5LZv66fhIigHvso8uyC
Wg9p7ThGDzOyeUYBsvKafSK3ijuTiTzgeQ+ui+V9dFzXbAED0G8nM+66xn1D3zm+0xLfmIrNft84
LgrVYb2vjCMv3VVSL3bVkKzisiHPSO0hijsHFm4pPodBY9Y5vIoyYytmVEPjoNSgINuTOYEoEq4z
7GnXtBXoY1IMSXGVGHp0SGK/VlQAfBdiG1RFaebBetRwwsQzuju7in3z9JffpLEbYNTI2DsoNXHi
85GZoUyVVGrCLxQebl+/WzfNvHWj0OhgMDSIEPmk9CiIUB1DLWZyYLikV2x7N4o8ufZGCukGAzDp
HmT+wnjKvSRxePjl7ohWDslBvf0YDk0xxZMnP1/fnh/v/+8CV/pMb0I+rrAUwqrJ+mmFMw155kIY
HvN75oQn+HZvcKmnDbOQGBM7jS1NEuk0qYBFFsaRay2CwahBnsRV96Wj2G3J2OCp1swaJvsWMDDf
Vi+KehFq4KIyufI6LWPXg+u41uE5Ec9Bg9SpTKHjWGp/IoEVq08VTRj21rYxPLY8b5AZSRD0Cep1
Q2GDY4L81NucQ4rdlYRuiOO4loFlmLeA+ZYZx0u0pCzs/bYhVJ22DlmdJF0f0cT4sw+p/EOWKvu0
KtyeG8Y4Vg6p61tmckfX+8E63L7jdsq7YmUm1m7u0v4KcCsOg3VN2xigSx62iMmr2+tlBR+FNy/P
T280yesYTZaZwby+3T79cfvyx+rT6+0bPZndv11+WX2VWJU7+H5YO0mKe6sXeOSiNmAcPTqp85d6
Jc6IqkgKcuS6zl8LRQEDtgiyj8RUmE6zq3+1pXcsFu5/r+juQE/fby/3tw9qm6WM8u50pddtXICJ
l2NP6FntSlX2WJ2aJAliDyP6Y00p6df+Y2NBTl7gWm69JtwSiISVPPhowBDAfq/oKMp+JWZiqhL7
cOdqN/TjqHqoM/BxmnB5NxMtzi42JxZnl6NWD7ZSR3bdM46f4ySROhHZrhu5KvFY9O5JvghjnGJd
yF3HMSYuB/ngYEv0XNRJzzUD2dE7heeE7XkzGqvt4yPvaHJGZ+TpZNS2pzuerUfz3nf0DoUQBZkb
YR0au/IsHlafrPKljmpLtRT8ulk0xrMFOJlx20Rm09PXZI7KdK5SqiiIExdrVKCNUnMaIrNTBj/0
9K4FcfHRoJusDuUaOrdeq9mPZGKQYyBr7eDUVi+Z0qkg2EZVtCtRSyiIa85lECkfVQN5z1N13HM6
ffJRauAWGvn33KXbIZje7HMkAdvgp7lDxBptXZVBLBN9hvOGeegwer6563jMxxq/1h16Wmbz/PL2
fZXRs9/93e3Tb1fPL5fbp9Uwz+LfCNs58uG4MJ/pDPEcxz6h910IrlsWcRe9CQB0TeiBzdVaXm3z
wfedE0rVdqFqS3cmc6RBThzsjReg2SEJPWOCc+qZ9sZiMvjYrnU+FKZegog9O0qVdvPQE33+n6wm
qcWzjhCMxFlYS9ji5jk9Xgd1X/6v/7BiA4HHhrZhZWoAxOR4VM3ipLxXz08Pfwv97re2qvQCKMkm
8WxLoo2na7S+P85QOolgX5DRXm885q++Pr9w5cRQj/z09OWzPpZVs9552I3nBKbaZG3WrS66jGZM
u7KnqzX68m5C9Yw4UVsC4CTuG/Xe9sm2wu87Jxz1TcWyHNb0POKbOkgUhX/pG3t58kIntMkOO9d4
xk6TbVLHN2q923eH3scsllianuwHr1Bbvyuqoimme5Dnx8fnp1VJp+7L19u7y+pT0YSO57m/yIab
iIHjuIA7S2pbqx1x1HOLcTxh+Q/Pzw+vqzf4fvqvy8Pzj9XT5d9WHf1Q11/OG8QY2bSFYZlvX25/
fL+/ezWNoMGOsGwPR994kZCroRD4tkFp83Xb/IlPIvOLuZfbx8vqnz+/fqW9mEsJRN4b1GS3bs/M
xk0+QAqaZMmLnx4pX5s1RXUe2v3uuM3QAUCrxeq1vr378+H+2/c3usxVJB8tyefumkqiKDd9BuPo
kmAXZBDGoSq3u0FhnOf1jF8NuRf6GGK+h5qx9gYLUjHj4n04mpb7JakK7Bw3c4nHS0i9Ro8BaOYU
TJII3240LvTL/cwzvSfGO0C8QF3MQrgxsHRu5DuZFUpRpE3CEO0T8a4RQeiUzPcdWpD0rtPAzJeG
UrO4bwcEUV+ySNU70gGLqxbD1jk9guHldOREmgaDxBsmtKwil78rvCNWY/pdXpfyWmYsVyNjvz80
sos++HsGc3bVmFylg9MxKoilZMvYK7k08Pa5VgmfeSgWiUKzK+pDJW9FQK7LE1UoKIhMRpEzoPJE
lshUiTlsy8Zi2yn4jBdxCof9BYDCNr4v2lf5OcPd41OuY9Gt9z10WdkMV3pbmS2tvQR4YdGQpaqa
9qlsad3lvzIrEXlPmWhy9XZ5BqPJDPrpAf/34h9RoFXC8l4TMDAqvSk7i+9a3tmkxB2vsLzRIJKs
28ZwS4J26OmxZkfKc1UOQ1WciyYvM+VRHHCIIbFsaJa3qUXdDyW5QirSFDcgf9KHTvinv9OZaWfN
AY6E0Hk+cI9Scp0Zw7oDQW8KyrW7OZMdPCzKjRGFDcb4aMjSm54iGDlrfMcLU2mp5OSuLCqjDhl4
r8VWf15DUke+7L11poY6lbtN0Gid48BxLTDKLSoXvH/jVw2MYzh0Xdmf93VTZloL2Y7uaGUxomcU
xHd/WyHsUyWaiB4nMVWdwUYgcN7Y/TqrqFpwWBdGhgLrsmtbnnq0UV4PePqPm+pMuCXQj8BDBz1x
jGg4ew42y6baCXZHPqM+mgj1byPQRHHWMBL5lq/nZNV/GM5iMlp8F0wMkb/AML4PH7IBfbowMcmP
xRlx8hqkEonrBb2ThEav4Foml6XcSxzPbP3gh6g7XC60k+YoU0UUEa1aTW/m3hTDaV2inu1Y9sJR
kppoIBl4fbCKa0XC1DWEAsQv/Esj7gdPvTDk9R99tdiKKHvf3VS+m56MtALSXD9r6ye7iPjnw/3T
n5/o4ZRuG6tuu14JBf4nhBNc9T8ud3BfsiunRXf1if45D7uy2da/aCvwuiqbq9roX+7jw9aMujpB
kFl18A69/HKU59KW5/WXodDI3M3H7O8bWbnwoCoT7qFurnk/tr4+2adX+WZZW/NYyw08wCp6eH65
+76we9FDheul+iSmOnkUhPreBYe7KEXEhLbGcRdkfHRkZOfohiC0hOsTeBK62I0RH6Nt7bvMRm2a
a8PL/bdv2lUHHzi63W9tj48yQgpw4ldSNQcLIVbQ5QV78Q7OQ5migV+hgFc2ODGbiiKF1ocN9iwY
3hjD23nsPH7gyaT7IPb/XO/pOYa5MPhiYNqLakHti2oDj50UmwaB7YqsRR/giqTgeZqt24p1tNai
MVF2OMG1R5VJNaO6VkcPUfMs2+VBECeO4UVf0GdCWYPfTlKWcHshSQrJPeVgwm9QuE4Hzyf7bIv1
p6gIXUjOWrQ7GWnQwZU4mPqJDZfsAukAwVnB38G2aMruWlKxIfQvvAAVgKxbQ5rugB7Jjhs5d/gH
yvv1RgmWzcjNvqT9irn9YPAUgV1Pl9Vr/AihJDuTrDpR+TgxV5Mset97JUF069N2XYg4io84E9Vz
wRFjV+uxJxlbDS/6Fdu3blh6NsjPNX+r/2HTOxjENZzK5Gk4MtdYDpR4JnUOIa/E/ZgiU0fm+BPK
MdaA+v7u5fn1+evbavf3j8vLr8fVN/YqX76rm4zvl1nn8rZd8QWPS0KFq8glpwv8v74+TFTuP50J
PD2enq/W//CcIFlgo4u9zCk5rRfMddmTxSeggq/ss4WRFEz8hDu91XzUYLKmGmHvRmdiYhRwEg7o
RTeAXp9j8Di2ULhgy8u9F2AlULzK1i2xYGzKYMVfH7KhIDvIvF2sQOKFgZEzJYYo8dxnBv2K/4LN
MNo/1jZhgHJlMJO7/WGgepsxucaNB6Gei1MG1ppGdhwVmaoiRreiLS0G6a3tvso3pXw1MFLObdkW
6oLf0YKm1QefoHVRVVmzP01sSJl78LR92isvtnZwz0iqK5MCl0BtpngjYnugyj3TZm9cXGd4eL77
U9av4QNGd/l6ebk8gWeky+v9N1W9KEmPrc+Qdd8mrvJu64O5y3ns+lyqd1Vf0ZVANuKQWiL5vpTl
QILTAPU7KzGNLhFNhHseteTdkxq7N1Q4WtVFkgSVoR9gJ3ONR34XokLqhYyKBdjhQGWRX69IyLp2
E9XaUgJJTooYDaqtMaVeaMuCfdQ8E8z9g8S26bkDZcXxm4b3GY7xQM4oJEKdYlDv1W0vG73KyU4l
/FLVSmkVRa73XXmNb0MUrXrX8RL2Ui0v8ZtiqZQTzR/VL2cWOfKlibY3NVr9/anJehQ5Ets41XXr
mb4Nkfky+cjDchE+l2qLh0TWt8wLj2UrhwKy8gp8a6GyAjipvdh1z/lR+VI6QonFKbXAzxBk4V0G
5m7ZXv5ZhB8321+2nexqZ+QnX7bNoTfpu87TJxiQmx73FzLjFk9wAu9RD3aw8M0x5CzLH11/InL0
ZTMEHU8tYw9gmOK6v8oWRdgFssYT2xYlCsZpQo4eeg2tLuaebDPGY4Tvyr5U9YDDWmLHvnDMHFB1
fBndQxD1GapPRGzGyuiAf6Ia2/8nsFFnCaO1CO16vL4on75dnu7vVv0zQR4qUQ2Hng9pXbbT7ZNU
JRn9/HuAvxfUmbxQsmHUQdXSTEfRr946U2LN4uTajLlUrgSN7jryDOQwDY1QWdA+RCffVfEFBhr/
hgbObXjIespqHNwMvYiZrAyXP6HYecTkNVn4gUJnXD14sYNvXxyiyzCtzRJDWW/f4TjmBXmHZVdu
3uEohh3nQPcdzrPOW8qzLM+ClW5S7xS49fPlAl3L+ilzRbHlGazGFWNGlBpPGlsrAyAfqY9kMw/Z
Qm5i0D6U37FoyFKGcWTzOqpx4eZgClfiog/UNZ7I3lcAiuH/SGnR2F0fKfRcb7Zks7VMK86xIE+M
YZYWW5Vi7POQxpP4CxlAwHlQ0j7UKspMsnq5RpTno50ErO2B2ZTgm6DG5L5TLGXL8uojIzll2mAf
aEzmaSwXMvyQzDHO5UWQs0xihLPIYU0MaHlFYxzvDiPl+egwMtb2XNKt8KbL2ncybYsPShtlrj+0
iHPW90YIePQRWuLtc9xgxGSlh3QIZPvOgVQwvy/SwMRH/wPlhy7+xHpZN5DUB3F1y+9VHh+ev1Gt
5cfD7Rv9/6jYpH6EXbqi6oesE7HCzjVuWS4fPMseXMrJF9vMsHKby879GKlra0LQqQ3wfMpgzFno
a95cODnGa8RAdqZsSU9rXyep/FJJhfv8JF90TmBf51DJGcna6/OWkHPiJIFKrWuDXFJy1vajFxqd
GjmuYiVRirwDx8U3zJEBEi4yJE6En2OBoUIYjPSx1Azad5waqb4BJnqqT1yDwUcDBk2w8v6bUiuT
mnNeSowxKgs+Phec8zyAbimYD5dRMq+PbHY8U/U+EVlYyCnWgzZqhGcRocyJMQjtQSDLjU0TeYr3
YrIpjvJ6AtsJpYNzPuy4S5jJuWCQzEJnuqfRtxjz1sZJd0w5mBmlspBXTGdAM2JtF2S5GQLwbM2o
aaZIMuaiYrH9E4da/bwWPZfIjod6MUM10QEyGxT8toOlYvXX0sGoDYeOnlZh4NBVrz9fRz09hrZi
aLWKmLXjkycI9fqN7aQQKt3AI8ZcY5EY2OCZxZ5YXeQlt5+6zwsdhTyWodNZt7puiBA9tTGC7KMu
hka5cpHs0TJFkG+JyHvQ1ULJT4Bn8Y7YS31s86Ao81jzGeNGwZaVl9gjIrah7TbKPnQFe9CJyF/f
4L58IwaNFi2ar1xSsfOc7fpVeCtWb6SKujh6Kqn7PXM1Sgxv9dRbPSAnWexn6PcLgcYBmii2eFKY
cdyCaMbtN8Ucj/HBmBky/OnhzLC2diODiaN1EaMWescBNU7QPsBvH0Y0xfJPsexT4yKak3E71hlH
D/QTGqHlR2gF5EhRMzXGhz5FV+4ZTi3J3qlvZiajtGirOeoyOOKtg3+BA/1yR6e33g+Eatuk3arO
tyZkWzQewDjkW6BDv6apqj25AjstXRq3nk4SbsehGnSj7JbQocVRuhJFqG4vXLor9+w+iYLJclm/
IZ3ZwvZIV4n32ISveJ8uXxZWlTFQv5Dr+YT2fEzW6GNFhoHSDKzUwPtoqVlXR8GHioXLhJ4NAlFN
TQVOkf0B+5g/honHq8xR793hAzZwObzMxuZIuSmPtq9sPBZUvyebdpupk0+BfGPdUuAIk0oWTdvS
SoB6kiYwxrYmTjx+ZhkK1jyIQa9XjgemZ0KK3pNMLBCDkIcjxLMY8QS1SDDYUvWTF68FGtNLEmKI
cJgr+gRQx1jmer2q7f9X9mTLbeS6/oprnu6pmsWW5SW3ah6obkrquDeTrcV+6fLYmkQ1sZ3yck5y
vv4CXLq5gEruwzgjAE2CK0AQACu8fiG7bFuURb3t1xmNduq8vamvK8o0s9zItqix4xx3mAHWN96z
MQ5CWRkcVh0UDuTBmvTzVo5jqYMxQ2Mxklf96lI7XDvmGvn8/kI9fq1C2vrG8cnVkFY0M+5Ndyky
60I4tME+uZ56Km54e10RuF/mbF3UWZH8El+2UnFPw6cWselZOwuh866rxDHsGVFFxbbFzT4duqde
JzlPMtJsyrAykRMN0o+Bp0oB7FkBgxOUpF4mC4tfdzh8cQ11m1UXB5uSsRzj/vquy5KcMFl9QMER
VGoGONfPleJqXbnIVmLG9/AjfIE5ZhOmpuAHuMR9EZrdwdiyNsmnYcg18LmrHHGwLZxOErse4u1D
hvE0bqW3WzNh+ivhXS9M6Ce6mIWp0Eaa9UWFt66JoED9/npbOI7AGiQ7omn2JRo69kf5KHVVOBzK
26YXLTEoVXd1KHoVBcmBaaV5+qhjeAtSZC9ND2WV15wBXnUrKrDL6m8NjBX5XUc6fvNhQLpQLCGn
6FLLuiAGISRqt7SHyPLyFFdfJWiz54AmM2MZrPuSkmYU0zvA5OizLl50EiPXM3deZNDLJ8fRIhWF
zNbxyoUFRex71skgsb4sHphqpDMpLdwDwnlfNOrVH2DsfDpzXRZI+TJ8yIpy1jhhXdgPFUIGWTY4
zFfLlWPlFhWDbfYUNzyxgbleecUMrxD5YIZPNrIAqJ1lLHAcSOVlo8CUJVMzrvx2HV6bkgmMXka1
bmhccHWANv7CdTRGKdjmWcCW3p2A0H2oGpZpVuXXEbP6PehKLmhu1QL2i1e8qNLHywAMo/BfLtSg
MTJIJynZPWEiqiMddtHefdq9qexTMspZor7GoIdFx2YlD8sdMXp/lD8kGAJ73Bn2I36cSa9KJZ7a
CvDa61+9OteJIvO2rJimZLc3tCTzSNGQ1S1Fs1pQwTTNXJM72zVoimlYGNgwzPjgC9QsjosQao5Y
FhoevZwaEoenD3DsyDZ9KvJGEcTs4/zVoMdAukQF6SeAdo/Pbzt8IyjWTAWvmo77bowjrM+8JzHt
rrVuVyAAvW+QJ/1u3fh+UFytZufr4+sngpMWFp7DBP4ENSeEuBV5CH0jicGeCCA7PCKUFackv0Mn
KycCTcOHKKGxpV6LhtHDtByYgMGeEWD3fnpQL4KNOYI0osmO/kd+f33bPR41T0fZ5/3Xfx29Ypjr
37Ag87CnUFluqz6HaVzUMnrS1Efb7cZeB8vnjHo4DN8OzFi9Zl7EiYEr3zQmV/Q75/rdwS1u1kU9
91TIATfykyyBc5/roJBqqIC8Uaeap9utXMLpZmscqgWoMTgGMwch66ZxUiYYTDth+hOnswzqIJcx
M6M68uFEybvC8V8fgHIu7CyavTzfPdw/PwZNik6LbbNJKaJQoMoPQaYdUFg4mchuFhxCYXxmZLNI
lhRP9bb9Y/6y273e34EouX5+Ka5TfF+viizreb0oEu6WecsYGqRq2YQ6p+HjR7Wp6va/V9sUD6g3
LdpsPTk8YdUwoVeuuwlE5Wp3XTgYf/tGTz9zaL6uFs7qNcC69dKdEcWo4rl6vPeo3L/tdOWz9/0X
DJIfdo84sLvouJsBAH+qFgHAvgPt5DT6+RrGDP/GkYXYZ4zm5csNkDHM1eSUfKvnggUuQwhXl2Lo
x0TtI1o0eL5VI8zfXRx0Nfhaubnlwjao1l2/332BeR6uPU8xxTRH11Ub6Kto82KYE8i5ANCCCCQq
6GNuOzVczihbn8KVpVI4/Q9AOFEakcW1eVAxyr4IpH1jYkIVyc0jRDtpI8ZlJSmZqnGDiHChm6yW
ctxOzSiQfe1vYuZcS0lwq8cthGN0c7Q7PRPcThyQ9NL3KjaGgyS+o4ZupYw+wxavJtR2/2X/FG4P
QxdQ2OGBjZ/SGUa2WvW8+VxwKrsN33aZChXQm8q3t/vnJ6OkOOqHo98iuUqHk7jEUPiKbU+mZxd0
pouR5vT0jL6ZHUkuLi4Tt7uGpu3q5JOFhkRPQLxYxxDjZCdgMokPF6fOJYSBy+rs7NixDhswZrYy
eYEiBEwE+HvqZoHBZ73FjSvhlXUqF6zyXsTVcD6j03sZ+QwicU5mZOxO+hJEZeeoNGjd51Xh5S8A
GILIKtQZadGm8nKt4VSDE4qOIkfTGdqxat71mVclYoo51f06FqSveRUeKyrnKJ2zS5COeS5048bV
a0xcos0SDdKWgHmVTZLdau2BZHobbUX2R0nBJsfQi8kvThV2nAAKeDKZ9l47dUEnirYPTvkuzjtC
k7F7XpAg/NCZONzvEJg+lCJWTT66bDMxl2WWZ6quxxjZZTMvzcZGpWnQwXKJUocou8cAiqqs354Z
F3B2C2CDvuoArT3dL5O3H063AcxYekOml8VsTZlhEVdUi7BPQSOk3D8ManLhc4eqZtcGY6UvM8tF
xEpxLc8nx1QGYMTqWC6/TVecVzN24wNVrrLTEJZhhCdoSV2EwGRNIVDKGDKmB/FQ6uTmt1Dpe0HW
W02qY5+Sc7LaUhsNYupuyzO/YrV55ZU213oYlXHs8iysPjBTOxgnhhKOVDz8EF0xUl+aLcmzUyuE
0TR8zkYfCheoLs3DmSbLyWXWltRtpkK3nImgnFbkQXVdEZCoy88Y1Jcho3gHF/aD2qQS/HQFz9zr
WgNbimiv6jZlVPCm7On8vYhdFxh/1xU+h/puz6ozhbhWb5AR2aDFtRoHV+7CTlBQuxRmaYL9P8i9
81Hd1jDyCzv+sKgz/K4takpiIRO0tcqKtFt2ElFZiWVmgqrEERlyegm6pmbWNtaJh/QQtp7lpbTF
jDJGXA8eANDMnNPpO1VabXEtO07fgiC67qqVe7egbll8tvVsh82kcIDWmAqcgAY3K2r/BgaT8CzQ
QNRmmK8joa7IDgsgjQbR9Bi4bll21c/cQG4dUpyNB+UAw7rlxYcIuJUnbgJQDVUGmOlZBA6km4HG
9hgPgb8yRsdWmTBomVP3pRoJ4+O44BuYEkWLTVzn1YR8o0cjSwar8Tr+yEiZ5HdVtmxhl2JiG3WJ
liKPBFDHxvVMzMJv8BY/ZmK45j7QUcMhPsmqomjzLC7fkRUHalDOeXg8aJc36tR7gDaRg8Qg1ZOF
YdMjJyoDDv2TNHiIYU7W4jgAkfB+Ua54ODzo1+NcnmqHHxuQf3p+HucbsEgVw29MndBBR/L9r1d1
yh23bcyjIWAnA/RYhwNUD1PD2chFI9hqOipdcedkd0TkMDcQ7X+nEnd4cgkHjtV9J1gtM47JpSj5
BFTmRtHhxyvEXCvhITFRgLGgn0yYcvgMufDRp7AJFtSBcCRl24Ui8ls44hSrSNCzmpXN4iCdapLX
i8asjMwsfYzOiWHr9hqhc1jgN/Rh17o3KY9XnBOkjmgKqqWiS3RCLSdq+HOR+y2bKc851rGwhxUi
YC3mPe7SwUuoESBgu7DNFp0fao8lkrDMaO3KJWLlugm5V8dtlT8i2b16wWxhsx/GNFGTucvH9RFU
Yy7/D1Whc3wc6MllgYIMRXy0cDGHBwikutFrIOhKLXL6tdhO0KkqvQIMoQAFyJRjlT7lBnF6caaM
NuUK9BjRR1xo0awnCYWI9g1tJIFyga1VVxUh4xZ/qbyk0/0Oh5N+clnDgVQWWdj1AzKc9RHVwQlQ
tacHxkahTe0uGP2doj0Aoau5jLYqAG9lupWINy8jBFA9L2XUf1pd6CUXOScPh0DTZLxsOkPjF62U
tXjUjEvHNcZsmrkeYnGOTQj4tZu6ZYT6k22Aq5z4dSv7Oa+6pl9TJSLNUqoBTpUgic+AfYwHNY0L
hgGjfbAJiR4TTF2NE5+OEQkHBNZgRs/Vr+2xz95ogsflHI+3j89kYWSMz4hHlGuiH/FDSZ4B2d20
nLRNAZE5gOStjtvy+TVINUXT6Fg8WFOjXigUIpo0NlQixgyq2GHUadj8ARlumjQVWyYnDZyvlNXh
5BQYhM4I984RPx3x/mLuiuX0+OLAJqStEVpvDjYibVT9MO3bycrHaHtxtIxZdX42JXeFjxeTE95v
iluXQWVPMse+pAYCqjTmi0wtDH2gMma5nldV0AYfTwjZwTiohCR9hvHpeEXapZVOq130tf+9e+3m
69zDJ+hM4Blxcs94WWVOB8MP5WpptfjdC+YfuMNskI/PT/u355fYFIPev3mVnYN+0RrHJsvQgc+d
04x/DahdP54eXp73D+7NFatz0RS533fWOcOQOx4HjDqw1mvv5lT9HKzsHlDZPQrHKDqCm6zpPCOo
uf7g85Wkl6L+1p5hOPpnUfesPlnjhnJpFLqT69q9WxZVcchpjXOpzpteM2twWqrNkYHwA3W/JnPm
GbCHXTZqXEhAsIsKdtRZpjK1IWBGVtrda9i4UvXqYtbzc9i0bB22S6zTke6XcLTrNb5+sWjdU7F+
JsqMjBvRPkH32qB/lbseWbYgZpc6hNRrofpVvyG0OXp7ubvfP32K15L0rzLgJwaadJizWpKWypEC
/SScawBEqNf3fJBsVgJOHJl2xSFxS9jsuxlnHYmdw8k5847UetPqluTKJBrr3Ci2C+poNJeOURh+
qPeCcr7u6yZ3+hwxFVMKv3lQzLmqHFDLFa06OyTwt8/mNCMjjUpPGtQhM3IhK9SMz4t54zek8Z0/
Ok565eGTRm3Jt8pwM76S/vXL7pv31ONAv+1Zvrj4MHHu4AxQnkyPneeEEerfeCNkCFqyTjREbYM0
gSXdemZ3WTR0ehNZFhV9x4wzRsD/1zzzHOtHKG604RxzcXRqxpjKMT7GyOsEUm2SDWY+OU1QEEGz
Hl7rjmSvZM0KKWlbdyM7chUF/hz6KZD9l92RlvXOZFjDESBnHaxTUF2Z8J49mSu/ZlcT4Ntu0rtq
rAH0W9Z1nq3eItpGFjCzMuqO2dJInq1E0d149Zz2/lW2AdEFRlS2SLrWaVz29CeYnSaZnYbO5Qp2
BVKpM8nNhx77OMs9swb+ju/oxxGoZhnLlp7pt4BRAow7DgMQSDMv7tUh16NE+WPo0r67v4e+8MFx
8xEatP6jeQ+kwNgtr6e3qiZy6BZzOenJIINZFzbXQjwuRyuixarOMOFxwWSIicUKDT4wYjd6yJKM
BI3VQCahl7sQisXyOYZP6ZdYRq2mKJPNnU/scIyyY2J69OAX8Sq0iMOLxlIdWDSKRHcnwZkO1yjq
j1xlgD7AIRq/BL6s42ertejylj7rjHg6WNDib2WXpwmKBrswId0TJwB6JfAthveEm4iG9TMdtkw+
mYPv+GDq76vClwbwGa8zcdOm+k+qSdTdBB9p4AEfn5FmtipAT4A5Xixq1q0EaUeby+jVoBBQaEDw
RNachXQWYt5S6lsuqkKNvLPTXK8aZWIdT7X4PKcG9xsm6iLheqkp0u2+nlddv6aTuGgcdW+gSvV8
6diqa+Zy6m2PGhYuBOiP1NbWwBCU7CZA68Pq3f3nnSOPa45TaIwfG8YlkAIGEL3WgkCcZO47IwNs
oB5jDXX1mpX8NzjN/JGvc6UrRKpCIZsPaPr3JEVTFty78bgFMnKTWuXz3piKbeV0hfo9rEb+MWfd
H3yLf+uOZmmudkRHO5XwnScp1iEJ/rYBZhmcD1q24H9OTy8ofNHgo0741tAv+9fny8uzD7+d/OIM
uUO66uZU/jYkGdUAP2fHPLWd150Vd6O86KzgSdGLjXOSBMApUcIpbKDbfqt24EQ5p+GON+qUh0ZE
W39ed+8Pz0d/eyPlrOwmo9urw8+WRZkL7vhDXHFRuyMX2F26qvVXoAIc1OE0hZWSdjWLbGkXnITj
34J35cytKA3q1eQZZx+v5nmfCe75z6vyl0z2i2KBt1JZ8JX+J9DAYL2umQjWC9G/zlkAH1NSq/wG
DqAVOb6la7YqpZ289OxGArtAelggtKXKJbr4KaILKlGTR3J55iVrCnD0zVdA9BN1XHirw8ORaf0C
EucxlwAzSTN/Tnu2B0S0jhMQ/biF5+f+aDuYDwnmP5yepzDuq6vBN5PUN9MPKQ7ctJuIAaGBE7C/
TPbdyYRMABjSBMOi3gYMy7SVUS68Ln5C83iaKi89bpaCDn5wKagcCC7+guYp6OihhUleT6j0SR7B
mV/kVVNc9sKvXcFWPp169K+pWO2TIjjj+PY2BYcT2ko0BEY0cIpkdVxFdiOK0nMetJgF4xrutVth
BOfk8+IGXwCDrM6pT4t6Rabp8FpMMgqa9hW+OOa1DbWFEQL6QeZZKg2grxtRsbK4ZXgqcCP5rUbW
9JtrV0Z7Nh4db7y7f3/Zv313XhYdxKsbPIe/4Kx6veJo3PR1TdDcJRzlYZSQDPOX+gcffXDhuSqE
6CQA9/kSTkRcqJb4j7WZQyc+eSmVT5lKIECZriPTg4V4WoItDzTpTSOuCEzLOucFOPXyGqh5Oa+h
CXiqyZoWTi0lHNMwp47LbERGqXygR+CxR9u/vaaiSSRT31YwvDqYmzaFWlbLhuVtQZ0IB5IbVjGy
QyWbo6NdeAUWV5Fd5c2m7ksymG+kg6VhknR5RszItGIPjkYzHgeYOasVKvvzly93Tw+Y7ORX/PPw
/J+nX7/fPd7Br7uHr/unX1/v/t5BgfuHX/dPb7tPOI1//evr37/omX21e3nafTn6fPfysHvC+4Jx
hpvw1Mfnl+9H+6f92/7uy/6/d4h1HmPJlFKGZ7keVa0ClXSYGR1onY5yRlHdctH4vQBAdCm8ghVL
vvvlUMC8cqqhykAKrCJVDrrl4eQcejh8+UfTzGG3c0hIO3Gijyw63cVDaGK4vVhOt43QhhD3IIrb
RGPvKLKX71/fno/un192R88vR593X77uXpzxUcTQ0oWXX8UDT2I4ZzkJjEnlVVa0Sy/xj4+IP4Gp
sCSBManwnrkcYATHydpYisGrto2pr9o2LgHNbTEpiCrQluJyDdzPu+ihMJ5HJZeJLKSpD/i2w4Rs
CYOqIV7MTyaX1aqMOKpXJQ2MG9WqfyOw+icP5yAu6CXIrYjcyFd9nH3/68v+/rd/dt+P7tVc/fRy
9/Xz92iKCsmicvIl0Yk8y5eH+gzwMvHImiUQP6CQFWXWsn2xEms+OdPvvGm3ife3z7unt/393dvu
4Yg/qXbCOj76z/7t8xF7fX2+3ytUfvd2FzU8y7zLZzuYGfkKmvlkCaoFmxy3TXlzcnp8Fg8MXxQS
ZgPRfZJf++mx4+5ZMtj9PBqdR0Nl1Hp8fnAtbZajWTwLsvkshnUiYjbrJNEBPKNvkA26FJtD6GZ+
8OsW+D2E3x5aZ6CImXdhghW1TI9HDlptt6IGGs34cV8v714/p7oa9OGogiUF3OKoxDWugTaqMN9/
2r2+xZWJ7HRCDC2CI+h2q7b2kI1Zya74ZJaAR5INC+9OjvNiHlWwIEVHsterfBrvzvlZDCtgyit3
7rgPRZWfeFm6zSpaetnbB+Dk7JzocUCcpZ5UGyjIl6/sfnQaV9aBZjJrYvm4aaEuuzVl+6+fPbeF
YYOQxN4A0CATQ0gBysgGH3o+sDcxfM65iDfzTDl82CcWY1w8Lgg9j4UCj6fMPCG2zD4Z0cPZodUx
BmFHT4nhgxNQ2Gbduc+PX192r6++Rmy5nJdowAxrLm8bouMvpwcETnk7JT4B6JJyTTJovMOzIljA
AeH58ah+f/xr96LT1lk1PpoBtSz6rBWJ+yLbODFDO21N5kfWJB8LVM45OoC2N4Gy+mX/18sdKMwv
z+9v+ydiiyuLmZmhMdzsGjZ86RANidNzYvg8Gp+BhEYNwv8gA46OQKGpKYxwu5OBMlTc8j9PDpEc
akByRxxbd0B5QKJhKyNQ5BpZboi5wORNVXG0RCjrBfqMuzPZQberWWmo5GqGhPFq2728YaoW0KRe
1Xtd+Ez63ds7HHzuP+/u/4GTlTuhtQG/7wQGp+TW5EIf4jUpzJrsqixkRxPb67afYMO2f1bUTNzo
29i5XQRlcvYLVuTnfes4SFlIPwM1G2S8a4jBYNvCPR/NChAJmGPWMTrZID+QFnXW3sBxVkVBuMcW
l6TktcU6rlMiL2htCRpWcThJVLMgR/HAPhqqWBlX1mZF6BUlu6pFf8Mic691RAYKMuwl7lTMTs59
ilhdyPqiW/XeBh9oLPBztAU+BnCYi3x2E6jPDibx6ocmYWITvI4dUMwK2n0CsGQ+foAHSy67IMhg
ccbqWub4IRr9zHHArfOmcvthQN3iSi/qQIbd6s0rgIJIGzxSHNPULQpBCj4lqackNYoxglyBKfrt
LYLdcdOQfntJv89m0Mpdv6XkqSEo2PmUKJYJ6pg2IrslLI6QPRWHlUXQWfYxgvmjMrYYOqxiCcSU
hBuFIFiHrn122JUx6Ris3DVmvxXMsRSjEa9oPHdrDcJb395/YQBfP3FZrDHVI6atxciQIDkagoHV
kgn0kV5y4elmiM186yyCWi5g51Go+DSz+/vu/cvb0f0zHMs/vT+/vx49aiPd3cvuDrbs/+7+19E6
MOEuCFwsEm9R8GL55NhZbxYv8ZAwu+lIpx+Pyinpe6qgoqZ3AY+IdKdCElYWi7rCjrp0O4ph5N/g
n0Ihekl5P9iRIQSNXJR6njjTp2xm/i9iLx3mWNfAyercPYuVt5izybmCEdeotDiComoL7+0f+DHP
nUmxyuREZUl2JeC8qbvB6+fRg15+c4WGAqE5Grj2vKElBhqUhQ9pm8b1ZVKeDmhj3rDS7SYE5bxt
ugCmbJs9SFGQq5PjAQVSwFsxLQbVegn2mtlHtqC1kEiJCDu9aAT3ircIpVvLZZkXp0mkSCLLQ8hV
VrW5a052kSDZVSiPVHNpw4fTyWAetyqcgn592T+9/XMEJ5ejh8fdq3sv4Xu56QcESH8Yhc2YyTvi
XiBlVyqeQnnz5X1BJcvJdKxGXzaLErSqcnDzuEhSXK/Qi2s6TGHYdvE+PSphoJg1TWf5zHnJPL/E
/KZmmLsz5a/k4VXyOGfe3VSzBhVqLgRQeZuQpof/QFWcNWHslJlfye4fDr77L7vf3vaPRut9VaT3
Gv4SX5POBXChXBFhZ51Mx/Uhihbf/kCOPYvEkmP6IMyvA8NFPm4rtZssuuxUrIM1iaX3TV3exK2d
NyqIZlXrT9Te2Z9PqcBJtbw3DPYHzXPbqBgD1/fNhbt1rauyqDGyg0y26nKy4ewKZQQctXUedHu4
+NmO9RLimxWU7/56//QJL5iKp9e3l/fH3dObt14qttAvKwgqpaXhTxK9Z9ZsHwxETIYXG4qywniL
A5WYAvGiz9UZlMoB/X+1cNO++vD+ejvHCNwrz2ESManRRF1kNZPMeKajbGWurFE4RzplzhczzEku
E0ilHo0kAzPup2SHGW6WxZzqJI3Ni3V0R6oxq1pwPMPPSmrf0zQgO1TIDNoRCM4aakVpJAetKuib
RL+huDedN76omSH9Vdas+5lornjtTu+fmrD+VEH3RfexPg1FNz0rP8zt61DYuOkobya+7XhtPOW9
MhAbqDUBArpCXdPZffu7V3Czqd1jtILBpiCbOvBKH0vFMIZDk1RTbrYhRy5kOEF3+crLnqB+Wzkw
ykgNJt6eCPjTE4ZSbI3WWLJwSZoRArFewn4WMv0jODp6KtVKT9KT8+Pj45CpgRanWpK1gWq4p5/P
k7UqJwSZsWg+aF1tJT23UpktMUO9QvE6HwKD6JFbV86TI0FT1tRBkfgsUXIhuhWL1kECrHPmKh8G
YiJqsYNSijzG6A3uiuE6jm2cGosuQfgAc92MO0Oem6N46BcxrsyQFdgAfVFkDm9Af9Q8f3399ah8
vv/n/asWgsu7p0+v7upW7wHBVte0bkoCF4yBeSvHkKqRqDA2q+7PQRdHD4sVLpIOloB7FpbNvIuR
QytQfwO1nVUuoaqDCntKEhsuvdmPlfVLzGvRMUkn+dxcg54Cik/eUOqh2px1La738+HO1c5uoHg8
vKO24e6po7MKgQ4HFnv4ivM2MKJq+yfeIo9b//+8ft0/4c0yMPT4/rb7toP/2b3d//777/9ycvBj
MJAqe4HzLorsaEWzJkOCNEKwjS6ihl5JmYHNi4YsvdGgkWPV8a17NWFmcvT2olmJNPlmozGwqzYb
35HO1LSRvIo+UxwGMks5nvE2AqCVUf55chaC1e2+NNjzEKt3OnM4UiQfDpGok62mm0YVFSJblUzA
sYivbGmTuEGa+WACaZsBdA9MogNCywy4Mm5YAwQt5FTXwfLFkK2UNBlHxX3taZAE8+T347H8/zG3
h4WqehI2wnnJFtGQx/Dx+Oqypw4/6PO2qiXnOQgtbd1NC00t8K0WpfeFf7Ri9nD3dneEGtk93ms4
e67p9cI3SiqpQgEloQepcLaCvi9QeghovqxjqMiIlQrkc0XKQTb9yjMB3VB3BSuHJ31gQpJ6ot4j
Mvd1PGekHYN5tkLVwXhuOdc0AE9/gbGrqa9QEKsD7iCUJidjj6lycaTJKY1Yfk0ENI3PLHntDbag
a3MWFfYUakU8sLQEUVVqnajjNo+PY8ttWs2XIyqVRoiZMVVjEKlOyG6okZromb9NogEPxn0+d8vi
a/SSRnrPvId8gDrfy02B5/2Qg1ZwXsGMEdfp+r3yDMCRJmNQWrrbJcMkouQrN8rn2li6HONmE2HU
bHzZv97/25uPrj2s272+4R6Cwjl7/vfu5e7TznE7x2g459SlguOMku8di4eoObItGs23qkmpbVET
qWH1g/DtUkYrUyPGyGUvD1NFk5FRfl78s2NwYUVpjh9O1GBR6jOVkodk64ICSXdzv8CKXXHrv09y
CDQwnHatfk/XZQ0dh457eEqOVGtQqPHwrBeL+/ymoR7HDsnMCRVveZjAsycZOYCUaEgTK7ww8A/x
GglrhgmuLx7+PP42PfYOY2JVY5PV+OOCSbh+qIZhAC9M8lB8GhC5TR2a8YNsRvmmIp+h/rzJVEtk
LAFnhZ5m8lBN1tb8f/FTpBZ6mgEA
--===============3174216941368686678==--

