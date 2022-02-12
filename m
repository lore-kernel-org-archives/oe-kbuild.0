Content-Type: multipart/mixed; boundary="===============2912405676006712892=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/fb.c:126:14: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 13 Feb 2022 05:32:16 +0800
Message-ID: <202202130548.HprbqGk8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2912405676006712892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: 606b102876e3741851dfb09d53f3ee57f650a52c drm: fb_helper: fix CONFIG=
_FB dependency
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220210 (https://download.01.org/0day-ci/archi=
ve/20220213/202202130548.HprbqGk8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D606b102876e3741851dfb09d53f3ee57f650a52c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 606b102876e3741851dfb09d53f3ee57f650a52c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^
   drivers/staging/axis-fifo/axis-fifo.c:560:3: note: Loop condition is tru=
e.  Entering loop body
                   for (i =3D 0; i < copy; i++)
                   ^
   drivers/staging/axis-fifo/axis-fifo.c:561:4: note: 1st function call arg=
ument is an uninitialized value
                           iowrite32(tmp_buf[i], fifo->base_addr +
                           ^         ~~~~~~~~~~
   include/asm-generic/io.h:759:19: note: expanded from macro 'iowrite32'
   #define iowrite32 iowrite32
                     ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/mtd/nand/raw/atmel/nand-controller.c:436:8: warning: The result =
of the left shift is undefined due to shifting '5' by '19', which is unrepr=
esentable in the unsigned version of the return type 'int' [clang-analyzer-=
core.UndefinedBinaryOperatorResult]
                 ATMEL_NFC_ACYCLE(nc->op.naddrs);
                 ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:116:45: note: expanded from=
 macro 'ATMEL_NFC_ACYCLE'
   #define ATMEL_NFC_ACYCLE(naddrs)                ((naddrs) << 19)
                                                             ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:1105:9: note: Calling 'atme=
l_hsmc_nand_pmecc_read_pg'
           return atmel_hsmc_nand_pmecc_read_pg(chip, buf, oob_required, pa=
ge,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:1059:6: note: Assuming fiel=
d 'type' is equal to ATMEL_NAND_NATIVE_RB
           if (nand->activecs->rb.type !=3D ATMEL_NAND_NATIVE_RB)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:1059:2: note: Taking false =
branch
           if (nand->activecs->rb.type !=3D ATMEL_NAND_NATIVE_RB)
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:1065:6: note: Assuming fiel=
d 'writesize' is <=3D 512
           if (mtd->writesize > 512)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:1065:2: note: Taking false =
branch
           if (mtd->writesize > 512)
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:1068:2: note: Calling 'atme=
l_nfc_set_op_addr'
           atmel_nfc_set_op_addr(chip, page, 0x0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:768:6: note: 'column' is >=
=3D 0
           if (column >=3D 0) {
               ^~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:768:2: note: Taking true br=
anch
           if (column >=3D 0) {
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:769:16: note: Value assigne=
d to field 'naddrs'
                   nc->op.addrs[nc->op.naddrs++] =3D column;
                                ^~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:774:12: note: Field 'writes=
ize' is <=3D 512
                   if (mtd->writesize > 512)
                            ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:774:3: note: Taking false b=
ranch
                   if (mtd->writesize > 512)
                   ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:778:6: note: Assuming 'page=
' is < 0
           if (page >=3D 0) {
               ^~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:778:2: note: Taking false b=
ranch
           if (page >=3D 0) {
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:1068:2: note: Returning fro=
m 'atmel_nfc_set_op_addr'
           atmel_nfc_set_op_addr(chip, page, 0x0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:1073:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:1073:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:1076:8: note: Calling 'atme=
l_nfc_exec_op'
           ret =3D atmel_nfc_exec_op(nc, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:429:14: note: Assuming 'i' =
is >=3D field 'ncmds'
           for (i =3D 0; i < nc->op.ncmds; i++)
                       ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:429:2: note: Loop condition=
 is false. Execution continues on line 432
           for (i =3D 0; i < nc->op.ncmds; i++)
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:432:6: note: Assuming field=
 'naddrs' is equal to ATMEL_NFC_MAX_ADDR_CYCLES
           if (nc->op.naddrs =3D=3D ATMEL_NFC_MAX_ADDR_CYCLES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:432:2: note: Taking true br=
anch
           if (nc->op.naddrs =3D=3D ATMEL_NFC_MAX_ADDR_CYCLES)
           ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:436:8: note: The result of =
the left shift is undefined due to shifting '5' by '19', which is unreprese=
ntable in the unsigned version of the return type 'int'
                 ATMEL_NFC_ACYCLE(nc->op.naddrs);
                 ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:116:45: note: expanded from=
 macro 'ATMEL_NFC_ACYCLE'
   #define ATMEL_NFC_ACYCLE(naddrs)                ((naddrs) << 19)
                                                    ~~~~~~~~ ^
   drivers/mtd/nand/raw/atmel/nand-controller.c:2029:22: warning: Value sto=
red to 'np' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/mtd/nand/raw/atmel/nand-controller.c:2029:22: note: Value stored=
 to 'np' during its initialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/gpu/drm/tegra/fb.c:126:14: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
                   fb->obj[i] =3D &planes[i]->gem;
                              ^
   drivers/gpu/drm/tegra/fb.c:150:14: note: Assuming 'i' is >=3D field 'num=
_planes'
           for (i =3D 0; i < info->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:150:2: note: Loop condition is false. Executi=
on continues on line 174
           for (i =3D 0; i < info->num_planes; i++) {
           ^
   drivers/gpu/drm/tegra/fb.c:174:7: note: Calling 'tegra_fb_alloc'
           fb =3D tegra_fb_alloc(drm, cmd, planes, i);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:119:7: note: Calling 'kzalloc'
           fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:119:7: note: Returning from 'kzalloc'
           fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:120:6: note: Assuming 'fb' is non-null
           if (!fb)
               ^~~
   drivers/gpu/drm/tegra/fb.c:120:2: note: Taking false branch
           if (!fb)
           ^
   drivers/gpu/drm/tegra/fb.c:125:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < fb->format->num_planes; i++)
                ^~~~~
   drivers/gpu/drm/tegra/fb.c:125:14: note: Assuming 'i' is < field 'num_pl=
anes'
           for (i =3D 0; i < fb->format->num_planes; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:125:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < fb->format->num_planes; i++)
           ^
   drivers/gpu/drm/tegra/fb.c:126:14: note: Assigned value is garbage or un=
defined
                   fb->obj[i] =3D &planes[i]->gem;
                              ^ ~~~~~~~~~~~~~~~
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
   drivers/iio/adc/qcom-spmi-vadc.c:326:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D vadc_poll_wait_eoc(vadc, timeout);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-spmi-vadc.c:326:3: note: Value stored to 'ret' is n=
ever read
                   ret =3D vadc_poll_wait_eoc(vadc, timeout);

vim +126 drivers/gpu/drm/tegra/fb.c

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  109  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  110 =
 static struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
1eb83451ba55d7 drivers/gpu/drm/tegra/fb.c  Ville Syrj=C3=A4l=C3=A4   2015-1=
1-11  111  					      const struct drm_mode_fb_cmd2 *mode_cmd,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  112 =
 					      struct tegra_bo **planes,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  113 =
 					      unsigned int num_planes)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  114 =
 {
dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  115 =
 	struct drm_framebuffer *fb;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  116 =
 	unsigned int i;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  117 =
 	int err;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  118  =

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  119 =
 	fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  120 =
 	if (!fb)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  121 =
 		return ERR_PTR(-ENOMEM);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  122  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  123 =
 	drm_helper_mode_fill_fb_struct(drm, fb, mode_cmd);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  124  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  125 =
 	for (i =3D 0; i < fb->format->num_planes; i++)
dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30 @126 =
 		fb->obj[i] =3D &planes[i]->gem;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  127  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  128 =
 	err =3D drm_framebuffer_init(drm, fb, &tegra_fb_funcs);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  129 =
 	if (err < 0) {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  130 =
 		dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  131 =
 			err);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  132 =
 		kfree(fb);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  133 =
 		return ERR_PTR(err);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  134 =
 	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  135  =

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  136 =
 	return fb;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  137 =
 }
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  138  =


:::::: The code at line 126 was first introduced by commit
:::::: dbc33c7d65536bce447057dc6f882decc515047d drm/tegra: tegra_fb -> drm_=
framebuffer

:::::: TO: Daniel Stone <daniels@collabora.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2912405676006712892==--

