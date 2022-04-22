Content-Type: multipart/mixed; boundary="===============4489150758256597089=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:2: warning: Value stored to 'f_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 22 Apr 2022 22:25:13 +0800
Message-ID: <202204222205.cHcJNsoT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4489150758256597089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d569e86915b7f2f9795588591c8d5ea0b66481cb
commit: 3bae07d4b44cf10bbffc6270e00816dda57e6e70 media: platform: rename ex=
ynos-gsc/ to samsung/exynos-gsc/
date:   5 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220421 (https://download.01.org/0day-ci/arc=
hive/20220422/202204222205.cHcJNsoT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3bae07d4b44cf10bbffc6270e00816dda57e6e70
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3bae07d4b44cf10bbffc6270e00816dda57e6e70
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/media/v4l2-common.h:72:2: note: expanded from macro 'v4l2_dbg'
           do {                                                            \
           ^
   drivers/media/i2c/ov9650.c:912:8: note: Calling '__g_volatile_ctrl'
           ret =3D __g_volatile_ctrl(ov965x, ctrl);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:863:6: note: Assuming field 'power' is not eq=
ual to 0
           if (!ov965x->power)
               ^~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:863:2: note: Taking false branch
           if (!ov965x->power)
           ^
   drivers/media/i2c/ov9650.c:866:2: note: Control jumps to 'case 9963794:'=
  at line 867
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov9650.c:868:7: note: Assuming field 'val' is not equa=
l to 0
                   if (!ctrl->val)
                       ^~~~~~~~~~
   drivers/media/i2c/ov9650.c:868:3: note: Taking false branch
                   if (!ctrl->val)
                   ^
   drivers/media/i2c/ov9650.c:871:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/media/i2c/ov9650.c:871:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/media/i2c/ov9650.c:874:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/media/i2c/ov9650.c:874:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/media/i2c/ov9650.c:877:15: note: Calling 'fls'
                   m =3D 0x01 << fls(gain >> 4);
                               ^~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   drivers/media/i2c/ov9650.c:877:15: note: Returning from 'fls'
                   m =3D 0x01 << fls(gain >> 4);
                               ^~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:877:12: note: The result of the left shift is=
 undefined due to shifting by '32', which is greater or equal to the width =
of type 'int'
                   m =3D 0x01 << fls(gain >> 4);
                            ^  ~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:2: warning: Val=
ue stored to 'f_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:2: note: Value =
stored to 'f_chk_addr' is never read
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:15: warning: Al=
though the value stored to 'f_chk_len' is used in the enclosing expression,=
 the value is never actually read from 'f_chk_len' [clang-analyzer-deadcode=
.DeadStores]
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
                        ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:15: note: Altho=
ugh the value stored to 'f_chk_len' is used in the enclosing expression, th=
e value is never actually read from 'f_chk_len'
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
                        ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:27: warning: Al=
though the value stored to 's_chk_addr' is used in the enclosing expression=
, the value is never actually read from 's_chk_addr' [clang-analyzer-deadco=
de.DeadStores]
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
                                    ^            ~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:27: note: Altho=
ugh the value stored to 's_chk_addr' is used in the enclosing expression, t=
he value is never actually read from 's_chk_addr'
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
                                    ^            ~~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:40: warning: Al=
though the value stored to 's_chk_len' is used in the enclosing expression,=
 the value is never actually read from 's_chk_len' [clang-analyzer-deadcode=
.DeadStores]
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
                                                 ^           ~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:40: note: Altho=
ugh the value stored to 's_chk_len' is used in the enclosing expression, th=
e value is never actually read from 's_chk_len'
           f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_len =3D 0;
                                                 ^           ~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:345:2: warning: Val=
ue stored to 'f_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
           f_chk_addr =3D frm->addr.y;
           ^            ~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:345:2: note: Value =
stored to 'f_chk_addr' is never read
           f_chk_addr =3D frm->addr.y;
           ^            ~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:346:2: warning: Val=
ue stored to 'f_chk_len' is never read [clang-analyzer-deadcode.DeadStores]
           f_chk_len =3D frm->payload[0];
           ^           ~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:346:2: note: Value =
stored to 'f_chk_len' is never read
           f_chk_len =3D frm->payload[0];
           ^           ~~~~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:348:3: warning: Val=
ue stored to 's_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
                   s_chk_addr =3D frm->addr.cb;
                   ^            ~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:348:3: note: Value =
stored to 's_chk_addr' is never read
                   s_chk_addr =3D frm->addr.cb;
                   ^            ~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos-gsc/gsc-core.c:349:3: warning: Val=
ue stored to 's_chk_len' is never read [clang-analyzer-deadcode.DeadStores]
                   s_chk_len =3D frm->payload[1];
                   ^           ~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:349:3: note: Value =
stored to 's_chk_len' is never read
                   s_chk_len =3D frm->payload[1];
                   ^           ~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:372:3: warning: Val=
ue stored to 'f_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
                   f_chk_addr =3D low_addr;
                   ^            ~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:372:3: note: Value =
stored to 'f_chk_addr' is never read
                   f_chk_addr =3D low_addr;
                   ^            ~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:375:4: warning: Val=
ue stored to 'f_chk_len' is never read [clang-analyzer-deadcode.DeadStores]
                           f_chk_len =3D frm->payload[low_plane];
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:375:4: note: Value =
stored to 'f_chk_len' is never read
                           f_chk_len =3D frm->payload[low_plane];
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:376:4: warning: Val=
ue stored to 's_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
                           s_chk_addr =3D mid_addr;
                           ^            ~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:376:4: note: Value =
stored to 's_chk_addr' is never read
                           s_chk_addr =3D mid_addr;
                           ^            ~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:377:4: warning: Val=
ue stored to 's_chk_len' is never read [clang-analyzer-deadcode.DeadStores]
                           s_chk_len =3D high_addr +
                           ^           ~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:377:4: note: Value =
stored to 's_chk_len' is never read
                           s_chk_len =3D high_addr +
                           ^           ~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:380:4: warning: Val=
ue stored to 'f_chk_len' is never read [clang-analyzer-deadcode.DeadStores]
                           f_chk_len =3D mid_addr +
                           ^           ~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:380:4: note: Value =
stored to 'f_chk_len' is never read
                           f_chk_len =3D mid_addr +
                           ^           ~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:382:4: warning: Val=
ue stored to 's_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
                           s_chk_addr =3D high_addr;
                           ^            ~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:382:4: note: Value =
stored to 's_chk_addr' is never read
                           s_chk_addr =3D high_addr;
                           ^            ~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:383:4: warning: Val=
ue stored to 's_chk_len' is never read [clang-analyzer-deadcode.DeadStores]
                           s_chk_len =3D frm->payload[high_plane];
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos-gsc/gsc-core.c:383:4: note: Value =
stored to 's_chk_len' is never read
                           s_chk_len =3D frm->payload[high_plane];
                           ^           ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/platform/chips-media/coda-common.c:478:38: warning: Array =
access (from variable 'formats') results in a null pointer dereference [cla=
ng-analyzer-core.NullDereference]
           if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=3D 0)
                                               ^~~~~~~
   drivers/media/platform/chips-media/coda-common.c:448:6: note: Assuming f=
ield 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:448:2: note: Taking tru=
e branch
           if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
           ^
   drivers/media/platform/chips-media/coda-common.c:449:3: note: Null point=
er value stored to 'formats'
                   formats =3D cvd->src_formats;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:478:6: note: Assuming f=
ield 'index' is < CODA_MAX_FORMATS
           if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:478:6: note: Left side =
of '||' is false
   drivers/media/platform/chips-media/coda-common.c:478:38: note: Array acc=
ess (from variable 'formats') results in a null pointer dereference
           if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=3D 0)
                                               ^~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/platform/chips-media/coda-common.c:2117:9: note: Assuming =
