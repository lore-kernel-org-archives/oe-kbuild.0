Content-Type: multipart/mixed; boundary="===============7009564957620391467=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/intel/pxa_camera.c:1352:25: warning: Value stored to 'pcdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 06 Jun 2022 10:41:22 +0800
Message-ID: <202206060938.NBM47jGC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7009564957620391467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/intel/pxa_camera.c:1352:25: warning: Value stored to 'pcdev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores=
]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d717180e7f9775d468f415c10a4a474640146001
commit: 95495f2aa9d8df1a7697bab24118544d3568f41d media: platform: place Int=
el drivers on a separate dir
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220606/202206060938.NBM47jGC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
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


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:632:3: note: Loop condition is true.=
  Entering loop body
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                   ^
   drivers/media/platform/ti-vpe/cal.c:633:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:633:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                           ^
   drivers/media/platform/ti-vpe/cal.c:644:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:644:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                           ^
   drivers/media/platform/ti-vpe/cal.c:632:15: note: Assuming 'i' is < fiel=
d 'num_csi2_phy'
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:632:3: note: Loop condition is true.=
  Entering loop body
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                   ^
   drivers/media/platform/ti-vpe/cal.c:633:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:633:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                           ^
   drivers/media/platform/ti-vpe/cal.c:644:8: note: Assuming the condition =
is false
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:644:4: note: Taking false branch
                           if (status & CAL_HL_IRQ_VC_MASK(i)) {
                           ^
   drivers/media/platform/ti-vpe/cal.c:632:15: note: Assuming 'i' is < fiel=
d 'num_csi2_phy'
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/cal.c:632:3: note: Loop condition is true.=
  Entering loop body
                   for (i =3D 0; i < cal->data->num_csi2_phy; ++i) {
                   ^
   drivers/media/platform/ti-vpe/cal.c:633:17: note: The result of the left=
 shift is undefined due to shifting by '32', which is greater or equal to t=
he width of type 'unsigned long'
                           if (status & CAL_HL_IRQ_CIO_MASK(i)) {
                                        ^
   drivers/media/platform/ti-vpe/cal_regs.h:133:34: note: expanded from mac=
ro 'CAL_HL_IRQ_CIO_MASK'
   #define CAL_HL_IRQ_CIO_MASK(i)                  BIT(16 + (i) * 8)
                                                   ^~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/platform/exynos4-is/media-dev.c:1018:3: warning: Value sto=
red to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/exynos4-is/media-dev.c:1018:3: note: Value stored=
 to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/exynos4-is/media-dev.c:1031:3: warning: Value sto=
red to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/exynos4-is/media-dev.c:1031:3: note: Value stored=
 to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/platform/exynos4-is/media-dev.c:1541:6: note: Assuming 'fm=
d' is non-null
           if (!fmd)
               ^~~~
   drivers/media/platform/exynos4-is/media-dev.c:1541:2: note: Taking false=
 branch
           if (!fmd)
           ^
   drivers/media/platform/exynos4-is/media-dev.c:1551:2: note: Calling 'fim=
c_md_pipelines_free'
           fimc_md_pipelines_free(fmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/media-dev.c:389:2: note: Loop conditio=
n is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/exynos4-is/media-dev.c:394:3: note: Memory is rel=
eased
                   kfree(p);
                   ^~~~~~~~
   drivers/media/platform/exynos4-is/media-dev.c:389:2: note: Loop conditio=
n is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/exynos4-is/media-dev.c:393:3: note: Calling 'list=
_del'
                   list_del(&p->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
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
   2 warnings generated.
   drivers/iio/light/tsl2772.c:896:40: warning: The result of the left shif=
t is undefined because the left operand is negative [clang-analyzer-core.Un=
definedBinaryOperatorResult]
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                                 ^
   drivers/iio/light/tsl2772.c:1057:6: note: Assuming the condition is false
           if (kstrtobool(buf, &value) || !value)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:1057:6: note: Left side of '||' is false
   drivers/iio/light/tsl2772.c:1057:33: note: Assuming 'value' is true
           if (kstrtobool(buf, &value) || !value)
                                          ^~~~~~
   drivers/iio/light/tsl2772.c:1057:2: note: Taking false branch
           if (kstrtobool(buf, &value) || !value)
           ^
   drivers/iio/light/tsl2772.c:1060:8: note: Calling 'tsl2772_prox_cal'
           ret =3D tsl2772_prox_cal(indio_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:6: note: Assuming field 'prox_max_sample=
s_cal' is >=3D 1
           if (chip->settings.prox_max_samples_cal < 1 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:6: note: Left side of '||' is false
   drivers/iio/light/tsl2772.c:876:6: note: Assuming field 'prox_max_sample=
s_cal' is <=3D MAX_SAMPLES_CAL
               chip->settings.prox_max_samples_cal > MAX_SAMPLES_CAL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:875:2: note: Taking false branch
           if (chip->settings.prox_max_samples_cal < 1 ||
           ^
   drivers/iio/light/tsl2772.c:879:14: note: 'i' is < field 'prox_max_sampl=
es_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:882:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/iio/light/tsl2772.c:882:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/tsl2772.c:879:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is false. Execut=
ion continues on line 888
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:889:2: note: The value -2147483648 is assign=
ed to 'max'
           max =3D INT_MIN;
           ^~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:2: note: Loop condition is false. Execut=
ion continues on line 894
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:896:40: note: The result of the left shift i=
s undefined because the left operand is negative
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                             ~~~ ^
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   drivers/iio/light/veml6030.c:332:13: warning: The left operand of '*' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           period =3D y * (1 << ((reg >> 4) & 0x03));
                      ^
   drivers/iio/light/veml6030.c:589:2: note: Control jumps to 'case IIO_EV_=
INFO_PERIOD:'  at line 599
           switch (info) {
           ^
   drivers/iio/light/veml6030.c:600:10: note: Calling 'veml6030_read_persis=
tence'
                   return veml6030_read_persistence(indio_dev, val, val2);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:318:27: note: 'y' declared without an initi=
al value
           int ret, reg, period, x, y;
                                    ^
   drivers/iio/light/veml6030.c:321:8: note: Calling 'veml6030_get_intgrn_t=
m'
           ret =3D veml6030_get_intgrn_tm(indio_dev, &x, &y);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/veml6030.c:221:6: note: Assuming 'ret' is not equal to=
 0
           if (ret) {
               ^~~
   drivers/iio/light/veml6030.c:221:2: note: Taking true branch
           if (ret) {
           ^
   drivers/iio/light/veml6030.c:222:3: note: Left side of '&&' is true
                   dev_err(&data->client->dev,
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)

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
--===============7009564957620391467==--

