Content-Type: multipart/mixed; boundary="===============5508418906862941782=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 23 Apr 2022 13:07:24 +0800
Message-ID: <202204231300.ML1GUzqC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5508418906862941782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7 media: platform: place NXP=
 drivers on a separate dir
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220423/202204231300.ML1GUzqC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:6: note: Left side of=
 '||' is false
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:18: note: Assuming 'd=
st_buf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:2: note: Taking false=
 branch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:7: note: 'q_data_cap'=
 is non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:2: note: Taking false=
 branch
           if (!q_data_cap)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:7: note: 'q_data_out'=
 is non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:2: note: Taking false=
 branch
           if (!q_data_out)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:6: note: Assuming fie=
ld 'colplanes' is equal to field 'num_planes'
           if (q_data_cap->fmt->colplanes !=3D dst_buf->vb2_buf.num_planes)=
 {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:2: note: Taking false=
 branch
           if (q_data_cap->fmt->colplanes !=3D dst_buf->vb2_buf.num_planes)=
 {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:6: note: Assuming fie=
ld 'jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:2: note: Taking false=
 branch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:11: note: Field 'slot=
' is < MXC_MAX_SLOTS
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:2: note: Taking false=
 branch
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:975:2: note: Taking false=
 branch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:6: note: Assuming fie=
ld 'mode' is equal to MXC_JPEG_ENCODE
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:2: note: Taking true =
branch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:984:3: note: Taking false=
 branch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:986:3: note: Calling 'mxc=
_jpeg_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Calling 'mx=
c_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:402:2: note: Control jump=
s to the 'default' case at line 415
           switch (fourcc) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:416:3: note: Returning th=
e value -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Returning f=
rom 'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:2: note: The value -1=
 is assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:6: note: 'img_fmt' is=
 equal to MXC_JPEG_INVALID
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
               ^~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:2: note: Taking true =
branch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: Loop conditi=
on is false.  Exiting loop
                   dev_err(jpeg->dev, "No valid image format detected\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:905:5: note: The result o=
f the left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded =
from macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: warning: Branch c=
ondition evaluates to a garbage value [clang-analyzer-core.uninitialized.Br=
anch]
                   if (!q->sizeimage[0])
                       ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1823:8: note: Calling 'mx=
c_jpeg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:16: note: Assuming f=
ield 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:15: note: '?' condit=
ion is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Left side o=
f '||' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:2: note: Taking fals=
e branch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:7: note: 'fmt' is no=
n-null
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:6: note: Left side o=
f '||' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:14: note: Assuming '=
q_type' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:2: note: Taking fals=
e branch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1739:9: note: Calling 'mx=
c_jpeg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:11: note: Assuming f=
ield 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:10: note: '?' condit=
ion is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:11: note: Assuming f=
ield 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:10: note: '?' condit=
ion is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming '=
i' is >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condit=
ion is false. Execution continues on line 1655
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Calling 'mx=
c_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:6: note: Assuming th=
e condition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Returning f=
rom 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1656:2: note: Calling 'mx=
c_jpeg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: note: Branch cond=
ition evaluates to a garbage value
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1522:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1522:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1662:22: warning: Assigne=
d value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pfmt->bytesperline =3D tmp_q.bytesperline[i];
                                      ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1823:8: note: Calling 'mx=
c_jpeg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:16: note: Assuming f=
ield 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:15: note: '?' condit=
ion is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Left side o=
f '||' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:2: note: Taking fals=
e branch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:7: note: 'fmt' is no=
n-null
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:6: note: Left side o=
f '||' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:14: note: Assuming '=
q_type' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:2: note: Taking fals=
e branch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1739:9: note: Calling 'mx=
c_jpeg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:11: note: Assuming f=
ield 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:10: note: '?' condit=
ion is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:11: note: Assuming f=
ield 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:10: note: '?' condit=
ion is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming '=
i' is < field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condit=
ion is true.  Entering loop body
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming '=
i' is >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condit=
ion is false. Execution continues on line 1655
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Calling 'mx=
c_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:6: note: Assuming th=
e condition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Returning f=
rom 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1656:2: note: Calling 'mx=
c_jpeg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: note: Assuming th=
e condition is false
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:3: note: Taking fals=
e branch
                   if (!q->sizeimage[0])
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1235:7: note: Assuming th=
e condition is false
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1235:3: note: Taking fals=
e branch
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
--
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:6: note: Left side of=
 '||' is false
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:18: note: Assuming 'd=
st_buf' is non-null
           if (!src_buf || !dst_buf) {
                           ^~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:933:2: note: Taking false=
 branch
           if (!src_buf || !dst_buf) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:7: note: 'q_data_cap'=
 is non-null
           if (!q_data_cap)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:939:2: note: Taking false=
 branch
           if (!q_data_cap)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:7: note: 'q_data_out'=
 is non-null
           if (!q_data_out)
                ^~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:942:2: note: Taking false=
 branch
           if (!q_data_out)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:6: note: Assuming fie=
ld 'colplanes' is equal to field 'num_planes'
           if (q_data_cap->fmt->colplanes !=3D dst_buf->vb2_buf.num_planes)=
 {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:950:2: note: Taking false=
 branch
           if (q_data_cap->fmt->colplanes !=3D dst_buf->vb2_buf.num_planes)=
 {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:6: note: Assuming fie=
ld 'jpeg_parse_error' is false
           if (jpeg_src_buf->jpeg_parse_error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:956:2: note: Taking false=
 branch
           if (jpeg_src_buf->jpeg_parse_error) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:11: note: Field 'slot=
' is < MXC_MAX_SLOTS
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:971:2: note: Taking false=
 branch
           if (ctx->slot >=3D MXC_MAX_SLOTS) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:975:2: note: Taking false=
 branch
           if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:6: note: Assuming fie=
ld 'mode' is equal to MXC_JPEG_ENCODE
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:983:2: note: Taking true =
branch
           if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:984:3: note: Taking false=
 branch
                   dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:986:3: note: Calling 'mxc=
_jpeg_config_enc_desc'
                   mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Calling 'mx=
c_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:402:2: note: Control jump=
s to the 'default' case at line 415
           switch (fourcc) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:416:3: note: Returning th=
e value -1
                   return MXC_JPEG_INVALID;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:12: note: Returning f=
rom 'mxc_jpeg_fourcc_to_imgfmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:901:2: note: The value -1=
 is assigned to 'img_fmt'
           img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:6: note: 'img_fmt' is=
 equal to MXC_JPEG_INVALID
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
               ^~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:2: note: Taking true =
branch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: Loop conditi=
on is false.  Exiting loop
                   dev_err(jpeg->dev, "No valid image format detected\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:905:5: note: The result o=
f the left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded =
from macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1046:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: warning: Branch c=
ondition evaluates to a garbage value [clang-analyzer-core.uninitialized.Br=
anch]
                   if (!q->sizeimage[0])
                       ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1823:8: note: Calling 'mx=
c_jpeg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:16: note: Assuming f=
ield 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:15: note: '?' condit=
ion is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Left side o=
f '||' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:2: note: Taking fals=
e branch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:7: note: 'fmt' is no=
n-null
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:6: note: Left side o=
f '||' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:14: note: Assuming '=
q_type' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:2: note: Taking fals=
e branch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1739:9: note: Calling 'mx=
c_jpeg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:11: note: Assuming f=
ield 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:10: note: '?' condit=
ion is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:11: note: Assuming f=
ield 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:10: note: '?' condit=
ion is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming '=
i' is >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condit=
ion is false. Execution continues on line 1655
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Calling 'mx=
c_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:6: note: Assuming th=
e condition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Returning f=
rom 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1656:2: note: Calling 'mx=
c_jpeg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: note: Branch cond=
ition evaluates to a garbage value
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1522:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1522:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D mxc_jpeg->dev;
                          ^~~   ~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1662:22: warning: Assigne=
d value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pfmt->bytesperline =3D tmp_q.bytesperline[i];
                                      ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1823:8: note: Calling 'mx=
c_jpeg_try_fmt_vid_out'
           ret =3D mxc_jpeg_try_fmt_vid_out(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:16: note: Assuming f=
ield 'mode' is not equal to MXC_JPEG_ENCODE
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1720:15: note: '?' condit=
ion is false
           int q_type =3D (jpeg->mode =3D=3D MXC_JPEG_ENCODE) ?
                        ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is not equal to V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Left side o=
f '||' is false
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:161:3: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE   \
            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:7: note: Assuming fi=
eld 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
                ^
   include/uapi/linux/videodev2.h:162:6: note: expanded from macro 'V4L2_TY=
PE_IS_MULTIPLANAR'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1723:2: note: Taking fals=
e branch
           if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:7: note: 'fmt' is no=
n-null
           if (!fmt || fmt->flags !=3D q_type) {
                ^~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:6: note: Left side o=
f '||' is false
           if (!fmt || fmt->flags !=3D q_type) {
               ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:14: note: Assuming '=
q_type' is equal to field 'flags'
           if (!fmt || fmt->flags !=3D q_type) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1729:2: note: Taking fals=
e branch
           if (!fmt || fmt->flags !=3D q_type) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1739:9: note: Calling 'mx=
c_jpeg_try_fmt'
           return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:11: note: Assuming f=
ield 'width' is >=3D MXC_JPEG_MAX_WIDTH
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1615:10: note: '?' condit=
ion is false
           u32 w =3D (pix_mp->width < MXC_JPEG_MAX_WIDTH) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:11: note: Assuming f=
ield 'height' is >=3D MXC_JPEG_MAX_HEIGHT
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1617:10: note: '?' condit=
ion is false
           u32 h =3D (pix_mp->height < MXC_JPEG_MAX_HEIGHT) ?
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming '=
i' is < field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condit=
ion is true.  Entering loop body
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:14: note: Assuming '=
i' is >=3D field 'num_planes'
           for (i =3D 0; i < pix_mp->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1648:2: note: Loop condit=
ion is false. Execution continues on line 1655
           for (i =3D 0; i < pix_mp->num_planes; i++) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Calling 'mx=
c_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:6: note: Assuming th=
e condition is true
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1655:2: note: Returning f=
rom 'mxc_jpeg_bytesperline'
           mxc_jpeg_bytesperline(&tmp_q, 8);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1656:2: note: Calling 'mx=
c_jpeg_sizeimage'
           mxc_jpeg_sizeimage(&tmp_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:2: note: Taking true=
 branch
           if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: note: Assuming th=
e condition is false
                   if (!q->sizeimage[0])
                       ^~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:3: note: Taking fals=
e branch
                   if (!q->sizeimage[0])
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1235:7: note: Assuming th=
e condition is false
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1235:3: note: Taking fals=
e branch
                   if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)

vim +/dev +1019 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   855  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   856  static void mxc_jpeg_config_enc_desc(struct vb2_buffer *ou=
t_buf,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   857  				     struct mxc_jpeg_ctx *ctx,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   858  				     struct vb2_buffer *src_buf,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   859  				     struct vb2_buffer *dst_buf)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   860  {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   861  	struct mxc_jpeg_dev *jpeg =3D ctx->mxc_jpeg;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   862  	void __iomem *reg =3D jpeg->base_reg;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   863  	unsigned int slot =3D ctx->slot;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   864  	struct mxc_jpeg_desc *desc =3D jpeg->slot_data[slot].desc;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   865  	struct mxc_jpeg_desc *cfg_desc =3D jpeg->slot_data[slot].=
cfg_desc;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   866  	dma_addr_t desc_handle =3D jpeg->slot_data[slot].desc_han=
dle;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   867  	dma_addr_t cfg_desc_handle =3D jpeg->slot_data[slot].cfg_=
desc_handle;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   868  	void *cfg_stream_vaddr =3D jpeg->slot_data[slot].cfg_stre=
am_vaddr;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   869  	struct mxc_jpeg_q_data *q_data;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   870  	enum mxc_jpeg_image_format img_fmt;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   871  	int w, h;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   872  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   873  	q_data =3D mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->t=
ype);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   874  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   875  	jpeg->slot_data[slot].cfg_stream_size =3D
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   876  			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   877  						  q_data->fmt->fourcc,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   878  						  q_data->w_adjusted,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   879  						  q_data->h_adjusted);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   880  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   881  	/* chain the config descriptor with the encoding descript=
or */
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   882  	cfg_desc->next_descpt_ptr =3D desc_handle | MXC_NXT_DESCP=
T_EN;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   883  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   884  	cfg_desc->buf_base0 =3D jpeg->slot_data[slot].cfg_stream_=
handle;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   885  	cfg_desc->buf_base1 =3D 0;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   886  	cfg_desc->line_pitch =3D 0;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   887  	cfg_desc->stm_bufbase =3D 0; /* no output expected */
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   888  	cfg_desc->stm_bufsize =3D 0x0;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   889  	cfg_desc->imgsize =3D 0;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   890  	cfg_desc->stm_ctrl =3D STM_CTRL_CONFIG_MOD(1);
ae3cab78dc48958 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-09-27   891  	cfg_desc->stm_ctrl |=3D STM_CTRL_BITBUF_PTR_CLR(1);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   892  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   893  	desc->next_descpt_ptr =3D 0; /* end of chain */
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   894  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   895  	/* use adjusted resolution for CAST IP job */
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   896  	w =3D q_data->w_adjusted;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   897  	h =3D q_data->h_adjusted;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   898  	mxc_jpeg_set_res(desc, w, h);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   899  	mxc_jpeg_set_line_pitch(desc, w * (q_data->fmt->depth / 8=
));
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   900  	mxc_jpeg_set_bufsize(desc, desc->line_pitch * h);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   901  	img_fmt =3D mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc=
);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   902  	if (img_fmt =3D=3D MXC_JPEG_INVALID)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   903  		dev_err(jpeg->dev, "No valid image format detected\n");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   904  	desc->stm_ctrl =3D STM_CTRL_CONFIG_MOD(0) |
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  @905  			 STM_CTRL_IMAGE_FORMAT(img_fmt);
ae3cab78dc48958 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-09-27   906  	desc->stm_ctrl |=3D STM_CTRL_BITBUF_PTR_CLR(1);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   907  	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   908  	dev_dbg(jpeg->dev, "cfg_desc:\n");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   909  	print_descriptor_info(jpeg->dev, cfg_desc);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   910  	dev_dbg(jpeg->dev, "enc desc:\n");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   911  	print_descriptor_info(jpeg->dev, desc);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   912  	print_wrapper_info(jpeg->dev, reg);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   913  	print_cast_status(jpeg->dev, reg, MXC_JPEG_ENCODE);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   914  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   915  	/* validate the configuration descriptor */
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   916  	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   917  }
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   918  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   919  static void mxc_jpeg_device_run(void *priv)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   920  {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   921  	struct mxc_jpeg_ctx *ctx =3D priv;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   922  	struct mxc_jpeg_dev *jpeg =3D ctx->mxc_jpeg;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   923  	void __iomem *reg =3D jpeg->base_reg;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   924  	struct device *dev =3D jpeg->dev;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   925  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   926  	unsigned long flags;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   927  	struct mxc_jpeg_q_data *q_data_cap, *q_data_out;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   928  	struct mxc_jpeg_src_buf *jpeg_src_buf;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   929  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   930  	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   931  	src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   932  	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   933  	if (!src_buf || !dst_buf) {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   934  		dev_err(dev, "Null src or dst buf\n");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   935  		goto end;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   936  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   937  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   938  	q_data_cap =3D mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VID=
EO_CAPTURE);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   939  	if (!q_data_cap)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   940  		goto end;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   941  	q_data_out =3D mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VID=
EO_OUTPUT);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   942  	if (!q_data_out)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   943  		goto end;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   944  	src_buf->sequence =3D q_data_out->sequence++;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   945  	dst_buf->sequence =3D q_data_cap->sequence++;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   946  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   947  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   948  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   949  	jpeg_src_buf =3D vb2_to_mxc_buf(&src_buf->vb2_buf);
417591a766b3c04 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
022-01-12   950  	if (q_data_cap->fmt->colplanes !=3D dst_buf->vb2_buf.num_=
planes) {
417591a766b3c04 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
022-01-12   951  		dev_err(dev, "Capture format %s has %d planes, but captu=
re buffer has %d planes\n",
417591a766b3c04 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
022-01-12   952  			q_data_cap->fmt->name, q_data_cap->fmt->colplanes,
417591a766b3c04 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
022-01-12   953  			dst_buf->vb2_buf.num_planes);
417591a766b3c04 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
022-01-12   954  		jpeg_src_buf->jpeg_parse_error =3D true;
417591a766b3c04 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
022-01-12   955  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   956  	if (jpeg_src_buf->jpeg_parse_error) {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   957  		v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   958  		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   959  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   960  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   961  		spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   962  		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   963  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   964  		return;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   965  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   966  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   967  	mxc_jpeg_enable(reg);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   968  	mxc_jpeg_set_l_endian(reg, 1);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   969  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   970  	ctx->slot =3D mxc_get_free_slot(jpeg->slot_data, MXC_MAX_=
SLOTS);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   971  	if (ctx->slot >=3D MXC_MAX_SLOTS) {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   972  		dev_err(dev, "No more free slots\n");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   973  		goto end;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   974  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   975  	if (!mxc_jpeg_alloc_slot_data(jpeg, ctx->slot)) {
033fc896617a5ba drivers/media/platform/imx-jpeg/mxc-jpeg.c Colin Ian King 2=
021-03-23   976  		dev_err(dev, "Cannot allocate slot data\n");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   977  		goto end;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   978  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   979  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   980  	mxc_jpeg_enable_slot(reg, ctx->slot);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   981  	mxc_jpeg_enable_irq(reg, ctx->slot);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   982  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   983  	if (jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   984  		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   985  		ctx->enc_state =3D MXC_JPEG_ENC_CONF;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   986  		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   987  					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   988  		mxc_jpeg_enc_mode_conf(dev, reg); /* start config phase =
*/
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   989  	} else {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   990  		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   991  		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   992  		mxc_jpeg_config_dec_desc(&dst_buf->vb2_buf, ctx,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   993  					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   994  		mxc_jpeg_dec_mode_go(dev, reg);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   995  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   996  end:
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   997  	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   998  }
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11   999  =

d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1000  static void mxc_jpeg_set_last_buffer_dequeued(struct mxc_j=
peg_ctx *ctx)
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1001  {
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1002  	struct vb2_queue *q;
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1003  =

d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1004  	ctx->stopped =3D 1;
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1005  	q =3D v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1006  	if (!list_empty(&q->done_list))
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1007  		return;
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1008  =

d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1009  	q->last_buffer_dequeued =3D true;
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1010  	wake_up(&q->done_wq);
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1011  	ctx->stopped =3D 0;
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1012  }
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1013  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1014  static int mxc_jpeg_decoder_cmd(struct file *file, void *p=
riv,
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1015  				struct v4l2_decoder_cmd *cmd)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1016  {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1017  	struct v4l2_fh *fh =3D file->private_data;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1018  	struct mxc_jpeg_ctx *ctx =3D mxc_jpeg_fh_to_ctx(fh);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11 @1019  	struct device *dev =3D ctx->mxc_jpeg->dev;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1020  	int ret;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1021  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1022  	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1023  	if (ret < 0)
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1024  		return ret;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1025  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1026  	if (cmd->cmd =3D=3D V4L2_DEC_CMD_STOP) {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1027  		dev_dbg(dev, "Received V4L2_DEC_CMD_STOP");
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1028  		if (v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx) =3D=3D 0) {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1029  			/* No more src bufs, notify app EOS */
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1030  			notify_eos(ctx);
d8ebe298d008ccb drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      2=
022-02-22  1031  			mxc_jpeg_set_last_buffer_dequeued(ctx);
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1032  		} else {
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1033  			/* will send EOS later*/
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1034  			ctx->stopping =3D 1;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1035  		}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1036  	}
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1037  =

2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1038  	return 0;
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1039  }
2db16c6ed72ce64 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 2=
021-03-11  1040  =


:::::: The code at line 1019 was first introduced by commit
:::::: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 d=
river for i.MX8 JPEG Encoder/Decoder

:::::: TO: Mirela Rabulea <mirela.rabulea@nxp.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5508418906862941782==--

