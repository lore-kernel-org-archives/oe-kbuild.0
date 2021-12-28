Content-Type: multipart/mixed; boundary="===============8387364387476926888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [plbossart-sound:fix/hda-dai-suspend 37/49] sound/soc/sof/ipc3-topology.c:1271:22: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 29 Dec 2021 00:02:35 +0800
Message-ID: <202112282355.Xfde66Iv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8387364387476926888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/thesofproject/linux fix/hda-dai-suspend
head:   7f41ec721b3ae5514d60ebcf8bb3845c7449ab9e
commit: a86a91dc9eefa395b785190f43a9ecebbccb5bba [37/49] ASoC: SOF: topolog=
y: Make DAI widget parsing IPC agnostic
:::::: branch date: 13 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20211228 (https://download.01.org/0day-ci/arc=
hive/20211228/202112282355.Xfde66Iv-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/thesofproject/linux/commit/a86a91dc9eefa395b78=
5190f43a9ecebbccb5bba
        git remote add thesofproject https://github.com/thesofproject/linux
        git fetch --no-tags thesofproject plbossart-sound/fix/hda-dai-suspe=
nd
        git checkout a86a91dc9eefa395b785190f43a9ecebbccb5bba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~
   sound/soc/codecs/madera.c:4656:2: note: Taking true branch
           if (fout)
           ^
   sound/soc/codecs/madera.c:4659:6: note: Assuming 'source' is not equal t=
o field 'ref_src'
           if (fll->ref_src =3D=3D source && fll->ref_freq =3D=3D fin &&
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4659:29: note: Left side of '&&' is false
           if (fll->ref_src =3D=3D source && fll->ref_freq =3D=3D fin &&
                                      ^
   sound/soc/codecs/madera.c:4663:6: note: Assuming 'fin' is 0
           if (fin && fout && madera_fllhj_validate(fll, fin, fout))
               ^~~
   sound/soc/codecs/madera.c:4663:10: note: Left side of '&&' is false
           if (fin && fout && madera_fllhj_validate(fll, fin, fout))
                   ^
   sound/soc/codecs/madera.c:4670:6: note: Assuming 'fout' is not equal to 0
           if (fout)
               ^~~~
   sound/soc/codecs/madera.c:4670:2: note: Taking true branch
           if (fout)
           ^
   sound/soc/codecs/madera.c:4671:9: note: Calling 'madera_fllhj_enable'
                   ret =3D madera_fllhj_enable(fll);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4566:6: note: 'already_enabled' is >=3D 0
           if (already_enabled < 0)
               ^~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4566:2: note: Taking false branch
           if (already_enabled < 0)
           ^
   sound/soc/codecs/madera.c:4569:6: note: Assuming 'already_enabled' is 0
           if (!already_enabled)
               ^~~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4569:2: note: Taking true branch
           if (!already_enabled)
           ^
   sound/soc/codecs/madera.c:4572:2: note: Taking false branch
           madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
           ^
   sound/soc/codecs/madera.c:147:2: note: expanded from macro 'madera_fll_d=
bg'
           dev_dbg(_fll->madera->dev, "FLL%d: " fmt, _fll->id, ##__VA_ARGS_=
_)
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/codecs/madera.c:4581:6: note: 'already_enabled' is 0
           if (already_enabled)
               ^~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4581:2: note: Taking false branch
           if (already_enabled)
           ^
   sound/soc/codecs/madera.c:4585:8: note: Calling 'madera_fllhj_apply'
           ret =3D madera_fllhj_apply(fll, fll->ref_freq);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4422:2: note: Taking false branch
           madera_fll_dbg(fll, "fin=3D%d, fout=3D%d\n", fin, fll->fout);
           ^
   sound/soc/codecs/madera.c:147:2: note: expanded from macro 'madera_fll_d=
bg'
           dev_dbg(_fll->madera->dev, "FLL%d: " fmt, _fll->id, ##__VA_ARGS_=
_)
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/codecs/madera.c:4424:2: note: Loop condition is true.  Enterin=
g loop body
           for (refdiv =3D 0; refdiv < 4; refdiv++)
           ^
   sound/soc/codecs/madera.c:4425:3: note: Taking true branch
                   if ((fin / (1 << refdiv)) <=3D MADERA_FLLHJ_MAX_THRESH)
                   ^
   sound/soc/codecs/madera.c:4426:4: note:  Execution continues on line 4428
                           break;
                           ^
   sound/soc/codecs/madera.c:4428:2: note: The value 0 is assigned to 'fref'
           fref =3D fin / (1 << refdiv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/madera.c:4435:14: note: Division by zero
           frac =3D fout % fref;
                  ~~~~~^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/sof/sof-audio.c:944:29: warning: Value stored to 'desc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct sof_dev_desc *desc =3D sof_pdata->desc;
                                      ^~~~   ~~~~~~~~~~~~~~~
   sound/soc/sof/sof-audio.c:944:29: note: Value stored to 'desc' during it=
s initialization is never read
           const struct sof_dev_desc *desc =3D sof_pdata->desc;
                                      ^~~~   ~~~~~~~~~~~~~~~
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
   4 warnings generated.
>> sound/soc/sof/ipc3-topology.c:1271:22: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           dai->current_config =3D current_config;
                               ^
   sound/soc/sof/ipc3-topology.c:1390:6: note: Assuming 'private' is non-nu=
ll
           if (!private)
               ^~~~~~~~
   sound/soc/sof/ipc3-topology.c:1390:2: note: Taking false branch
           if (!private)
           ^
   sound/soc/sof/ipc3-topology.c:1396:16: note: Field 'comp_dai' is non-null
           if (!private->comp_dai) {
                         ^
   sound/soc/sof/ipc3-topology.c:1396:2: note: Taking false branch
           if (!private->comp_dai) {
           ^
   sound/soc/sof/ipc3-topology.c:1410:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   sound/soc/sof/ipc3-topology.c:1410:2: note: Taking false branch
           if (ret < 0)
           ^
   sound/soc/sof/ipc3-topology.c:1417:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   sound/soc/sof/ipc3-topology.c:1417:2: note: Taking false branch
           if (ret < 0)
           ^
   sound/soc/sof/ipc3-topology.c:1420:2: note: Taking false branch
           dev_dbg(scomp->dev, "%s dai %s: type %d index %d\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/sof/ipc3-topology.c:1425:2: note: Loop condition is true.  Ent=
ering loop body
           list_for_each_entry(slink, &sdev->dai_link_list, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/soc/sof/ipc3-topology.c:1429:7: note: Assuming the condition is fa=
lse
                   if (strcmp(slink->link->name, dai->name))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/ipc3-topology.c:1429:3: note: Taking false branch
                   if (strcmp(slink->link->name, dai->name))
                   ^
   sound/soc/sof/ipc3-topology.c:1434:7: note: Assuming 'config' is non-null
                   if (!config) {
                       ^~~~~~~
   sound/soc/sof/ipc3-topology.c:1434:3: note: Taking false branch
                   if (!config) {
                   ^
   sound/soc/sof/ipc3-topology.c:1443:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   sound/soc/sof/ipc3-topology.c:1443:3: note: Taking false branch
                   if (ret < 0)
                   ^
   sound/soc/sof/ipc3-topology.c:1446:15: note: Assuming 'i' is >=3D field =
'num_hw_configs'
                   for (i =3D 0; i < slink->num_hw_configs; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/ipc3-topology.c:1446:3: note: Loop condition is false. Exe=
cution continues on line 1453
                   for (i =3D 0; i < slink->num_hw_configs; i++) {
                   ^
   sound/soc/sof/ipc3-topology.c:1453:3: note: Control jumps to 'case SOF_D=
AI_INTEL_SSP:'  at line 1454
                   switch (common_config.type) {
                   ^
   sound/soc/sof/ipc3-topology.c:1455:10: note: Calling 'sof_link_ssp_load'
                           ret =3D sof_link_ssp_load(scomp, slink, config, =
dai);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/soc/sof/ipc3-topology.c:1219:2: note: 'current_config' declared wi=
thout an initial value
           int current_config;
           ^~~~~~~~~~~~~~~~~~
   sound/soc/sof/ipc3-topology.c:1227:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   sound/soc/sof/ipc3-topology.c:1227:2: note: Taking false branch
           if (ret < 0)
           ^
   sound/soc/sof/ipc3-topology.c:1231:14: note: 'i' is >=3D field 'num_hw_c=
onfigs'
           for (i =3D 0; i < slink->num_hw_configs; i++) {
                       ^
   sound/soc/sof/ipc3-topology.c:1231:2: note: Loop condition is false. Exe=
cution continues on line 1270
           for (i =3D 0; i < slink->num_hw_configs; i++) {
           ^
   sound/soc/sof/ipc3-topology.c:1271:22: note: Assigned value is garbage o=
r undefined
           dai->current_config =3D current_config;
                               ^ ~~~~~~~~~~~~~~
>> sound/soc/sof/ipc3-topology.c:1501:2: warning: Attempt to free released =
memory [clang-analyzer-unix.Malloc]
           kfree(private);
           ^~~~~~~~~~~~~~
   sound/soc/sof/ipc3-topology.c:1390:6: note: Assuming 'private' is non-nu=
ll
           if (!private)
               ^~~~~~~~
   sound/soc/sof/ipc3-topology.c:1390:2: note: Taking false branch
           if (!private)
           ^
   sound/soc/sof/ipc3-topology.c:1396:16: note: Field 'comp_dai' is null
           if (!private->comp_dai) {
                         ^
   sound/soc/sof/ipc3-topology.c:1396:2: note: Taking true branch
           if (!private->comp_dai) {
           ^
   sound/soc/sof/ipc3-topology.c:1397:3: note: Memory is released
                   kfree(private);
                   ^~~~~~~~~~~~~~
   sound/soc/sof/ipc3-topology.c:1399:3: note: Control jumps to line 1501
                   goto free;
                   ^
   sound/soc/sof/ipc3-topology.c:1501:2: note: Attempt to free released mem=
ory
           kfree(private);
           ^~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:299:16: warning: The result=
 of the left shift is undefined due to shifting '3' by '31', which is unrep=
resentable in the unsigned version of the return type 'int' [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
                   slv_config =3D ST_LSM6DSX_SHIFT_VAL(3, aux_sens->mask);
                                ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h:65:49: note: expanded from macro=
 'ST_LSM6DSX_SHIFT_VAL'
   #define ST_LSM6DSX_SHIFT_VAL(val, mask) (((val) << __ffs(mask)) & (mask))
                                                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:561:2: note: Control jumps =
to 'case IIO_CHAN_INFO_RAW:' @line 562
           switch (mask) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:564:7: note: Assuming 'ret'=
 is 0
                   if (ret)
                       ^~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:564:3: note: Taking false b=
ranch
                   if (ret)
                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:567:9: note: Calling 'st_ls=
m6dsx_shub_read_oneshot'
                   ret =3D st_lsm6dsx_shub_read_oneshot(sensor, ch, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:527:6: note: Assuming 'err'=
 is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:527:2: note: Taking false b=
ranch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:533:8: note: Assuming '__UN=
IQUE_ID___x265' is >=3D '__UNIQUE_ID___y266'
           len =3D min_t(int, sizeof(data), ch->scan_type.realbits >> 3);
                 ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:533:8: note: '?' condition =
is false
           len =3D min_t(int, sizeof(data), ch->scan_type.realbits >> 3);
                 ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:534:8: note: Calling 'st_ls=
m6dsx_shub_read'
           err =3D st_lsm6dsx_shub_read(sensor, ch->address, data, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:298:6: note: Assuming the c=
ondition is true
           if (slv_addr + 2 =3D=3D aux_sens->addr)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:298:2: note: Taking true br=
anch
           if (slv_addr + 2 =3D=3D aux_sens->addr)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:299:16: note: The result of=
 the left shift is undefined due to shifting '3' by '31', which is unrepres=
entable in the unsigned version of the return type 'int'
                   slv_config =3D ST_LSM6DSX_SHIFT_VAL(3, aux_sens->mask);
                                ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h:65:49: note: expanded from macro=
 'ST_LSM6DSX_SHIFT_VAL'
   #define ST_LSM6DSX_SHIFT_VAL(val, mask) (((val) << __ffs(mask)) & (mask))
                                             ~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
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
   drivers/hwtracing/intel_th/msu.c:860:2: warning: Value stored to 'reg' i=
s never read [clang-analyzer-deadcode.DeadStores]
           reg =3D ioread32(msc->reg_base + REG_MSU_MSC0STS);
           ^
   drivers/hwtracing/intel_th/msu.c:860:2: note: Value stored to 'reg' is n=
ever read
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
   sound/soc/sof/ipc.c:412:18: warning: The left operand of '<' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (reply.error < 0) {
               ~~~~~~~~~~~ ^
   sound/soc/sof/ipc.c:403:6: note: Assuming 'msg' is non-null
           if (!msg) {
               ^~~~
   sound/soc/sof/ipc.c:403:2: note: Taking false branch
           if (!msg) {
           ^
   sound/soc/sof/ipc.c:409:2: note: Calling 'snd_sof_dsp_mailbox_read'
           snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, &reply,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/ops.h:352:6: note: Assuming field 'mailbox_read' is null
           if (sof_ops(sdev)->mailbox_read)
               ^
   sound/soc/sof/ops.h:22:2: note: expanded from macro 'sof_ops'
           ((sdev)->pdata->desc->ops)
           ^
   sound/soc/sof/ops.h:352:2: note: Taking false branch
           if (sof_ops(sdev)->mailbox_read)
           ^
   sound/soc/sof/ops.h:354:1: note: Returning without writing to 'dest->err=
or'
   }
   ^
   sound/soc/sof/ipc.c:409:2: note: Returning from 'snd_sof_dsp_mailbox_rea=
d'
           snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, &reply,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/ipc.c:412:18: note: The left operand of '<' is a garbage v=
alue
           if (reply.error < 0) {
               ~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/sof/pcm.c:509:2: warning: Value stored to 'dai' is never read =
[clang-analyzer-deadcode.DeadStores]
           dai =3D bytes_to_frames(substream->runtime,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/pcm.c:509:2: note: Value stored to 'dai' is never read
           dai =3D bytes_to_frames(substream->runtime,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
>> sound/soc/sof/topology.c:1551:14: warning: Use of memory after it is fre=
ed [clang-analyzer-unix.Malloc]
                   int core =3D sof_get_token_value(SOF_TKN_COMP_CORE_ID, s=
widget->tuples,
                              ^                                         ~~~=
~~~~~~~~~~~~
   sound/soc/sof/topology.c:1470:6: note: Assuming 'swidget' is non-null
           if (!swidget)
               ^~~~~~~~
   sound/soc/sof/topology.c:1470:2: note: Taking false branch
           if (!swidget)
           ^
   sound/soc/sof/topology.c:1481:2: note: Taking false branch
           dev_dbg(scomp->dev, "tplg: ready widget id %d pipe %d type %d na=
me : %s stream %s\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   sound/soc/sof/topology.c:1490:2: note: Control jumps to 'case snd_soc_da=
pm_demux:'  at line 1537
           switch (w->id) {
           ^
   sound/soc/sof/topology.c:1538:9: note: Calling 'sof_widget_parse_tokens'
                   ret =3D sof_widget_parse_tokens(scomp, swidget, tw,  tok=
en_list, token_list_size);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1351:6: note: Assuming 'count' is > 0
           if (count > 0 && !object_token_list) {
               ^~~~~~~~~
   sound/soc/sof/topology.c:1351:6: note: Left side of '&&' is true
   sound/soc/sof/topology.c:1351:19: note: Assuming 'object_token_list' is =
non-null
           if (count > 0 && !object_token_list) {
                            ^~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1351:2: note: Taking false branch
           if (count > 0 && !object_token_list) {
           ^
   sound/soc/sof/topology.c:1357:14: note: 'i' is < 'count'
           for (i =3D 0; i < count; i++)
                       ^
   sound/soc/sof/topology.c:1357:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < count; i++)
           ^
   sound/soc/sof/topology.c:1357:14: note: Assuming 'i' is >=3D 'count'
           for (i =3D 0; i < count; i++)
                       ^~~~~~~~~
   sound/soc/sof/topology.c:1357:2: note: Loop condition is false. Executio=
n continues on line 1361
           for (i =3D 0; i < count; i++)
           ^
   sound/soc/sof/topology.c:1363:6: note: Assuming field 'tuples' is non-nu=
ll
           if (!swidget->tuples)
               ^~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1363:2: note: Taking false branch
           if (!swidget->tuples)
           ^
   sound/soc/sof/topology.c:1367:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0; i < count; i++) {
           ^
   sound/soc/sof/topology.c:1368:7: note: Assuming the condition is true
                   if (object_token_list[i] >=3D SOF_TOKEN_COUNT) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1368:3: note: Taking true branch
                   if (object_token_list[i] >=3D SOF_TOKEN_COUNT) {
                   ^
   sound/soc/sof/topology.c:1369:4: note: Loop condition is false.  Exiting=
 loop
                           dev_err(scomp->dev, "Invalid token id %d for wid=
get %s\n",
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
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   sound/soc/sof/topology.c:1372:4: note: Control jumps to line 1404
                           goto err;
                           ^
   sound/soc/sof/topology.c:1404:2: note: Memory is released
           kfree(swidget->tuples);
           ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1538:9: note: Returning; memory was released
                   ret =3D sof_widget_parse_tokens(scomp, swidget, tw,  tok=
en_list, token_list_size);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1539:3: note:  Execution continues on line 1548
                   break;
                   ^
   sound/soc/sof/topology.c:1548:6: note: Assuming the condition is false
           if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/topology.c:1548:2: note: Taking false branch
           if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
           ^
   sound/soc/sof/topology.c:1551:14: note: Use of memory after it is freed
                   int core =3D sof_get_token_value(SOF_TKN_COMP_CORE_ID, s=
widget->tuples,
                              ^                                         ~~~=
~~~~~~~~~~~~
   sound/soc/sof/topology.c:1950:8: warning: 4th function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
           ret =3D sof_copy_tuples(sdev, private->array, le32_to_cpu(privat=
e->size),
                 ^
   sound/soc/sof/topology.c:1829:2: note: 'token_id' declared without an in=
itial value

vim +1271 sound/soc/sof/ipc3-topology.c

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1212  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1213  static int sof_link_ssp_=
load(struct snd_soc_component *scomp, struct snd_sof_dai_link *slink,
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1214  			     struct sof_ipc_d=
ai_config *config, struct snd_sof_dai *dai)
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1215  {
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1216  	struct snd_soc_tplg_hw_=
config *hw_config =3D slink->hw_configs;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1217  	struct sof_dai_private_=
data *private =3D dai->private;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1218  	u32 size =3D sizeof(*co=
nfig);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1219  	int current_config;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1220  	int i, ret;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1221  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1222  	/*
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1223  	 * Parse common data, w=
e should have 1 common data per hw_config.
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1224  	 */
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1225  	ret =3D sof_update_ipc_=
object(scomp, &config->ssp, SOF_SSP_TOKENS, slink->tuples,
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1226  				    slink->num_tuple=
s, size, slink->num_hw_configs);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1227  	if (ret < 0)
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1228  		return ret;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1229  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1230  	/* process all possible=
 hw configs */
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1231  	for (i =3D 0; i < slink=
->num_hw_configs; i++) {
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1232  		if (le32_to_cpu(hw_con=
fig[i].id) =3D=3D slink->default_hw_cfg_id)
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1233  			current_config =3D i;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1234  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1235  		/* handle master/slave=
 and inverted clocks */
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1236  		sof_dai_set_format(&hw=
_config[i], &config[i]);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1237  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1238  		config[i].hdr.size =3D=
 size;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1239  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1240  		/* copy differentiatin=
g hw configs to ipc structs */
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1241  		config[i].ssp.mclk_rat=
e =3D le32_to_cpu(hw_config[i].mclk_rate);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1242  		config[i].ssp.bclk_rat=
e =3D le32_to_cpu(hw_config[i].bclk_rate);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1243  		config[i].ssp.fsync_ra=
te =3D le32_to_cpu(hw_config[i].fsync_rate);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1244  		config[i].ssp.tdm_slot=
s =3D le32_to_cpu(hw_config[i].tdm_slots);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1245  		config[i].ssp.tdm_slot=
_width =3D le32_to_cpu(hw_config[i].tdm_slot_width);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1246  		config[i].ssp.mclk_dir=
ection =3D hw_config[i].mclk_direction;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1247  		config[i].ssp.rx_slots=
 =3D le32_to_cpu(hw_config[i].rx_slots);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1248  		config[i].ssp.tx_slots=
 =3D le32_to_cpu(hw_config[i].tx_slots);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1249  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1250  		dev_dbg(scomp->dev, "t=
plg: config SSP%d fmt %#x mclk %d bclk %d fclk %d width (%d)%d slots %d mcl=
k id %d quirks %d clks_control %#x\n",
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1251  			config[i].dai_index, =
config[i].format,
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1252  			config[i].ssp.mclk_ra=
te, config[i].ssp.bclk_rate,
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1253  			config[i].ssp.fsync_r=
ate, config[i].ssp.sample_valid_bits,
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1254  			config[i].ssp.tdm_slo=
t_width, config[i].ssp.tdm_slots,
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1255  			config[i].ssp.mclk_id=
, config[i].ssp.quirks, config[i].ssp.clks_control);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1256  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1257  		/* validate SSP fsync =
rate and channel count */
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1258  		if (config[i].ssp.fsyn=
c_rate < 8000 || config[i].ssp.fsync_rate > 192000) {
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1259  			dev_err(scomp->dev, "=
Invalid fsync rate for SSP%d\n", config[i].dai_index);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1260  			return -EINVAL;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1261  		}
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1262  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1263  		if (config[i].ssp.tdm_=
slots < 1 || config[i].ssp.tdm_slots > 8) {
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1264  			dev_err(scomp->dev, "=
Invalid channel count for SSP%d\n",
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1265  				config[i].dai_index);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1266  			return -EINVAL;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1267  		}
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1268  	}
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1269  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1270  	dai->number_configs =3D=
 slink->num_hw_configs;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04 @1271  	dai->current_config =3D=
 current_config;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1272  	private->dai_config =3D=
 kmemdup(config, size * slink->num_hw_configs, GFP_KERNEL);
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1273  	if (!private->dai_confi=
g)
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1274  		return -ENOMEM;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1275  =

a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1276  	return 0;
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1277  }
a86a91dc9eefa3 Ranjani Sridharan 2021-12-04  1278  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8387364387476926888==--

