Content-Type: multipart/mixed; boundary="===============6550790661854579392=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 10/14] drm/vc4: hdmi: Move clock calculation into its own function
Date: Tue, 28 Dec 2021 06:44:14 +0800
Message-ID: <202112280623.f3h65W1j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6550790661854579392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211215124406.340180-11-maxime@cerno.tech>
References: <20211215124406.340180-11-maxime@cerno.tech>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Daniel Vetter <daniel.vetter@intel.com>
TO: David Airlie <airlied@linux.ie>
CC: Dom Cobley <dom@raspberrypi.com>
CC: Tim Gover <tim.gover@raspberrypi.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: dri-devel(a)lists.freedesktop.org
CC: Werner Sembach <wse@tuxedocomputers.com>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next next-20211224]
[cannot apply to anholt/for-next v5.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-hdmi=
-Yet-Another-Approach-to-HDMI-YUV-output/20211215-204656
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-c002-20211227 (https://download.01.org/0day-ci/archi=
ve/20211228/202112280623.f3h65W1j-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/7944eff87b48d07ddbb19c3a0=
3d2fd9922553ac0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-hdmi-Yet-Ano=
ther-Approach-to-HDMI-YUV-output/20211215-204656
        git checkout 7944eff87b48d07ddbb19c3a03d2fd9922553ac0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1220:6: note: Assuming field 'hdmi_monito=
r' is true
           if (vc4_encoder->hdmi_monitor) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:1220:2: note: Taking true branch
           if (vc4_encoder->hdmi_monitor) {
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1221:3: note: Loop condition is false.  E=
xiting loop
                   spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1221:3: note: Loop condition is false.  E=
xiting loop
                   spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
                   ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1223:11: note: Assuming the condition is =
false
                   WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
                           ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:1223:3: note: Taking false branch
                   WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1234:3: note: Calling 'vc4_hdmi_set_infof=
rames'
                   vc4_hdmi_set_infoframes(encoder);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:570:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&vc4_hdmi->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:570:2: note: Left side of '&&' is false
           lockdep_assert_held(&vc4_hdmi->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:570:2: note: Taking false branch
           lockdep_assert_held(&vc4_hdmi->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:570:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&vc4_hdmi->mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:578:6: note: Assuming field 'streaming' i=
s true
           if (vc4_hdmi->audio.streaming)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:578:2: note: Taking true branch
           if (vc4_hdmi->audio.streaming)
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:579:3: note: Calling 'vc4_hdmi_set_audio_=
infoframe'
                   vc4_hdmi_set_audio_infoframe(encoder);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:542:2: note: Calling 'vc4_hdmi_write_info=
frame'
           vc4_hdmi_write_infoframe(encoder, &frame);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:437:34: note: The left operand of '-' is =
a garbage value
           u32 packet_id =3D frame->any.type - 0x80;
                           ~~~~~~~~~~~~~~~ ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1337:3: warning: Value stored to 'pixel_r=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                   pixel_rate =3D mode->clock * 1000;
                   ^            ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:1337:3: note: Value stored to 'pixel_rate=
' is never read
                   pixel_rate =3D mode->clock * 1000;
                   ^            ~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   drivers/greybus/svc.c:1144:2: warning: Value stored to 'reset' is never =
read [clang-analyzer-deadcode.DeadStores]
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1144:2: note: Value stored to 'reset' is never read
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   drivers/hwtracing/coresight/coresight-core.c:490:8: warning: Access to f=
ield 'next' results in a dereference of a null pointer (loaded from variabl=
e 'path') [clang-analyzer-core.NullDereference]
                   nd =3D list_first_entry(path, struct coresight_node, lin=
k);
                        ^
   include/linux/list.h:524:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/hwtracing/coresight/coresight-core.c:1253:6: note: Assuming 'ret=
' is 0
           if (ret)
               ^~~
   drivers/hwtracing/coresight/coresight-core.c:1253:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/hwtracing/coresight/coresight-core.c:1256:6: note: Assuming 'val=
' is 0
           if (val) {
               ^~~
   drivers/hwtracing/coresight/coresight-core.c:1256:2: note: Taking false =
branch
           if (val) {
           ^
   drivers/hwtracing/coresight/coresight-core.c:1261:3: note: Calling 'core=
sight_disable'
                   coresight_disable(csdev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1172:2: note: 'path' initia=
lized to a null pointer value
           struct list_head *path =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1176:8: note: Calling 'core=
sight_validate_source'
           ret =3D coresight_validate_source(csdev, __func__);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1075:6: note: Assuming 'typ=
e' is equal to CORESIGHT_DEV_TYPE_SOURCE
           if (type !=3D CORESIGHT_DEV_TYPE_SOURCE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1075:2: note: Taking false =
branch
           if (type !=3D CORESIGHT_DEV_TYPE_SOURCE) {
           ^
   drivers/hwtracing/coresight/coresight-core.c:1080:6: note: Assuming 'sub=
type' is equal to CORESIGHT_DEV_SUBTYPE_SOURCE_PROC
           if (subtype !=3D CORESIGHT_DEV_SUBTYPE_SOURCE_PROC &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1080:51: note: Left side of=
 '&&' is false
           if (subtype !=3D CORESIGHT_DEV_SUBTYPE_SOURCE_PROC &&
                                                            ^
   drivers/hwtracing/coresight/coresight-core.c:1086:2: note: Returning wit=
hout writing to 'csdev->enable', which participates in a condition later
           return 0;
           ^
   drivers/hwtracing/coresight/coresight-core.c:1086:2: note: Returning zer=
o, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1176:8: note: Returning fro=
m 'coresight_validate_source'
           ret =3D coresight_validate_source(csdev, __func__);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-core.c:1177:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/hwtracing/coresight/coresight-core.c:1177:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/hwtracing/coresight/coresight-core.c:1180:6: note: Assuming fiel=
d 'enable' is true
           if (!csdev->enable || !coresight_disable_source(csdev))

vim +/pixel_rate +1337 drivers/gpu/drm/vc4/vc4_hdmi.c

9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1309  =

63495f6b4aede26 Maxime Ripard 2020-10-29  1310  static int vc4_hdmi_encoder=
_atomic_check(struct drm_encoder *encoder,
63495f6b4aede26 Maxime Ripard 2020-10-29  1311  					 struct drm_crtc_state=
 *crtc_state,
63495f6b4aede26 Maxime Ripard 2020-10-29  1312  					 struct drm_connector_=
state *conn_state)
63495f6b4aede26 Maxime Ripard 2020-10-29  1313  {
f623746f74721be Maxime Ripard 2020-12-15  1314  	struct vc4_hdmi_connector_=
state *vc4_state =3D conn_state_to_vc4_hdmi_conn_state(conn_state);
63495f6b4aede26 Maxime Ripard 2020-10-29  1315  	struct drm_display_mode *m=
ode =3D &crtc_state->adjusted_mode;
63495f6b4aede26 Maxime Ripard 2020-10-29  1316  	struct vc4_hdmi *vc4_hdmi =
=3D encoder_to_vc4_hdmi(encoder);
63495f6b4aede26 Maxime Ripard 2020-10-29  1317  	unsigned long long pixel_r=
ate =3D mode->clock * 1000;
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1318  	unsigned long long tmds_ra=
te;
7944eff87b48d07 Maxime Ripard 2021-12-15  1319  	int ret;
63495f6b4aede26 Maxime Ripard 2020-10-29  1320  =

57fb32e632be4d4 Maxime Ripard 2020-10-29  1321  	if (vc4_hdmi->variant->uns=
upported_odd_h_timings &&
57fb32e632be4d4 Maxime Ripard 2020-10-29  1322  	    ((mode->hdisplay % 2) =
|| (mode->hsync_start % 2) ||
57fb32e632be4d4 Maxime Ripard 2020-10-29  1323  	     (mode->hsync_end % 2)=
 || (mode->htotal % 2)))
57fb32e632be4d4 Maxime Ripard 2020-10-29  1324  		return -EINVAL;
57fb32e632be4d4 Maxime Ripard 2020-10-29  1325  =

9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1326  	/*
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1327  	 * The 1440p(a)60 pixel ra=
te is in the same range than the first
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1328  	 * WiFi channel (between 2=
.4GHz and 2.422GHz with 22MHz
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1329  	 * bandwidth). Slightly lo=
wer the frequency to bring it out of
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1330  	 * the WiFi range.
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1331  	 */
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1332  	tmds_rate =3D pixel_rate *=
 10;
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1333  	if (vc4_hdmi->disable_wifi=
_frequencies &&
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1334  	    (tmds_rate >=3D WIFI_2=
_4GHz_CH1_MIN_FREQ &&
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1335  	     tmds_rate <=3D WIFI_2=
_4GHz_CH1_MAX_FREQ)) {
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1336  		mode->clock =3D 238560;
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29 @1337  		pixel_rate =3D mode->cloc=
k * 1000;
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1338  	}
9fa1d7e60ad5ad2 Maxime Ripard 2020-10-29  1339  =

7944eff87b48d07 Maxime Ripard 2021-12-15  1340  	ret =3D vc4_hdmi_encoder_c=
ompute_clock(vc4_hdmi, vc4_state, mode,
7944eff87b48d07 Maxime Ripard 2021-12-15  1341  					     conn_state->max_b=
pc);
7944eff87b48d07 Maxime Ripard 2021-12-15  1342  	if (ret)
7944eff87b48d07 Maxime Ripard 2021-12-15  1343  		return ret;
f623746f74721be Maxime Ripard 2020-12-15  1344  =

63495f6b4aede26 Maxime Ripard 2020-10-29  1345  	return 0;
63495f6b4aede26 Maxime Ripard 2020-10-29  1346  }
63495f6b4aede26 Maxime Ripard 2020-10-29  1347  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6550790661854579392==--