field 'streamon_out' is not equal to 0
           stop =3D ctx->streamon_out && ctx->streamon_cap;
                  ^~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2117:9: note: Left side=
 of '&&' is true
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Assuming =
'coda_debug' is < 1
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^
   drivers/media/platform/chips-media/coda.h:300:7: note: expanded from mac=
ro 'coda_dbg'
                   if (coda_debug >=3D (level))                            =
  \
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Taking fa=
lse branch
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^

vim +/f_chk_addr +343 drivers/media/platform/samsung/exynos-gsc/gsc-core.c

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  339  =

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  340  void gsc_set_prefbuf(struct gsc_dev *gsc, struct gs=
c_frame *frm)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  341  {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  342  	u32 f_chk_addr, f_chk_len, s_chk_addr, s_chk_len;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31 @343  	f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk_=
len =3D 0;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  344  =

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31 @345  	f_chk_addr =3D frm->addr.y;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31 @346  	f_chk_len =3D frm->payload[0];
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  347  	if (frm->fmt->num_planes =3D=3D 2) {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31 @348  		s_chk_addr =3D frm->addr.cb;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31 @349  		s_chk_len =3D frm->payload[1];
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  350  	} else if (frm->fmt->num_planes =3D=3D 3) {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  351  		u32 low_addr, low_plane, mid_addr, mid_plane;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  352  		u32 high_addr, high_plane;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  353  		u32 t_min, t_max;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  354  =

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  355  		t_min =3D min3(frm->addr.y, frm->addr.cb, frm->ad=
dr.cr);
32af858cc96b0c drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho =
Chehab 2014-11-25  356  		if (get_plane_info(frm, t_min, &low_plane, &low_a=
ddr))
32af858cc96b0c drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho =
Chehab 2014-11-25  357  			return;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  358  		t_max =3D max3(frm->addr.y, frm->addr.cb, frm->ad=
dr.cr);
32af858cc96b0c drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho =
Chehab 2014-11-25  359  		if (get_plane_info(frm, t_max, &high_plane, &high=
_addr))
32af858cc96b0c drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho =
Chehab 2014-11-25  360  			return;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  361  =

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  362  		mid_plane =3D 3 - (low_plane + high_plane);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  363  		if (mid_plane =3D=3D 0)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  364  			mid_addr =3D frm->addr.y;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  365  		else if (mid_plane =3D=3D 1)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  366  			mid_addr =3D frm->addr.cb;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  367  		else if (mid_plane =3D=3D 2)
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  368  			mid_addr =3D frm->addr.cr;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  369  		else
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  370  			return;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  371  =

89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  372  		f_chk_addr =3D low_addr;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  373  		if (mid_addr + frm->payload[mid_plane] - low_addr=
 >
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  374  		    high_addr + frm->payload[high_plane] - mid_ad=
dr) {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  375  			f_chk_len =3D frm->payload[low_plane];
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  376  			s_chk_addr =3D mid_addr;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  377  			s_chk_len =3D high_addr +
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  378  					frm->payload[high_plane] - mid_addr;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  379  		} else {
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  380  			f_chk_len =3D mid_addr +
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  381  					frm->payload[mid_plane] - low_addr;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  382  			s_chk_addr =3D high_addr;
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  383  			s_chk_len =3D frm->payload[high_plane];
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  384  		}
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  385  	}
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  386  	pr_debug("f_addr =3D 0x%08x, f_len =3D %d, s_addr =
=3D 0x%08x, s_len =3D %d\n",
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  387  			f_chk_addr, f_chk_len, s_chk_addr, s_chk_len);
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  388  }
89069699769aa4 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang  =
       2012-07-31  389  =


:::::: The code at line 343 was first introduced by commit
:::::: 89069699769aa4108023a80ac953454e1d26af6b [media] gscaler: Add core f=
unctionality for the G-Scaler driver

:::::: TO: Sungchun Kang <sungchun.kang@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4489150758256597089==--

