Content-Type: multipart/mixed; boundary="===============5844032956165017379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/intel/pxa_camera.c:1352:25: warning: Value stored to 'pcdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 04 May 2022 09:08:40 +0800
Message-ID: <202205040831.z23yP7jj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5844032956165017379==
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
head:   ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
commit: 95495f2aa9d8df1a7697bab24118544d3568f41d media: platform: place Int=
el drivers on a separate dir
date:   7 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220504/202205040831.z23yP7jj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D95495f2aa9d8df1a7697bab24118544d3568f41d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 95495f2aa9d8df1a7697bab24118544d3568f41d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/of/irq.c:602:4: note: Loop condition is false.  Exiting loop
                           pr_err("of_irq_init: children remain, but no par=
ents\n");
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/of/irq.c:603:4: note:  Execution continues on line 610
                           break;
                           ^
   drivers/of/irq.c:610:27: note: Null pointer value stored to 'desc'
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
                                    ^
   include/linux/list.h:725:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:610:2: note: Dereference of null pointer
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   2 warnings generated.
   drivers/media/i2c/ov9650.c:606:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:606:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/i2c/rj54n1cb0c.c:687:3: warning: Value stored to 'input_w'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   input_w =3D output_w;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:687:3: note: Value stored to 'input_w' is=
 never read
                   input_w =3D output_w;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:688:3: warning: Value stored to 'input_h'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   input_h =3D output_h;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:688:3: note: Value stored to 'input_h' is=
 never read
                   input_h =3D output_h;
                   ^         ~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/gyro/fxas21002c_core.c:137:8: warning: Excessive padding in =
'struct fxas21002c_data' (35 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   buffer, =

   timestamp, =

   mode, =

   prev_mode, =

   regmap, =

   dready_trig, =

   irq, =

   vdd, =

   vddio, =

   lock, =

   regmap_fields, =

   chip_id, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct fxas21002c_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/gyro/fxas21002c_core.c:137:8: note: Excessive padding in 'st=
ruct fxas21002c_data' (35 padding bytes, where 3 is optimal). Optimal field=
s order: buffer, timestamp, mode, prev_mode, regmap, dready_trig, irq, vdd,=
 vddio, lock, regmap_fields, chip_id, consider reordering the fields or add=
ing explicit padding members
   struct fxas21002c_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/iio/gyro/itg3200_core.c:94:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:94:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:370:18: warning: Value stored to 'st' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct itg3200 *st =3D iio_priv(indio_dev);
                           ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:370:18: note: Value stored to 'st' durin=
g its initialization is never read
           struct itg3200 *st =3D iio_priv(indio_dev);
                           ^~   ~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/intel/pxa_camera.c:1352:25: warning: Value stored=
 to 'pcdev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct pxa_camera_dev *pcdev =3D vb2_get_drv_priv(vb->vb2_queue);
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/intel/pxa_camera.c:1352:25: note: Value stored to=
 'pcdev' during its initialization is never read
           struct pxa_camera_dev *pcdev =3D vb2_get_drv_priv(vb->vb2_queue);
                                  ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:16: warning: The l=
eft operand of '>' is a garbage value due to array index out of bounds [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                   if (brz_w[i] > 3)
                                ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:181:2: note: Taking fa=
lse branch
           if (mtk_jpeg_decide_format(param))
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:186:6: note: Calling '=
mtk_jpeg_calc_dst_size'
           if (mtk_jpeg_calc_dst_size(param))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:14: note: Assuming=
 'i' is < field 'comp_num'
           for (i =3D 0; i < param->comp_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:2: note: Loop cond=
ition is true.  Entering loop body
           for (i =3D 0; i < param->comp_num; i++) {
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:3: note: Taking fa=
lse branch
                   if (brz_w[i] > 3)
                   ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:158:26: note: 'i' is 0
                   param->img_stride[i] =3D i ? round_up(param->comp_w[i], =
16)
                                          ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:158:26: note: '?' cond=
ition is false
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:14: note: Assuming=
 'i' is < field 'comp_num'
           for (i =3D 0; i < param->comp_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:2: note: Loop cond=
ition is true.  Entering loop body
           for (i =3D 0; i < param->comp_num; i++) {
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:7: note: Assuming =
the condition is false
                   if (brz_w[i] > 3)
                       ^~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:3: note: Taking fa=
lse branch
                   if (brz_w[i] > 3)
                   ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:158:26: note: 'i' is 1
                   param->img_stride[i] =3D i ? round_up(param->comp_w[i], =
16)
                                          ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:158:26: note: '?' cond=
ition is true
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:14: note: Assuming=
 'i' is < field 'comp_num'
           for (i =3D 0; i < param->comp_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:2: note: Loop cond=
ition is true.  Entering loop body
           for (i =3D 0; i < param->comp_num; i++) {
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:3: note: Taking fa=
lse branch
                   if (brz_w[i] > 3)
                   ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:158:26: note: 'i' is 2
                   param->img_stride[i] =3D i ? round_up(param->comp_w[i], =
16)
                                          ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:158:26: note: '?' cond=
ition is true
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:35: note: The valu=
e 3 is assigned to 'i'
           for (i =3D 0; i < param->comp_num; i++) {
                                            ^~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:14: note: Assuming=
 'i' is < field 'comp_num'
           for (i =3D 0; i < param->comp_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:2: note: Loop cond=
ition is true.  Entering loop body
           for (i =3D 0; i < param->comp_num; i++) {
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:149:16: note: The left=
 operand of '>' is a garbage value due to array index out of bounds
                   if (brz_w[i] > 3)
                       ~~~~~~~~ ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:163:29: warning: The l=
eft operand of '*' is a garbage value [clang-analyzer-core.UndefinedBinaryO=
peratorResult]
           param->dec_h =3D ds_row_h[0] * param->mcu_h;
                                      ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:181:2: note: Taking fa=
lse branch
           if (mtk_jpeg_decide_format(param))
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:186:6: note: Calling '=
mtk_jpeg_calc_dst_size'
           if (mtk_jpeg_calc_dst_size(param))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:14: note: Assuming=
 'i' is >=3D field 'comp_num'
           for (i =3D 0; i < param->comp_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:148:2: note: Loop cond=
ition is false. Execution continues on line 162
           for (i =3D 0; i < param->comp_num; i++) {
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:163:29: note: The left=
 operand of '*' is a garbage value
           param->dec_h =3D ds_row_h[0] * param->mcu_h;
                          ~~~~~~~~~~~ ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:168:46: warning: The r=
ight operand of '*' is a garbage value [clang-analyzer-core.UndefinedBinary=
OperatorResult]
                   param->comp_size[i] =3D param->mem_stride[i] * ds_row_h[=
i] *
                                                              ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:181:2: note: Taking fa=
lse branch
           if (mtk_jpeg_decide_format(param))
           ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c:186:6: note: Calling '=
mtk_jpeg_calc_dst_size'
           if (mtk_jpeg_calc_dst_size(param))

vim +/pcdev +1352 drivers/media/platform/intel/pxa_camera.c

6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1348  =

6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1349  static void pxac_vb2_cleanup(struct vb2_buffer *vb)
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1350  {
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1351  	struct pxa_buffer *buf =3D vb2_to_pxa_buffer(vb);
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06 @1352  	struct pxa_camera_dev *pcdev =3D vb2_get_drv_priv(vb->=
vb2_queue);
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1353  =

6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1354  	dev_dbg(pcdev_to_dev(pcdev),
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1355  		 "%s(vb=3D%p)\n", __func__, vb);
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1356  	pxa_buffer_cleanup(buf);
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1357  }
6f28435d1c1570 drivers/media/platform/soc_camera/pxa_camera.c Robert Jarzmi=
k 2016-09-06  1358  =


:::::: The code at line 1352 was first introduced by commit
:::::: 6f28435d1c157073e4257a5dca7695103f32ba02 [media] media: platform: px=
a_camera: trivial move of functions

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5844032956165017379==--

