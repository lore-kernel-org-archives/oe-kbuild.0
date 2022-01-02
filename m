Content-Type: multipart/mixed; boundary="===============0339787500777765993=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 02 Jan 2022 10:00:50 +0800
Message-ID: <202201021017.mFSR8hf6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0339787500777765993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mirela Rabulea <mirela.rabulea@nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 =
driver for i.MX8 JPEG Encoder/Decoder
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20211213 (https://download.01.org/0day-ci/arc=
hive/20220102/202201021017.mFSR8hf6-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2db16c6ed72ce644d5639b3ed15e5817442db4ba
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2db16c6ed72ce644d5639b3ed15e5817442db4ba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:6: note: Left side of '||=
' is false
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:18: note: Assuming 'dst_b=
uf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:907:2: note: Taking false bra=
nch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:913:7: note: 'q_data_cap' is =
non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:913:2: note: Taking false bra=
nch
           if (!q_data_cap)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:916:7: note: 'q_data_out' is =
non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:916:2: note: Taking false bra=
nch
           if (!q_data_out)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:924:6: note: Assuming field '=
jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:924:2: note: Taking false bra=
nch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:945:11: note: Field 'slot' is=
 < MXC_MAX_SLOTS
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:945:2: note: Taking false bra=
nch
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:949:2: note: Taking false bra=
nch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:6: note: Assuming field '=
mode' is equal to MXC_JPEG_ENCODE
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:957:2: note: Taking true bran=
ch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: Taking false bra=
nch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:161:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:147:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:128:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:958:3: note: Loop condition i=
s false.  Exiting loop
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:161:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:147:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:126:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:960:3: note: Calling 'mxc_jpe=
g_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Calling 'mxc_jp=
eg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:387:2: note: Control jumps to=
 the 'default' case at line 400
           switch (fourcc) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:401:3: note: Returning the va=
lue -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:12: note: Returning from =
'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:876:2: note: The value -1 is =
assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:6: note: 'img_fmt' is equ=
al to MXC_JPEG_INVALID
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
               ^~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:877:2: note: Taking true bran=
ch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:880:5: note: The result of th=
e left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded from=
 macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: warning: Branch condi=
tion evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!q->sizeimage[0])
                       ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:6: note: Left side of '|=
|' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:14: note: Assuming 'q_ty=
pe' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:2: note: Taking false br=
anch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1668:9: note: Calling 'mxc_jp=
eg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:11: note: Assuming field=
 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:10: note: '?' condition =
is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:11: note: Assuming field=
 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:10: note: '?' condition =
is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is false. Execution continues on line 1584
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Calling 'mxc_jp=
eg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:6: note: Assuming the co=
ndition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Returning from =
'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1585:2: note: Calling 'mxc_jp=
eg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: note: Branch conditio=
n evaluates to a garbage value
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:1591:22: warning: Assigned va=
lue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pfmt->bytesperline =3D tmp_q.bytesperline[i];
                                      ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1752:8: note: Calling 'mxc_jp=
eg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:16: note: Assuming field=
 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1649:15: note: '?' condition =
is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Left side of '|=
|' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:7: note: Assuming field =
'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1652:2: note: Taking false br=
anch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:7: note: 'fmt' is non-nu=
ll
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:6: note: Left side of '|=
|' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:14: note: Assuming 'q_ty=
pe' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1658:2: note: Taking false br=
anch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1668:9: note: Calling 'mxc_jp=
eg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:11: note: Assuming field=
 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1544:10: note: '?' condition =
is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:11: note: Assuming field=
 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1546:10: note: '?' condition =
is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s < field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is true.  Entering loop body
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:14: note: Assuming 'i' i=
s >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1577:2: note: Loop condition =
is false. Execution continues on line 1584
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Calling 'mxc_jp=
eg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:6: note: Assuming the co=
ndition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1153:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1584:2: note: Returning from =
'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1585:2: note: Calling 'mxc_jp=
eg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1175:2: note: Taking true bra=
nch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:7: note: Assuming the co=
ndition is false
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1177:3: note: Taking false br=
anch
                   if (!q->sizeimage[0])
                   ^
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1181:7: note: Assuming the co=
ndition is false
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:1181:3: note: Taking false br=
anch
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)

vim +1177 drivers/media/platform/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1172  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1173  static void mxc_jpeg_sizeim=
age(struct mxc_jpeg_q_data *q)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1174  {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1175  	if (q->fmt->fourcc =3D=3D =
V4L2_PIX_FMT_JPEG) {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1176  		/* if no sizeimage from u=
ser, assume worst jpeg compression */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11 @1177  		if (!q->sizeimage[0])
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1178  			q->sizeimage[0] =3D 6 * =
q->w * q->h;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1179  		q->sizeimage[1] =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1180  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1181  		if (q->sizeimage[0] > MXC=
_JPEG_MAX_SIZEIMAGE)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1182  			q->sizeimage[0] =3D MXC_=
JPEG_MAX_SIZEIMAGE;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1183  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1184  		/* jpeg stream size must =
be multiple of 1K */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1185  		q->sizeimage[0] =3D ALIGN=
(q->sizeimage[0], 1024);
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1186  	} else {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1187  		q->sizeimage[0] =3D q->by=
tesperline[0] * q->h;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1188  		q->sizeimage[1] =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1189  		if (q->fmt->fourcc =3D=3D=
 V4L2_PIX_FMT_NV12)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1190  			q->sizeimage[1] =3D q->s=
izeimage[0] / 2;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1191  	}
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1192  }
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  1193  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0339787500777765993==--

