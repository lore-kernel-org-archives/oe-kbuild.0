Content-Type: multipart/mixed; boundary="===============9179111387586212153=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Mar 2022 22:14:52 +0800
Message-ID: <202203162216.Ysr2MNY0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9179111387586212153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Martin Kepplinger <martin.kepplinger@puri.sm>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Pavel Machek <pavel@ucw.cz>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: e8c0882685f9152f0d729664a12bcbe749cb7736 media: i2c: add driver for=
 the SK Hynix Hi-846 8M pixel camera
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220316/202203162216.Ysr2MNY0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c0882685f9152f0d729664a12bcbe749cb7736
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c0882685f9152f0d729664a12bcbe749cb7736
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^       ~
   fs/xfs/xfs_icache.c:746:2: note: Value stored to 'error' is never read
           error =3D 0;
           ^       ~
   fs/xfs/xfs_icache.c:1667:2: warning: Value stored to 'nr_found' is never=
 read [clang-analyzer-deadcode.DeadStores]
           nr_found =3D 0;
           ^          ~
   fs/xfs/xfs_icache.c:1667:2: note: Value stored to 'nr_found' is never re=
ad
           nr_found =3D 0;
           ^          ~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
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
   12 warnings generated.
   Suppressed 12 warnings (9 in non-user code, 3 with check filters).
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
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/media/pci/saa7164/saa7164-encoder.c:597:2: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D saa7164_encoder_pause_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-encoder.c:597:2: note: Value stored to=
 'ret' is never read
           ret =3D saa7164_encoder_pause_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-encoder.c:598:2: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D saa7164_encoder_acquire_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-encoder.c:598:2: note: Value stored to=
 'ret' is never read
           ret =3D saa7164_encoder_acquire_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/media/pci/saa7164/saa7164-vbi.c:281:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D saa7164_vbi_pause_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-vbi.c:281:2: note: Value stored to 're=
t' is never read
           ret =3D saa7164_vbi_pause_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-vbi.c:282:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D saa7164_vbi_acquire_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-vbi.c:282:2: note: Value stored to 're=
