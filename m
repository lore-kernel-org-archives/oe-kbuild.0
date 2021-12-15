Content-Type: multipart/mixed; boundary="===============5069948902768429846=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/wm8994.c:1450:28: warning: Value stored to 'component' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 16 Dec 2021 06:47:24 +0800
Message-ID: <202112160624.aSphPuVU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5069948902768429846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: efd0b1660829a987354cea6a446179c7ac7cd0e6 ASoC: fsl-asoc-card: Add s=
upport for WM8958 codec
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211216/202112160624.aSphPuVU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Defd0b1660829a987354cea6a446179c7ac7cd0e6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout efd0b1660829a987354cea6a446179c7ac7cd0e6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ext4/resize.c:1227:13: note: Left side of '&&' is false
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1710:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:571:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:345:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   fs/ext4/resize.c:1227:13: note: Loop condition is false.  Exiting loop
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1710:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:571:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:513:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:345:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   fs/ext4/resize.c:1229:4: note: Loop condition is false.  Exiting loop
                           BUFFER_TRACE(gdb_bh, "get_write_access");
                           ^
   include/linux/jbd2.h:1787:32: note: expanded from macro 'BUFFER_TRACE'
   #define BUFFER_TRACE(bh, info)  do {} while (0)
                                   ^
   fs/ext4/resize.c:1232:8: note: Assuming 'err' is 0
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                               ^~~~
   fs/ext4/resize.c:1232:8: note: Left side of '&&' is true
   fs/ext4/resize.c:1232:16: note: Assuming 'reserved_gdb' is not equal to 0
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                                       ^~~~~~~~~~~~
   fs/ext4/resize.c:1232:8: note: Left side of '&&' is true
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                               ^
   fs/ext4/resize.c:1232:32: note: Assuming the condition is true
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                                                       ^~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/ext4/resize.c:1232:4: note: Taking true branch
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                           ^
   fs/ext4/resize.c:1233:38: note: Passing null pointer value via 2nd param=
eter 'inode'
                                   err =3D reserve_backup_gdb(handle, resiz=
e_inode, group);
                                                                    ^~~~~~~=
~~~~~
   fs/ext4/resize.c:1233:11: note: Calling 'reserve_backup_gdb'
                                   err =3D reserve_backup_gdb(handle, resiz=
e_inode, group);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   fs/ext4/resize.c:983:27: note: Access to field 'i_sb' results in a deref=
erence of a null pointer (loaded from variable 'inode')
           struct super_block *sb =3D inode->i_sb;
                                    ^~~~~
   fs/ext4/resize.c:1916:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ret;
                   ^     ~~~
   fs/ext4/resize.c:1916:3: note: Value stored to 'err' is never read
                   err =3D ret;
                   ^     ~~~
   Suppressed 10 warnings (10 in non-user code).
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
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> sound/soc/codecs/wm8994.c:1450:28: warning: Value stored to 'component' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_component *component =3D snd_soc_dapm_to_componen=
t(w->dapm);
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/soc/codecs/wm8994.c:1450:28: note: Value stored to 'component' dur=
ing its initialization is never read
           struct snd_soc_component *component =3D snd_soc_dapm_to_componen=
t(w->dapm);
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/soc/codecs/wm8994.c:3345:28: warning: Value stored to 'component' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_component *component =3D wm8994->hubs.component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8994.c:3345:28: note: Value stored to 'component' dur=
ing its initialization is never read
           struct snd_soc_component *component =3D wm8994->hubs.component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/wm8994.c:3703:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D wm8994->wm8994->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8994.c:3703:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D wm8994->wm8994->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
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
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/w83781d.c:391:1: note: Left side of '&&' is false
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:368:41: note: expanded from macro 'store_temp_re=
g'
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);=
 \
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/w83781d.c:391:1: note: Taking false branch
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:368:41: note: expanded from macro 'store_temp_re=
g'
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);=
 \
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/w83781d.c:391:1: note: Loop condition is false.  Exiting l=
oop
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:368:41: note: expanded from macro 'store_temp_re=
g'
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);=
 \
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/w83781d.c:391:1: note: Assuming 'err' is 0
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:373:6: note: expanded from macro 'store_temp_reg'
           if (err) \
               ^~~
   drivers/hwmon/w83781d.c:391:1: note: Taking false branch
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:373:2: note: expanded from macro 'store_temp_reg'
           if (err) \
           ^
   drivers/hwmon/w83781d.c:391:1: note: Assuming 'nr' is >=3D 2
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:377:6: note: expanded from macro 'store_temp_reg'
           if (nr >=3D 2) {  /* TEMP2 and TEMP3 */ \
               ^~~~~~~

vim +/component +1450 sound/soc/codecs/wm8994.c

9e6e96a197a0375 Mark Brown        2010-01-29  1445  =

9e6e96a197a0375 Mark Brown        2010-01-29  1446  /* Debugging; dump chip=
 status after DAPM transitions */
9e6e96a197a0375 Mark Brown        2010-01-29  1447  static int post_ev(stru=
ct snd_soc_dapm_widget *w,
9e6e96a197a0375 Mark Brown        2010-01-29  1448  	    struct snd_kcontro=
l *kcontrol, int event)
9e6e96a197a0375 Mark Brown        2010-01-29  1449  {
00a6941c841205f Kuninori Morimoto 2018-01-29 @1450  	struct snd_soc_compone=
nt *component =3D snd_soc_dapm_to_component(w->dapm);
00a6941c841205f Kuninori Morimoto 2018-01-29  1451  	dev_dbg(component->dev=
, "SRC status: %x\n",
6d75dfc3e86500e Kuninori Morimoto 2020-06-16  1452  		snd_soc_component_rea=
d(component,
9e6e96a197a0375 Mark Brown        2010-01-29  1453  			     WM8994_RATE_STA=
TUS));
9e6e96a197a0375 Mark Brown        2010-01-29  1454  	return 0;
9e6e96a197a0375 Mark Brown        2010-01-29  1455  }
9e6e96a197a0375 Mark Brown        2010-01-29  1456  =


:::::: The code at line 1450 was first introduced by commit
:::::: 00a6941c841205fbdade825219a828c81008149b ASoC: wm8993/wm8994/wm8958:=
 replace codec to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5069948902768429846==--

