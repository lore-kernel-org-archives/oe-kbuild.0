Content-Type: multipart/mixed; boundary="===============1249909337122051102=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov5648.c:587:8: warning: Excessive padding in 'struct ov5648_mode' (10 padding bytes, where 2 is optimal).
Date: Sun, 22 Aug 2021 20:34:53 +0800
Message-ID: <202108222048.emBlQt2t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1249909337122051102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9ff50bf2f2ff5fab01cac26d8eed21a89308e6ef
commit: e43ccb0a045f34838b786e8021dc4838b4af5c38 media: i2c: Add support fo=
r the OV5648 image sensor
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20210821 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d9c561=
3e856cf2addfbf892fc4c1ce9ef9feceaa)
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
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/socket.c:2856:9: note: Taking false branch
           call =3D array_index_nospec(call, SYS_SENDMMSG + 1);
                  ^
   include/linux/nospec.h:58:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   net/socket.c:2856:9: note: Loop condition is false.  Exiting loop
           call =3D array_index_nospec(call, SYS_SENDMMSG + 1);
                  ^
   include/linux/nospec.h:58:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   net/socket.c:2859:6: note: Assuming the condition is false
           if (len > sizeof(a))
               ^~~~~~~~~~~~~~~
   net/socket.c:2859:2: note: Taking false branch
           if (len > sizeof(a))
           ^
   net/socket.c:2863:6: note: Calling 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is true
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   net/socket.c:2863:6: note: Returning from 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2863:6: note: Assuming the condition is false
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2863:2: note: Taking false branch
           if (copy_from_user(a, args, len))
           ^
   net/socket.c:2866:8: note: Calling 'audit_socketcall'
           err =3D audit_socketcall(nargs[call] / sizeof(unsigned long), a);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/audit.h:611:2: note: Returning without writing to '*args'
           return 0;
           ^
   include/linux/audit.h:611:2: note: Returning zero, which participates in=
 a condition later
           return 0;
           ^~~~~~~~
   net/socket.c:2866:8: note: Returning from 'audit_socketcall'
           err =3D audit_socketcall(nargs[call] / sizeof(unsigned long), a);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2867:6: note: 'err' is 0
           if (err)
               ^~~
   net/socket.c:2867:2: note: Taking false branch
           if (err)
           ^
   net/socket.c:2870:5: note: Assigned value is garbage or undefined
           a0 =3D a[0];
              ^ ~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   drivers/media/i2c/ov5695.c:1135:3: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ov5695_write_reg(ov5695->client, OV5695_REG_DIGI=
_GAIN_L,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/i2c/ov5695.c:1135:3: note: Value stored to 'ret' is never =
read
                   ret =3D ov5695_write_reg(ov5695->client, OV5695_REG_DIGI=
_GAIN_L,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/i2c/ov772x.c:583:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov772x.c:583:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
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
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   kernel/workqueue.c:147:8: warning: Excessive padding in 'struct worker_p=
ool' (64 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   nr_running, =

   cpu, =

   watchdog_ts, =

   manager, =

   detach_completion, =

   attrs, =

   worklist, =

   idle_list, =

   workers, =

   hash_node, =

   rcu, =

   lock, =

   idle_timer, =


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

--===============1249909337122051102==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICE30IWEAAy5jb25maWcAlFxbd9u2k3/vp9BJX/p/aGo5tk+ye/wAkaCEiiRYgJRsv+AotpJ6
69hZ2W6Tb78zAC8AOFSzfWgrzBDXufxmMPDPP/08Y68vT192L/e3u4eH77PP+8f9Yfeyv5t9un/Y
//cslbNS1jOeivotMOf3j6/ffvv2/sJcnM3O387nb09+PdzOZ+v94XH/MEueHj/df36FDu6fHn/6
+adElplYmiQxG660kKWp+VV9+eb2Yff4efb3/vAMfLP52duTtyezXz7fv/zXb7/Bv7/cHw5Ph98e
Hv7+Yr4env5nf/sy271/d/fhw+35+f7jx/nZ+bvT27P52cnFxe58t3v38e7jxfm79x8+XJz/5003
6nIY9vKka8zTcRvwCW2SnJXLy+8eIzTmeTo0WY7+cxgd/unZvY5DCvSesNLkolx7XQ2NRtesFklA
WzFtmC7MUtZykmBkU1dNTdJFCV1zjyRLXasmqaXSQ6tQf5itVN68Fo3I01oU3NRskXOjpfIGqFeK
M9iXMpPwL2DR+Cmc88+zpZWbh9nz/uX163DyohS14eXGMAV7JApRX747BfZ+WkUlYJia63p2/zx7
fHrBHvpNlQnLu11984ZqNqzxt8jO32iW1x7/im24WXNV8twsb0Q1sPuUBVBOaVJ+UzCacnUz9YWc
IpzRhBtdo6j1W+PN19+ZmG5nfYwB536MfnVz/Gt5nHxGHFu4orYx5Rlr8tpKhHc2XfNK6rpkBb98
88vj0+N+0GJ9rTei8tSjbcD/JnXub1kltbgyxR8Nbzg56y2rk5UZ0TthVFJrU/BCqmvD6polq2HU
RvNcLPzRWAM2kejGHipTMJDlwGmyPO/0BFRu9vz68fn788v+y6AnS15yJRKrkZWSC091fZJeyS1N
4VnGk1rg0FlmCqeZEV/Fy1SUVu3pTgqxVGCLQNk8EVUpkLTRW6O4hh7oT5OVr1fYksqCiZJqMyvB
Fe7Q9cQ0WK3gIGHXQNHBYtFcOBu1sdM1hUx5OFImVcLT1mIJ37DriinN203oT9PvOeWLZpnpUIT2
j3ezp0/R+Q2eQSZrLRsY0wlZKr0RrTD4LFYHvlMfb1guUlZzkzNdm+Q6yQlJsPZ5MwhWRLb98Q0v
a32UaBZKsjSBgY6zFXBiLP29IfkKqU1T4ZQjs+aUMakaO12lrbeIvM1RHqsu9f0XAAmUxoDLXBtZ
clAJb16lNKsbdCuFFeL+eKGxggnLVCSEyrqvRGo3u//GtWZNnlPGQpYIZUytWLJ28uV5tZDmhHFq
3GCaYrlCwW73g5TA0Zb0u6k4L6oaei2DdXTtG5k3Zc3UNWkbWy5ilt33iYTPu4OBQ/ut3j3/NXuB
6cx2MLXnl93L82x3e/v0+vhy//h5OKqNULU9ZZbYPqLtsicZkolZEJ2gFPodoe5a3aA76vkWOkUj
m3Aw98Bak0woiojMNLUjWnhCrEXvxVKhETY5R96e1w/sVC9UsDyhZd7ZYLvTKmlmmpB/OBUDNH8D
4KfhVyDo1DFqx+x/HjXhim0frXYTpFFTk3KqHUU/ImDHsKF5PqinRyk5WGvNl8kiF9bQ9PsXrr+3
8Wv3P57VX/fyKhO/eQUegPuwN5cIFDPwpiKrL09P/HY8goJdefT56aAIoqwBr7OMR33M3wW2rwGw
7eBzsoJlWWPaHae+/XN/9/qwP8w+7Xcvr4f983CmDUQYRdXh6rBx0YBBBmvstPB82B+iw8Dx6Kaq
AMVrUzYFMwsGQUwSOETLtWVlDcTaTrgpCwbTyBcmyxvtoaA2woBtmJ++j3rox+mpgyUNRqas6VLJ
pvKOqGJL7pbKPfcP2CxZRj/NGv7jzdD25DZ+aM2YUCakDNY6A0/IynQr0npFmgIwPN63JIt3co6X
5GonV4lUH6OrdAKyt/QMdPeGq8l9NKtmyeH0glVWgGDro8OmfCMSGji3HNDJpL3s1sZVNj2xRZUF
k+oGBrxFWSyJjqHlYTULRApiBUByYMOp0VY8WVcSBBGdKSBID5w4lcSo0Xbs9wmICmQh5eDwAHeG
J92JAs+Zh1oX+Rq3zQI65cmb/c0K6M3hOi/gUWkUg0JDF3oOEpdOx21Am4jZ7FeSmnUaxp3wOwzO
FlKifw8NKii7rMCfihuOCMYerVQFKHEAL2I2Df9DxfKpkapasRJMjfKMfx/GBb/BjSW8stjeupIY
XCa6WsOMwFPilLyFWAFrfzhX6NkLcNEC1MCzKBoUBYMlM6DpSBxaArGiDBaT+vjcwVkH3bxW6zXi
36YsPAwB8u9NO8/gLHyZHS93wDIMYpkJjJo1AEM9I4g/wfh4I1XSDyC0WJYszzy5sGvxG2xI4Dfo
VWB+mZABIpOmUbTJZ+lGwNTb7dX+V9DjgiklSBO3Ru7rwtvgrsUE0dDQugBEBUtH+QUDRnDYPUTN
xvg5kCUzCrIGZ9lhPmT7XdTBoUATGJEcwivaW4AM2o8zysbYIdDNDvsA8yiTTigGfdf8D7J/+I6n
KWnAnPrA8KaPEIcQIJmfBPkcC1ja1G61P3x6OnzZPd7uZ/zv/SMgWAYAJEEMC/HIAGImOrdG3hFh
+WZT2PCejHB+cMSh703hBuwQA+UTdN4s3CQCHcdWhyOcusuS9m6yqBictVqTZJ2zxcSY4WiSZmM4
CQWQpxUqT7+Qhg4fYbFRYHFkEXbp0zFbA9idljq9arIMQKnFVn1yZWqrEAhXTNWChTk2JTOR0ypt
LbV1u9oH8GFquGO+OFv4SZAre6UQ/PbdqUteoztIeSJT34S7LLixrqm+fLN/+HRx9uu39xe/Xpz5
GeM1+PUOo3rbW0OI7oKVEa0omkjvC4TFqgSHLVxe5PL0/TEGdoXZbpKhE6iuo4l+Ajbobn4xSoVp
ZlI/Pd0RAp/iNfaWztijCnyVG5xdd17WZGky7gQsolgozFKlIRzqLRcKDw5zRdEYIDC8+eAWKhAc
IGAwLVMtQdi887BzAhDrUKbLBSjurdzGkB3J2kDoSmEebdX4ly8Bn9UGks3NRyy4Kl2WEfy7Fos8
nrJuNGZWp8jWWditY7mHzFuWGwn7AOf3zrt6sHlj+3GsH0YX1Wj0NuxqbN7YO8wMwAhnKr9OMEPq
e+lq6cLTHKwmuN6zKLzTDM8GNQMPgCcuBWudQXV4ut0/Pz8dZi/fv7pshhfG9laiWxVlXPwV4Koy
zupGcYfofVODxKtTVomENGdILiqbzCXpS5mnmdATIR2vAfuADBIzxI6dAAMSVXk4W35Vw1mj/BBg
DBk2sMDJ+R6dEzKgQuYmrzQdqSELK4bBj8VsQurMFAsxscJebtoLDwiR8ybEFy5UkgUIYwbRTG8w
KFhxDfoEgA7w/7LhfqYYDohh7i5wIm3bOPIbs+hKlDZBPrGO1QbtUb4AaTWbTlaHDeMlhSEBMETT
dDn6qsEkMChBXrfQeJjQhj61fqJHMo8xa5cQ6jv5HTZ/JREX2WmRA7FElUfIxfo93V5pWn8KhJP0
1SE4UlkQC+gdgA+jO7FVJfjl1rq7rNiFz5LPp2m1TsL+kqK6SlbLCBDgbcMmbAHXKYqmsPqasULk
15cXZz6DlTAIKAvtQQYB5tbaHROEnlZ9i6uRRRqgD6aMMcTlOUhalF5BjXL6S2UkWjoorxdgt42r
66WfDu2aE0C0rFHUMDcrJq8EJdqrijtR9JZr2zhEv+iyVZ0EsLwQtPUE6AcmBDAQMQggkcCMl9aV
aoSn4EwXfImAZv7hlKbjHSJF7bAvQQvanFnShQ/jbFMRSZGtEzDoQCJplV1jYFgVVxLjRExiLJRc
89LlRfD6c8L4FGEqpG3C3HDOlyyhb1parklZ6eiBrHSNeKGpVzInSKL83Uml89Re9PTl6fH+5ekQ
XMp4YVrrdRSrPGXw6dblyC1XPqyfGMCf1fxihPG5rgCXxIrdXWa2UhrcQLsTq3L8F/dzPeJ9YEML
kYCCgg2a2lLfArQ+XqTx8Z1bTDTRRSoU7LBZLhA06rg35ip5dC2SAMfg7oGTBblP1DV5w4b5cc8V
AX/Y0oI/llQiotjMOvcDFbTCuruW6K82HFS0YMlNhRE4tiePolBHt1avwwt45R7nRdBCmjX6FVfn
NRxVjvqQdwACr7kbfnny7W6/uzvx/gk2FJO4EPlIvPNQqqlasQiOCxUU3WrRTWtgdR1MnKQrHsBr
nC06jEGIakXBG7u6cfBtcRSEapNq3hQT1TsD1mvn3SJtnPeaX9Poj2e0rV7dmPnJyRTp9PyE8hM3
5t3Jib8Y1wvNewm8fvHPFacxhaVg/EbX1zC9Mmnje45qda0FWmlQHcCIJ9/mrSB4SN0mKlBeKUjV
fQ8h6bKE708DOVqBdOTNMgQsg8x45JOB7jJVNM2Z9dheBU4gZrmSZU47gpgTL+7p7FOR2ngZZk6Z
JlBFkV2bPK3H+UobNOcQ7Vd4txfY7yOh3CgkZ2lqIqNnac6QdELc7tnAg4jWpV2dpbIQUaR0J7rK
IdKo0NfULUAmuDCCtjG7X6zkPN7TP/vDDBzS7vP+y/7xxS4Jbebs6SvWo3o5yjZk9wBEG8O3V2tj
gl6LymZhPdktjM45r8YtbZA7xAiFvXCyNEqIC7Nla26jnKCzvrUtnZz7ihHQl1RZS1VEk5i6aANS
kgfOdPuHc/hYVyYSwYd8N/E5RgVL2iP0USaeg0cb/eqUwSo6rFfKdROnOuDEV3VbX4efVH5yyraA
+Nfgv9zU0RujK+zzel4oVQm3GUsymnV9VYly04lnWvmgxvGGcmDbFN8YueFKiZRTuSHkAWPZFptF
BBavbMFqcJzXcWtT1z5Wso0bGFCOlpsxKlywpJqlURdpqH7YZCMsxUEudDzZITBK7J5PkkU62oGe
GLWTljvqji2XCqSmHn1crwAoslgWrR1z60VD0lRgP1I+2qiAOhGJd+IzTa4SlApJqYvbTgnBHdj0
qXULGcYtTswW8dYHVQ6u40ZD8A4WuV7JdLQ4xdMG6yLxomDLAKfFzslnbqFm2MOqYNNVr1Z0K+7p
dtje3nqGPSJhagppVQcVA/jbqTfxhSPCSWdiE++r+/8svO+CkMHICmRISEo5EKSBaeyi6SEvFuKw
rh5ulh32//u6f7z9Pnu+3T0E0VanPWGUb/VpKTdYbYxZhXqCPK5n7MmocDRm6Di6e0rsyLvC/398
hNut4Rx//BO84LTVGROpkNEHNoBvapFP7EBYe0BydLMkt+mHJ4WMskw5DJVOnkbZVh5vpibjL6cX
j0+xeMzuDvd/u7tTf8ZucyglG6KGKjK0VlSTpPs8DlI6C460yXgEgA5PwX+6zJMSJVVKYgc6cxnM
whoYO/vnP3eH/d0YaIX9dhX0Q2UkoTP9fom7h32oQXGFbtdm9zwHjBqaBZqv4CWV0wp46tCBBrQu
OUwaQUfqEsnxYt2KegD+r3jVbsXi9blrmP0CbmW2f7l9+x8vkQOexiUmPOwIbUXhfgytrgXzpPOT
VWAIgT0pF6cnsMQ/GjFxyY03jYuGSoW1d5CYVYvSGItQRPGOPRCBicW5hd8/7g7fZ/zL68OuE6th
MpjC7bNFE4J65d+quavU+LfN9jWYXMEAEmTDzyq2L036L4dpj6Zm55bdH778A4owS8eKzVP6Vj4T
qrCeGGKoKJXQcWxNkrX1Cf6p+e1diDhxEyaXOe9HGvmuev/5sJt96ibvrJKldCXnNENHHi07cP7r
TRCG4AVIA5t9M3VwiNI2V+dz/0IUE1psbkoRt52eX8StENuDpb+M3qXtDrd/3r/sbzG+/fVu/xWm
jio3MlguSRGWX3WYLEg5d3chaCo9WG6XLF2VhNdF14IAaAwo1u7qljy835sCDCdbhEnJAYvYx4P2
CgwTdNnESzo7rSGWa0or7lgImSCYjpAyhu34kq4WpVnoLYtfzAnYHqxQIO7n1/EttGvF+1aKICu6
ve0GXLHJqALArCldsgziKwwsbOo7eri04WGR3fAwy/a4ghAzIqINQ2Aulo1siMczENY7P+CeFRHx
BViTGnMxbdnnmAFAXpstmSC2OeZitOlu5u4FpiuHMduVqHlbL+/3hSUH2qTXJUOEa4uS3Rdxl7rA
qL19ShmfAeBiUEXMfWApQCspoY13fNrHteHx4LPPyQ9XW7OA5bhK3YhWiCuQzoGs7XQiJkR0eJXf
qNKUEjZeBNdeUakbIQ0YBiGSsUXIrtLBfkF1QozfVbOpdovC3OZwaoMOH6cSRYhF0RgIcSGgbQNT
zFCRZHxFQbG00uW0wT1eaK9X48m0JqEVLkyyRRztd+5ibYKWyibIcwzr1DxBT3qE1Fb+eB44/mTE
OBjCluIumacyXd6QeGI5iFc0n1Hdy2Bof6AdN0+Wo521SinqFdhTJym2niIWJzQ90ZuyY2Qjs8z2
FvFNv5QKbPj4sVSsghJFvEnJ5iJu7gxriddI6GO6RO2P8hFDOdEFOpaLxtlAW1dliZgyBiygaKmT
mTWqdeykwfB19148AdPhJVuA1GAWEv0gVmOjWhLm2pLspVBQxzaMHZQDRgz8StS0Hwm/GioMiX69
8sCpTnwWoquWbNmxDjqephPX9lnq2MHCzgiXvO8LKQeONmAILX874LvThXCFCtTG4XGbSLaptsFz
QrwKNqt9ea62V76CTpLiz925k59TpGG+WOwN8Uh7V9X60uGeB9+xeAXKVAjlF313N8Xjo+ig3jRl
9JcfBl2ZeoERJurbOm1QSFsi3OPoRG5+/bh7hiD/L1ee/fXw9Ok+zHIhU7vRxCZbaoeDo7cWMY2s
Cz82h2A/8C9/IGIXJVmI/C+xQNcVWNECn0z4OmGfCmisXb+cR9bCX04rLfbdr5l8BtByNeUxjg6c
HetBq6T/cxjx3kWcgs5Zt2RUTsUnig9bHhSLLeAzrdGx9O+wjCisABGy3ZRgSMFEXxcLmeuxmbVv
Ufsbn+EVBeoNWUbXPgbrY75yPvxqSqcBtnDQ7u3IYAyXUrVEgAxhsTcp+0rGfgzbKbdBil5tNajn
BNGq+QStD6vsH59Ih6rGgWWaEn+stvSno/Ze9UqcEYhIzqoKT42lKR6zsSdH2cPuuYlZ8Az/gyA3
/CMLHq+7vd4q6Nxf83CXai0I/7a/fX3ZfXzY2z8tNLPFQy9e6L0QZVbU6FWHPuBH/OrFTguRdp9A
Rj/cPvIlxKXtVidK+Ca1bQY59v/0jsQLkvbytrUaU/O2iyr2X54O32fFkMQb3zUfK5sZam4KVjaM
ogxNtm7dPmKrMJOAhT5UT4ARITznFGnjkkyj+p8RRxzP4V+jWPoXsu1y/Nfq/vstrxqAqgF3N/32
lt/V9w0l6AgPolDeokPFUWcDlEr8uRIXvZvOdXUdrK5tCQPEUPG7E1e6KxGnBBkZTdW/dgJn99D9
WYxUXZ6dfLgItGK6tDrcoFH7aguxrgZd7Uv5+glRiHkKRrjwv14BXHK5m0F3IOApbYREZcDD2z74
ORlG9TT/4hob8UGGvpx/CITBw+BEXzeVlJ7c3yya4Nry5l0mc9o73ujxI7IOT3TZOXz/0OWrhkHg
ILlSYazb/VWWIcWcdo+luojrGG6r7HOYME5xVfObKGJsC2LsH5cIMFBTTf0hrGAUG6+0r7JaGzVt
hgbb0VeGlvuXf54Of+EF1MhYge6teVSrjy1weoxaPnhbDxDjLzC0Qb7XtsVfD2KdTzx0yFRhnQ5J
hcVglRz9ZVrZh+OchCKiDFcnKmdQ8a/g0JceFb5UxXtH8K9YHkxdPANTVfp//sj+NukqqaLBsNnW
n00NhgyKKZqO6xbVREmhIy7ROfKiuaLKTC2HqZvSAfQhd3JdguWUazGRg3Yfbmq6/BCpmWyO0YZh
6QHwWAyjH1hYGmDMaaKo0GtMnPawXL8RBTJqqpOqaw67b9JqWoAth2Lbf+FAKpwLZodoscXR4X+X
vbQRy+l5kmbhpys6t9TRL9/cvn68v30T9l6k5xH676VucxGK6eailXUMbLMJUQUm9+4fC55NOhHB
4Oovjh3txdGzvSAON5xDIar/4+xKuhvHkfRf8anfzCFfidRi6VAHkIQkpLiZoCTaFz5X2lXlN1l2
PtvV3fPvBwFwAcAIKacPuQgRWIklIhDxYUVTvTlrk6S323dp7arCxl6T80RJi1rwqu9LPsltZtqF
pvaim3Fyu8CoR5+mS75bten5Wn2abZ8x3FfXfOYyvVyQ+gb05VNWqolFZQMYL7DKZoy4T+55lHSm
DUHqQMxKCrNJMRubL0qNygtEtfckMdFOcOqMid24IlBa1DfER5TVGZqehkQNUSUSVIwz5nrYN6SL
emKS0MJOKcvb9SwMcA+PhMcqN96+NMbjwJSaneLfrgmXeFGsjFBCuS+o6ldpcS4ZHncvOOfQp+WC
mhUXQHmSGIu2T3K4S1J6i9KHf/3L+hjq8zEQ6U9oYUXJ85M8izrG97ITInQ4qwigXslDIiuJkxF6
mBMBo3tJi0empUogJTnSOcBEwiZPcd1VNV1BHktsa61sFKdqqwHW7NO3KR2Zt0P3gQLLSuBYoxZP
nDIpBbY/62MYYLvkfeuimkR3jqzTwXVQ2whoBJxlrVaIMVlPSzRgATMu2a5MffP5/NFh3zmDVR7q
HcdnuF7SVaHO50LpH4U34J18PyneI9iyvDU/WFaxhBpVYsVFRPTpVg1vRW182/YQYwrzWVQ8Nf4F
Y8XbHazoYOKGMhBen5+fPm4+325+e1b9BMvLE1hdbtRJphlGdaVPAWUK9KO9xm7TsAJ2CMn2IFB/
LRj7jR3HqH9rm4CLY9MRaJ/fmAlcTop5uQe/N/zbb/HxLKU6CVNcANAC7xanYSd5v+sBvgEo/mNv
1bJSzUttiyxYJAqzL3YpvN7XSj/vdzD/EmsEv9GfMHn+58s32/3JYRbSstp2v0b/KLgtOqUR7AMZ
rmtrFvBVm5bUuxUpudV2SdGkHLlqVaVYCrn3o4Op9bBxhDZA4Q5wQGWyzJxidIoVS+eUpWmXPWtd
NrAq/RTzFRdfYGxLQlLRfoPovg4U7Rroj8qlGH7wga+P2CEMJLD+weYwAo85OUWBn0pAU3OEpjH8
hNBVdj4Y7mjAHaVaOBwu1ImPq3mIT6lp4FdBjzdw/NSHMYy8CuEv/NDvnNHAWdLfQSHt29vr5/vb
d8CDRNyLYRC2tfqbChgEBsDi7i1odFMbgAFqJm1Inj9e/ng9gzsgNCd+U/+Rf//48fb+absUXmIz
lvW331TrX74D+Zks5gKX6fbj0zMEKGvyODQAnzuWZfcqZglXX0gjbOiBIEfp620YcISl9/e9WvPg
B4x/teGL8tenH28vr35bIY5eu0ah1TsZh6I+/vXy+e3Pn5gj8txJkLUf6WmVT5c2Lp2YVYm7YLJY
YLgwwGiM8F1rv3x7fH+6+e395ekPF1zmHnARcI2NlcKTd0Yn0Jdv3bl0U/yYuBMfzfX8nqclHlrC
T3VWuv63fZqS3I45irhbszxhaWFfx5eVqWlw+9UvFvS9Hjxpv7+p6fM+HqDbs75Gdq7X+iRto04A
jdY6+Jq6YkMlFvzkmEv7rZkO271CGZRgYCBWkF6OGfrbY6eNvdAx9Rbu+jjYuPW9MqBpOrdww2CD
W0JSiROxL3YM/FQRlhXDAAb2rhilBYIvE77As/aukO3hCO9X+Eb50RIAhTF9WdoVqd1WUV5TVM9G
PnlhQazomFHiMQAgn44pgEpFah+uhS3hVHznXEOY360I40maVFpMdJzkbc/BJCnLRDEt035KoC8z
ji23f/Cp1c5ZeoZu3ckGxK3eb7XrELrTEIt3iI140jKns5qlAPEZPiIurmV74V/4dUkXpJmeA7ZH
9HC0Qhr6Nll6QKEE8xjH29vl9prJ3HdA1E89V+T0tH98/3yBwbj58fj+4W3ikI1VtxrCj3DnUBx9
YPmEy+IptobstBACCTU4ygWS8WSGi07tyfHrl4AsQDuka98pO55xygbechCxaO8n02HQ43BU/1Xi
ASBjG9zI+v3x9cOEa9ykj//r6Ce6n4VrmoA0DYAIN8xw8a6NJZOvULHsl6rIftl+f/xQZ+GfLz+s
M9Ue6q1we/aVJzz2ljekq7nlPwHS5QfblLa5e/5lPTkv4L6X+IzAEKnj5h5uEL1r4Z6eWnR6zmxh
/hcZryvsOhdYjDNhfmg1pnYbuD3xqOFF6mI6CiJA0rxSlJCMMEHonINLMgxsljh4yH26OsHZNNWN
U9SzlGVeQuElsEia2KIR156eOEYAfvzxwwoS1BYQzfX4DXAbvNlVwI7XwOiBCd1bkeD/kE0/eZfc
uWQS37JnKrZUdnA9YzWO+WHz7TigdaEta3clgDKBN4VDllHc7prGr1l9rttVUxW4EgscIt5fpHMZ
hZfo8WE9W1wsQcZR2G5TRthmgSXn9efzd2JU0sVitpv0zNPq3D7pyM9TpdY5LgLpApTeomYWejJd
m1HmfYLn779/AZH+8eX1+elGldmdZpiqoGvM4uUyIHop08nSKPcmySlE/fFabZTJl4//+VK8fomh
lZRxCfInRbybWzZf7dmcK+ks+zVYTFPrXxfjsFzvsTHxKmHerRRSvFAxvffkPDfRw04Xu2RYLhAh
dK5ETa2YnnV8hwMtiXIjsHnCBg6TnTe4ztZ1brvmmvPs8V+/qIP0Uelz33Wfb343G9SowvozQFek
1GaWiosT2OZLCBTDYVg9e4pPzxrHYb9Phn0EScbAOq2qtMp/uT2sYhJF0Bg4OujOXdaPZPby8Q2Z
MPCXElDRpqiPXewvVZIIeShy97EthGgEiMGX4Od4tUuobTenmeGdop9rZhtFtZ7q/ajwOFYL7w+1
1CwbjJ9fMaHjo9LBNLFnmW8iJnkj/76ud+tE2jHcqsBS161NSzUsN/8w/4Y3ZZzd/GV8rVAhT7O5
o32nX0vsBbqhiusF24UcI+/cVAntObXQAG0nxJ4h4lF3SxV6XxWo4NNJYZf1PLv0yCN6QWvUV1zF
Smprebqyg1IoQBcmFGBFVadqXTsxbCrRePKhpEMRfXUSushHJ62f33aao72q37mNwFFse5S4xEVP
NgS4P3bSjH+1H9ZpYRaVMegTLsb4mDCaHkxSS9y19WTWrNe3G9z1pecJwjX2PqPjq6Yd1bRpJFPD
00F89VjPn2/f3r7b7oF52UE3mSPxlHHMKuukD3uhpan3ejrPZVEBupWcp6dZ6OLVJMtw2bRJWeBH
RXLMsnv4hLjjQJRBeCvhi8DymhDtarHN9JmOjJuI5WYeysXMUkDUyZEWEtBiYaqI2I0D2ZetSPH7
V1YmcrOehSzFERXScDObWSKNSQktLLp+9GpFWS4dLL+eFO2D21sM0q9n0K3YzOygpixezZfOazSJ
DFZr3ENETmTNfowtAzVl6zI3CK1MttzZ7stTyXKBufXGob9aTIqaDKohrGrDwEU7NEcOL0GSnxw3
Jr1ldWhpmV2igSNzLigNIWPNan2Le790LJt53KyQ1ndkpde2682+5LKZVMt5MJst7IPCa7zV8+g2
mE2magfo8O/Hjxvx+vH5/vdf+uGMDp/lE2wgUM7Ndzj4ntSqfPkB/7VFuhr0XvTM/A/KxZa6a4lk
4LilsVNL52quh8fEj5+Bqv5cYagbnONkDPCnjBBZlfR9vsP2AR7vHe8AiCFR3YgheJwSf4GlqmVD
cuxZxHLWMoGOvLN/OjfZIhlEKwkuOZ3qMpnsQGyzwnmaEMtg3QQcpYfQYV6w5ZzfBPPN4ua/ti/v
z2f157+x67StqDj4f6C97Ylgs7pHe3yxmkHSYbH6zgXAimrDumsWYzEgxGSAqx7VmOyuznsDoG+J
BdrNyAs5igr9cC59DKEU6N/uyCrcOY3faRSUCx7uNSf2VtUxcPbDp31Jkk4NRQE9k7gIidQSOSa4
lLij9E8WSwIgVvULNPCCcG6pj3gDVXp70l9Gv9FM5D7xGtNKjDuPFu4sd788zYi3fsDQT/kqKpnO
I/V2is/3l9/+/lR7oTS3oswKMnVMJ/0F+E9mGTYdAHlwBFQYj5M6Y9W2M49dYGKezvERUmclb/Ah
vi/3BQrIY9XDElbW7mHdJWkA361A5Sa7gB13lxavg3lABSv0mVIWgwoZO6BVMlXKssSEJydrzd3g
NBZzT7YYSeYkquW1TmTswQ46c0iuDJsl6yAIWk68LFnCbJoTzrdZ0ja76Fpb1DaS18LFabwjoJXs
fFWMdwCmWeHil9cp5R6cBiSBgM5UFGrwr82CY1VUbj91SptH6zWKW21lNk9du4skWuBOxVGcwYZI
uIjmDT4YMTWrarErcnw5QmH4ajRAtiDaUhlRHHmnw7GHbhrlmN+FlaczhHlnKOa+5WQ6iaMzrvX+
mIM7QA5PzuNekTbL6TpLtCP2LIunInhScXf0nUKQXux5Kl2fzy6prfE5PpDxTzuQ8Tk2kk+Yy5nd
MlFV7lV1LNebf1+Z77GSN53e+JsekkWH1zoLzNzYDEcP3pOmhddScdnIyzStNHEPExOvlQrsEtPO
1bmijhWlIfEwn5ogvsfdtDzAEeTOXUzEw6tt5w+dHXYcZJ3S5iU81parsw7wBFt/L5mWZAD60P14
f2RnG0/XIol1uGwanATKj9OyAN0hIXnm880IhWqHOzGrdGIJi4bK4p9rI2VB1o7vrl+zK982Y9WJ
u2Aj2SmjvOLlYYfXLw/34ZWKVC0sL9wrvbRZtITjv6ItJ+q7TZXni+Tt+Up7RFy5k+Ag1+tloPLi
0VwH+bBeLyYaKl5y4c991ffbxfzKGa5zSp7hEzq7rxx0aPgdzIgPsuUsza9Ul7O6q2zcYUwSrpzI
9XwdXtlZ1X955QEeyJCYTqcGDe9yi6uKvMjw1Z+7bRdKIOT/v61lPd/M3B02PFz/wvlJHZnOUaCh
bBJcwbIyFgenxQBCfuXY6eLLeb4TuWc8VXK2mmXowN5z8Bbcok9g2YXzXAJAl2NXKq4ehXdpsXOv
Xe9SNm8aXMK4S0nZT5XZ8LylyHdomK/dkCOYlTJHvLqLwU5IRXVW2dUpUSVO16rVbHFlzlccVCPn
xGWE7r8O5hsi1hJIdYEvlGodrDbXGqHmB5PoOqkg9q5CSZJlSghwH/2F48fXyZCc3Ma1tAlFqnRd
9cd9LZEI5lHp4D4bX9PIpFBbqFNgvAlnc8yzwsnlrBn1c0N49itSsLnyoWUmnbnBSxFTkQLAuwkC
Qn8B4uLaXiqLGHzrGtyoIWt9XDjdqzNt1bv66Y65u5OU5X2mJjElI6rtFBduIdwwJ04LgcGI2424
z4tSKXKOoHqO2ybdeat3mrfm+2PtbKUm5UouNwdAvishAuKrJRHBXaeoU4NV5sk9B9TPttpTSNNA
PQEInkChXqxiz+Ihd6E4TEp7XlITbmCYX9P2zcWSXXh31cQaQW+dHU+aqrGmeLZJQpjvRVnS8Bgy
8p/WGk1A+3sqPBCkVOSF1y4+QmJ+WUN0xoRq1ZgSCCJliadLL4Ouaf/28fnl4+Xp+eYoo94wr7me
n5+6gE2g9KGr7Onxx+fz+/Ri4my2PevXaG3MzKmD0eq9exztL73IUu+XlNTjFprZsco2yTIgIdRe
3UZIvSpGkCopHBkd4okIp4yyEjJbYhf6dqGjvoMRuRLryDG15XqEXDE3AtShDRICRpQCJ9jA1XZ6
TfA/3Ce2AGCTtBmU56794kzdhGQN2F3xFX78Kmp5bGkoHLUipcDc6XRo+BhBO0qcMkGu0V5//P1J
3taJvDy68CSQ0KY8wVGNgLjdgp9K6ji5GIqBdzs4QSGGkrG6Ek1HGfzmv8NLFC+varn+/uiFVnTZ
4E6Ngg0wLF+Le4/BIfOTok47yE/eGrbGivL/NDkP/D4qTLBZl96nqH2kXC5DRw1yaWv86WSPCZNP
R5b6ECVoDXd1MFvie7/Dc3uVJwxWV3iSDmWiWq1xD4WBMz2o9l5mAV/K6xwabQHVYwa2OmarRbBC
voyirBfBGqGYiYkQ0mw9D+foSANpPr/Ukow1t/PlBs2dxfiKHxnKKggxcXzgyPnZeY5tIAB4CNhy
JEIbFZQJpS7O7Gy7lI2kY07NN3EnVyFmGBlbo5b7Av0aczXLsUGvs7Cti2O8VylopfU5XczmmFg2
sDTkColZqfSIi02OXFC58ZvUB/2MF7nP6J1q7JH+2ZbS8W8aEluWlhT2bc8S3WNzfaSD6UD9W5ZI
paASsLJ7H5gmKu3JickbWeL7PsASaZlGKZxEBE/YeAonpb5LJWlDC5BqII6Fp4RFw2qNni7iclu2
8JCAf7E7kk+Z/v/FIoiWSl4JQt8zDEolTLlu5AUmNe2Wm1v8CsdwxPesxIORDR1GFPydLrCcZNM0
DLubM3TPp910b5grxpfK7/1ABhGcWhvqiAbsNseu06e1LGdqKiN5R455gudMMDl7IMdF5F7jDpTd
NsQCjEd6ZYumTnKboZQjPDyd2YggA00L3yzGSFIk/CzyxI1VHch1lhB3EUPZ2lp6qStnVlXCBgUd
KBnb6YsErF2A1lxUEUWKHGT4kQaouRyrqz6LRP1Ae/mw5/n+iM3KgSWJNvh3ZBmPUXPXWPOxiiAq
ZdvgU0guZwF+7zrwgIB5JJABB6amJHAJB46yqbDTY6BvpWAra8jN0tEIfi5Ar06B9QYuJjFRrc0l
SqUxXePas1xpMQR46sh2iNSPa0wl3zGJeut3TGbTVJNTKbqLSZdhr5Rxxe2nRKxEiHEoedWFoo/1
WxwsuV3fbvBm2mxVMAsDf9fEGEFfbzPbfoiS23p+S7bpqERY0cQCd8SzWaNjGMwCXG2c8IXX+wmq
dpHzVsT5eh6sr3TW5l7OlniX4/t1XGcsWMyo/hqOXRBgwprLWNey9OLbEAbvAJpyLOhrTJs5YZvZ
HLNuOExwsFUF3qA9y0q5F1R7ObftCg5lx1LWXKJ1S4PqKG/iOWXgs/k648KVTu6KIhFEc/bqbLKf
mrZpIhVq4hEZ5Ure364CnLg75g/UqB3qbRiE5PrhlFOpy4T539gces9pz+vZjGiiYbgw2ZRuFwTr
GaagOWyxOltmM7ySLJNBsCBoPN3C+yyipBj0D6p5ImtWx7StJeElZrPmvEEdlpzaDrf2E4nORsxz
DUlDfNCkbrf1spmtcLr+fwVhSxfoSjwi6tZbKfEJk3p92zSXPiIcUxCOXkhBAOBOmiLqMMCUfodR
xnoFExuHIoezWXNhrzMcC6rZhnx7tcFV1qI4G85CFanzJpRLk27whEOsg3BOTAlZZ9uaPJdls14R
CKtOL0u5Ws5uCV88i/GB16swvPZRHrSUjLe3KvZZd47Oic3uTi5dZACnbADzF3hLO8OAkJh4UWVi
4c0DneSC50CKUjy9lK0dr9Wn+PNOp4dJFxDj8wfBJCX0U+bO2d6lYQdnR2JTdvQWoSMte0vw/vH9
SQM1iV+KGzBPO5F7TqeQUEePQ/9sxXq2CP1E9bcbFGmS43odxrfBzE8vWeUZkrr0GOwuSL8MORWR
Z/Yx6RU7o7PEUDuXcK9gv2YZArQ3WbUaHd/k1BHK6FKTjXnVzXjUJCQLKF3uMPYpbS6Xy7VdyEBJ
8UU/0Hl2DGYHXBEbmLaZd+oO15DYDBrie7D7D3PT8Ofj++M3uCucBIzWtaOsnrAxhwcnNuu2rN2b
dxPQp5ORTKlGdgfALcAy61eAfH5/efw+DfXu9CQdkhzbBt+OsA6XMzSxTXhZcQ1zhAH52JxlTlzG
WjzBarmcsfbEVBL+rJzNvQWTxwFvV2yCcnCig49qE3jDKpySaUkrwol51R41bNQCo1bwGGXGL7Hw
puZ5YuMaOHWzHDCgHVwqm870g/TtCSqgRl8jlvnBxej3hHc/u0BytKRKYjYUp4yz2puo7Am9Ow01
1OF6jVnPbaa0lMRwZGI6joD5NUJmmFjvt9cvwK8q0ItCX/dPowxNfhja1IA++E3uSf2Uo9s9cA7z
JfA43HPaSrTms1//VyIovCNLsRWnC40CA7m4m1RqksllJOM4b0qkNYZwfSxkHKyEBOEZ7fNApimu
BNNRozhbzV0pyqVgLfNZuzPya80g2hGPBHBZfTaXqfPDKWXbrdBLZHLInQCnMe0SP0w0s28Ek5ZX
JS0BKPJWqjlQXuu+5hL5NuXN5SGIwSsO3uxMxE7E6kyabrNTFrJrsBk/BPMlNv9K9LWTflar1Yd+
g56g4db7ISNY7KU4IC4556rf3Liu0v7Ww29wDvhNAKtKhNXm7Y5Y4HnxUBCO3xp8Ui39HLt+2J96
dE+kOQBX6gGgjKXW9+Czk9foI5aVvoBwJBR0H7C8s3B/ii68FdnxRJkJMCAnKfFqVRZ17mXmNuT/
GLuy5rhxJP1X9DgTsb1NgAQJPswDi2RVsUVW0STrcL9UaGzNtGJly2HJs+799YsEeOBIUP3go/JL
nAQSCSCRuTWCQe4vY3BjhCTjtQg91PCLsqCWzdMCWM8jF2CTRail68Jh2SHqALR/NW0uRpRpArxg
16rdC5mE2421LTwy9bzCvvh8sUMYOI9BqYDufdjhjHvpEmlMxX7fmlcP8FvGJESzFQNgl+9LuHSB
j4YP1Vz8aT0eUco6tyOxzqAQxvVHZwJMLrAdRV7bh47jqDv1Mlg5th/VWcAJ6OwBWRkF0RyxmzI8
S+QteIbMhardlTsjTiRQpQUBeGcy5gzN/f4QJSg0Q2W6pBGb03WqVvPj+e3p2/PjT9FsqKJ0XYfV
U6w4G7XFE1nWdXnQQ6WPmVp3vwtVFWiR6yGPQv1YbwLaPEtZRHzAT7sDABI95ukBQJv6mre14Uxi
teF6+tGlNGy2zBpZZg+yj+rdcbPEl4B8500lONpdOna0ir0TmQj6Hy+vb++4OVfZV4SFuKnUjMf4
jc+MX1fwpkiYJzyZguF5+Bp+azyKB+CVs/HWwd5j2qDAxhPvUIBtVV3xgwFAD/LYzl8p9XZIjFE8
IqD80FXPWOrvdoHHIX6bMsJp7DnbE/C5wqX5iLWd6yAeJIVvjPR540ZakMLnz9e3xy93/wR/z6NH
zb99EePu+c+7xy//fPwMVtC/jly/iN0TuNr8uykCcnAo7c7xouyr3UF6p7FdkVhwX2fobsViw/wf
2iwevzTAVjblGTumAsytvZRpKiKhimN77Oxy78umrdEweyCtJ0s5c1Dm2dwMT8LuPrzayfqqcUIY
aLAniEX5U6xaX4WKKnh+VRLlYbRfdw6DZOVcN25AHrJjfxPKgJP/8e0PJSXHzLUxZA+/UdJ6mrzt
K10Ge+Wj1Sl4UBYJwYCyxHIto/dIP1QYAt69TnbsXDm4wKuc9+53YQEh/w6LT8XQlYC5ZqEe0RvC
vQnK6L57AYoLSm4q0BkEsM+NxzR9ixk19a35unSPx84xHYuLn+5bBbV8tf3dp+cn5VnLVhkgWV5X
8OzzXmpyS6U1SB5koojre3DBxkk8V+Lf4HP/4e3lu7vCDq2o4sun/0EjqAztjTDOb47CqGaVjOV1
N754ARtzbwjItxeR7PFOTBMx8T5L9+5iNsqCX//beOni1EerTnWArSR2WC7aqw7dTIJ0itnCYxLl
N5MROnEct5aoUy6rlTdEK5eq+2A/j1bD2Dap1rPqP/Z6NG2lGVpG8jPxdsZ2SxJenAbrVGn5HCxa
qvI1+uXh2zexSslqOYJNpkui69UK/aAaLk9ybGJTtIPdhNmpiE4tLlm7cVoG58n4XYNcUgb4J0AN
V/SW66udAXf2mYIk7+sLfpQg0cqjRElQPhM+o/HHZZ9veNwnV6fEpjz8TmjiHQhZk7GCiuF73Jyc
xO4BpY0fsbPgaYjl5st1ST5fOcOVMQlf8iINI2+m7mO7aSzcth7fuyujTwkZMY9/GVG4OloZn9uE
cH61vnQ18MTtuLUvKcCQoH6oVBdUB/AB5+R56UmcRxxt5GojZiVSUh9/fhPS0G3c+DjFnmWKal86
jJjn2kjNgMsNVyU0ERFggoPaPTxS0TrITSXqCWKBE7uYNt9yltjFDG2VU04CW8exek2JtG3xF3qT
2gVnXfX70XJ7A/RNIUYWxYzylFjrPorFCo5hz45sy9KAMYuoNF6nlLoN0wgzlBhRnoRY1yex6e9V
Al3OBsa9mTmvO8YeBpsOHmNkSuyhN3xorjx2Sva//phg8DFg5XVpeJoark6RLzhHLnO+rCNtvDtp
9TkH7nHfoDq1vlXHFfkgAxLCc1yC7+YnplJxUc+9uvxMRR5Sz7N5JYuORXYGw3VcrLidIXvj/PT9
7YfQkSxZaXXTbteVu8wJM2t0hVDdTi1aNlrG9FFlyChZIvnlf5/G/UfzIHa/ZkUuZIo7DG+80MVq
YSl6GnHDAELHyAU/slx4vG/YFpZ+h7tcRVqht65/fviPbpogMhy3Q/tSVz1mem8cls9kaGHArBZq
ECaBDA4S+nKNPQD1pOC6VbGRIgx8APHWHH2JZ3JwX2IWeIbFzJFwT5US7q0SLwP09bTBQhJdJJkf
W9tayJCs4B8eOyeeA7a2tWGvotPX4qbqbPtLgz6laItMMWp71+zKU8pssoxSZ9HgFHsHh7BiTQxi
o8c22SCmxUextRl4GjHMemFiyS80IAxLDB8ixhYEnYEHvqQc290YDJoV2UTvN73bQIOoPCdZxCn5
5gNNrvoNugWYdws2uC8++MFiuJ3E9xIf4nY4Ny6fNH1HOwOMmhPcP4/FgnSIRMRS4/aKHCm6teIE
gMZh2npPiFeSLnnKzl3lqYcwRmMFTQzKnka6MbiSKGYxVpVJA1rJR7GkIZZcfJWIMHwBNnhS/Aha
56EM28bpHEnI3G4WABNVwAFueuzSoZSvV6lvNmGE1WgaErvstCvhooim+n3QlL4bxIxnWOmnvCdB
gB0Cz/Ur0jRlhol0d2BDTLgSPugNbaNfysmft7Nuj6RI40miOlJR1kgPb0L7wCzzxrgGRRIRoy4G
gi2qC0MDz4/wtACxdxPH/sSYEwGDI9Q+iw6QJPHkmtLI46Fp5hlEm1fDQEgOtGQBxNQDJIEPYGhd
+9Dj5GDhyJMYfWM/c1whcs0BzB2E8lhjxdxzcJ27Ws49Cd7l2WYNYXt37LqVbgpwxNftcDfwS6iN
ti77xuMkbO6Ajdff1swC5ovrLMO1XevEXPyVVd0tN55S2Wjbn7DuLfoY9eu14CSmyFAqyroWAqpB
kGnD7JRVsXvRvdhdxfyVxC49YFs3U3kwRLc7DGFhwnoX2JnOz2b+Pt836x2+qxnhXsPCmYcG7/EI
pQk3F51xZC6OF24HF9lX+5iYmsXSteydgQY3N/YssTNRB20W9bc8QmopJlJHKBbABkLQZrsSAeQ6
hY4MBSWeR6IGV4oVKQGklmBDQRgyfAGghHkA6smKRr4UMV4rASCFgzZEkZ4GehzEaA9JjKytN5Ij
5ni2KbrcCCQkCXrUo7HEqACQQJh6AGzISIAhHSWBFO8QUb8UHfFN3oYBxc+IZp762pU7mEyrbEMe
o09o5mzKw5aSTZPbKs7M0CVCGoTIEGhilJqE6CxokjVtRMDoVxT0NQ2objjageBfZ7VbBMN6dTBp
UTfoBG3Q2dmkaO+kjIaRB4iwySwBZGq2OU9CbGoCEGFT8DDk6sin6gfTTHfE80HMMfTrAZSsfkDB
IXbJSEcc2rxJbMPtqaZbzlJs+W9tVylzkgYP4qfrnzSO3WpIIEH6cVPWt3ZbYoVBZLZ8u/U42pm5
Dn176m5V27drNau6kFFM2AiABzG6A6i6tmcR+lB4ZunrmJMQHa2UBVhXyBUl4ei8URCY1J1q7+Gr
xh1ysjYqRqmPDHgl0QN08yIwGiQesyqTib0jJKWQXZ3qwBJFES66eczRfmpa0U1rubZNnMTRgMyy
9lqKxQ4p7gOL+t9IwDOKlTi0fRSI1Xtd2IvhEsbJ2kp6yovUeFSuAxQDrkVbEkxr+L0W7UDFb3tp
7IXJ4ug3Q1+5Wfb7AVNcBBmbOYIc/sTKF0C+PjAQuz5b1W9KoT4g86pschJhC6IAKPEAMZw/Ii1o
+jxKGnQWTFi6/s0V2yZM8TfdM9sw9O/NFrHlEUrMOxv0nFBe8HfOJfqEU3TiZKIr+Oq2uTpkNEhR
aSgQz82YxhLS1eyHPEGk0bBvckx7G5qWBPh8BAS7NzAYEI1V0CNc7AHyjtInWBjqQmBiALfGeXuC
zRBWhIBjHuNGpzPPQKjnfnJh4RR9BDExXHiYJCGyowWAkwKrG0Apwd/4aBy0wHPF1C1JR+SJooOI
AqsrT2VqsW54XqrqPLHlsX0BY5rssZA5Jku5R44ErmAgNJ0g+kx+5zkFjwf+wuHPcB94fOmAUmi5
jFEkcBRbW4+NHJ5+yIYKXFCh/iJGprIpO9EoeNcMNT1ut3DMkn28NRDI22K2tiIT+bh1aRCxG1xC
3YauMo0XJ46iVBa+u+NZVLVsb5eq9zjsQFJs4XxJvrH9y0ng4btyc7bSH3oCdYuW1fUxzywT5Ind
XxWEcW6l210Ab7LDTv6Fw0v1cXyltkLyTKyrvQVRjDI78pvDBbZ8SEvhDC6m2qAdHe++PT6DFeb3
L8Y7+DlXFWW1P+a3YuixWi5zTbCGUXB9JzdgwVs73siu5mVXrM33q5nh7dNuj7Mh3xeoG8QeHKod
+77aGC8u+43xAx5Y6lbTMlVegZdvPPWEWrkU1XElzQSbVPVoETKUT6K1pIsUc9hwYbeweSxYN3mT
oSUA4IwH+VToXz++fgK7XteN/Zi02RbWa2egTNfSFrUPE/3+YqLpGjb4icV8QUvebKA8ccMpm0zS
nxy83vW+CZy59nXu8RIJPNKvaOBRuyRDkbKENBfcw7Ys5trS4Op3LboFb8eF9bJR7wl56Xy1O0Ke
xVPPserMwMyeVsIDoYVI9gS9uAVwlw0lmIM7J/GyMTkJx1t4f4NbGqM3bADuq1gogrLtS03FlubW
Zn2VhyZNlGKZ60EWSqh8OGXd/fzSBa1M3eZey2HALFtUR5iOlUTErPx0+X644C6PbbYiN5zpL40w
/UGY9MmqHWm7hL1Brme2tkH9/m4n79R25r9lh99veXPE4zQCh2s/CVTO2waP/bmgDE0UB/7JJ20P
WIJv/UaGJMFvwRZY3/ksVN3ScqGmzkSRdI6aho4wT4PEyQvsf5CseJpiVgELyq2chtg4BZ1oqV3i
dM5tl9mVA/78D8A23zIhG/CzZJl6xURS4gMLUPMyCSozWLOi3T0PrDaOxgkmsS9zZM3pqyiJbdcb
EmhYQBCS471AIvcfuRhXnli6mysL3ll/erFRRZ1hA+aY9gN1qG5ZE4bsCh7qssIn05UVsp0YbIE4
diIx5lw3JztJm9VNhm5Y2j4mATP9tUnTY3zvNHqaM7tWs1U2WynpHmudmYES/4QGBh4lvgkNjZ1M
se3+BYDF2JmXVjJHq8w9j1hnhpS806aUOEu1zSTEI3qoMNpsI4N6QrJTYThMVFbcSIJLTWgSIkDd
hCy0ZqJjhi6Jjl05UP3vUmTmx3x/yHYZZlgkFaTZsN8lmrZ8UtHso6SmkV2FS8MIavU0gcRRJaVd
u3+oSdg3qwQYBViOIVnXfICFBStq22xtr0tA6WQR3jlcnZE9YUIZ9FV2SU5tKTqA/mELxqHZWp99
fFn0D9uLgG9rMKWdL1L0Ws9E17LW4dhWV/AAdqwHw+5gYQCnIiflZac/GW8tFx7Y0ssd/SqX0DZ2
YqJjEGxleMx8kLnL0bCChfqCrSHTLgjpFLUbQgfQwuR/9GLxXNEG2XsDE4mp53PJncJqmbBt0O8q
DISac9DC8DNXbShkBxYyhglwi4lzTzmePfHCoLYeWPUVcma6gf2CVn2dhgHaoXBDSROCDhAhdmNz
rdIwsdQn7/WJZHpvrEhTYcxM32QJ0ZEiV020YbVaIHxQnMQYBCo74z7IeS9loDyOcF/tFpcn+JLJ
lQaYom3xULTlEmKeSSLBBFeZLS50dbH7w1xtbTRdn45qc6LbJdgYxT9F3hLxJfB0LVMxorBKtZyz
d7+RYIrXx2PTfkhSik412N34RCdgqDdjk4WhMnneSnky9qgKCxO8l4zQMxONZ8uvAdqudnv6vSQe
7CxEWuyHfPJOgmgoWY3n0mD5yuDFttcECwYf4GefU7WFt8v6dlN23ce2sqI+DNUBiz6qJbW3iBo0
bhSxAtWGcT1noROh2Q4RD9AVoBuaM/V0dE+bNvO4+DG5eoLp+BoPa3gSJ1gF+noHIVfRYbAocli5
YjsbxNj5osHDaeRZiySY4NcVCxeYXxAxAd9nkzvM1eoAE/VOR7WPfGemu1tTG8OXIYmREJV92C5R
Q72vazV91b5yXSC1p1hNbW8OrAlZZ5tqY3hr6HLnpGJEcucABSiH41BtK9PdoYxFKlF46XZE3WEq
nhF3E4+AUOfBG8VK+k3RnaXDsb6sy3x2J9Y8fn56mDYZb39+099zjtXLGnBYutTAQFWMrNtw9jGA
b054Je7n6DJ4L+wB+6LzQZOPCx8uH/3pHTe7XnCarHXFp5fvSDDSc1WUMhCxXYj4AY8wasOvznmz
OK0yCjUyH98sf358ieqnrz9+3r18gx3fq13qOaq1KbPQzB28RoePXYqPbZ5gK4asOK88u1Q8amvY
VAe5xBx2JXacJUva1lm/h5Cst1z8TztNV+jlcCyMXsBaa/T97K1u6Qt7tswdDv2MXml6M5O5FU//
fnp7eL4bzlgh8O1sP5IapAJ267zZVfRp1kIY43+QWIcgUA/cQciONEOgA1qCE8FeTMXqeLjVx76/
WcHmDPZTXWLfbWwx0iZ9drvXzOMMyqsVyaPm5dw4XfapGVtFiecKYWHwxIpSDKLzKvm/FZ6hzFgS
484ExmKyLEmCGL9qmjLZCnXfs35KDnWAh41zmBKb05ZaMn2hI/NT0puyObY9mqKRVg7G7IzqRaCp
i2bPrIN8qfgzcblzfGYopU/b2jIYMcbVXygTRLDNNi8fTf4rXL3fwVwc/cOZtkRNL+/mRUL8Ihda
JCU1UgGjpn4mU67r7mUU6eHrp6fn54fvfyIX7GoRG4ZMhi1Spho/Pj+9iPXh0wu4lvivu2/fXz49
vr6CJzBw2PXl6afVRtXrw1meFvuG0G0osiQKHUkuyCk3Y5WNQAkhgxl+4KmxUHxPPg6Fvg1x1Ufh
eR+G+q3QRGWh/jRgodYhzZwW1OeQBlmV03DjNuNUZCSM8KmnOITqhT8BWOAwdTM+tzTpmxbTdhVD
fzx8vG2GrdjzGuerf+37yg/cFf3MaC/LQuzEbLTiHnM22Jfl3ZuFWIzh7Z7doYocYuSIX9E1PYlR
vw4LziOKJxQAaKAr32czcPQN1YyaT9Rnchx7E933gRVPbRyuNY9FW2L8QGDu9wQ3N9RxpJvkqVoS
4QvSNIdbRlA/XxrOnA8myEkQuFP7QnkQudTU8DugUWOMSpzizu01NF4Rjp2XXVMqd17a0IMR/WAM
eGQcJ0TfzI2z/UrZJJd07Q0d4I9f57yxr4U6etNw7sgaOQUSRCoqAL8SWzjC1a8sOdJ1jjTkKfbo
dsTvOUeH2L7n1H5TavTe3FNa7z19ESLoP49fHr++3YGHXKQbT20Rix0wwY4adI7xlZVRpJv9ssz9
qlg+vQgeIQPhwslTAxB3CaN7fO1dz0xFEiq6u7cfX4U6PpWg6Rfw6IaMT+anCAkWv1rQn14/PYq1
/OvjC7i4fnz+5uY3f4okdOdZw6j1NlLR8WvDsemD9IlajAb7k7rhr4rqvYcvj98fRG5fxdLixnEa
B1I7VAfYytbO/Mt7jLyvGHPERNWI3nMEjaQiCyfQGV8Z/cDgifi9MKCHnzMckhSpTmg+cVf04zmg
2Yo8P55pHDnCDqjMKQOoHPm6ku5XMQScYEWwGFPMJH0tMwEnaGaOonU8m497F94EpzqCEqgp2qsJ
Rd3MzHBCEQEm6LHHlcbC4PFgseSMOuuZYM7dAXw8p+g3TtHeSZPQGezHMwm5GeJtXCz7OKZ+3agZ
0sYIuKqRQ0RlAsDnZW/maHF7kxkf8BIHQhwdQpDPgXkrowGeI+GFY72qfReEQZt7HkQqnsPxeAiI
w2UJ1eZYIxvRrsjyZnV/0v3GooO/r3p2H2fOhkNSQ7c4QY/KfLeyI2D3bJNtEVHrZlYOvLzH3Zri
kl0K/VrQ3F3mpFQw7mpt2X0SutO6uKSJ6bxnocfY/csM8yC5nfNGX6mMSslqbp8fXv/Q1iRH/YFL
yjUFCcyaUOdmMxxHsV4Hs0SlELSVvYIvi7+NWUe7p8MSBSX/8fr28uXp/x7h+EtqDM4GX/KDI/zW
NM3XUbERJzK6m+8MfWbjVH+u74CGzZ5TQEK8aMp15wAGKA/BfCkl6EnZDDS4eioEWOxpicRCX18J
lMa4G1CLjaCSUGf6MJCAeGpxzWlgWFYZmBnE2sSiwDIi06t1rUVShp11uWyJe6+g0DyKeq4rmAYK
+qxu1+QOBOJp1zYPAuL51BKjK5inOmOJnpRl5O3IbS5URX9Hct71sUjsv7gayz9lqbHmmdOSEuYZ
vtWQktAzfDshTX0f51qHAem2OPqhIQURvRV5+kPim2AKdj1JfUTM6PLn9VEegm6/v3x9E0lep3AB
0pzv9U1sxB++f7772+vDm9g1PL09/v3uX/9P2ZU9N47j/H/FtQ9bM/XVfmPLl/ywD5RE25roikhf
/aLKZNzdqUnHXUm6dua/X4C6SApUZh/6MH4QRfEAARIENFZjq1PIYOpvaG+PBl+5YmTV+HG6mf45
jjscaxt8NZuNF7ByqRbqVASmjuNqj4J9PxJz65oz1ViPKlvC/03er69gUb5jyryRZovKM32hVG0f
N9I39CI6kJX6rhhnrbveme8vHF5hPT78KsD+Jf5e14dnbzEb6RqFe/TSrKog5zN3BT8lMGzmtODu
8ZGBt9zPXBvO7cDyfNq2bAfu9IOB640OfDUwPxj4bhzX56kjgk87SKZT391AaoFfuQf+kYvZ2bG1
pJ5vpFo0G2uGmqseCqOVhbq4ZxkI3VEpUZfv/tYap7di+6E40hkwmUaEgBSwtrufBgEx1kSYWIKN
VL7uSdPNs5uLcvLT35MoogCVbOQLEXZ/ITSQtx7vAMDds1XNNoeJ18g7tyhLVgsrhjDRPgt35bOz
HJ2qIGgc93haQTJ3WBCq6nGA3ZsGH3LQJxMNxxo5PmKgY1w2DJvReVg3kluese1mOjJDefjRKj13
HHXUwyPyQMWhgy90DIuZIzwDcpQy8XyHed/jIyMQ10P353+KZqBmoStDHpETLWyW8JEphhLTH5ED
dR84wpdoDO5eqBeV9aCCTAqoX3Z7ff86YWDRPz0+vPxyd3u9PrxMZC8efgmVEhLJ48hXwGzxpg5n
CMTzcukMftLis5GOCEIwuEcWvmQXyfl8pAINg1u3aRgcMVxqDhgMI8MZpdXUvXazg7/0vAra8SOW
44KO8tC9ZTYU67GI/he5vhkZUCAV/A+XHm8q6DqYet4//8eKyRDvnn+gYS7MzDKGV5P2msnt5fmv
xlL5pUgS+11A+kADgZaANfQjPUVxmccB9f4OD1snrHbjZ/L59lprw4TuPt+cL7+6R18W7L2R4Yuw
e/ABXIx0uYLdrY43TRYjc0fhI8XXuFtC4Y6SG012wt8lYzMX8BFFi8kADK6RVQAk6Gq1dFt78dlb
Tpfuaau2AbyxKYPrpOOyM8L7vDyIuVvyMBHm0nM7Me15wjM+GIDh7du324uKcPL6+eHxOvmJZ8up
581+/iAvbru4TsdMETsprblNMNgNUOXL2+35DTP7wXy4Pt++T16u/xmxZw9peqm2dBIcl2uTKmT3
+vD969PjG5WhkO0o58bjjmE2Zm0fuiYoB8ddcVDOjf0mMIDiFMtwz8ucjKWj53+BH3VSyUgPzYfU
qACZfx4mlFaYinifGglbe7rgyRY9wuh3V3epaJIsm4UifRv0EFEy1CkVspJ5kSf57lKVfOtwSoNH
tsrTlgw7pHFh1u6KR3FUbeMyxVyzg1cXthOOBu54WmFwGdcHuTB8TuzRE7BDu6RrjR/CBOQxfYqO
BdTJvkGHXtn1rfPKJrMVdbLWMmTnQm1rb/TsdANwOUht5qpbrbWV6fAwXbVEnvKIGY5eGqtZ/ZJF
3BEkCmGWRq7czQhn+eHImRuPN2TsUoSOO25NjCP0oN26x/S02zoEOvZrylyBy1XtBZ3XWk3DHdsN
HFT0hglZiXlh91FKpXHtWJJjNKj1/dmhTwAW5OGe2m9HrGAZ78JtRU9v358f/poUDy/XZ6uHFSMI
JWggXgqYcHoQKI1BHET1aTqFOZwui2WVgaW63AyGcM0c5Lzax3hp0FtvqBiBJqs8zqaz0wHGQOIo
EFtmtJjuFGqA8CSOWHUXzZdypscM6Dm2PD7HGeZumFVx6gVMdzoz2C4Yi217Ae3NW0Sxt2LzaUSx
xkks+R3+s/H9WUiyZFmegJQupuvNp5BRLL9GcZVIeFnKp+apTM9zF2e7KBYFxua7i6abdaT7xmkN
yFmEVUrkHZS1n88Wq9MHfPDKfQRW5Ibukiw/MuRUA4H0NCF5V6u1R35tyjIZn6s0Ydvpcn3iyxn9
3jyJU36ukjDC/2YH6Dra0117pIwF5v/ZV7nEsD4bh1LUPyAi/AMDQnpLf10t52Royf4B+JuJPIvD
6ng8z6bb6XyR0R3muF1Is16iGGZFma7Ws42jOTQm20luyJtnQV6VAQypaE7WTrBUHGCMi1U0W0Uf
sPD5npEzRWNZzX+dnqfktDO40o/ehSxDVWfA5vtsCiuNWCw9vtXPxmhuxsbfm2+hFJqFx3d5tZif
jtvZjmQA9auoknsYROVMnB11qZnEdL4+rqPTB0yLuZwl3MEUS+hemEBCrtdTx2AxmaiLGRovOnqz
8LzwFuyuoF4pI3RTh8F0EnszF4jGUx6SS7NYrKvT/XlHOVv2/MdYgMaXn3E8b7zNhnovzPiCQ++c
i2K6XIbe2vAgtNY6/fGgjKMduUh0iLFc9jZO8Pr0+xdbN1Ip4AdDMtxDE2OsMtTx7AWnFdVAylQ+
MhNO4EmczIncrGazMexwtlYVXCGh2Ihb9JTvGCa4wpjSUXHGSHc7XgX+cnqcV9uT3WvZKemsCreq
BlpmIbP5wrVxpdoV1cGqEP7KtQdgcpHubcgDGjH8iaEcayICcTM1/e1asjd3qdC1okAOBbmPM0yz
Ga7m0JqzqWetpDIX+zhgjcv7yhtFx59d25W2cMoZachmZsNSOCwq22Lh2tOsOUS2WkL3+tRNgraQ
Ipp5YqpHd1dKsLqXCvKDZeeVcZnFRtdGJBcDjQq71saDKzIPWmvgoJf5cjYQbxo0YvKpCZvuo8Jf
mn5U7glvvobLjB3jo6N4VobF7mBNv7MYELaBXf0wLktQr+/B5HV23DHIz8oPzMmR4FSnAhQYmhDP
pLKqq/tDXN51d862rw/frpPffnz+DJZhZJuCYN2HaYT5lPqvAZq6fn3RSdr/G6NcmejGUyH82cZJ
UtY3pk0gzIsLPMUGAJgTOx6AYm0g4iLoshAgy0KALmublzzeZRXPopgZIe8ADHK5bxCihZEB/iGf
hNdIkDhjz6qvMK41bvEu6xb0RB5VerA0tc0SHgLzmwIW3iXxbm9+TwqrQbNJYZaMNh5+vYxVVOlh
/399eP39Pw+vV2obD7tDDVdyHAJapLS8xwcvoPrae5o9DBPIajsGwh9ajTa91aAQ0gked66z7K06
IaM0ERzURsJCbPCd2do5aB94bdVsVDGLVCBZ6wsymLMxbW8AWsZHJxavHT7jOKa4D0YSfYaIPT9I
gG281L1Pg00uLzPPWTKgLkjQW9GIsCPMNycaO4fS0d1yGc9hEsf0QTbgd5eSlpSAzSPHPhC+Ms+j
PKdPHRCWoIc4P1SCVsHdo5WVtCeVmjTOQkNWpnFGxcTAxjMDheKwCdJqd5aLpemqqVpTxZ6jC0o5
mgZ5yq2H8FzOlcdDdR6qU466CTzJXlsFinRt+1K13szUEqRET/Dw+Mfz05ev75N/TsDwb8NMDAJK
4KaAipmAQSViPSQ+Iu11657ayU37qa7CPcedjLwlZTL1LHZYyh4xohb15C5U9gAhQu72oMr4OVoT
FV7llPCIKlswMCiZo+g6jPlo4cDj+7qLswWtSUgFj5syJ7QhEVDVlmQDgT4T5c6vUPEKRz+iCaQ7
fOMRPn+dFBQWRKuZHhtZe2EZnsMsIwvkka5qfjCU2+eVpkcv4LiLrH82qM45OZ8G51VtCSI/ZGZS
l2zoabKPo+EE2xs5lOOoz5EuSzDJ5V4vFfCSnUjJccDSh92DJWIulVJFKa/Pu79fH/HYHR8YXAFB
frbAnT3rvRULywMttBTqmEAKO4DGmNjlBTy5iyntDUE8sCsvZsOAzQ2/bGJ+2LHSpKUsZEliMyrP
aYt2KUDnEHbNoI13eVZaWVI0Bo6nc1uzLIxWlKd2UfzTHafsh7pb0iAurd7fbXVpqigJmBj5QZhU
sJlYEsX2++BtagvU8cq7CzeLObFE5oVdND+pnVe78N2ldJ0eIhyHLLKKj6VF+JUFpoRBojzF2Z5U
5OtPygRo1dJIPw70JFSJWCwij2xClh9ziwaWcTPCCSr+KLQm6eiqx3UZEZeHNEh4wSIPQHJqINdu
s5hauIae9pwnw+GkNLEUup3b9AS1CrsJU3ZRMY6c8xOsHjWqHY2cxmGZi3wrBwXjzlvJaRVVMRwS
GY+NuUwORmleSn7nYIdVCNPAwKDXelIjDlqq4JIll+xsUUFWwGJAEg2jWqcTRp8O1+UZX9JBPKJV
bsWUsEztEpMJohRHiUd75lsFwxMvm6Z20S0iJhnHJFUWWXI2kEdAhNEGqwEZK0txHLIisaVNmQ76
cIdnLGBMUiafKidlpfw1v5iF6dRBT8r4mA9kA9jwrhzqCt+DbKBda2sYzGqZMkEHnUOWAy6pVSHm
9qtPcZzmkjayED/HWUobRIh+4mWOX+l466dLBAuqLdPqVGXV/hCQ9BC+BYNyql8mB0ua5F/txURi
ke+cKkxFpKs2bvlZWoTh76A/puWcikHsuEpU2/bA4C6XLKL2oEijidjWgCD8g1Jol627ZPLxFjRe
1mpQIqjyfRib20t9MyNOxDdEMkaWA0uVDouGDIekiCtXoFRkgP9mrujUiIM6DJ/KRLU3hRBgjieK
MG41PmTCT9XUvY5efP3r7ekRRkry8BftZZblhSrwHPKYdq5DVGW2H8aCbdp75E1WMSzacdrcl5fC
Ef8HHyxz6LLa14tokNTMe1KcSsHvQY9LqY3tBh1ew1UBwg6Mjn+Zhir017+NiGN10LH97e19Evau
fNEgvBc8rLy6+tGGJBHtQzO7T0t0J/bpOFT2tXGWIpHb1PEtp0BE9qtlvAXpQwtjxMNg7UqDAehR
hcmkmxzxA1QqXkE/Ts1WCO+JVtiLe+eL2iOdsTZKJb1xlIJuL+OQ0k4yflLrvKYacjwhNCNK9rQ6
6iSJKKUJNAddiis4KFH9yMAoqfYn9DfMdkqjrS/tc8JgU4+xbD71lhtmlQZG+6rOTNArpIqOyXip
jZe6DmG6muu3mXuqGbhC0dUODbW70aOeVZS9qdMSV2bsr4688Wi7s2OYOhIQKYZhSHATx6DdyzmV
OETB5q5G/UrMwbMYVhXIjqtGDb608shZ6PKMiYtSI/Vnh+lJCXrioBWBuBq0d+EvTf+FluyTsRH6
ZjGzAOl011rV8az0XThFtbfmatZTOnjFePL1ejRGnu+4kVZ/m5wvHa7q9QwYbsqZDDJkGDva9YUy
CZeb2dn+GiqBgQaQsfq7KbH80y5NS9ml03HfFCaFRY3FfLZN5rONXakG8FRtLUGiLjr89vz08sdP
s5/VKl3uAoVDRX+8oHcroUlOfupV758tURSgJTLs0zrplevz0+QMnW7VG5O2WCQwodZ+YH9gneDK
MXVQfqwJoqenwa6LIRJf1XXfpfPZYnhxBJtJvj59+TIUyKgM7qygpzoAdU5Ji8RgymEh2OfSWUgq
qS0/g2XPQV0JOHMX0hm9HxUVFge7xRqEhWC6xfLigAkR2kJtFmDVb6pRn76/4z22t8l73bL9QMyu
75+fnt/Rzfr28vnpy+Qn7ID3h9cv13d7FHbNXLJM4AG94/110HAHWDBrE8xAMy4jTjkuWGXgbq49
KruGM/N2sTDkmJcVnV0v2nbtwx8/vuNHv92er5O379fr41cjCA3NoZth2zgDjSijhgsHQ7QCaYsh
oEVY6qanggiTB+lESaUMwXbSnkdCGs4WK3/mD5FWceqKReI+BO3tQlnNiAIiwUQzy2mI7VHTP17f
H6f/0BkszRpJ2TFVDu519FQJX9P6qRimD7KCDbvFdzhuV3QsRZnT1knHYQ0XgwGj3tv3RDp7HStI
GGbtcywIlp+4oBaXnoXnnzZ2Y9fI2Z9SWknHYOXmbemRaI4iSXoVwqQ76Fv4Oq7LXo2+WhPv2V9S
f2mG+GkhWFVXGzphQs9hJt80ACO5jw5sfMfrVDqekfcNc5K0gFiG8zWlZbYcsUhmHv1wDXkfP+2t
qMfPgJBJsxq8CLe+oUoaQB1eiULmToTuLgX5Y8M0XcyklcrGQKpTRO8NtGzB/dyjbLduitUJOsge
qjPNjHVuiFllyFkkwKLZTMkEKw3HFnQII3VYWyhMvxldoTO0FpkrRnuUGsI8BWtwTRZ5BIRMi6Mx
zIlJWGIeIbJTxZLefe3wCKSBPxBrGDjNFGu6tETfwwx3trstLOTHGMF/QxxGAuw9Rwz9fiR6dLRf
o6U2IdkUiIB5biibfZ+s6kSTqmbF88M7aNjf3J+Kz4RpPlgHG4nojUobYLA8N3WEdK3Qpa2/rLYs
jdVJKVUCHYrUYCAnAyBrz6cvAus8i7/B439Uh/WCXJu8xZRaY+yshxqdEmZC3s3WkvnEMrHwpU9K
W0Tm4x+GLEsqVHnHINKVZ+6G9BJu4ZNpTrsRWCxDI39VQ8dhS8ifT5fsPi3aAXt7+Reo+R8MVxbx
TPcE6kSchP85hNkwf5pd7fVc1brzlBB12MrRquzyJNrGwvBViFJWa4LDwAcABYftMH+NuGQh+rya
m70nRac3nJuSKKyGqjQ/8sabd4ytvR9MXoaqWcCE0/1YdarSfbkRRNP6xs60OJybmxJ9SXid2Twj
jRaLtT8dWNINXW+dON3hdfc4xlNR+hBMzlZ3jsv08IxHfXHBSpUlqmiuWnbk+kaYAv89tchlrrpu
qW3vK6DePa1SMKlcvpJNC1RBUuXkCb3OYBy6a8Dg4F2vhXFW48i6UXb5QnRu9E7fHbjjkmyG944q
mIcJO9J5j6BYM7F5TcFdJdol/hgVZNj2fY6BxeEpozBFzRxHNTWKLgWiOUYjXOmbQOmPr7e32+f3
yf6v79fXfx0nX35c396pw8T9peB2cpYuxvl4Ke237Ep+CQ5GMwvJdnFGn9yd/ZWWUWYoVNqOTmsD
Wp9ZZZ7y7llhjhzEclEVYLY6Ush3PDJwBJbCtq0cx2EKuwuUV8Lo9k7Kk4Th1bChH2e9I1ftc1kk
ynjuT0hqxJEMSRzKLeZZ7j6dOv+GIQvWv+avAD8wPkGS53cH3RupYYQ5zmH265nqlISyCuloeuJU
EtwsfMMRVEOVBUc3a88k4uV8QXs0W1xkbHOTx4yfbGILOry9ybSmLGCNJYxCvp7SjYGY5RWroypc
ShVSkTj0OtRpLY3+bJPQO0ouTtTBo8ZwDJdkhQc5rTWsSQiX6ntqSE92aRXuDPm1P4FFkSW5edJX
i5vn2+MfE3H78fp4HaoeUB4/yir2vaWmMKqfmOfeHNRBEnWc/QRCXyu8QFgVsVwt6NxwZCW6ycni
BFYHvdBOTKX7AyWiQmMjk2ESRlalQU7t/DTFt8fZ/ZoPLX2gErHVu2jXb7f3KyYpIo0zjr40wz2y
NiPR8OG60O/f3r4Q+l+RCkMoKYJalCkVU4GZpkPVFOXSvTM9p2wECTaqLa1t9Y1qdmolOgWf4rK7
BQvd+fL76en1ql0HqwFolp/EX2/v12+T/GUSfn36/jNu4z4+fX561NwFar+Yb8+3L0AWN9MMbv1e
CLh2+X+9Pfz+ePvmepDEFUN2Ln7Zvl6vb48Pz9fJ/e01vncV8hFrvcf//+nZVcAAUyB/UcHtkqf3
a40GP56e8VCga6ThwXgsuX5ShD+hS0IzFWb33r//BlWh+x8Pz9BWzsYkcW2ZzNGbYjCHzk/PTy9/
WmW2ykgM4/EMcvGgV5t6ojsX+FujSpMhSsnZlvyemET8LMP+lIb/+f54e2mGsTZA+yMCxV5tBYO1
llqfGobmbMh+rnEcy+R8saF2QBo2WMrnVrKWHnEduDYchczMHFkNvZSYvZ0N6CJdGvnQG3Lr+0TU
ASDoZfh7Tl7/wLyLpbH3EjuUqkzS8UePoGMGpIuhcTsGftQHGCbJOhZBEpMpRhgIA5Mclpb3FDx8
oj2nUuhyMImk9fq6P2Edtsj3YuXpN1iQqNwr5jbNPCpqabaPzwAeKLYIKf8EUwNEMmgsjrIAaVzL
6zOZ8l6Fehre5gAEV3btSA8aozlEbD0e7Ye7ZwtQ1SvLPAlyVkaVhM+kQ5GgLy+8Iy7yUDLNZC65
4NIWdQYWlGEqZIC/QvIKW81W99zuNCwA770PTvXrbc/9ZSJ+/PamRE/fOM09lArgvqIa8b+VPUt3
27jO+/srcrL6Fp25ebVNF1nQEm1rrFdIKU6y0XETT+ozjdPjOHem99d/AElJfIBu7mKmMQA+xAcI
gABo0iRotOPchwIcVhp2cpJgRq2SIdlZ5xXFOo21qgNdS3iBhASV37iNkxkXgtKQHSKWu07MiMQt
kRW3l8V1xF9Tf/wtz+khQHR9y7qzy7Lo5jIjt55Ng4PhV1Cwup5XJe+KtPj0KZJbCwmrhOdVgysr
5fSdJ1INOxoF8AnNt1w639ty2BHucrGKY3xHQr5xXCROxD/8jHACxOT1EPtUr3doj19t4dR6ftlu
9i87x9TQ9+gA2bA9mC1QMolZEgLAwGTt5XwRbBi2fdy9bB7HrcLKVFR2ZJgBdJOsTDEze53EcDab
90oZE8bV8dcNelR8+Pa3+eM/20f917GlIwQtkskMR7nTfMNgp7QDGvr7dvunfyYZYF0AX0nZcDs/
Xx7td6uHzfYpZLfSPmfgBxoDm6qbMJklFAKzAjQuQiWvdEEgtwvYygCRlZ0BzcLZbjUhdtoIZhvI
9R5wQ/l6WGTdDmh04yXLzRrK6DigZTMPO9AVsqU70RzsxLiKe//5cFLGWqc1mZJoauf1gR/KoRbN
Pub1dQujAzY8xyEL4QRIWHCmYmFclPTC8hRswqfZlLLGNnzQ1uBPSrK3wQOXQX/eOue3Y/JK9ULI
j+/rfxyn+oEeX2Offf5iJ25DoC9JIgztGbTVk2iir6wtM1zsN5msxMSJwMlcwwH+RqEj5tAp86xw
KwCAVpCTRuTuGhOJzsJkW2dahFtTAtvkumWpTqtEGEVA+oTTtG5aQYVfFpW039JRZmadknW8AXGV
Ep2LY4N+UeqAsVNOJSyZ826JYWXa98oxcTPMc9jAdpZ49yBJfz3EVRIT7STWWPBbNJFMnep6WDdB
M1FX1ZTcjjcZyoyU2VFeBfBi9Ie9i+CnaGVPxF2N0ZnuWscUlFlDSU5TOeSaGS+lwgurYXYVxnPK
nLKwjh5mRrSruSgyiTnIaGHiuq0ail2wtqmm8qJzzjMFc0BT6FHnjnTSkpG75v7Dpa1u8OF5FNFC
O+Dq4ZuTsUeq5WIPu14/smGNdIddI+aZbKqZYLSHRE+lmOtBimryB2yqLs8iR6/pqZZwXtdvjy9H
f8KCD9Y7mt+cwVOABWZe8WA3hQGOwtgINnIEHp2UbKYoUTNocq/WmuF9XFVmTpo2hYKtn6fCztqo
S2BoG4Y+4Ri3fs+TulXqi8OHFlyU9jd6UkZT1O4KUIBxE5MToWluWdPQPukan+FBRmYanrcz3uQT
ux8GpMbE2um8mKagb4NkYUGH4K9ZNsOcnolXSv/Tb4xRig2Xgs1wpb7z1lfIFDMqeQOscWFTWdKa
tw/x982Z99uxe2uIP8Y28uLq2SO/6OhbFlGBhlJGXDJ119TWieKRa+grSWB65McbIlxOIASlpfet
aSbZBJhxm9aUiyyQUM62M6Eux4AnV5aYggzd/4mj4TToX8rLthS2FqB/dzPp2LkTyRWsW4iJY/Aw
5P1nZCUQtphbrEww0I4e2b5QlGMlvJ57vLTHZLBanu1fmm9aS0YBWZ5Xy7E7eo4c7o5US87wDgk3
BR3zrqjaGhNBxPHBhraRgeY2QmnnshGvOCPmYqBHURO+o39yWf6S5tBCT6qUdZFNwlRZEvWlpqew
zO09kMvee//qePP6cnn58ctvp8c2GnNnKpZ/ce54Izq4z+eUV5BL4mZldHCX5EOoHsmZ220L8zGK
ifeYDprySE5jFX86O1AxZa72SC4OFKe9zjwiypzukXyJtvHl/JfFv7jhT15xeuu4RBf0axZuJz9T
5yySgMaDa7G7jMzA6Zlt9PdR3rwpFycX1Nd/SoOD6e0Rsbnt8Rd0fcHS7xGxiejxn+n6grkdvod2
1XJIfjXmp95+WlTZZScIWOv3omAJHOoFmQWmxycco2bd2jQcVMxWVARGVKxxgvgHzJ3I8twN7+lx
M8Zz0sY6EAiuMnMEJUEqzukom4GibO0cmc6nkx0FPXjheTgiqm2mkffOcsqxoi2zRFtZRkOkBnVl
JQrQdO91CtODJj5Hi9YX1+uHt91m/zP0qcTTzxbK7zCu8xr92bpejRp1Cy4k6DYwjUgoQLeljh+j
4vK0r3soD7+7dI5ZJHWCoojwghIF6MJdWnCpLjEakSXUjUBP6chLBhY5M4fKjdBM28ORyTRa3pJV
+BRLWFvNSCufcoxSj9GUMByok2NiViU7JUwrV6Oni09G2QJAekWVXdsvbZsmQ20DS2LmNP/xFhKt
+nx1/O/Xr5vtv99e17vnl8f1b/qBlGPiEyWscnq4BpKmKqq7iL9ZT8PqmkEvaP1soLpjBZ3/cuwO
m+Ltlp9UxCdTMnoF8lkuqf2GxrCZv4QGYCezWcl8C9dIF+kjv6Ga6kMox+XN7IBhWVwdf19tH9Gf
6AP+7/Hl7+2Hn6vnFfxaPf7YbD+8rv5cQ4Wbxw8YBfeE+/nD1x9/HustvljvtuvvKoHteosG33Gr
a0Pn+vll9/Nos93sN6vvm/+uEGv5SyVKc0XLTXfDBAxC1oRRkSQVptCx7YsAghWXLIBlldwd2AEF
W6CvnR5blxSbiNMBP1RbygpTJedak07hVHADWq1HsMgx6tHxIR5cOXw+OwwcssSqNzonu58/9i9H
Dy+79fgqkTUXihi+acZqS6pxwGchnLOUBIakcpFk9dxmER4iLDJ3cmRYwJBU2DbPEUYSDrpJ0PFo
T1is84u6DqkXdo64vgbQ0QlSONqB8Yf1GrgjMRpUS1ub3YKD8q4CCILqZ9PTs8uizQNE2eY0MOx6
rf4NwOofYlG0zRxO6QBuHAm9JZEVYQ2zvO3zc6L3dYDn5UxnTNe2zrev3zcPv/21/nn0oFb+E+bn
/BkseCFZUFMarjruOkkO0JQ6ggesSCUjismCCtLpx68VN/zs48fTL+HQDigzAPqC+G3/bb3dbx5W
+/XjEd+qzwVGcPT3Bl+FfX19edgoVLrar4LvT5IiHGkClsxBMmNnJ3WV352en3wMJ5jPMgxKiyLg
D1lmnZScYA78OrshB3jOgIc6nv3aYVH5wKL48Bp+0iRcZomd16+HNeG+S4jNwpOwbC6WAawi2qip
ztwSjYCcuhQs5BvlPDriI4oeVAvPbm4pVsIw/KJpSXdr8+1SqonR1+2r12+xMQdJzTLhGVZdMOLj
qRG50ZTmPZin9es+bEEk52fUJtQIfSFNm7osugP7DtEwXznFFm9vybNokrMFP5sQndIY0tjpEJCc
DLrSnJ6k2TSOiXV0RvbTWkJ+R4clggEt5AVFf7CkF0G9RRquyiKDPau8lajJEkV6SkYZW/hPJ3TB
s4/0+wIjBe1M2fOYOTsNGQ8AYfdIfk6hoMU48uPp2cGSkTIUmKiiIGANSJGTakaMTjMTp18OLO5l
TbWsFkunFlIHnFntoEFc3Pz45gY39Nw85F0A6xpCaOTSrtZf/9XShGfSiPFSI9xbhiJcssGeZxjH
RCYi9ShMZeGO6/H69AJGOlLGWhtpz365rRKGVg/v/sbChRtMQd2OhAQEU0HooWIpl8Q3AfS84yn/
5YdMe3EwkHZYLtmhjdmLFlGZI9ZjEIRrnb8naFNj1Ln4y573xAfGxiI5i9IUIaxZVuQiN/DYxPfo
SEsuujtfsjuKJxiq8bNCN4aX5x+79eurq5X3Ez/NnZvmXvK5rwLY5QUlXeT3B/cmoOeUJdWg72Uz
OFWL1fbx5fmofHv+ut4dzdbb9c43JRiWU8qsS2pKG0zFZNaHqhIYUlbRGOaaWG1cQt8RjhRBlX9k
aIDg6HtdU7OG2l0HuvaB60uPsNef30UsIuGsPh3q8OFy0SaE75uvO3yue/fytt9sCWEwzybkOaHg
IrkIBEXjxHDDFYkRjcjivdg0vlsQLKuRKj41boOaz5DtaZTVXIwkPP3cJuJanYs+3NThWtLImA8y
npDZPb86PT1Ec6j9A3LkOBKjjhgff6SOSEnzJbXZ+E1Xs9SPyQyJdJRKRioKIx60+fdUgz08uaA0
eKRJ3NBXiuSaNV06v/zy8Z8kFo7t0Cb4pNW7CD9F8p56dBfvrK/v5A2dt4Lq5jtJoaM3ZPaEkW6I
mQxRaHG/TQjxUU+A4OH5pKavwOcTkm52S5e08KEvB5N3Bb7PBHi8PEKPl5ATrnd7jJRb7devKk/m
6+Zpu9q/7dZHD9/WD39ttk92ChH0j0KmhOH2crjIGrsWUCjBHP+6Oj62fPne0Wpf5SQrmbjD1wPK
Ztqfo3mUc+Njg0x0AtNi2K50zHMnnWSghGA6Cmvg+zAd0E/KpL7rpqIqPGdQmyTnZQRb8qZrm8x2
JelR06xM8ZFDGJtJ5vgQi9RmVvhaAu/Ktpg4r/jouz87CGqILUoyDF62LS89ygMrho5uX0lR3yZz
7Ysl+NSjwLuKKQr1xvE7s790qAPWGAgrZaVfh3TYdgILG4QEB3T6yaUIzQPQ3abt3FLnZ97P4QrX
ZWkKk2cJn9zRqrlFcEEUZWLJIo8haAqYshg2IpgnjtSbOB43cHhomw9d0rJA+mYbgc9YFe44GBSI
sCiN94/+WNCUh/B7PMCy0pOQ7/Uh7EFBYCZqRihVM0jFdIsgDhPVKDBFf3vfeW70GoKqADFuBqnC
qmqqWMbImTJYZodRjrBmDhsxQMhaPz3pQifJH0Szvr+BwY5f3M3u7ZhKCzEBxBmJgTEm4Ubl8NiA
fXPeryPO005WeeXmebOgWK29aSf2k0LwQ0UQNepFZttzlklZJRnwBBAbmRB2RibkK8CR7FApDVJZ
kRxOhfC0sETSUvVM5YfCV49mdvyPwiECqlC39r5zMeJYmoquARXSYb6Ige/MmcCIqLlSa6xDbZlV
Te6+vgsFksgNtmoGAxyjDqR9Jye8TEBdE5QoKGe5njCLfdRtweQCszipy10H0wln5NJr+4jIK6f3
+Jt0gulHMkefUav6/B49OuwqMnGNQjTl5VzUmZMGF35MU2s4K/VS0wxkAufxM1Qw+pV6k8oqXL8z
3mBG6WqaMiK2FsuojNNOEozhJKsx7s65ER5QrQnimOatnHvhDwOR8j2xs5T3HvvJYsnsDD0KlPLa
TWmNbjjl7LDnUSDUuK4JvTCmoD92m+3+L5Ut8vF5/foU+iYpgWmhRsSRKhCI3rbOXa2OAsS3unIQ
ivLhYvlzlOK6zXhzdTFMuk5AFtZwMY7BBP3ZTQ9SnrNIzri7kmGa5gPbx6ZAwYkKhAG5ZFLBSd9x
IYDcfrNdFYP/QPqbVFI7WZgpiA7rYGXafF//tt88G0H1VZE+aPgunATdFpyvld8+wvDBsjbhzhMk
FlaCzEWLGxZRumRiSh1oNZvjhOHaVRV1k8Z5222WTjAVdlaTafl4qS7dixaNunNuM5spcHreQbPl
FSiVl+4ar4HzY9ArGWshOEtVtUBjd2UOcJBy0SG+YSRP0R8seaL894pMFqyxDyIfo7rXVaWb9lPX
Mq1U+Gpb6iIsx8e7z8+okHX9qXWVueF92rXGhM550Wh2G9qBX2eVJ3f8uxeUWn7KXLh56DlCuv76
9vSEnjTZ9nW/e3teb/d2+CU+rocKmbgee24BBy8ePdVXJ/+cUlQ69wJdg8nLINHlEZNlHh+78+XG
IPUwE/0Qc/gfyNDxQ1EWGF4ZXRRDhcZhyj5PFI9ewEq3+4G/idrG42AiWQm6QJk12T3HysdaFc6u
TBM3ggzgNw5fmmaCiZJs/chGKhEpIKEL/rqEnGfuI4canGY3gS+YWw52AshQGC44hRENa2hLj4Sc
QU1r4vnQUHeACs4EehloNC9bOq7QDALu3YLOeEFO41AeD2FNEvM81Wsnkba/skIomNJgMucQ9WjN
/DY9Mc6U4oAg9k0xwHAp9Muh48JUFZtTifxqTRGcjA6W0ow1JiLtaSRnIr/reYH7TWiFAIYKbFVx
Qnn16cLFt+o0BxFRLq4uT0ic4qCirRs4M/7lfQ3itUKLRl2vbbmAM0U1fnVxcnISQzoVeN89tK1J
SaczTSm40kEqTHKSwWkir86DNg2NinFry0WJ/rGVyGZZ6XfdUMI50fI+Uas5khw60JVanUgT2lSr
Qpq3KohvmZW4djSafobuXceEy0N1/J8vomD0ZG9wM86dQ2WWnIliH79t8AVb6ihEvFJkSBkFh2RZ
uql7FBSWGr7PG7nlGauGUY6kKFYkooIjmsWW/sDzNfHyNuz+kkoeONjcGgyCc/quILpsxIte16vZ
Y8TPPm8nPVnEdx4pVGhhjH2ZiQWtJwcpJPyuHhMXtpSQ00onCFfC9kkNipepLxp643lTdPWsMRzF
az/i5h0Ui9SciaZlwYqNgHUSMuXDTKxPLZ+hQh4dTH0WsPAsGBHo+eWp6/oA0NjwMsrGyiUwz1ko
HGCQBaqNZTWeY2nqP+et6iBZQbBr/Y8HSUE4ifC04xrSH1UvP14/HOUvD3+9/dBi6Xy1fbI1THw6
CJ3Cq6p2TO0WWHO/q1MXqdT41spyjRboFrdNA5vCNlDhc80h0lEplenJJlRtEFMZJza9PBnnVqQG
r1a46jCsenevW1R938g1jahu3sI8qhPSWpxaAB9Qw7hcwClKfONI+OtP9Gj9L1xe68Mwdb2wlFik
v4lcUIdXho6WAj3m8U29ABoeFpp/eEn5NNBVkhVszDnRRwgQdbtbHUdwwXmt73r0XRE62I6n4P+9
/ths0ekWPuH5bb/+Zw1/rPcPv//+u/3AFqYvUVXOlN1mCH7v17HA1PdjkpLxAFAIfG1ZVVHCgMYO
MUWA3xjlhGgPbRt+a99kmY1rEvsGrI4mXy41Bg6OaqlilzwCsZRO5gMNVT302JoKCuJ1yEgNIvox
/fNbOY+VxpFWjiAH3gtQXYKdhoFF2ud+8MEYP5IQgWUydYrR1zgy1Q0sWdZQFqjeUvc/LKm+dypd
FtpNp7nD6l14VxaWiVIdtF6eLWXZwLAeUMY4T2HnaNGXOOK1jBFh739p8fBxtV8doVz4gNevgelK
Xd2GZ6afpcVdm7OwhEqXk3FBTamWczolqCWVktQzN7ToYI/9phIBo1I2GcvDdDciaUkZVm/axHKp
opcYkHSYSZKCeyWGXiEOhFSrHGUaAyKUQpQBbDgHzk7datRSiJTm13Y6hz5ns/O9Hk+4NmYq4T17
iP0wOfH1PUqfYtNiAgAtk7umsq4clMvVuGJDnolvbCuU/aw7SlGDLe4wdiZYPadpepOwn5SOQHbL
rJnjBYR8B1maCTy80V7+HnImgloNulA5wqBZvOf3SDCNkJp1pDQqtlcJutn5lyWJqU1X7TOUxD0d
1O3DpJ1O7aHjN+gKivSOawTONih05qHxYMBrwXkBW1Rc0z0O6jMAKoPMNFjRzkGapVy9Vn96/uVC
3ZqhCE8rRAzfMae4i6U5qNyLmbEXjplu/7n8RDEFjzEHyzlk3CGNtqqYO49W2lfIl596U4+S2uwn
IexSkbrSySxSQD9jn04c44ERjvKJuuOKqTmYhM/fu+M9NnQYr5gxTyZ9jWUIs8rYdE5uL+kErBYF
p0OQB4o2uCjyKfw4WXO9o+6a1KU0fdLX7NANk6pDbboDeDXj8VtUPWDKRF07qSDqFoNpURw60IW2
XOqcpMCiKetmj/avKAbW765q+yqxWb/uUWxBwT15+c96t3paWzkNWk9NVoCDFg1NETMvKiS/VRs0
eG5BYxX3iwh8veSAF3kVBk3/oe96nBEtaDKiumqq2Ga8arte/fztu+vW6hzZwynLcpkz8pIJUNqU
5UnaXnVDbgO/XjghgV//uj/krYyqoCiSPnHFIQ66SKqbwEYhWQlgww1rz2RZRR6DhQMLb+obrR0F
zzUZMmDXw3pxo8jpJRyEmusr8/8HM2ft3FbgAQA=
--===============1249909337122051102==--

