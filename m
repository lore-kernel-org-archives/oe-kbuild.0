Content-Type: multipart/mixed; boundary="===============3024298631243593495=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kraxel:drm-misc-next 3/7] drivers/gpu/drm/vc4/vc4_hdmi.c:1323:3: warning: Value stored to 'tmds_char_rate' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 01 Apr 2022 14:27:57 +0800
Message-ID: <202204011417.pQUMEXTr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3024298631243593495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>

tree:   git://git.kraxel.org/linux drm-misc-next
head:   e769a3504e273309c9fe4a417d427c8dbff4cf1c
commit: 595dcf4eb859d043de9919f50d44272304e75422 [3/7] drm/vc4: hdmi: Move =
clock calculation into its own function
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-c002-20220331 (https://download.01.org/0day-ci/archi=
ve/20220401/202204011417.pQUMEXTr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add kraxel git://git.kraxel.org/linux
        git fetch --no-tags kraxel drm-misc-next
        git checkout 595dcf4eb859d043de9919f50d44272304e75422
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1205:3: note: Loop condition is false.  E=
xiting loop
                   spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1205:3: note: Loop condition is false.  E=
xiting loop
                   spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:3: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1205:3: note: Loop condition is false.  E=
xiting loop
                   spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:262:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1205:3: note: Loop condition is false.  E=
xiting loop
                   spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
                   ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1207:11: note: Assuming the condition is =
false
                   WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
                           ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:1207:3: note: Taking false branch
                   WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1218:3: note: Calling 'vc4_hdmi_set_infof=
rames'
                   vc4_hdmi_set_infoframes(encoder);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:570:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&vc4_hdmi->mutex);
           ^
   include/linux/lockdep.h:411:34: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)                  do { (void)(l); } while =
(0)
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
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1323:3: warning: Value stored to 'tmds_ch=
ar_rate' is never read [clang-analyzer-deadcode.DeadStores]
                   tmds_char_rate =3D mode->clock * 1000;
                   ^                ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:1323:3: note: Value stored to 'tmds_char_=
rate' is never read
                   tmds_char_rate =3D mode->clock * 1000;
                   ^                ~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:88:44: warning: The =
left operand of '-' is a garbage value [clang-analyzer-core.UndefinedBinary=
OperatorResult]
           return ((sublinks & 1) ? sor[0] : sor[1]) - 1;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:72:2: note: Loop con=