t' is never read
           ret =3D saa7164_vbi_acquire_port(port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-vbi.c:381:3: warning: Value stored to =
'result' is never read [clang-analyzer-deadcode.DeadStores]
                   result =3D saa7164_vbi_acquire_port(port);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7164/saa7164-vbi.c:381:3: note: Value stored to 're=
sult' is never read
                   result =3D saa7164_vbi_acquire_port(port);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/i2c/ccs-pll.c:93:15: warning: Value stored to 's' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
                   const char *s =3D pll_string(br->which);
                               ^   ~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:93:15: note: Value stored to 's' during its =
initialization is never read
                   const char *s =3D pll_string(br->which);
                               ^   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1494:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/hi846.c:1764:2: warning: Value stored to 'tgt_fps' is =
never read [clang-analyzer-deadcode.DeadStores]
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1764:2: note: Value stored to 'tgt_fps' is nev=
er read
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/i2c/imx258.c:781:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx258.c:781:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/udf/balloc.c:543:13: warning: The result of the left shift is undefin=
ed because the left operand is negative [clang-analyzer-core.UndefinedBinar=
yOperatorResult]
                                           (etype << 30) | elen, 1);
                                                  ^
   fs/udf/balloc.c:680:6: note: Assuming the condition is false
           if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_BITMAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:680:2: note: Taking false branch
           if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_BITMAP)
           ^
   fs/udf/balloc.c:685:11: note: Assuming the condition is true
           else if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_TABLE)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:685:7: note: Taking true branch
           else if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_TABLE)
                ^
   fs/udf/balloc.c:686:15: note: Calling 'udf_table_prealloc_blocks'
                   allocated =3D udf_table_prealloc_blocks(sb,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:510:6: note: Assuming 'first_block' is < field 's_partit=
ion_len'
           if (first_block >=3D sbi->s_partmaps[partition].s_partition_len)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:510:2: note: Taking false branch
           if (first_block >=3D sbi->s_partmaps[partition].s_partition_len)
           ^
   fs/udf/balloc.c:514:6: note: Assuming field 'i_alloc_type' is equal to I=
CBTAG_FLAG_AD_SHORT
           if (iinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_SHORT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:514:2: note: Taking true branch
           if (iinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_SHORT)
           ^
   fs/udf/balloc.c:527:9: note: 'first_block' is not equal to field 'logica=
lBlockNum'
           while (first_block !=3D eloc.logicalBlockNum &&
                  ^~~~~~~~~~~
   fs/udf/balloc.c:527:9: note: Left side of '&&' is true
   fs/udf/balloc.c:528:10: note: Value assigned to 'etype'
                  (etype =3D udf_next_aext(table, &epos, &eloc, &elen, 1)) =
!=3D -1) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:528:9: note: Assuming the condition is false
                  (etype =3D udf_next_aext(table, &epos, &eloc, &elen, 1)) =
!=3D -1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/udf/balloc.c:527:2: note: Loop condition is false. Execution continue=
s on line 534
           while (first_block !=3D eloc.logicalBlockNum &&
           ^
   fs/udf/balloc.c:534:6: note: Assuming 'first_block' is equal to field 'l=
ogicalBlockNum'
           if (first_block =3D=3D eloc.logicalBlockNum) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:534:2: note: Taking true branch
           if (first_block =3D=3D eloc.logicalBlockNum) {
           ^
   fs/udf/balloc.c:538:7: note: Assuming 'alloc_count' is > 'block_count'
                   if (alloc_count > block_count) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/balloc.c:538:3: note: Taking true branch
                   if (alloc_count > block_count) {
                   ^
   fs/udf/balloc.c:543:13: note: The result of the left shift is undefined =
because the left operand is negative
                                           (etype << 30) | elen, 1);
                                            ~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: warning: Value s=
tored to 'input' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: note: Value stor=
ed to 'input' during its initialization is never read
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/misc/habanalabs/common/debugfs.c:858:3: warning: Value stored to=
 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pci_enable_device(hdev->pdev);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/debugfs.c:858:3: note: Value stored to 'r=
c' is never read

vim +/client +1494 drivers/media/i2c/hi846.c

e8c0882685f9152 Martin Kepplinger 2021-09-06  1491  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1492  static int hi846_set_vi=
deo_mode(struct hi846 *hi846, int fps)
e8c0882685f9152 Martin Kepplinger 2021-09-06  1493  {
e8c0882685f9152 Martin Kepplinger 2021-09-06 @1494  	struct i2c_client *cli=
ent =3D v4l2_get_subdevdata(&hi846->sd);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1495  	u64 frame_length;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1496  	int ret =3D 0;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1497  	int dummy_lines;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1498  	u64 link_freq =3D hi84=
6_get_link_freq(hi846);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1499  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1500  	dev_dbg(&client->dev, =
"%s: link freq: %llu\n", __func__,
e8c0882685f9152 Martin Kepplinger 2021-09-06  1501  		hi846_get_link_freq(h=
i846));
e8c0882685f9152 Martin Kepplinger 2021-09-06  1502  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1503  	do_div(link_freq, fps);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1504  	frame_length =3D link_=
freq;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1505  	do_div(frame_length, H=
I846_LINE_LENGTH);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1506  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1507  	dummy_lines =3D (frame=
_length > hi846->cur_mode->frame_len) ?
e8c0882685f9152 Martin Kepplinger 2021-09-06  1508  			(frame_length - hi84=
6->cur_mode->frame_len) : 0;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1509  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1510  	frame_length =3D hi846=
->cur_mode->frame_len + dummy_lines;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1511  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1512  	dev_dbg(&client->dev, =
"%s: frame length calculated: %llu\n", __func__,
e8c0882685f9152 Martin Kepplinger 2021-09-06  1513  		frame_length);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1514  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1515  	hi846_write_reg_16(hi8=
46, HI846_REG_FLL, frame_length & 0xFFFF, &ret);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1516  	hi846_write_reg_16(hi8=
46, HI846_REG_LLP,
e8c0882685f9152 Martin Kepplinger 2021-09-06  1517  			   HI846_LINE_LENGTH=
 & 0xFFFF, &ret);
e8c0882685f9152 Martin Kepplinger 2021-09-06  1518  =

e8c0882685f9152 Martin Kepplinger 2021-09-06  1519  	return ret;
e8c0882685f9152 Martin Kepplinger 2021-09-06  1520  }
e8c0882685f9152 Martin Kepplinger 2021-09-06  1521  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9179111387586212153==--

