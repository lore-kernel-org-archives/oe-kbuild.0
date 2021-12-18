Content-Type: multipart/mixed; boundary="===============8537372992921034054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov5648.c:587:8: warning: Excessive padding in 'struct ov5648_mode' (10 padding bytes, where 2 is optimal).
Date: Sat, 18 Dec 2021 22:14:31 +0800
Message-ID: <202112182239.n6gt5N4i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8537372992921034054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9eaa88c7036eda3f6c215f87ca693594cf90559b
commit: e43ccb0a045f34838b786e8021dc4838b4af5c38 media: i2c: Add support fo=
r the OV5648 image sensor
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-c007-20211218 (https://download.01.org/0day-ci/ar=
chive/20211218/202112182239.n6gt5N4i-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3=
d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De43ccb0a045f34838b786e8021dc4838b4af5c38
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e43ccb0a045f34838b786e8021dc4838b4af5c38
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/netlink/genetlink.c:1421:2: note: Loop condition is false.  Exiting =
loop
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:336:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:392:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:316:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/netlink/genetlink.c:1421:2: note: Left side of '&&' is false
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:336:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:392:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:316:2: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/netlink/genetlink.c:1421:2: note: Taking false branch
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:336:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:392:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:316:2: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/netlink/genetlink.c:1421:2: note: Loop condition is false.  Exiting =
loop
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:336:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:392:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:316:2: note: expanded from macro 'list_entry_rcu'
           container_of(READ_ONCE(ptr), type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/netlink/genetlink.c:1421:2: note: Loop condition is false. Execution=
 continues on line 1439
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:336:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:391:2: note: expanded from macro 'list_for_each_=
entry_rcu'
           for (__list_check_rcu(dummy, ## cond, 0),                       \
           ^
   net/netlink/genetlink.c:1439:24: note: Access to field 'genl_sock' resul=
ts in a dereference of a null pointer (loaded from variable 'prev')
           err =3D nlmsg_multicast(prev->genl_sock, skb, portid, group, fla=
gs);
                                 ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/i2c/ov5648.c:587:8: warning: Excessive padding in 'struct =
ov5648_mode' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   pll2_config, =

   register_values, =

   pll1_config, =

   crop_start_x, =

   offset_x, =

   output_size_x, =

   crop_end_x, =

   hts, =

   crop_start_y, =

   offset_y, =

   output_size_y, =

   crop_end_y, =

   vts, =

   inc_x_odd, =

   inc_x_even, =

   inc_y_odd, =

   inc_y_even, =

   register_values_count, =

   frame_interval, =

   binning_x, =

   binning_y, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ov5648_mode {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/media/i2c/ov5648.c:587:8: note: Excessive padding in 'struct ov5=
648_mode' (10 padding bytes, where 2 is optimal). Optimal fields order: pll=
2_config, register_values, pll1_config, crop_start_x, offset_x, output_size=
_x, crop_end_x, hts, crop_start_y, offset_y, output_size_y, crop_end_y, vts=
, inc_x_odd, inc_x_even, inc_y_odd, inc_y_even, register_values_count, fram=
e_interval, binning_x, binning_y, consider reordering the fields or adding =
explicit padding members
   struct ov5648_mode {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/regulator/core.c:1127:2: warning: Value stored to 'count' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:1127:2: note: Value stored to 'count' is never =
read
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:3671:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3671:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/extcon/extcon-max77693.c:121:8: warning: Excessive padding in 's=
truct max77693_muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max77693_muic_irq {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-max77693.c:121:8: note: Excessive padding in 'stru=
ct max77693_muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields=
 order: name, irq, virq, consider reordering the fields or adding explicit =
padding members
   struct max77693_muic_irq {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/video/fbdev/hgafb.c:301:21: warning: Value stored to 'q_save' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p_save =3D readw(p); q_save =3D readw(q);
                              ^
   drivers/video/fbdev/hgafb.c:301:21: note: Value stored to 'q_save' is ne=
ver read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.

vim +587 drivers/media/i2c/ov5648.c

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  575  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  576  /*
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  577   * General formulas for (=
array-centered) mode calculation:
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  578   * - photo_array_width =
=3D 2624
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  579   * - crop_start_x =3D (ph=
oto_array_width - output_size_x) / 2
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  580   * - crop_end_x =3D crop_=
start_x + offset_x + output_size_x - 1
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  581   *
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  582   * - photo_array_height =
=3D 1956
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  583   * - crop_start_y =3D (ph=
oto_array_height - output_size_y) / 2
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  584   * - crop_end_y =3D crop_=
start_y + offset_y + output_size_y - 1
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  585   */
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  586  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31 @587  struct ov5648_mode {
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  588  	unsigned int crop_start_=
x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  589  	unsigned int offset_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  590  	unsigned int output_size=
_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  591  	unsigned int crop_end_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  592  	unsigned int hts;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  593  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  594  	unsigned int crop_start_=
y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  595  	unsigned int offset_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  596  	unsigned int output_size=
_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  597  	unsigned int crop_end_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  598  	unsigned int vts;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  599  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  600  	bool binning_x;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  601  	bool binning_y;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  602  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  603  	unsigned int inc_x_odd;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  604  	unsigned int inc_x_even;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  605  	unsigned int inc_y_odd;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  606  	unsigned int inc_y_even;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  607  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  608  	/* 8-bit frame interval =
followed by 10-bit frame interval. */
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  609  	struct v4l2_fract frame_=
interval[2];
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  610  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  611  	/* 8-bit config followed=
 by 10-bit config. */
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  612  	const struct ov5648_pll1=
_config *pll1_config[2];
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  613  	const struct ov5648_pll2=
_config *pll2_config;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  614  =

e43ccb0a045f34 Paul Kocialkowski 2020-12-31  615  	const struct ov5648_regi=
ster_value *register_values;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  616  	unsigned int register_va=
lues_count;
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  617  };
e43ccb0a045f34 Paul Kocialkowski 2020-12-31  618  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8537372992921034054==--

