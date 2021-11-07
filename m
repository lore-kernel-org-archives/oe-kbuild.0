Content-Type: multipart/mixed; boundary="===============3073382726384362506=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/allegro-dvt/allegro-core.c:1593:3: warning: Value stored to 'curr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 07 Nov 2021 22:33:23 +0800
Message-ID: <202111072217.KJWZ2Omf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3073382726384362506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Tretter <m.tretter@pengutronix.de>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b5013d084e03e82ceeab4db8ae8ceeaebe76b0eb
commit: d74d4e2359ec7985831192f9b5ee22ed5e55b81c media: allegro: move drive=
r out of staging
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20211017 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3=
ef19fe82d7ad6a6e1515317dcc01b41515)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd74d4e2359ec7985831192f9b5ee22ed5e55b81c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d74d4e2359ec7985831192f9b5ee22ed5e55b81c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: warning: Value stored =
to 'stream' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: note: Value stored to =
'stream' during its initialization is never read
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: warning: Value stored =
to 'frame' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: note: Value stored to =
'frame' during its initialization is never read
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/media/platform/allegro-dvt/allegro-core.c:1593:3: warning: Value=
 stored to 'curr' is never read [clang-analyzer-deadcode.DeadStores]
                   curr +=3D len;
                   ^       ~~~
   drivers/media/platform/allegro-dvt/allegro-core.c:1593:3: note: Value st=
ored to 'curr' is never read
                   curr +=3D len;
                   ^       ~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/media/platform/ti-vpe/vpe.c:1790:8: note: Calling 'vpe_try_fmt'
           ret =3D vpe_try_fmt(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:166:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE         \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OVERLAY
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:167:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OVERLAY               \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:168:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY        \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VBI_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:169:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT                  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_SLICED_VBI_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:170:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_OUTPUT           \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_SDR_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:171:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT                  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1727:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))

vim +/curr +1593 drivers/media/platform/allegro-dvt/allegro-core.c

09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1470  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1471  static void allegro_channel_finish_frame(struct alle=
gro_channel *channel,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1472  		struct mcu_msg_encode_frame_response *msg)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1473  {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1474  	struct allegro_dev *dev =3D channel->dev;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1475  	struct vb2_v4l2_buffer *src_buf;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1476  	struct vb2_v4l2_buffer *dst_buf;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1477  	struct {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1478  		u32 offset;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1479  		u32 size;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1480  	} *partition;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1481  	enum vb2_buffer_state state =3D VB2_BUF_STATE_ERROR;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1482  	char *curr;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1483  	ssize_t len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1484  	ssize_t free;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1485  =

09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1486  	src_buf =3D allegro_get_buffer(channel, &channel->s=
ource_shadow_list,
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1487  				     msg->src_handle);
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1488  	if (!src_buf)
3b78f8a21ed685 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1489  		v4l2_warn(&dev->v4l2_dev,
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1490  			  "channel %d: invalid source buffer\n",
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1491  			  channel->mcu_channel_id);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1492  =

09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1493  	dst_buf =3D allegro_get_buffer(channel, &channel->s=
tream_shadow_list,
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1494  				     msg->stream_id);
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1495  	if (!dst_buf)
3b78f8a21ed685 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1496  		v4l2_warn(&dev->v4l2_dev,
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1497  			  "channel %d: invalid stream buffer\n",
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1498  			  channel->mcu_channel_id);
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1499  =

09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1500  	if (!src_buf || !dst_buf)
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1501  		goto err;
3b78f8a21ed685 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1502  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1503  	dst_buf->sequence =3D channel->csequence++;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1504  =

b646f99642b749 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1505  	if (msg->error_code & AL_ERROR) {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1506  		v4l2_err(&dev->v4l2_dev,
04d2a110187103 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1507  			 "channel %d: failed to encode frame: %s (%x)\n",
04d2a110187103 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1508  			 channel->mcu_channel_id,
04d2a110187103 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1509  			 allegro_err_to_string(msg->error_code),
04d2a110187103 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1510  			 msg->error_code);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1511  		goto err;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1512  	}
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1513  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1514  	if (msg->partition_table_size !=3D 1) {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1515  		v4l2_warn(&dev->v4l2_dev,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1516  			  "channel %d: only handling first partition tabl=
e entry (%d entries)\n",
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1517  			  channel->mcu_channel_id, msg->partition_table_s=
ize);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1518  	}
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1519  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1520  	if (msg->partition_table_offset +
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1521  	    msg->partition_table_size * sizeof(*partition) >
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1522  	    vb2_plane_size(&dst_buf->vb2_buf, 0)) {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1523  		v4l2_err(&dev->v4l2_dev,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1524  			 "channel %d: partition table outside of dst_buf\=
n",
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1525  			 channel->mcu_channel_id);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1526  		goto err;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1527  	}
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1528  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1529  	partition =3D
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1530  	    vb2_plane_vaddr(&dst_buf->vb2_buf, 0) + msg->pa=
rtition_table_offset;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1531  	if (partition->offset + partition->size >
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1532  	    vb2_plane_size(&dst_buf->vb2_buf, 0)) {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1533  		v4l2_err(&dev->v4l2_dev,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1534  			 "channel %d: encoded frame is outside of dst_buf=
 (offset 0x%x, size 0x%x)\n",
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1535  			 channel->mcu_channel_id, partition->offset,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1536  			 partition->size);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1537  		goto err;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1538  	}
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1539  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1540  	v4l2_dbg(2, debug, &dev->v4l2_dev,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1541  		 "channel %d: encoded frame of size %d is at offse=
t 0x%x\n",
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1542  		 channel->mcu_channel_id, partition->size, partiti=
on->offset);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1543  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1544  	/*
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1545  	 * The payload must include the data before the par=
tition offset,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1546  	 * because we will put the sps and pps data there.
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1547  	 */
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1548  	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1549  			      partition->offset + partition->size);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1550  =

