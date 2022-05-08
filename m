Content-Type: multipart/mixed; boundary="===============7103558317941621220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/meson/meson_encoder_hdmi.c:165:3: warning: Value stored to 'venc_freq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 08 May 2022 22:13:35 +0800
Message-ID: <202205082226.jOJ9cPIn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7103558317941621220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Neil Armstrong <narmstrong@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: e67f6037ae1be34b2b686bab72caa41d57714534 drm/meson: split out encod=
er from meson_dw_hdmi
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220507 (https://download.01.org/0day-ci/archi=
ve/20220508/202205082226.jOJ9cPIn-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De67f6037ae1be34b2b686bab72caa41d57714534
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e67f6037ae1be34b2b686bab72caa41d57714534
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/iio/pressure/icp10100.c:178:14: note: Assuming 'i' is < field 'r=
esponse_word_nb'
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:178:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
           ^
   drivers/iio/pressure/icp10100.c:182:7: note: Assuming the condition is f=
alse
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:182:3: note: Taking false branch
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                   ^
   drivers/iio/pressure/icp10100.c:178:14: note: Assuming 'i' is < field 'r=
esponse_word_nb'
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:178:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
           ^
   drivers/iio/pressure/icp10100.c:182:7: note: Assuming the condition is f=
alse
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:182:3: note: Taking false branch
                   if (crc !=3D ptr[ICP10100_CRC8_WORD_LENGTH]) {
                   ^
   drivers/iio/pressure/icp10100.c:178:14: note: Assuming 'i' is >=3D field=
 'response_word_nb'
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:178:2: note: Loop condition is false. Ex=
ecution continues on line 191
           for (i =3D 0; i < cmd->response_word_nb; ++i) {
           ^
   drivers/iio/pressure/icp10100.c:191:2: note: Returning zero, which parti=
cipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/iio/pressure/icp10100.c:259:8: note: Returning from 'icp10100_se=
nd_cmd'
           ret =3D icp10100_send_cmd(st, cmd, measures, sizeof(measures));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/pressure/icp10100.c:261:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/pressure/icp10100.c:261:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/pressure/icp10100.c:266:17: note: 1st function call argument=
 is an uninitialized value
           *temperature =3D be16_to_cpu(measures[2]);
                          ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:42:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:102:28: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                              ^                 ~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   12 warnings generated.
>> drivers/gpu/drm/meson/meson_encoder_hdmi.c:165:3: warning: Value stored =
to 'venc_freq' is never read [clang-analyzer-deadcode.DeadStores]
                   venc_freq /=3D 2;
                   ^            ~
   drivers/gpu/drm/meson/meson_encoder_hdmi.c:165:3: note: Value stored to =
'venc_freq' is never read
                   venc_freq /=3D 2;
                   ^            ~
>> drivers/gpu/drm/meson/meson_encoder_hdmi.c:289:20: warning: Value stored=
 to 'priv' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct meson_drm *priv =3D encoder_hdmi->priv;
                             ^~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_encoder_hdmi.c:289:20: note: Value stored to=
 'priv' during its initialization is never read
           struct meson_drm *priv =3D encoder_hdmi->priv;
                             ^~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
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
   10 warnings generated.
   drivers/iio/adc/ltc2497.c:18:8: warning: Excessive padding in 'struct lt=
c2497_driverdata' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   buf, =

   client, =

   common_ddata, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ltc2497_driverdata {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ltc2497.c:18:8: note: Excessive padding in 'struct ltc24=
97_driverdata' (32 padding bytes, where 0 is optimal). Optimal fields order=
: buf, client, common_ddata, consider reordering the fields or adding expli=
cit padding members
   struct ltc2497_driverdata {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
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
   12 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: warning: Value stored to 'drop_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: note: Value stored to 'drop_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: warning: Value stored to 'save_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: note: Value stored to 'save_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   10 warnings generated.
   drivers/iio/accel/mma8452.c:252:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/mma8452.c:252:2: note: Value stored to 'ret' is never =
read
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   10 warnings generated.

vim +/venc_freq +165 drivers/gpu/drm/meson/meson_encoder_hdmi.c

e67f6037ae1be3 Neil Armstrong 2021-10-20  102  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  103  static enum drm_mode_status =
meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
e67f6037ae1be3 Neil Armstrong 2021-10-20  104  					const struct drm_displa=
y_info *display_info,
e67f6037ae1be3 Neil Armstrong 2021-10-20  105  					const struct drm_displa=
y_mode *mode)
e67f6037ae1be3 Neil Armstrong 2021-10-20  106  {
e67f6037ae1be3 Neil Armstrong 2021-10-20  107  	struct meson_encoder_hdmi *=
encoder_hdmi =3D bridge_to_meson_encoder_hdmi(bridge);
e67f6037ae1be3 Neil Armstrong 2021-10-20  108  	struct meson_drm *priv =3D =
encoder_hdmi->priv;
e67f6037ae1be3 Neil Armstrong 2021-10-20  109  	bool is_hdmi2_sink =3D disp=
lay_info->hdmi.scdc.supported;
e67f6037ae1be3 Neil Armstrong 2021-10-20  110  	unsigned int phy_freq;
e67f6037ae1be3 Neil Armstrong 2021-10-20  111  	unsigned int vclk_freq;
e67f6037ae1be3 Neil Armstrong 2021-10-20  112  	unsigned int venc_freq;
e67f6037ae1be3 Neil Armstrong 2021-10-20  113  	unsigned int hdmi_freq;
e67f6037ae1be3 Neil Armstrong 2021-10-20  114  	int vic =3D drm_match_cea_m=
ode(mode);
e67f6037ae1be3 Neil Armstrong 2021-10-20  115  	enum drm_mode_status status;
e67f6037ae1be3 Neil Armstrong 2021-10-20  116  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  117  	dev_dbg(priv->dev, "Modelin=
e " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
e67f6037ae1be3 Neil Armstrong 2021-10-20  118  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  119  	/* If sink does not support=
 540MHz, reject the non-420 HDMI2 modes */
e67f6037ae1be3 Neil Armstrong 2021-10-20  120  	if (display_info->max_tmds_=
clock &&
e67f6037ae1be3 Neil Armstrong 2021-10-20  121  	    mode->clock > display_i=
nfo->max_tmds_clock &&
e67f6037ae1be3 Neil Armstrong 2021-10-20  122  	    !drm_mode_is_420_only(d=
isplay_info, mode) &&
e67f6037ae1be3 Neil Armstrong 2021-10-20  123  	    !drm_mode_is_420_also(d=
isplay_info, mode))
e67f6037ae1be3 Neil Armstrong 2021-10-20  124  		return MODE_BAD;
e67f6037ae1be3 Neil Armstrong 2021-10-20  125  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  126  	/* Check against non-VIC su=
pported modes */
e67f6037ae1be3 Neil Armstrong 2021-10-20  127  	if (!vic) {
e67f6037ae1be3 Neil Armstrong 2021-10-20  128  		status =3D meson_venc_hdmi=
_supported_mode(mode);
e67f6037ae1be3 Neil Armstrong 2021-10-20  129  		if (status !=3D MODE_OK)
e67f6037ae1be3 Neil Armstrong 2021-10-20  130  			return status;
e67f6037ae1be3 Neil Armstrong 2021-10-20  131  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  132  		return meson_vclk_dmt_supp=
orted_freq(priv, mode->clock);
e67f6037ae1be3 Neil Armstrong 2021-10-20  133  	/* Check against supported =
VIC modes */
e67f6037ae1be3 Neil Armstrong 2021-10-20  134  	} else if (!meson_venc_hdmi=
_supported_vic(vic))
e67f6037ae1be3 Neil Armstrong 2021-10-20  135  		return MODE_BAD;
e67f6037ae1be3 Neil Armstrong 2021-10-20  136  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  137  	vclk_freq =3D mode->clock;
e67f6037ae1be3 Neil Armstrong 2021-10-20  138  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  139  	/* For 420, pixel clock is =
half unlike venc clock */
e67f6037ae1be3 Neil Armstrong 2021-10-20  140  	if (drm_mode_is_420_only(di=
splay_info, mode) ||
e67f6037ae1be3 Neil Armstrong 2021-10-20  141  	    (!is_hdmi2_sink &&
e67f6037ae1be3 Neil Armstrong 2021-10-20  142  	     drm_mode_is_420_also(d=
isplay_info, mode)))
e67f6037ae1be3 Neil Armstrong 2021-10-20  143  		vclk_freq /=3D 2;
e67f6037ae1be3 Neil Armstrong 2021-10-20  144  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  145  	/* TMDS clock is pixel_cloc=
k * 10 */
e67f6037ae1be3 Neil Armstrong 2021-10-20  146  	phy_freq =3D vclk_freq * 10;
e67f6037ae1be3 Neil Armstrong 2021-10-20  147  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  148  	/* 480i/576i needs global p=
ixel doubling */
e67f6037ae1be3 Neil Armstrong 2021-10-20  149  	if (mode->flags & DRM_MODE_=
FLAG_DBLCLK)
e67f6037ae1be3 Neil Armstrong 2021-10-20  150  		vclk_freq *=3D 2;
e67f6037ae1be3 Neil Armstrong 2021-10-20  151  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  152  	venc_freq =3D vclk_freq;
e67f6037ae1be3 Neil Armstrong 2021-10-20  153  	hdmi_freq =3D vclk_freq;
e67f6037ae1be3 Neil Armstrong 2021-10-20  154  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  155  	/* VENC double pixels for 1=
080i, 720p and YUV420 modes */
e67f6037ae1be3 Neil Armstrong 2021-10-20  156  	if (meson_venc_hdmi_venc_re=
peat(vic) ||
e67f6037ae1be3 Neil Armstrong 2021-10-20  157  	    drm_mode_is_420_only(di=
splay_info, mode) ||
e67f6037ae1be3 Neil Armstrong 2021-10-20  158  	    (!is_hdmi2_sink &&
e67f6037ae1be3 Neil Armstrong 2021-10-20  159  	     drm_mode_is_420_also(d=
isplay_info, mode)))
e67f6037ae1be3 Neil Armstrong 2021-10-20  160  		venc_freq *=3D 2;
e67f6037ae1be3 Neil Armstrong 2021-10-20  161  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  162  	vclk_freq =3D max(venc_freq=
, hdmi_freq);
e67f6037ae1be3 Neil Armstrong 2021-10-20  163  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  164  	if (mode->flags & DRM_MODE_=
FLAG_DBLCLK)
e67f6037ae1be3 Neil Armstrong 2021-10-20 @165  		venc_freq /=3D 2;
e67f6037ae1be3 Neil Armstrong 2021-10-20  166  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  167  	dev_dbg(priv->dev, "%s: vcl=
k:%d phy=3D%d venc=3D%d hdmi=3D%d\n",
e67f6037ae1be3 Neil Armstrong 2021-10-20  168  		__func__, phy_freq, vclk_f=
req, venc_freq, hdmi_freq);
e67f6037ae1be3 Neil Armstrong 2021-10-20  169  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  170  	return meson_vclk_vic_suppo=
rted_freq(priv, phy_freq, vclk_freq);
e67f6037ae1be3 Neil Armstrong 2021-10-20  171  }
e67f6037ae1be3 Neil Armstrong 2021-10-20  172  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  173  static void meson_encoder_hd=
mi_atomic_enable(struct drm_bridge *bridge,
e67f6037ae1be3 Neil Armstrong 2021-10-20  174  					     struct drm_bridge_=
state *bridge_state)
e67f6037ae1be3 Neil Armstrong 2021-10-20  175  {
e67f6037ae1be3 Neil Armstrong 2021-10-20  176  	struct meson_encoder_hdmi *=
encoder_hdmi =3D bridge_to_meson_encoder_hdmi(bridge);
e67f6037ae1be3 Neil Armstrong 2021-10-20  177  	struct drm_atomic_state *st=
ate =3D bridge_state->base.state;
e67f6037ae1be3 Neil Armstrong 2021-10-20  178  	unsigned int ycrcb_map =3D =
VPU_HDMI_OUTPUT_CBYCR;
e67f6037ae1be3 Neil Armstrong 2021-10-20  179  	struct meson_drm *priv =3D =
encoder_hdmi->priv;
e67f6037ae1be3 Neil Armstrong 2021-10-20  180  	struct drm_connector_state =
*conn_state;
e67f6037ae1be3 Neil Armstrong 2021-10-20  181  	const struct drm_display_mo=
de *mode;
e67f6037ae1be3 Neil Armstrong 2021-10-20  182  	struct drm_crtc_state *crtc=
_state;
e67f6037ae1be3 Neil Armstrong 2021-10-20  183  	struct drm_connector *conne=
ctor;
e67f6037ae1be3 Neil Armstrong 2021-10-20  184  	bool yuv420_mode =3D false;
e67f6037ae1be3 Neil Armstrong 2021-10-20  185  	int vic;
e67f6037ae1be3 Neil Armstrong 2021-10-20  186  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  187  	connector =3D drm_atomic_ge=
t_new_connector_for_encoder(state, bridge->encoder);
e67f6037ae1be3 Neil Armstrong 2021-10-20  188  	if (WARN_ON(!connector))
e67f6037ae1be3 Neil Armstrong 2021-10-20  189  		return;
e67f6037ae1be3 Neil Armstrong 2021-10-20  190  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  191  	conn_state =3D drm_atomic_g=
et_new_connector_state(state, connector);
e67f6037ae1be3 Neil Armstrong 2021-10-20  192  	if (WARN_ON(!conn_state))
e67f6037ae1be3 Neil Armstrong 2021-10-20  193  		return;
e67f6037ae1be3 Neil Armstrong 2021-10-20  194  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  195  	crtc_state =3D drm_atomic_g=
et_new_crtc_state(state, conn_state->crtc);
e67f6037ae1be3 Neil Armstrong 2021-10-20  196  	if (WARN_ON(!crtc_state))
e67f6037ae1be3 Neil Armstrong 2021-10-20  197  		return;
e67f6037ae1be3 Neil Armstrong 2021-10-20  198  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  199  	mode =3D &crtc_state->adjus=
ted_mode;
e67f6037ae1be3 Neil Armstrong 2021-10-20  200  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  201  	vic =3D drm_match_cea_mode(=
mode);
e67f6037ae1be3 Neil Armstrong 2021-10-20  202  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  203  	dev_dbg(priv->dev, "\"%s\" =
vic %d\n", mode->name, vic);
e67f6037ae1be3 Neil Armstrong 2021-10-20  204  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  205  	if (encoder_hdmi->output_bu=
s_fmt =3D=3D MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
e67f6037ae1be3 Neil Armstrong 2021-10-20  206  		ycrcb_map =3D VPU_HDMI_OUT=
PUT_CRYCB;
e67f6037ae1be3 Neil Armstrong 2021-10-20  207  		yuv420_mode =3D true;
e67f6037ae1be3 Neil Armstrong 2021-10-20  208  	}
e67f6037ae1be3 Neil Armstrong 2021-10-20  209  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  210  	/* VENC + VENC-DVI Mode set=
up */
e67f6037ae1be3 Neil Armstrong 2021-10-20  211  	meson_venc_hdmi_mode_set(pr=
iv, vic, ycrcb_map, yuv420_mode, mode);
e67f6037ae1be3 Neil Armstrong 2021-10-20  212  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  213  	/* VCLK Set clock */
e67f6037ae1be3 Neil Armstrong 2021-10-20  214  	meson_encoder_hdmi_set_vclk=
(encoder_hdmi, mode);
e67f6037ae1be3 Neil Armstrong 2021-10-20  215  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  216  	if (encoder_hdmi->output_bu=
s_fmt =3D=3D MEDIA_BUS_FMT_UYYVYY8_0_5X24)
e67f6037ae1be3 Neil Armstrong 2021-10-20  217  		/* Setup YUV420 to HDMI-TX=
, no 10bit diphering */
e67f6037ae1be3 Neil Armstrong 2021-10-20  218  		writel_relaxed(2 | (2 << 2=
),
e67f6037ae1be3 Neil Armstrong 2021-10-20  219  			       priv->io_base + _R=
EG(VPU_HDMI_FMT_CTRL));
e67f6037ae1be3 Neil Armstrong 2021-10-20  220  	else
e67f6037ae1be3 Neil Armstrong 2021-10-20  221  		/* Setup YUV444 to HDMI-TX=
, no 10bit diphering */
e67f6037ae1be3 Neil Armstrong 2021-10-20  222  		writel_relaxed(0, priv->io=
_base + _REG(VPU_HDMI_FMT_CTRL));
e67f6037ae1be3 Neil Armstrong 2021-10-20  223  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  224  	dev_dbg(priv->dev, "%s\n", =
priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
e67f6037ae1be3 Neil Armstrong 2021-10-20  225  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  226  	if (priv->venc.hdmi_use_enc=
i)
e67f6037ae1be3 Neil Armstrong 2021-10-20  227  		writel_relaxed(1, priv->io=
_base + _REG(ENCI_VIDEO_EN));
e67f6037ae1be3 Neil Armstrong 2021-10-20  228  	else
e67f6037ae1be3 Neil Armstrong 2021-10-20  229  		writel_relaxed(1, priv->io=
_base + _REG(ENCP_VIDEO_EN));
e67f6037ae1be3 Neil Armstrong 2021-10-20  230  }
e67f6037ae1be3 Neil Armstrong 2021-10-20  231  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  232  static void meson_encoder_hd=
mi_atomic_disable(struct drm_bridge *bridge,
e67f6037ae1be3 Neil Armstrong 2021-10-20  233  					     struct drm_bridge_=
state *bridge_state)
e67f6037ae1be3 Neil Armstrong 2021-10-20  234  {
e67f6037ae1be3 Neil Armstrong 2021-10-20  235  	struct meson_encoder_hdmi *=
encoder_hdmi =3D bridge_to_meson_encoder_hdmi(bridge);
e67f6037ae1be3 Neil Armstrong 2021-10-20  236  	struct meson_drm *priv =3D =
encoder_hdmi->priv;
e67f6037ae1be3 Neil Armstrong 2021-10-20  237  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  238  	writel_bits_relaxed(0x3, 0,
e67f6037ae1be3 Neil Armstrong 2021-10-20  239  			    priv->io_base + _REG(=
VPU_HDMI_SETTING));
e67f6037ae1be3 Neil Armstrong 2021-10-20  240  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  241  	writel_relaxed(0, priv->io_=
base + _REG(ENCI_VIDEO_EN));
e67f6037ae1be3 Neil Armstrong 2021-10-20  242  	writel_relaxed(0, priv->io_=
base + _REG(ENCP_VIDEO_EN));
e67f6037ae1be3 Neil Armstrong 2021-10-20  243  }
e67f6037ae1be3 Neil Armstrong 2021-10-20  244  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  245  static const u32 meson_encod=
er_hdmi_out_bus_fmts[] =3D {
e67f6037ae1be3 Neil Armstrong 2021-10-20  246  	MEDIA_BUS_FMT_YUV8_1X24,
e67f6037ae1be3 Neil Armstrong 2021-10-20  247  	MEDIA_BUS_FMT_UYYVYY8_0_5X2=
4,
e67f6037ae1be3 Neil Armstrong 2021-10-20  248  };
e67f6037ae1be3 Neil Armstrong 2021-10-20  249  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  250  static u32 *
e67f6037ae1be3 Neil Armstrong 2021-10-20  251  meson_encoder_hdmi_get_inp_b=
us_fmts(struct drm_bridge *bridge,
e67f6037ae1be3 Neil Armstrong 2021-10-20  252  					struct drm_bridge_state=
 *bridge_state,
e67f6037ae1be3 Neil Armstrong 2021-10-20  253  					struct drm_crtc_state *=
crtc_state,
e67f6037ae1be3 Neil Armstrong 2021-10-20  254  					struct drm_connector_st=
ate *conn_state,
e67f6037ae1be3 Neil Armstrong 2021-10-20  255  					u32 output_fmt,
e67f6037ae1be3 Neil Armstrong 2021-10-20  256  					unsigned int *num_input=
_fmts)
e67f6037ae1be3 Neil Armstrong 2021-10-20  257  {
e67f6037ae1be3 Neil Armstrong 2021-10-20  258  	u32 *input_fmts =3D NULL;
e67f6037ae1be3 Neil Armstrong 2021-10-20  259  	int i;
e67f6037ae1be3 Neil Armstrong 2021-10-20  260  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  261  	*num_input_fmts =3D 0;
e67f6037ae1be3 Neil Armstrong 2021-10-20  262  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  263  	for (i =3D 0 ; i < ARRAY_SI=
ZE(meson_encoder_hdmi_out_bus_fmts) ; ++i) {
e67f6037ae1be3 Neil Armstrong 2021-10-20  264  		if (output_fmt =3D=3D meso=
n_encoder_hdmi_out_bus_fmts[i]) {
e67f6037ae1be3 Neil Armstrong 2021-10-20  265  			*num_input_fmts =3D 1;
e67f6037ae1be3 Neil Armstrong 2021-10-20  266  			input_fmts =3D kcalloc(*n=
um_input_fmts,
e67f6037ae1be3 Neil Armstrong 2021-10-20  267  					     sizeof(*input_fmts=
),
e67f6037ae1be3 Neil Armstrong 2021-10-20  268  					     GFP_KERNEL);
e67f6037ae1be3 Neil Armstrong 2021-10-20  269  			if (!input_fmts)
e67f6037ae1be3 Neil Armstrong 2021-10-20  270  				return NULL;
e67f6037ae1be3 Neil Armstrong 2021-10-20  271  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  272  			input_fmts[0] =3D output_=
fmt;
e67f6037ae1be3 Neil Armstrong 2021-10-20  273  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  274  			break;
e67f6037ae1be3 Neil Armstrong 2021-10-20  275  		}
e67f6037ae1be3 Neil Armstrong 2021-10-20  276  	}
e67f6037ae1be3 Neil Armstrong 2021-10-20  277  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  278  	return input_fmts;
e67f6037ae1be3 Neil Armstrong 2021-10-20  279  }
e67f6037ae1be3 Neil Armstrong 2021-10-20  280  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  281  static int meson_encoder_hdm=
i_atomic_check(struct drm_bridge *bridge,
e67f6037ae1be3 Neil Armstrong 2021-10-20  282  					struct drm_bridge_state=
 *bridge_state,
e67f6037ae1be3 Neil Armstrong 2021-10-20  283  					struct drm_crtc_state *=
crtc_state,
e67f6037ae1be3 Neil Armstrong 2021-10-20  284  					struct drm_connector_st=
ate *conn_state)
e67f6037ae1be3 Neil Armstrong 2021-10-20  285  {
e67f6037ae1be3 Neil Armstrong 2021-10-20  286  	struct meson_encoder_hdmi *=
encoder_hdmi =3D bridge_to_meson_encoder_hdmi(bridge);
e67f6037ae1be3 Neil Armstrong 2021-10-20  287  	struct drm_connector_state =
*old_conn_state =3D
e67f6037ae1be3 Neil Armstrong 2021-10-20  288  		drm_atomic_get_old_connect=
or_state(conn_state->state, conn_state->connector);
e67f6037ae1be3 Neil Armstrong 2021-10-20 @289  	struct meson_drm *priv =3D =
encoder_hdmi->priv;
e67f6037ae1be3 Neil Armstrong 2021-10-20  290  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  291  	encoder_hdmi->output_bus_fm=
t =3D bridge_state->output_bus_cfg.format;
e67f6037ae1be3 Neil Armstrong 2021-10-20  292  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  293  	dev_dbg(priv->dev, "output_=
bus_fmt %lx\n", encoder_hdmi->output_bus_fmt);
e67f6037ae1be3 Neil Armstrong 2021-10-20  294  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  295  	if (!drm_connector_atomic_h=
dr_metadata_equal(old_conn_state, conn_state))
e67f6037ae1be3 Neil Armstrong 2021-10-20  296  		crtc_state->mode_changed =
=3D true;
e67f6037ae1be3 Neil Armstrong 2021-10-20  297  =

e67f6037ae1be3 Neil Armstrong 2021-10-20  298  	return 0;
e67f6037ae1be3 Neil Armstrong 2021-10-20  299  }
e67f6037ae1be3 Neil Armstrong 2021-10-20  300  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7103558317941621220==--