dition is true.  Entering loop body
           for (*link =3D 0, m =3D __ffs(outp->info.or) * 2, s =3D 0; s < 2=
; m++, s++) {
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:73:7: note: Assuming=
 the condition is false
                   if (sublinks & BIT(s)) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:73:3: note: Taking f=
alse branch
                   if (sublinks & BIT(s)) {
                   ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:72:2: note: Loop con=
dition is true.  Entering loop body
           for (*link =3D 0, m =3D __ffs(outp->info.or) * 2, s =3D 0; s < 2=
; m++, s++) {
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:73:7: note: Assuming=
 the condition is false
                   if (sublinks & BIT(s)) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:73:3: note: Taking f=
alse branch
                   if (sublinks & BIT(s)) {
                   ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:72:2: note: Loop con=
dition is false. Execution continues on line 83
           for (*link =3D 0, m =3D __ffs(outp->info.or) * 2, s =3D 0; s < 2=
; m++, s++) {
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:83:6: note: 'sublink=
s' is not equal to 3
           if (sublinks =3D=3D 3) {
               ^~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:83:2: note: Taking f=
alse branch
           if (sublinks =3D=3D 3) {
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:88:11: note: Assumin=
g the condition is false
           return ((sublinks & 1) ? sor[0] : sor[1]) - 1;
                    ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:88:10: note: '?' con=
dition is false
           return ((sublinks & 1) ? sor[0] : sor[1]) - 1;
                   ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c:88:44: note: The lef=
t operand of '-' is a garbage value
           return ((sublinks & 1) ? sor[0] : sor[1]) - 1;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
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
   7 warnings generated.
   sound/pci/maestro3.c:1851:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, chip->card->driver);
           ^~~~~~
   sound/pci/maestro3.c:1851:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(pcm->name, chip->card->driver);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   sound/pci/ac97/ac97_codec.c:1067:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1067:3: note: Value stored to 'val' is never=
 read
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1104:3: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1104:3: note: Value stored to 'val' is never=
 read
                   val =3D snd_ac97_read(ac97, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:1856:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, pid->name);
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1856:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(name, pid->name);
           ^~~~~~
   sound/pci/ac97/ac97_codec.c:1865:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(name, " ");

vim +/tmds_char_rate +1323 drivers/gpu/drm/vc4/vc4_hdmi.c

9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1295  =

63495f6b4aede2 Maxime Ripard 2020-10-29  1296  static int vc4_hdmi_encoder_=
atomic_check(struct drm_encoder *encoder,
63495f6b4aede2 Maxime Ripard 2020-10-29  1297  					 struct drm_crtc_state =
*crtc_state,
63495f6b4aede2 Maxime Ripard 2020-10-29  1298  					 struct drm_connector_s=
tate *conn_state)
63495f6b4aede2 Maxime Ripard 2020-10-29  1299  {
f623746f74721b Maxime Ripard 2020-12-15  1300  	struct vc4_hdmi_connector_s=
tate *vc4_state =3D conn_state_to_vc4_hdmi_conn_state(conn_state);
63495f6b4aede2 Maxime Ripard 2020-10-29  1301  	struct drm_display_mode *mo=
de =3D &crtc_state->adjusted_mode;
63495f6b4aede2 Maxime Ripard 2020-10-29  1302  	struct vc4_hdmi *vc4_hdmi =
=3D encoder_to_vc4_hdmi(encoder);
6135ee07702781 Maxime Ripard 2022-02-22  1303  	unsigned long long tmds_cha=
r_rate =3D mode->clock * 1000;
6135ee07702781 Maxime Ripard 2022-02-22  1304  	unsigned long long tmds_bit=
_rate;
595dcf4eb859d0 Maxime Ripard 2022-02-22  1305  	int ret;
63495f6b4aede2 Maxime Ripard 2020-10-29  1306  =

57fb32e632be4d Maxime Ripard 2020-10-29  1307  	if (vc4_hdmi->variant->unsu=
pported_odd_h_timings &&
57fb32e632be4d Maxime Ripard 2020-10-29  1308  	    ((mode->hdisplay % 2) |=
| (mode->hsync_start % 2) ||
57fb32e632be4d Maxime Ripard 2020-10-29  1309  	     (mode->hsync_end % 2) =
|| (mode->htotal % 2)))
57fb32e632be4d Maxime Ripard 2020-10-29  1310  		return -EINVAL;
57fb32e632be4d Maxime Ripard 2020-10-29  1311  =

9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1312  	/*
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1313  	 * The 1440p(a)60 pixel rat=
e is in the same range than the first
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1314  	 * WiFi channel (between 2.=
4GHz and 2.422GHz with 22MHz
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1315  	 * bandwidth). Slightly low=
er the frequency to bring it out of
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1316  	 * the WiFi range.
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1317  	 */
6135ee07702781 Maxime Ripard 2022-02-22  1318  	tmds_bit_rate =3D tmds_char=
_rate * 10;
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1319  	if (vc4_hdmi->disable_wifi_=
frequencies &&
6135ee07702781 Maxime Ripard 2022-02-22  1320  	    (tmds_bit_rate >=3D WIF=
I_2_4GHz_CH1_MIN_FREQ &&
6135ee07702781 Maxime Ripard 2022-02-22  1321  	     tmds_bit_rate <=3D WIF=
I_2_4GHz_CH1_MAX_FREQ)) {
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1322  		mode->clock =3D 238560;
6135ee07702781 Maxime Ripard 2022-02-22 @1323  		tmds_char_rate =3D mode->c=
lock * 1000;
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1324  	}
9fa1d7e60ad5ad Maxime Ripard 2020-10-29  1325  =

595dcf4eb859d0 Maxime Ripard 2022-02-22  1326  	ret =3D vc4_hdmi_encoder_co=
mpute_clock(vc4_hdmi, vc4_state, mode,
595dcf4eb859d0 Maxime Ripard 2022-02-22  1327  					     conn_state->max_bp=
c);
595dcf4eb859d0 Maxime Ripard 2022-02-22  1328  	if (ret)
595dcf4eb859d0 Maxime Ripard 2022-02-22  1329  		return ret;
f623746f74721b Maxime Ripard 2020-12-15  1330  =

63495f6b4aede2 Maxime Ripard 2020-10-29  1331  	return 0;
63495f6b4aede2 Maxime Ripard 2020-10-29  1332  }
63495f6b4aede2 Maxime Ripard 2020-10-29  1333  =


:::::: The code at line 1323 was first introduced by commit
:::::: 6135ee07702781cd8206bcb1c202c4630d6e3c9c drm/vc4: hdmi: Rename pixel=
_rate variable

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3024298631243593495==--