878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1551  	curr =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1552  	free =3D partition->offset;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1553  	if (msg->is_idr) {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1554  		len =3D allegro_h264_write_sps(channel, curr, free=
);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1555  		if (len < 0) {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1556  			v4l2_err(&dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1557  				 "not enough space for sequence parameter set: %=
zd left\n",
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1558  				 free);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1559  			goto err;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1560  		}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1561  		curr +=3D len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1562  		free -=3D len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1563  		v4l2_dbg(1, debug, &dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1564  			 "channel %d: wrote %zd byte SPS nal unit\n",
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1565  			 channel->mcu_channel_id, len);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1566  	}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1567  =

878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1568  	if (msg->slice_type =3D=3D AL_ENC_SLICE_TYPE_I) {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1569  		len =3D allegro_h264_write_pps(channel, curr, free=
);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1570  		if (len < 0) {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1571  			v4l2_err(&dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1572  				 "not enough space for picture parameter set: %z=
d left\n",
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1573  				 free);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1574  			goto err;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1575  		}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1576  		curr +=3D len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1577  		free -=3D len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1578  		v4l2_dbg(1, debug, &dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1579  			 "channel %d: wrote %zd byte PPS nal unit\n",
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1580  			 channel->mcu_channel_id, len);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1581  	}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1582  =

e74145c2334d85 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1583  	if (msg->slice_type !=3D AL_ENC_SLICE_TYPE_I && !ms=
g->is_idr) {
e74145c2334d85 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1584  		dst_buf->vb2_buf.planes[0].data_offset =3D free;
e74145c2334d85 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1585  		free =3D 0;
e74145c2334d85 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1586  	} else {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1587  		len =3D nal_h264_write_filler(&dev->plat_dev->dev,=
 curr, free);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1588  		if (len < 0) {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1589  			v4l2_err(&dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1590  				 "failed to write %zd filler data\n", free);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1591  			goto err;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1592  		}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28 @1593  		curr +=3D len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1594  		free -=3D len;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1595  		v4l2_dbg(2, debug, &dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1596  			 "channel %d: wrote %zd bytes filler nal unit\n",
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1597  			 channel->mcu_channel_id, len);
e74145c2334d85 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1598  	}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1599  =

878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1600  	if (free !=3D 0) {
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1601  		v4l2_err(&dev->v4l2_dev,
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1602  			 "non-VCL NAL units do not fill space until VCL N=
AL unit: %zd bytes left\n",
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1603  			 free);
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1604  		goto err;
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1605  	}
878344de61d0d5 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1606  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1607  	state =3D VB2_BUF_STATE_DONE;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1608  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1609  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1610  	if (msg->is_idr)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1611  		dst_buf->flags |=3D V4L2_BUF_FLAG_KEYFRAME;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1612  	else
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1613  		dst_buf->flags |=3D V4L2_BUF_FLAG_PFRAME;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1614  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1615  	v4l2_dbg(1, debug, &dev->v4l2_dev,
80c8449fc71c80 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1616  		 "channel %d: encoded frame #%03d (%s%s, QP %d, %d=
 bytes)\n",
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1617  		 channel->mcu_channel_id,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1618  		 dst_buf->sequence,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1619  		 msg->is_idr ? "IDR, " : "",
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1620  		 msg->slice_type =3D=3D AL_ENC_SLICE_TYPE_I ? "I s=
lice" :
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1621  		 msg->slice_type =3D=3D AL_ENC_SLICE_TYPE_P ? "P s=
lice" : "unknown",
80c8449fc71c80 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1622  		 msg->qp, partition->size);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1623  =

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1624  err:
09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1625  	if (src_buf)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1626  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1627  =

09e6a7d63ead8d drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2020-03-16  1628  	if (dst_buf)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1629  		allegro_channel_buf_done(channel, dst_buf, state);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1630  }
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  1631  =


:::::: The code at line 1593 was first introduced by commit
:::::: 878344de61d0d5f351a1b84fce009a321be3eb45 media: allegro: add SPS/PPS=
 nal unit writer

:::::: TO: Michael Tretter <m.tretter@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3073382726384362506==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3073382726384362506==--

