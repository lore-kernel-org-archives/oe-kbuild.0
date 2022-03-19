Content-Type: multipart/mixed; boundary="===============0420488159780363101=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 259/331] drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1231:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sat, 19 Mar 2022 16:44:38 +0800
Message-ID: <202203191647.oSnuoCij-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0420488159780363101==
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

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   47aa866f248c89b319b99ac7b21a0a961ed2264a
commit: 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7 [259/331] media: platform:=
 place NXP drivers on a separate dir
:::::: branch date: 26 hours ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220318 (https://download.01.org/0day-ci/archi=
ve/20220319/202203191647.oSnuoCij-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e=
4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add mchehab-media-next git://linuxtv.org/mchehab/media-n=
ext.git
        git fetch --no-tags mchehab-media-next master
        git checkout 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:902:2: note: Taking true =
branch
           if (img_fmt =3D=3D MXC_JPEG_INVALID)
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: Left side of=
 '&&' is true
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
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: Taking true =
branch
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
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: '?' conditio=
n is true
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
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:903:3: note: '?' conditio=
n is true
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
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
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
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:905:5: note: The result o=
f the left shift is undefined because the left operand is negative
                            STM_CTRL_IMAGE_FORMAT(img_fmt);
                            ^
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h:84:52: note: expanded =
from macro 'STM_CTRL_IMAGE_FORMAT'
   #define STM_CTRL_IMAGE_FORMAT(img_fmt)          ((img_fmt) << 3)
                                                    ~~~~~~~~~ ^
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

vim +1231 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1226  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1227  static void mxc_jpeg_sizeimage(struct mxc_jpeg_q_data *q)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1228  {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1229  	if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1230  		/* if no sizeimage from user, assume worst jpeg compressi=
on */
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11 @1231  		if (!q->sizeimage[0])
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1232  			q->sizeimage[0] =3D 6 * q->w * q->h;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1233  		q->sizeimage[1] =3D 0;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1234  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1235  		if (q->sizeimage[0] > MXC_JPEG_MAX_SIZEIMAGE)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1236  			q->sizeimage[0] =3D MXC_JPEG_MAX_SIZEIMAGE;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1237  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1238  		/* jpeg stream size must be multiple of 1K */
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1239  		q->sizeimage[0] =3D ALIGN(q->sizeimage[0], 1024);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1240  	} else {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1241  		q->sizeimage[0] =3D q->bytesperline[0] * q->h;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1242  		q->sizeimage[1] =3D 0;
784a1883cff07e drivers/media/platform/imx-jpeg/mxc-jpeg.c Ming Qian      20=
21-12-24  1243  		if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_NV12M)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1244  			q->sizeimage[1] =3D q->sizeimage[0] / 2;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1245  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1246  }
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  1247  =


:::::: The code at line 1231 was first introduced by commit
:::::: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 d=
river for i.MX8 JPEG Encoder/Decoder

:::::: TO: Mirela Rabulea <mirela.rabulea@nxp.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0420488159780363101==--

