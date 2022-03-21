Content-Type: multipart/mixed; boundary="===============2667481253831599420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:cec 391/417] drivers/media/platform/samsung/exynos-gsc/gsc-core.c:343:2: warning: Value stored to 'f_chk_addr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Mar 2022 02:49:31 +0800
Message-ID: <202203220250.ind3XA20-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2667481253831599420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   git://linuxtv.org/hverkuil/media_tree.git cec
head:   8b429dac2d98bd585ff5af37042d1d9bb104a2eb
commit: 531daf264b8f3d9effe64b211aa1064e2e410bbc [391/417] media: platform:=
 rename exynos-gsc/ to samsung/exynos-gsc/
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220318 (https://download.01.org/0day-ci/archi=
ve/20220322/202203220250.ind3XA20-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e=
4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media=
_tree.git
        git fetch --no-tags hverkuil-media-tree cec
        git checkout 531daf264b8f3d9effe64b211aa1064e2e410bbc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   include/linux/hid.h:1036:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   include/linux/hid.h:1036:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   include/linux/hid.h:1037:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:600:3: warning: Value st=
ored to 'buf_addr2' is never read [clang-analyzer-deadcode.DeadStores]
                   buf_addr2 +=3D S5P_FIMV_ENC_INTRAPRED_SIZE;
                   ^
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:600:3: note: Value store=
d to 'buf_addr2' is never read
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:604:3: warning: Value st=
ored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStores]
                   buf_addr1 +=3D S5P_FIMV_ENC_NBORINFO_SIZE;
                   ^
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:604:3: note: Value store=
d to 'buf_addr1' is never read
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:635:3: warning: Value st=
ored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStores]
                   buf_addr1 +=3D S5P_FIMV_ENC_ACDCCOEF_SIZE;
                   ^
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:635:3: note: Value store=
d to 'buf_addr1' is never read
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:661:3: warning: Value st=
ored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStores]
                   buf_addr1 +=3D S5P_FIMV_ENC_ACDCCOEF_SIZE;
                   ^
   drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c:661:3: note: Value store=
d to 'buf_addr1' is never read
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
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/dvb-frontends/s5h1420.c:186:29: warning: The result of the=
 left shift is undefined because the left operand is negative [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
                                         ((cmd->msg_len-1) << 4) | 0x08);
                                          ~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Assuming 'debug' is 0
           dprintk("enter %s\n", __func__);
           ^
   drivers/media/dvb-frontends/s5h1420.c:61:6: note: expanded from macro 'd=
printk'
           if (debug) \
               ^~~~~
   drivers/media/dvb-frontends/s5h1420.c:170:2: note: Taking false branch
           dprintk("enter %s\n", __func__);

vim +/f_chk_addr +343 drivers/media/platform/samsung/exynos-gsc/gsc-core.c

89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  339  =

89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  340  void gsc_set_prefbuf(struct gsc_dev *gsc, struct g=
sc_frame *frm)
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  341  {
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  342  	u32 f_chk_addr, f_chk_len, s_chk_addr, s_chk_len;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31 @343  	f_chk_addr =3D f_chk_len =3D s_chk_addr =3D s_chk=
_len =3D 0;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  344  =

89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  345  	f_chk_addr =3D frm->addr.y;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  346  	f_chk_len =3D frm->payload[0];
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  347  	if (frm->fmt->num_planes =3D=3D 2) {
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  348  		s_chk_addr =3D frm->addr.cb;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  349  		s_chk_len =3D frm->payload[1];
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  350  	} else if (frm->fmt->num_planes =3D=3D 3) {
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  351  		u32 low_addr, low_plane, mid_addr, mid_plane;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  352  		u32 high_addr, high_plane;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  353  		u32 t_min, t_max;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  354  =

89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  355  		t_min =3D min3(frm->addr.y, frm->addr.cb, frm->a=
ddr.cr);
32af858cc96b0ce drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho=
 Chehab 2014-11-25  356  		if (get_plane_info(frm, t_min, &low_plane, &low_=
addr))
32af858cc96b0ce drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho=
 Chehab 2014-11-25  357  			return;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  358  		t_max =3D max3(frm->addr.y, frm->addr.cb, frm->a=
ddr.cr);
32af858cc96b0ce drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho=
 Chehab 2014-11-25  359  		if (get_plane_info(frm, t_max, &high_plane, &hig=
h_addr))
32af858cc96b0ce drivers/media/platform/exynos-gsc/gsc-core.c Mauro Carvalho=
 Chehab 2014-11-25  360  			return;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  361  =

89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  362  		mid_plane =3D 3 - (low_plane + high_plane);
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  363  		if (mid_plane =3D=3D 0)
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  364  			mid_addr =3D frm->addr.y;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  365  		else if (mid_plane =3D=3D 1)
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  366  			mid_addr =3D frm->addr.cb;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  367  		else if (mid_plane =3D=3D 2)
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  368  			mid_addr =3D frm->addr.cr;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  369  		else
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  370  			return;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  371  =

89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  372  		f_chk_addr =3D low_addr;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  373  		if (mid_addr + frm->payload[mid_plane] - low_add=
r >
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  374  		    high_addr + frm->payload[high_plane] - mid_a=
ddr) {
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  375  			f_chk_len =3D frm->payload[low_plane];
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  376  			s_chk_addr =3D mid_addr;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  377  			s_chk_len =3D high_addr +
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  378  					frm->payload[high_plane] - mid_addr;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  379  		} else {
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  380  			f_chk_len =3D mid_addr +
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  381  					frm->payload[mid_plane] - low_addr;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  382  			s_chk_addr =3D high_addr;
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  383  			s_chk_len =3D frm->payload[high_plane];
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  384  		}
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  385  	}
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  386  	pr_debug("f_addr =3D 0x%08x, f_len =3D %d, s_addr=
 =3D 0x%08x, s_len =3D %d\n",
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  387  			f_chk_addr, f_chk_len, s_chk_addr, s_chk_len);
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  388  }
89069699769aa41 drivers/media/platform/exynos-gsc/gsc-core.c Sungchun Kang =
        2012-07-31  389  =


:::::: The code at line 343 was first introduced by commit
:::::: 89069699769aa4108023a80ac953454e1d26af6b [media] gscaler: Add core f=
unctionality for the G-Scaler driver

:::::: TO: Sungchun Kang <sungchun.kang@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2667481253831599420==--

