Content-Type: multipart/mixed; boundary="===============2945444236038185397=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:master 107/415] drivers/mtd/spi-nor/core.c:2402:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 29 Jan 2022 21:28:27 +0800
Message-ID: <202201292141.9YmBMvVl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2945444236038185397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   8f3691e6b43c0f2c74584eebd1cd0b9645e525ae
commit: 66627bb2d1c558fe2fbae0f371246c39dc3b213b [107/415] mtd: spi-nor: Si=
mplify odd address handling in read for dual parallel mode
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220125 (https://download.01.org/0day-ci/archi=
ve/20220129/202201292141.9YmBMvVl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/66627bb2d1c558fe2fbae=
0f371246c39dc3b213b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 66627bb2d1c558fe2fbae0f371246c39dc3b213b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^       ~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1193:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1193:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1195:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1195:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l33->regmap, CS35L33_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   sound/soc/codecs/cs35l34.c:259:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:259:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:1069:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l34->regmap, CS35L34_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:1069:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l34->regmap, CS35L34_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:1072:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l34->regmap, CS35L34_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:1072:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l34->regmap, CS35L34_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:1074:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l34->regmap, CS35L34_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:1074:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l34->regmap, CS35L34_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mtd/nand/raw/nand_ecc.c:357:8: warning: Array subscript is undef=
ined [clang-analyzer-core.uninitialized.ArraySubscript]
                       (invparity[rp17] << 1) |
                        ^
   drivers/mtd/nand/raw/nand_ecc.c:374:2: note: Calling '__nand_calculate_e=
cc'
           __nand_calculate_ecc(buf, chip->ecc.size, code, sm_order);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:134:2: note: 'rp17' declared without an =
initial value
           uint32_t rp17;
           ^~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:159:14: note: Assuming the condition is =
false
           for (i =3D 0; i < eccsize_mult << 2; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:159:2: note: Loop condition is false. Ex=
ecution continues on line 232
           for (i =3D 0; i < eccsize_mult << 2; i++) {
           ^
   drivers/mtd/nand/raw/nand_ecc.c:250:6: note: 'eccsize_mult' is not equal=
 to 2
           if (eccsize_mult =3D=3D 2) {
               ^~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:250:2: note: Taking false branch
           if (eccsize_mult =3D=3D 2) {
           ^
   drivers/mtd/nand/raw/nand_ecc.c:311:6: note: 'eccsize_mult' is not equal=
 to 2
           if (eccsize_mult =3D=3D 2)
               ^~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:311:2: note: Taking false branch
           if (eccsize_mult =3D=3D 2)
           ^
   drivers/mtd/nand/raw/nand_ecc.c:320:6: note: Assuming 'sm_order' is false
           if (sm_order) {
               ^~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:320:2: note: Taking false branch
           if (sm_order) {
           ^
   drivers/mtd/nand/raw/nand_ecc.c:340:6: note: 'eccsize_mult' is not equal=
 to 1
           if (eccsize_mult =3D=3D 1)
               ^~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_ecc.c:340:2: note: Taking false branch
           if (eccsize_mult =3D=3D 1)
           ^
   drivers/mtd/nand/raw/nand_ecc.c:357:8: note: Array subscript is undefined
                       (invparity[rp17] << 1) |
                        ^         ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/mtd/spi-nor/core.c:2123:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D nor->params->locking_ops->lock(nor, ofs, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2123:2: note: Value stored to 'ret' is never =
read
           ret =3D nor->params->locking_ops->lock(nor, ofs, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2166:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D nor->params->locking_ops->unlock(nor, ofs, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2166:2: note: Value stored to 'ret' is never =
read
           ret =3D nor->params->locking_ops->unlock(nor, ofs, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/core.c:2402:10: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                   buf[0] =3D two[1]; /* copy odd byte to buffer */
                          ^ ~~~~~~
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Assuming field 'isparallel' is =
true
           if (nor->isparallel && (from & 1)) {
               ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is true
           if (nor->isparallel && (from & 1)) {
                                   ^~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:2: note: Taking true branch
           if (nor->isparallel && (from & 1)) {
           ^
   drivers/mtd/spi-nor/core.c:2399:9: note: Calling 'spi_nor_read'
                   ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen,=
 two);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:11: note: Field 'isparallel' is true
           if (nor->isparallel && (from & 1)) {
                    ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
           if (nor->isparallel && (from & 1)) {
               ^
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is false
           if (nor->isparallel && (from & 1)) {
                                   ^~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:2: note: Taking false branch
           if (nor->isparallel && (from & 1)) {
           ^
   drivers/mtd/spi-nor/core.c:2409:6: note: 'ret' is not equal to 0
           if (ret) {
               ^~~
   drivers/mtd/spi-nor/core.c:2409:2: note: Taking true branch
           if (ret) {
           ^
   drivers/mtd/spi-nor/core.c:2399:9: note: Returning from 'spi_nor_read'
                   ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen,=
 two);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/spi-nor/core.c:2400:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/mtd/spi-nor/core.c:2400:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/mtd/spi-nor/core.c:2402:10: note: Assigned value is garbage or u=
ndefined
                   buf[0] =3D two[1]; /* copy odd byte to buffer */
                          ^ ~~~~~~
>> drivers/mtd/spi-nor/core.c:2404:11: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
                   *retlen +=3D 1; /* We've read only one actual byte */
                           ^
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Assuming field 'isparallel' is =
true
           if (nor->isparallel && (from & 1)) {
               ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is true
           if (nor->isparallel && (from & 1)) {
                                   ^~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:2: note: Taking true branch
           if (nor->isparallel && (from & 1)) {
           ^
   drivers/mtd/spi-nor/core.c:2399:9: note: Calling 'spi_nor_read'
                   ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen,=
 two);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:11: note: Field 'isparallel' is true
           if (nor->isparallel && (from & 1)) {
                    ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
           if (nor->isparallel && (from & 1)) {
               ^
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is true
           if (nor->isparallel && (from & 1)) {
                                   ^~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:2: note: Taking true branch
           if (nor->isparallel && (from & 1)) {
           ^
   drivers/mtd/spi-nor/core.c:2399:9: note: Calling 'spi_nor_read'
                   ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen,=
 two);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:11: note: Field 'isparallel' is true
           if (nor->isparallel && (from & 1)) {
                    ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
           if (nor->isparallel && (from & 1)) {
               ^
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is true
           if (nor->isparallel && (from & 1)) {
                                   ^~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:2: note: Taking true branch
           if (nor->isparallel && (from & 1)) {
           ^
   drivers/mtd/spi-nor/core.c:2399:9: note: Calling 'spi_nor_read'
                   ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen,=
 two);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:11: note: Field 'isparallel' is true
           if (nor->isparallel && (from & 1)) {
                    ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
           if (nor->isparallel && (from & 1)) {
               ^
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is true
           if (nor->isparallel && (from & 1)) {
                                   ^~~~~~~~
   drivers/mtd/spi-nor/core.c:2395:2: note: Taking true branch
           if (nor->isparallel && (from & 1)) {
           ^
   drivers/mtd/spi-nor/core.c:2397:3: note: 'local_retlen' declared without=
 an initial value
                   size_t local_retlen;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2399:9: note: Calling 'spi_nor_read'
                   ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen,=
 two);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/spi-nor/core.c:2394:2: note: Taking false branch
           dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:2395:11: note: Field 'isparallel' is true
           if (nor->isparallel && (from & 1)) {
                    ^
   drivers/mtd/spi-nor/core.c:2395:6: note: Left side of '&&' is true
           if (nor->isparallel && (from & 1)) {
               ^
   drivers/mtd/spi-nor/core.c:2395:26: note: Assuming the condition is true

vim +2402 drivers/mtd/spi-nor/core.c

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2378  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2379  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t =
len,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2380  			size_t *retlen, u_char *buf)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2381  {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2382  	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
a719a75a7761e4 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov      2019-10-3=
0  2383  	ssize_t ret;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2384  	u32 offset =3D from;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2385  	u32 stack_shift =3D 0;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2386  	u32 read_len =3D 0;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2387  	u32 rem_bank_len =3D 0;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2388  	u8 bank;
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2389  	u8 cur_bank;
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2390  	u8 nxt_bank;
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2391  	u32 bank_size;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2392  =

bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2393  #define OFFSET_16_MB 0x1000000
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2394  	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2395  	if (nor->isparallel && (from & 1)) {
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2396  		u8 two[2];
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2397  		size_t local_retlen;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2398  =

66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2399  		ret =3D spi_nor_read(mtd, (from & ~1), 2, &local_retlen, two);
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2400  		if (ret < 0)
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2401  			return ret;
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6 @2402  		buf[0] =3D two[1]; /* copy odd byte to buffer */
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2403  		++buf;
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6 @2404  		*retlen +=3D 1; /* We've read only one actual byte */
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2405  		--len;
66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2406  		++from;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2407  	}
52bbd2dcb42c21 drivers/mtd/spi-nor/spi-nor.c Michael Walle        2020-01-1=
3  2408  	ret =3D spi_nor_lock_and_prep(nor);
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2409  	if (ret) {
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2410  		return ret;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2411  	}
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2412  =

26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2413  	while (len) {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2414  		if (nor->addr_width =3D=3D 3) {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2415  			bank =3D (u32)from / (OFFSET_16_MB << nor->shift);
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2416  			rem_bank_len =3D ((OFFSET_16_MB << nor->shift) *
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2417  							(bank + 1)) - from;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2418  		}
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2419  		offset =3D from;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2420  		if (nor->isparallel =3D=3D 1)
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2421  			offset /=3D 2;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2422  		if (nor->isstacked =3D=3D 1) {
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2423  			stack_shift =3D 1;
7a5bf064a1debd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2424  			if (offset >=3D (mtd->size / 2)) {
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2425  				offset =3D offset - (mtd->size / 2);
13b76c42d920f3 drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-02-0=
9  2426  				nor->spimem->spi->master->flags |=3D
13b76c42d920f3 drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-02-0=
9  2427  					SPI_MASTER_U_PAGE;
7a5bf064a1debd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2428  			} else {
13b76c42d920f3 drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-02-0=
9  2429  				nor->spimem->spi->master->flags &=3D
13b76c42d920f3 drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-02-0=
9  2430  					~SPI_MASTER_U_PAGE;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2431  			}
7a5bf064a1debd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2432  		}
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2433  		if (nor->addr_width =3D=3D 4) {
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2434  			/*
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2435  			 * Some flash devices like N25Q512 have multiple dies
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2436  			 * in it. Read operation in these devices is bounded
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2437  			 * by its die segment. In a continuous read, across
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2438  			 * multiple dies, when the last byte of the selected
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2439  			 * die segment is read, the next byte read is the
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2440  			 * first byte of the same die segment. This is Die
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2441  			 * cross over issue. So to handle this issue, split
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2442  			 * a read transaction, that spans across multiple
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2443  			 * banks, into one read per bank. Bank size is 16MB
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2444  			 * for single and dual stacked mode and 32MB for dual
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2445  			 * parallel mode.
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2446  			 */
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2447  			if (nor->spi && nor->spi->multi_die) {
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2448  				bank_size =3D (OFFSET_16_MB << nor->shift);
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2449  				cur_bank =3D offset / bank_size;
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2450  				nxt_bank =3D (offset + len) / bank_size;
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2451  				if (cur_bank !=3D nxt_bank)
2698c74f3b991d drivers/mtd/spi-nor/core.c    Leon Leijssen        2021-01-1=
1  2452  					rem_bank_len =3D ((bank_size *
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2453  							(cur_bank + 1)) -
2698c74f3b991d drivers/mtd/spi-nor/core.c    Leon Leijssen        2021-01-1=
1  2454  							offset) << nor->shift;
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2455  				else
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2456  					rem_bank_len =3D (mtd->size >>
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2457  							stack_shift) -
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2458  							(offset << nor->shift);
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2459  			} else {
7a5bf064a1debd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2460  				rem_bank_len =3D (mtd->size >> stack_shift) -
7a5bf064a1debd drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2461  						(offset << nor->shift);
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2462  			}
82d4d84c0e52d7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2463  		}
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2464  		if (nor->addr_width =3D=3D 3) {
26d248f9f56a75 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-02-0=
8  2465  			ret =3D spi_nor_write_ear(nor, offset);
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2466  			if (ret) {
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2467  				dev_err(nor->dev, "While writing ear register\n");
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2468  				goto read_err;
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2469  			}
bd78733fffb572 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2470  		}
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2471  		if (len < rem_bank_len)
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2472  			read_len =3D len;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2473  		else
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2474  			read_len =3D rem_bank_len;
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  2475  =

f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2476  		/* Wait till previous write/erase is done. */
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2477  		ret =3D spi_nor_wait_till_ready(nor);
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2478  		if (ret)
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2479  			goto read_err;
f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2480  =

f413bd6c939d9e drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2020-01-1=
9  2481  		offset =3D spi_nor_convert_addr(nor, offset);
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  2482  =

66627bb2d1c558 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2021-08-2=
6  2483  		ret =3D spi_nor_read_data(nor, (offset), read_len, buf);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2484  		if (ret =3D=3D 0) {
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2485  			/* We shouldn't see 0-length reads */
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2486  			ret =3D -EIO;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2487  			goto read_err;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2488  		}
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2489  		if (ret < 0)
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2490  			goto read_err;
59451e1233bd31 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2491  =

26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2492  		WARN_ON(ret > len);
2dd087b16946cf drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2493  		*retlen +=3D ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2494  		buf +=3D ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2495  		from +=3D ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2496  		len -=3D ret;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2497  	}
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2498  	ret =3D 0;
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2499  =

26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2500  read_err:
52bbd2dcb42c21 drivers/mtd/spi-nor/spi-nor.c Michael Walle        2020-01-1=
3  2501  	spi_nor_unlock_and_unprep(nor);
26f9bcad29a6c2 drivers/mtd/spi-nor/spi-nor.c Michal Suchanek      2016-05-0=
5  2502  	return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2503  }
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  2504  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2945444236038185397==--

