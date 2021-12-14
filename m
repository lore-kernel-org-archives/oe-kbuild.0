Content-Type: multipart/mixed; boundary="===============1018614805264046262=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/allegro-dvt/allegro-core.c:1593:3: warning: Value stored to 'curr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 14 Dec 2021 15:23:26 +0800
Message-ID: <202112141555.FbypAilI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1018614805264046262==
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
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: d74d4e2359ec7985831192f9b5ee22ed5e55b81c media: allegro: move drive=
r out of staging
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20211213 (https://download.01.org/0day-ci/arc=
hive/20211214/202112141555.FbypAilI-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   measure_proximity, =

   set_power_state, =

   num_channels, =

   irq_support, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct vcnl4000_chip_spec {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/vcnl4000.c:132:8: note: Excessive padding in 'struct v=
cnl4000_chip_spec' (11 padding bytes, where 3 is optimal). Optimal fields o=
rder: prod, channels, info, init, measure_light, measure_proximity, set_pow=
er_state, num_channels, irq_support, consider reordering the fields or addi=
ng explicit padding members
   struct vcnl4000_chip_spec {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/gfs2/ops_fstype.c:823:2: warning: Value stored to 'jindex' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           jindex =3D 0;
           ^        ~
   fs/gfs2/ops_fstype.c:823:2: note: Value stored to 'jindex' is never read
           jindex =3D 0;
           ^        ~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/media/platform/allegro-dvt/allegro-core.c:1593:3: warning: Value=
 stored to 'curr' is never read [clang-analyzer-deadcode.DeadStores]
                   curr +=3D len;
                   ^       ~~~
   drivers/media/platform/allegro-dvt/allegro-core.c:1593:3: note: Value st=
ored to 'curr' is never read
                   curr +=3D len;
                   ^       ~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/usb/serial/usb-serial.c:1414:2: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
           rc =3D driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/usb-serial.c:1414:2: note: Value stored to 'rc' is ne=
ver read
           rc =3D driver_attach(&udriver->drvwrap.driver);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   11 warnings generated.
   drivers/gpu/drm/drm_modes.c:1768:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   drivers/gpu/drm/drm_modes.c:1768:4: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
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
   8 warnings generated.
   drivers/iio/imu/fxos8700_core.c:167:8: warning: Excessive padding in 'st=
ruct fxos8700_data' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   buf, =

   regmap, =

   trig, =


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
--===============1018614805264046262==--

