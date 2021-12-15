Content-Type: multipart/mixed; boundary="===============4817233832466327900=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c:342:3: warning: Value stored to 'src_buf' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 15 Dec 2021 08:21:00 +0800
Message-ID: <202112150808.bMnC6chn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4817233832466327900==
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
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: fd00d90330d1d2a962d010fc93515e2d77739ad8 media: mtk-vcodec: vdec: m=
ove stateful ops into their own file
date:   3 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20211213 (https://download.01.org/0day-ci/arc=
hive/20211215/202112150808.bMnC6chn-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                   ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:837:19: note: Calling 'devm_kcalloc'
           adc->iio_chans =3D devm_kcalloc(adc->dev, adc->nchans,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:215:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:218:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:837:19: note: Returning from 'devm_k=
calloc'
           adc->iio_chans =3D devm_kcalloc(adc->dev, adc->nchans,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:839:6: note: Assuming field 'iio_cha=
ns' is non-null
           if (!adc->iio_chans)
               ^~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:839:2: note: Taking false branch
           if (!adc->iio_chans)
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:842:15: note: Calling 'devm_kcalloc'
           adc->chans =3D devm_kcalloc(adc->dev, adc->nchans,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:215:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:218:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:842:15: note: Returning from 'devm_k=
calloc'
           adc->chans =3D devm_kcalloc(adc->dev, adc->nchans,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:844:6: note: Assuming field 'chans' =
is non-null
           if (!adc->chans)
               ^~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:844:2: note: Taking false branch
           if (!adc->chans)
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:848:39: note: Assuming 'child' is no=
t equal to null
           for_each_available_child_of_node(np, child) {
                                                ^
   include/linux/of.h:1304:58: note: expanded from macro 'for_each_availabl=
e_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
                                                                   ^~~~~~~~=
~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:848:2: note: Loop condition is true.=
  Entering loop body
           for_each_available_child_of_node(np, child) {
           ^
   include/linux/of.h:1304:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:851:8: note: Passing value via 3rd p=
arameter 'hw_channels'
                                                    adc->variant->channels,
                                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:850:9: note: Calling 'pm8xxx_xoadc_p=
arse_channel'
                   ret =3D pm8xxx_xoadc_parse_channel(adc->dev, child,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:746:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:746:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:751:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:751:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:758:2: note: Value assigned to 'hwch=
an'
           hwchan =3D &hw_channels[0];
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:759:9: note: Assuming 'hwchan' is nu=
ll
           while (hwchan && hwchan->datasheet_name) {
                  ^~~~~~
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:759:16: note: Left side of '&&' is f=
alse
           while (hwchan && hwchan->datasheet_name) {
                         ^
   drivers/iio/adc/qcom-pm8xxx-xoadc.c:767:7: note: Access to field 'datash=
eet_name' results in a dereference of a null pointer (loaded from variable =
'hwchan')
           if (!hwchan->datasheet_name) {
                ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/imu/fxos8700_core.c:167:8: warning: Excessive padding in 'st=
ruct fxos8700_data' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   buf, =

   regmap, =

   trig, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct fxos8700_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/imu/fxos8700_core.c:167:8: note: Excessive padding in 'struc=
t fxos8700_data' (106 padding bytes, where 42 is optimal). Optimal fields o=
rder: buf, regmap, trig, consider reordering the fields or adding explicit =
padding members
   struct fxos8700_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/light/adux1020.c:384:9: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                           *val =3D buf[0];
                                ^ ~~~~~~
   drivers/iio/light/adux1020.c:372:2: note: Control jumps to 'case IIO_CHA=
N_INFO_RAW:'  at line 373
           switch (mask) {
           ^
   drivers/iio/light/adux1020.c:374:3: note: Control jumps to 'case IIO_PRO=
XIMITY:'  at line 375
                   switch (chan->type) {
                   ^
   drivers/iio/light/adux1020.c:377:8: note: 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~
   drivers/iio/light/adux1020.c:377:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:380:10: note: Calling 'adux1020_measure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:320:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:320:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:327:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:327:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:330:2: note: Loop condition is true.  Enter=
ing loop body
           while (tries--) {
           ^
   drivers/iio/light/adux1020.c:333:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/iio/light/adux1020.c:333:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/adux1020.c:337:7: note: Assuming 'status' is >=3D fiel=
d 'bytes'
                   if (status >=3D adux1020_modes[mode].bytes)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:337:3: note: Taking true branch
                   if (status >=3D adux1020_modes[mode].bytes)
                   ^
   drivers/iio/light/adux1020.c:338:4: note:  Execution continues on line 3=
42
                           break;
                           ^
   drivers/iio/light/adux1020.c:342:6: note: 'tries' is >=3D 0
           if (tries < 0)
               ^~~~~

vim +/src_buf +342 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_statefu=
l.c

fd00d90330d1d2a Yunfei Dong 2021-08-06  292  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  293  static void mtk_vdec_worker(st=
ruct work_struct *work)
fd00d90330d1d2a Yunfei Dong 2021-08-06  294  {
fd00d90330d1d2a Yunfei Dong 2021-08-06  295  	struct mtk_vcodec_ctx *ctx =
=3D
fd00d90330d1d2a Yunfei Dong 2021-08-06  296  		container_of(work, struct mt=
k_vcodec_ctx, decode_work);
fd00d90330d1d2a Yunfei Dong 2021-08-06  297  	struct mtk_vcodec_dev *dev =
=3D ctx->dev;
fd00d90330d1d2a Yunfei Dong 2021-08-06  298  	struct vb2_v4l2_buffer *src_b=
uf, *dst_buf;
fd00d90330d1d2a Yunfei Dong 2021-08-06  299  	struct mtk_vcodec_mem buf;
fd00d90330d1d2a Yunfei Dong 2021-08-06  300  	struct vdec_fb *pfb;
fd00d90330d1d2a Yunfei Dong 2021-08-06  301  	bool res_chg =3D false;
fd00d90330d1d2a Yunfei Dong 2021-08-06  302  	int ret;
fd00d90330d1d2a Yunfei Dong 2021-08-06  303  	struct mtk_video_dec_buf *dst=
_buf_info, *src_buf_info;
fd00d90330d1d2a Yunfei Dong 2021-08-06  304  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  305  	src_buf =3D v4l2_m2m_next_src=
_buf(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  306  	if (!src_buf) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  307  		v4l2_m2m_job_finish(dev->m2m=
_dev_dec, ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  308  		mtk_v4l2_debug(1, "[%d] src_=
buf empty!!", ctx->id);
fd00d90330d1d2a Yunfei Dong 2021-08-06  309  		return;
fd00d90330d1d2a Yunfei Dong 2021-08-06  310  	}
fd00d90330d1d2a Yunfei Dong 2021-08-06  311  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  312  	dst_buf =3D v4l2_m2m_next_dst=
_buf(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  313  	if (!dst_buf) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  314  		v4l2_m2m_job_finish(dev->m2m=
_dev_dec, ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  315  		mtk_v4l2_debug(1, "[%d] dst_=
buf empty!!", ctx->id);
fd00d90330d1d2a Yunfei Dong 2021-08-06  316  		return;
fd00d90330d1d2a Yunfei Dong 2021-08-06  317  	}
fd00d90330d1d2a Yunfei Dong 2021-08-06  318  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  319  	dst_buf_info =3D
fd00d90330d1d2a Yunfei Dong 2021-08-06  320  		container_of(dst_buf, struct=
 mtk_video_dec_buf, m2m_buf.vb);
fd00d90330d1d2a Yunfei Dong 2021-08-06  321  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  322  	pfb =3D &dst_buf_info->frame_=
buffer;
fd00d90330d1d2a Yunfei Dong 2021-08-06  323  	pfb->base_y.va =3D vb2_plane_=
vaddr(&dst_buf->vb2_buf, 0);
fd00d90330d1d2a Yunfei Dong 2021-08-06  324  	pfb->base_y.dma_addr =3D
fd00d90330d1d2a Yunfei Dong 2021-08-06  325  		vb2_dma_contig_plane_dma_add=
r(&dst_buf->vb2_buf, 0);
fd00d90330d1d2a Yunfei Dong 2021-08-06  326  	pfb->base_y.size =3D ctx->pic=
info.fb_sz[0];
fd00d90330d1d2a Yunfei Dong 2021-08-06  327  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  328  	pfb->base_c.va =3D vb2_plane_=
vaddr(&dst_buf->vb2_buf, 1);
fd00d90330d1d2a Yunfei Dong 2021-08-06  329  	pfb->base_c.dma_addr =3D
fd00d90330d1d2a Yunfei Dong 2021-08-06  330  		vb2_dma_contig_plane_dma_add=
r(&dst_buf->vb2_buf, 1);
fd00d90330d1d2a Yunfei Dong 2021-08-06  331  	pfb->base_c.size =3D ctx->pic=
info.fb_sz[1];
fd00d90330d1d2a Yunfei Dong 2021-08-06  332  	pfb->status =3D 0;
fd00d90330d1d2a Yunfei Dong 2021-08-06  333  	mtk_v4l2_debug(3, "=3D=3D=3D>=
[%d] vdec_if_decode() =3D=3D=3D>", ctx->id);
fd00d90330d1d2a Yunfei Dong 2021-08-06  334  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  335  	mtk_v4l2_debug(3,
fd00d90330d1d2a Yunfei Dong 2021-08-06  336  		       "id=3D%d Framebuf  pf=
b=3D%p VA=3D%p Y_DMA=3D%pad C_DMA=3D%pad Size=3D%zx",
fd00d90330d1d2a Yunfei Dong 2021-08-06  337  		       dst_buf->vb2_buf.inde=
x, pfb, pfb->base_y.va,
fd00d90330d1d2a Yunfei Dong 2021-08-06  338  		       &pfb->base_y.dma_addr=
, &pfb->base_c.dma_addr, pfb->base_y.size);
fd00d90330d1d2a Yunfei Dong 2021-08-06  339  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  340  	if (src_buf =3D=3D &ctx->empt=
y_flush_buf.vb) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  341  		mtk_v4l2_debug(1, "Got empty=
 flush input buffer.");
fd00d90330d1d2a Yunfei Dong 2021-08-06 @342  		src_buf =3D v4l2_m2m_src_buf=
_remove(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  343  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  344  		/* update dst buf status */
fd00d90330d1d2a Yunfei Dong 2021-08-06  345  		dst_buf =3D v4l2_m2m_dst_buf=
_remove(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  346  		mutex_lock(&ctx->lock);
fd00d90330d1d2a Yunfei Dong 2021-08-06  347  		dst_buf_info->used =3D false;
fd00d90330d1d2a Yunfei Dong 2021-08-06  348  		mutex_unlock(&ctx->lock);
fd00d90330d1d2a Yunfei Dong 2021-08-06  349  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  350  		vdec_if_decode(ctx, NULL, NU=
LL, &res_chg);
fd00d90330d1d2a Yunfei Dong 2021-08-06  351  		clean_display_buffer(ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  352  		vb2_set_plane_payload(&dst_b=
uf->vb2_buf, 0, 0);
fd00d90330d1d2a Yunfei Dong 2021-08-06  353  		if (ctx->q_data[MTK_Q_DATA_D=
ST].fmt->num_planes =3D=3D 2)
fd00d90330d1d2a Yunfei Dong 2021-08-06  354  			vb2_set_plane_payload(&dst_=
buf->vb2_buf, 1, 0);
fd00d90330d1d2a Yunfei Dong 2021-08-06  355  		dst_buf->flags |=3D V4L2_BUF=
_FLAG_LAST;
fd00d90330d1d2a Yunfei Dong 2021-08-06  356  		v4l2_m2m_buf_done(dst_buf, V=
B2_BUF_STATE_DONE);
fd00d90330d1d2a Yunfei Dong 2021-08-06  357  		clean_free_buffer(ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  358  		v4l2_m2m_job_finish(dev->m2m=
_dev_dec, ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  359  		return;
fd00d90330d1d2a Yunfei Dong 2021-08-06  360  	}
fd00d90330d1d2a Yunfei Dong 2021-08-06  361  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  362  	src_buf_info =3D
fd00d90330d1d2a Yunfei Dong 2021-08-06  363  		container_of(src_buf, struct=
 mtk_video_dec_buf, m2m_buf.vb);
fd00d90330d1d2a Yunfei Dong 2021-08-06  364  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  365  	buf.va =3D vb2_plane_vaddr(&s=
rc_buf->vb2_buf, 0);
fd00d90330d1d2a Yunfei Dong 2021-08-06  366  	buf.dma_addr =3D vb2_dma_cont=
ig_plane_dma_addr(&src_buf->vb2_buf, 0);
fd00d90330d1d2a Yunfei Dong 2021-08-06  367  	buf.size =3D (size_t)src_buf-=
>vb2_buf.planes[0].bytesused;
fd00d90330d1d2a Yunfei Dong 2021-08-06  368  	if (!buf.va) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  369  		v4l2_m2m_job_finish(dev->m2m=
_dev_dec, ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  370  		mtk_v4l2_err("[%d] id=3D%d s=
rc_addr is NULL!!", ctx->id,
fd00d90330d1d2a Yunfei Dong 2021-08-06  371  			     src_buf->vb2_buf.index=
);
fd00d90330d1d2a Yunfei Dong 2021-08-06  372  		return;
fd00d90330d1d2a Yunfei Dong 2021-08-06  373  	}
fd00d90330d1d2a Yunfei Dong 2021-08-06  374  	mtk_v4l2_debug(3, "[%d] Bitst=
ream VA=3D%p DMA=3D%pad Size=3D%zx vb=3D%p",
fd00d90330d1d2a Yunfei Dong 2021-08-06  375  		       ctx->id, buf.va, &buf=
.dma_addr, buf.size, src_buf);
fd00d90330d1d2a Yunfei Dong 2021-08-06  376  	dst_buf->vb2_buf.timestamp =
=3D src_buf->vb2_buf.timestamp;
fd00d90330d1d2a Yunfei Dong 2021-08-06  377  	dst_buf->timecode =3D src_buf=
->timecode;
fd00d90330d1d2a Yunfei Dong 2021-08-06  378  	mutex_lock(&ctx->lock);
fd00d90330d1d2a Yunfei Dong 2021-08-06  379  	dst_buf_info->used =3D true;
fd00d90330d1d2a Yunfei Dong 2021-08-06  380  	mutex_unlock(&ctx->lock);
fd00d90330d1d2a Yunfei Dong 2021-08-06  381  	src_buf_info->used =3D true;
fd00d90330d1d2a Yunfei Dong 2021-08-06  382  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  383  	ret =3D vdec_if_decode(ctx, &=
buf, pfb, &res_chg);
fd00d90330d1d2a Yunfei Dong 2021-08-06  384  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  385  	if (ret) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  386  		mtk_v4l2_err(" <=3D=3D=3D[%d=
], src_buf[%d] sz=3D0x%zx pts=3D%llu dst_buf[%d] vdec_if_decode() ret=3D%d =
res_chg=3D%d=3D=3D=3D>",
fd00d90330d1d2a Yunfei Dong 2021-08-06  387  			     ctx->id, src_buf->vb2_=
buf.index, buf.size,
fd00d90330d1d2a Yunfei Dong 2021-08-06  388  			     src_buf->vb2_buf.times=
tamp, dst_buf->vb2_buf.index, ret, res_chg);
fd00d90330d1d2a Yunfei Dong 2021-08-06  389  		src_buf =3D v4l2_m2m_src_buf=
_remove(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  390  		if (ret =3D=3D -EIO) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  391  			mutex_lock(&ctx->lock);
fd00d90330d1d2a Yunfei Dong 2021-08-06  392  			src_buf_info->error =3D tru=
e;
fd00d90330d1d2a Yunfei Dong 2021-08-06  393  			mutex_unlock(&ctx->lock);
fd00d90330d1d2a Yunfei Dong 2021-08-06  394  		}
fd00d90330d1d2a Yunfei Dong 2021-08-06  395  		v4l2_m2m_buf_done(src_buf, V=
B2_BUF_STATE_ERROR);
fd00d90330d1d2a Yunfei Dong 2021-08-06  396  	} else if (!res_chg) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  397  		/*
fd00d90330d1d2a Yunfei Dong 2021-08-06  398  		 * we only return src buffer=
 with VB2_BUF_STATE_DONE
fd00d90330d1d2a Yunfei Dong 2021-08-06  399  		 * when decode success witho=
ut resolution change
fd00d90330d1d2a Yunfei Dong 2021-08-06  400  		 */
fd00d90330d1d2a Yunfei Dong 2021-08-06  401  		src_buf =3D v4l2_m2m_src_buf=
_remove(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  402  		v4l2_m2m_buf_done(src_buf, V=
B2_BUF_STATE_DONE);
fd00d90330d1d2a Yunfei Dong 2021-08-06  403  	}
fd00d90330d1d2a Yunfei Dong 2021-08-06  404  =

fd00d90330d1d2a Yunfei Dong 2021-08-06 @405  	dst_buf =3D v4l2_m2m_dst_buf_=
remove(ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  406  	clean_display_buffer(ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  407  	clean_free_buffer(ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  408  =

fd00d90330d1d2a Yunfei Dong 2021-08-06  409  	if (!ret && res_chg) {
fd00d90330d1d2a Yunfei Dong 2021-08-06  410  		mtk_vdec_pic_info_update(ctx=
);
fd00d90330d1d2a Yunfei Dong 2021-08-06  411  		/*
fd00d90330d1d2a Yunfei Dong 2021-08-06  412  		 * On encountering a resolut=
ion change in the stream.
fd00d90330d1d2a Yunfei Dong 2021-08-06  413  		 * The driver must first pro=
cess and decode all
fd00d90330d1d2a Yunfei Dong 2021-08-06  414  		 * remaining buffers from be=
fore the resolution change
fd00d90330d1d2a Yunfei Dong 2021-08-06  415  		 * point, so call flush deco=
de here
fd00d90330d1d2a Yunfei Dong 2021-08-06  416  		 */
fd00d90330d1d2a Yunfei Dong 2021-08-06  417  		mtk_vdec_flush_decoder(ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  418  		/*
fd00d90330d1d2a Yunfei Dong 2021-08-06  419  		 * After all buffers contain=
ing decoded frames from
fd00d90330d1d2a Yunfei Dong 2021-08-06  420  		 * before the resolution cha=
nge point ready to be
fd00d90330d1d2a Yunfei Dong 2021-08-06  421  		 * dequeued on the CAPTURE q=
ueue, the driver sends a
fd00d90330d1d2a Yunfei Dong 2021-08-06  422  		 * V4L2_EVENT_SOURCE_CHANGE =
event for source change
fd00d90330d1d2a Yunfei Dong 2021-08-06  423  		 * type V4L2_EVENT_SRC_CH_RE=
SOLUTION
fd00d90330d1d2a Yunfei Dong 2021-08-06  424  		 */
fd00d90330d1d2a Yunfei Dong 2021-08-06  425  		mtk_vdec_queue_res_chg_event=
(ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  426  	}
fd00d90330d1d2a Yunfei Dong 2021-08-06  427  	v4l2_m2m_job_finish(dev->m2m_=
dev_dec, ctx->m2m_ctx);
fd00d90330d1d2a Yunfei Dong 2021-08-06  428  }
fd00d90330d1d2a Yunfei Dong 2021-08-06  429  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4817233832466327900==--

