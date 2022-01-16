Content-Type: multipart/mixed; boundary="===============0440262853922386832=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/rocker/rocker_ofdpa.c:1235:2: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 16 Jan 2022 18:02:19 +0800
Message-ID: <202201161722.4XR3O86w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0440262853922386832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a33f5c380c4bd3fa5278d690421b72052456d9fe
commit: 97e4910232fa1f81e806aa60c25a0450276d99a2 linux/compiler-clang.h: de=
fine HAVE_BUILTIN_BSWAP*
date:   10 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220113 (https://download.01.org/0day-ci/archi=
ve/20220116/202201161722.4XR3O86w-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d10219=
78b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D97e4910232fa1f81e806aa60c25a0450276d99a2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 97e4910232fa1f81e806aa60c25a0450276d99a2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   drivers/gpu/drm/meson/meson_venc.c:136:2: warning: Excessive padding in =
'struct meson_hdmi_venc_mode::(unnamed at drivers/gpu/drm/meson/meson_venc.=
c:136:2)' (39 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   dvi_settings, =

   video_mode, =

   video_mode_adv, =

   video_prog_mode, =

   video_sync_mode, =

   video_yc_dly, =

   video_rgb_ctrl, =

   video_filt_ctrl, =

   video_ofld_voav_ofst, =

   yfp1_htime, =

   yfp2_htime, =

   max_pxcnt, =

   hspuls_begin, =

   hspuls_end, =

   hspuls_switch, =

   vspuls_begin, =

   vspuls_end, =

   vspuls_bline, =

   vspuls_eline, =

   eqpuls_begin, =

   eqpuls_end, =

   eqpuls_bline, =

   eqpuls_eline, =

   havon_begin, =

   havon_end, =

   vavon_bline, =

   vavon_eline, =

   hso_begin, =

   hso_end, =

   vso_begin, =

   vso_end, =

   vso_bline, =

   vso_eline, =

   sy_val, =

   sy2_val, =

   max_lncnt, =

   video_prog_mode_present, =

   video_sync_mode_present, =

   video_yc_dly_present, =

   video_rgb_ctrl_present, =

   video_filt_ctrl_present, =

   video_ofld_voav_ofst_present, =

   eqpuls_begin_present, =

   eqpuls_end_present, =

   eqpuls_bline_present, =

   eqpuls_eline_present, =

   vso_eline_present, =

   sy_val_present, =

   sy2_val_present, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
           struct {
           ^~~~~~~~
   drivers/gpu/drm/meson/meson_venc.c:136:2: note: Excessive padding in 'st=
ruct meson_hdmi_venc_mode::(unnamed at drivers/gpu/drm/meson/meson_venc.c:1=
36:2)' (39 padding bytes, where 3 is optimal). Optimal fields order: dvi_se=
ttings, video_mode, video_mode_adv, video_prog_mode, video_sync_mode, video=
_yc_dly, video_rgb_ctrl, video_filt_ctrl, video_ofld_voav_ofst, yfp1_htime,=
 yfp2_htime, max_pxcnt, hspuls_begin, hspuls_end, hspuls_switch, vspuls_beg=
in, vspuls_end, vspuls_bline, vspuls_eline, eqpuls_begin, eqpuls_end, eqpul=
s_bline, eqpuls_eline, havon_begin, havon_end, vavon_bline, vavon_eline, hs=
o_begin, hso_end, vso_begin, vso_end, vso_bline, vso_eline, sy_val, sy2_val=
, max_lncnt, video_prog_mode_present, video_sync_mode_present, video_yc_dly=
_present, video_rgb_ctrl_present, video_filt_ctrl_present, video_ofld_voav_=
ofst_present, eqpuls_begin_present, eqpuls_end_present, eqpuls_bline_presen=
t, eqpuls_eline_present, vso_eline_present, sy_val_present, sy2_val_present=
, consider reordering the fields or adding explicit padding members
           struct {
           ^~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iommu/sun50i-iommu.c:511:3: warning: Value stored to 'dte' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   dte =3D old_dte;
                   ^     ~~~~~~~
   drivers/iommu/sun50i-iommu.c:511:3: note: Value stored to 'dte' is never=
 read
                   dte =3D old_dte;
                   ^     ~~~~~~~
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
   8 warnings generated.
>> drivers/net/ethernet/rocker/rocker_ofdpa.c:1235:2: warning: The expressi=
on is an uninitialized value. The computed value will also be garbage [clan=
g-analyzer-core.uninitialized.Assign]
           entry->ref_count++;
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2717:6: note: Assuming field =
'fib_aborted' is false
           if (ofdpa->fib_aborted)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2717:2: note: Taking false br=
anch
           if (ofdpa->fib_aborted)
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2721:6: note: Assuming 'ofdpa=
_port' is non-null
           if (!ofdpa_port)
               ^~~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2721:2: note: Taking false br=
anch
           if (!ofdpa_port)
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2723:8: note: Calling 'ofdpa_=
port_fib_ipv4'
           err =3D ofdpa_port_fib_ipv4(ofdpa_port, htonl(fen_info->dst),
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2287:16: note: Assuming field=
 'nhc_dev' is equal to field 'dev'
           nh_on_port =3D (nh->fib_nh_dev =3D=3D ofdpa_port->dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2288:12: note: Assuming field=
 'ipv4' is not equal to 0
           has_gw =3D !!nh->fib_nh_gw4;
                     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2290:6: note: 'has_gw' is true
           if (has_gw && nh_on_port) {
               ^~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2290:6: note: Left side of '&=
&' is true
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2290:16: note: 'nh_on_port' i=
s true
           if (has_gw && nh_on_port) {
                         ^~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2290:2: note: Taking true bra=
nch
           if (has_gw && nh_on_port) {
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:2291:9: note: Calling 'ofdpa_=
port_ipv4_nh'
                   err =3D ofdpa_port_ipv4_nh(ofdpa_port, flags,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1390:6: note: Assuming 'entry=
' is non-null
           if (!entry)
               ^~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1390:2: note: Taking false br=
anch
           if (!entry)
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1393:2: note: Loop condition =
is false.  Exiting loop
           spin_lock_irqsave(&ofdpa->neigh_tbl_lock, lock_flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1393:2: note: Loop condition =
is false.  Exiting loop
           spin_lock_irqsave(&ofdpa->neigh_tbl_lock, lock_flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1397:13: note: Assuming 'foun=
d' is non-null
           updating =3D found && adding;
                      ^~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1397:13: note: Left side of '=
&&' is true
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1398:13: note: 'found' is non=
-null
           removing =3D found && !adding;
                      ^~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1398:13: note: Left side of '=
&&' is true
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1399:12: note: 'found' is non=
-null
           adding =3D !found && adding;
                     ^~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1399:18: note: Left side of '=
&&' is false
           adding =3D !found && adding;
                           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1401:6: note: 'adding' is fal=
se
           if (adding) {
               ^~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1401:2: note: Taking false br=
anch
           if (adding) {
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1407:13: note: 'removing' is =
false
           } else if (removing) {
                      ^~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1407:9: note: Taking false br=
anch
           } else if (removing) {
                  ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1410:13: note: 'updating' is =
true
           } else if (updating) {
                      ^~~~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1410:9: note: Taking true bra=
nch
           } else if (updating) {
                  ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1420:7: note: 'adding' is fal=
se
           if (!adding)
                ^~~~~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1420:2: note: Taking true bra=
nch
           if (!adding)
           ^
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1423:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/net/ethernet/rocker/rocker_ofdpa.c:1423:2: note: Taking false br=
anch
           if (err)

vim +1235 drivers/net/ethernet/rocker/rocker_ofdpa.c

3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1230  =

3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1231  static void ofdpa_neigh_add(str=
uct ofdpa *ofdpa,
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1232  			    struct ofdpa_neigh_tbl_e=
ntry *entry)
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1233  {
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1234  	entry->index =3D ofdpa->neigh_=
tbl_next_index++;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16 @1235  	entry->ref_count++;
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1236  	hash_add(ofdpa->neigh_tbl, &en=
try->entry,
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1237  		 be32_to_cpu(entry->ip_addr));
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1238  }
3fbcdbf3f1cbe8 Jiri Pirko 2016-02-16  1239  =


:::::: The code at line 1235 was first introduced by commit
:::::: 3fbcdbf3f1cbe86fc11856ec268470d7d7bd459b rocker: move OF-DPA stuff i=
nto separate file

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0440262853922386832==--

