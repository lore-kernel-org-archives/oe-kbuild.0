Content-Type: multipart/mixed; boundary="===============8802782575907638490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1019:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 22 Apr 2022 08:18:35 +0800
Message-ID: <202204220854.0PMb5s89-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8802782575907638490==
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
head:   59f0c2447e2553b0918b4a9fd38763a5c0587d02
commit: 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7 media: platform: place NXP=
 drivers on a separate dir
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220422/202204220854.0PMb5s89-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
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

vim +/dev +1019 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

d8ebe298d008cc drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      20=
22-02-22  1013  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1014  static int mxc_jpeg_decoder_cmd(struct file *file, void *pr=
iv,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1015  				struct v4l2_decoder_cmd *cmd)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1016  {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1017  	struct v4l2_fh *fh =3D file->private_data;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1018  	struct mxc_jpeg_ctx *ctx =3D mxc_jpeg_fh_to_ctx(fh);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11 @1019  	struct device *dev =3D ctx->mxc_jpeg->dev;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1020  	int ret;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1021  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1022  	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1023  	if (ret < 0)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1024  		return ret;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1025  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1026  	if (cmd->cmd =3D=3D V4L2_DEC_CMD_STOP) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1027  		dev_dbg(dev, "Received V4L2_DEC_CMD_STOP");
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1028  		if (v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx) =3D=3D 0) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1029  			/* No more src bufs, notify app EOS */
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1030  			notify_eos(ctx);
d8ebe298d008cc drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      20=
22-02-22  1031  			mxc_jpeg_set_last_buffer_dequeued(ctx);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1032  		} else {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1033  			/* will send EOS later*/
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1034  			ctx->stopping =3D 1;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1035  		}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1036  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1037  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1038  	return 0;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1039  }
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1040  =


:::::: The code at line 1019 was first introduced by commit
:::::: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 d=
river for i.MX8 JPEG Encoder/Decoder

:::::: TO: Mirela Rabulea <mirela.rabulea@nxp.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8802782575907638490==--

