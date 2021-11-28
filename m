Content-Type: multipart/mixed; boundary="===============6870723769864446555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/max98373-sdw.c:789:26: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 28 Nov 2021 20:59:29 +0800
Message-ID: <202111282034.Bijgdank-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6870723769864446555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 349dd23931d1943b1083182e35715eba8b150fe1 ASoC: max98373: don't acce=
ss volatile registers in bias level off
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20211118 (https://download.01.org/0day-ci/arc=
hive/20211128/202111282034.Bijgdank-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D349dd23931d1943b1083182e35715eba8b150fe1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 349dd23931d1943b1083182e35715eba8b150fe1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   temp_fixed_num, =

   pwm_num, =

   target_temp_mask, =

   speed_tolerance_limit, =

   tolerance_mask, =

   vid, =

   vrm, =

   have_vid, =

   vbat, =

   fandiv1, =

   fandiv2, =

   sio_reg_enable, =

   temp_type, =

   temp_offset, =

   fan_pulses, =

   fan_div, =

   pwm_mode, =

   target_temp, =

   pwm_temp_sel, =

   pwm_weight_temp_sel, =

   temp_src, =

   temp_tolerance, =

   fan_time, =

   weight_temp, =

   in, =

   pwm, =

   auto_pwm, =

   auto_temp, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct nct6775_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/hwmon/nct6775.c:1069:8: note: Excessive padding in 'struct nct67=
75_data' (35 padding bytes, where 3 is optimal). Optimal fields order: name=
, temp_label, ALARM_BITS, BEEP_BITS, REG_VIN, REG_TARGET, REG_FAN, REG_FAN_=
MODE, REG_FAN_MIN, REG_FAN_PULSES, FAN_PULSE_SHIFT, REG_TOLERANCE_H, REG_PW=
M_MODE, PWM_MODE_MASK, REG_PWM_READ, REG_CRITICAL_PWM_ENABLE, REG_CRITICAL_=
PWM, REG_AUTO_TEMP, REG_AUTO_PWM, REG_CRITICAL_TEMP, REG_CRITICAL_TEMP_TOLE=
RANCE, REG_TEMP_SOURCE, REG_TEMP_SEL, REG_WEIGHT_TEMP_SEL, REG_TEMP_OFFSET,=
 REG_ALARM, REG_BEEP, fan_from_reg, fan_from_reg_min, last_updated, alarms,=
 beeps, REG_IN_MINMAX, REG_FAN_TIME, REG_WEIGHT_TEMP, groups, REG_PWM, upda=
te_lock, addr, sioreg, kind, temp_mask, virt_temp_mask, auto_pwm_num, rpm, =
pwm_enable, target_speed, target_speed_tolerance, REG_CONFIG, REG_VBAT, REG=
_DIODE, have_temp, have_temp_fixed, have_in, fan_min, reg_temp_config, reg_=
temp, temp, DIODE_MASK, CRITICAL_PWM_ENABLE_MASK, valid, bank, in_num, has_=
pwm, has_fan, has_fan_min, has_fan_div, num_temp_alarms, num_temp_beeps, te=
mp_fixed_num, pwm_num, target_temp_mask, speed_tolerance_limit, tolerance_m=
ask, vid, vrm, have_vid, vbat, fandiv1, fandiv2, sio_reg_enable, temp_type,=
 temp_offset, fan_pulses, fan_div, pwm_mode, target_temp, pwm_temp_sel, pwm=
_weight_temp_sel, temp_src, temp_tolerance, fan_time, weight_temp, in, pwm,=
 auto_pwm, auto_temp, consider reordering the fields or adding explicit pad=
ding members
   struct nct6775_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/mon/mon_bin.c:848:3: warning: Value stored to 'nbytes' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   nbytes -=3D step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:848:3: note: Value stored to 'nbytes' is never=
 read
                   nbytes -=3D step_len;
                   ^         ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: warning: Value stored to 'buf' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   buf +=3D step_len;
                   ^      ~~~~~~~~
   drivers/usb/mon/mon_bin.c:849:3: note: Value stored to 'buf' is never re=
ad
                   buf +=3D step_len;
                   ^      ~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   sound/soc/bcm/bcm63xx-pcm-whistler.c:281:31: warning: The left operand o=
f '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:252:59: note: 'val_1' declared with=
out an initial value
           unsigned int availdepth, ifflevel, offlevel, int_status, val_1, =
val_2;
                                                                    ^~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:267:6: note: Assuming the condition=
 is true
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:267:2: note: Taking true branch
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
           ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:276:3: note: Loop condition is fals=
e. Execution continues on line 281
                   while (offlevel) {
                   ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:281:31: note: The left operand of '=
+' is a garbage value
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (6 in non-user code, 3 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> sound/soc/codecs/max98373-sdw.c:789:26: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^
   sound/soc/codecs/max98373-sdw.c:854:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   sound/soc/codecs/max98373-sdw.c:857:9: note: Calling 'max98373_init'
           return max98373_init(slave, regmap);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:6: note: Assuming 'max98373' is non-=
null
           if (!max98373)
               ^~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:2: note: Taking false branch
           if (!max98373)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:39: note: The value 3 is assigned to=
 'i'
           for (i =3D 0; i < max98373->cache_num; i++)
                                                ^~~
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:789:26: note: Assigned value is garbage =
or undefined
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/usb/gadget/function/uvc_configfs.c:2042:30: warning: Value store=
d to 'u' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
                           struct uvcg_uncompressed *u =3D
                                                     ^
   drivers/usb/gadget/function/uvc_configfs.c:2042:30: note: Value stored t=
o 'u' during its initialization is never read
                           struct uvcg_uncompressed *u =3D
                                                     ^
   drivers/usb/gadget/function/uvc_configfs.c:2048:23: warning: Value store=
d to 'm' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
                           struct uvcg_mjpeg *m =3D
                                              ^
   drivers/usb/gadget/function/uvc_configfs.c:2048:23: note: Value stored t=
o 'm' during its initialization is never read
                           struct uvcg_mjpeg *m =3D
                                              ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/usb/gadget/function/f_midi.c:420:28: warning: Value stored to 'c=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct usb_composite_dev *cdev =3D f->config->cdev;
                                     ^~~~   ~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_midi.c:420:28: note: Value stored to 'cdev=
' during its initialization is never read
           struct usb_composite_dev *cdev =3D f->config->cdev;
                                     ^~~~   ~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_midi.c:724:17: warning: Value stored to 'm=
idi' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct f_midi *midi =3D substream->rmidi->private_data;
                          ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_midi.c:724:17: note: Value stored to 'midi=
' during its initialization is never read
           struct f_midi *midi =3D substream->rmidi->private_data;
                          ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_midi.c:757:17: warning: Value stored to 'm=
idi' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct f_midi *midi =3D substream->rmidi->private_data;
                          ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_midi.c:757:17: note: Value stored to 'midi=
' during its initialization is never read
           struct f_midi *midi =3D substream->rmidi->private_data;
                          ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_midi.c:819:2: warning: Call to function 's=
trcpy' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.=
strcpy]
           strcpy(card->driver, f_midi_longname);
--
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:1011:2: note: Loop condition is true.  Enteri=
ng loop body
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:1012:3: note: Left side of '&&' is false
                   list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_nod=
e) {
                   ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/soundwire/stream.c:1012:3: note: Taking false branch
                   list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_nod=
e) {
                   ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:299:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/soundwire/stream.c:1012:3: note: Loop condition is false.  Exiti=
ng loop
                   list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_nod=
e) {
                   ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:1012:3: note: Loop condition is true.  Enteri=
ng loop body
                   list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_nod=
e) {
                   ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:1013:8: note: Use of memory after it is freed
                           if (s_rt->slave !=3D slave)
                               ^~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> sound/soc/codecs/max98373-sdw.c:789:26: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^
   sound/soc/codecs/max98373-sdw.c:854:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   sound/soc/codecs/max98373-sdw.c:857:9: note: Calling 'max98373_init'
           return max98373_init(slave, regmap);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:6: note: Assuming 'max98373' is non-=
null
           if (!max98373)
               ^~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:2: note: Taking false branch
           if (!max98373)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:39: note: The value 3 is assigned to=
 'i'
           for (i =3D 0; i < max98373->cache_num; i++)
                                                ^~~
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:789:26: note: Assigned value is garbage =
or undefined
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/most/configfs.c:173:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:173:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:446:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:446:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +789 sound/soc/codecs/max98373-sdw.c

56a5b7910e965c Ryan Lee  2020-07-08  766  =

56a5b7910e965c Ryan Lee  2020-07-08  767  static int max98373_init(struct s=
dw_slave *slave, struct regmap *regmap)
56a5b7910e965c Ryan Lee  2020-07-08  768  {
56a5b7910e965c Ryan Lee  2020-07-08  769  	struct max98373_priv *max98373;
56a5b7910e965c Ryan Lee  2020-07-08  770  	int ret;
349dd23931d194 Bard Liao 2020-12-17  771  	int i;
56a5b7910e965c Ryan Lee  2020-07-08  772  	struct device *dev =3D &slave->d=
ev;
56a5b7910e965c Ryan Lee  2020-07-08  773  =

56a5b7910e965c Ryan Lee  2020-07-08  774  	/*  Allocate and assign private =
driver data structure  */
56a5b7910e965c Ryan Lee  2020-07-08  775  	max98373 =3D devm_kzalloc(dev, s=
izeof(*max98373), GFP_KERNEL);
56a5b7910e965c Ryan Lee  2020-07-08  776  	if (!max98373)
56a5b7910e965c Ryan Lee  2020-07-08  777  		return -ENOMEM;
56a5b7910e965c Ryan Lee  2020-07-08  778  =

56a5b7910e965c Ryan Lee  2020-07-08  779  	dev_set_drvdata(dev, max98373);
56a5b7910e965c Ryan Lee  2020-07-08  780  	max98373->regmap =3D regmap;
56a5b7910e965c Ryan Lee  2020-07-08  781  	max98373->slave =3D slave;
56a5b7910e965c Ryan Lee  2020-07-08  782  =

349dd23931d194 Bard Liao 2020-12-17  783  	max98373->cache_num =3D ARRAY_SI=
ZE(max98373_sdw_cache_reg);
349dd23931d194 Bard Liao 2020-12-17  784  	max98373->cache =3D devm_kcalloc=
(dev, max98373->cache_num,
349dd23931d194 Bard Liao 2020-12-17  785  				       sizeof(*max98373->cach=
e),
349dd23931d194 Bard Liao 2020-12-17  786  				       GFP_KERNEL);
349dd23931d194 Bard Liao 2020-12-17  787  =

349dd23931d194 Bard Liao 2020-12-17  788  	for (i =3D 0; i < max98373->cach=
e_num; i++)
349dd23931d194 Bard Liao 2020-12-17 @789  		max98373->cache[i].reg =3D max9=
8373_sdw_cache_reg[i];
349dd23931d194 Bard Liao 2020-12-17  790  =

56a5b7910e965c Ryan Lee  2020-07-08  791  	/* Read voltage and slot configu=
ration */
56a5b7910e965c Ryan Lee  2020-07-08  792  	max98373_slot_config(dev, max983=
73);
56a5b7910e965c Ryan Lee  2020-07-08  793  =

56a5b7910e965c Ryan Lee  2020-07-08  794  	max98373->hw_init =3D false;
56a5b7910e965c Ryan Lee  2020-07-08  795  	max98373->pm_init_once =3D false;
56a5b7910e965c Ryan Lee  2020-07-08  796  =

56a5b7910e965c Ryan Lee  2020-07-08  797  	/* codec registration  */
56a5b7910e965c Ryan Lee  2020-07-08  798  	ret =3D devm_snd_soc_register_co=
mponent(dev, &soc_codec_dev_max98373_sdw,
56a5b7910e965c Ryan Lee  2020-07-08  799  					      max98373_sdw_dai,
56a5b7910e965c Ryan Lee  2020-07-08  800  					      ARRAY_SIZE(max98373_sd=
w_dai));
56a5b7910e965c Ryan Lee  2020-07-08  801  	if (ret < 0)
56a5b7910e965c Ryan Lee  2020-07-08  802  		dev_err(dev, "Failed to registe=
r codec: %d\n", ret);
56a5b7910e965c Ryan Lee  2020-07-08  803  =

56a5b7910e965c Ryan Lee  2020-07-08  804  	return ret;
56a5b7910e965c Ryan Lee  2020-07-08  805  }
56a5b7910e965c Ryan Lee  2020-07-08  806  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6870723769864446555==--

