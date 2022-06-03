Content-Type: multipart/mixed; boundary="===============3586446635072794802=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/st/sti/delta/delta-v4l2.c:63:20: warning: Value stored to 'delta' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 03 Jun 2022 11:23:02 +0800
Message-ID: <202206031117.sZPa7VLG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3586446635072794802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/st/sti/delta/delta-v4l2.c:63:20: warning: Value stored to 'de=
lta' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
commit: e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2 media: platform: place stm=
32/ and sti/ under st/ dir
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220603/202206031117.sZPa7VLG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/max31730.c:219:8: note: '?' condition is false
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/hwmon/max31730.c:219:8: note: '__UNIQUE_ID___x243' is < '__UNIQU=
E_ID___y244'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
                            ^~~
   drivers/hwmon/max31730.c:219:8: note: '?' condition is true
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
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
   drivers/hwmon/max31730.c:219:2: note: The value -128000 is assigned to '=
val'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/max31730.c:220:30: note: The result of the left shift is u=
ndefined because the left operand is negative
           val =3D DIV_ROUND_CLOSEST(val << 4, 1000) << 4;
                                       ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:699:20: warning: Value =
stored to 'ctx' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
                             ^~~
   drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:699:20: note: Value sto=
red to 'ctx' during its initialization is never read
           struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
                             ^~~
   drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:743:20: warning: Value =
stored to 'ctx' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
                             ^~~
   drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c:743:20: note: Value sto=
red to 'ctx' during its initialization is never read
           struct bdisp_ctx *ctx =3D fh_to_ctx(fh);
                             ^~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   22 warnings generated.
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:63:20: warning: Value s=
tored to 'delta' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:63:20: note: Value stor=
ed to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:65:6: warning: Value st=
ored to 'data' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           u8 *data =3D (u8 *)(au->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:65:6: note: Value store=
d to 'data' during its initialization is never read
           u8 *data =3D (u8 *)(au->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:79:20: warning: Value s=
tored to 'delta' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:79:20: note: Value stor=
ed to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:81:6: warning: Value st=
ored to 'data' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           u8 *data =3D (u8 *)(frame->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:81:6: note: Value store=
d to 'data' during its initialization is never read
           u8 *data =3D (u8 *)(frame->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:428:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:428:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:431:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:431:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:456:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:456:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:460:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:460:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:495:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:495:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:549:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:549:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:609:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:609:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:645:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:645:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:649:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:649:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:766:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:766:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:809:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:809:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1045:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1045:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1055:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1055:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1118:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1118:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:1314:16: warning: Value=
 stored to 'str1' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           unsigned char str1[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1314:16: note: Value st=
ored to 'str1' during its initialization is never read
           unsigned char str1[100] =3D "";
                         ^~~~        ~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:1315:16: warning: Value=
 stored to 'str2' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           unsigned char str2[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1315:16: note: Value st=
ored to 'str2' during its initialization is never read
           unsigned char str2[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1420:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1420:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/mtd/nand/raw/nand_bbt.c:579:3: warning: Value stored to 'bbtbloc=
ks' is never read [clang-analyzer-deadcode.DeadStores]
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_bbt.c:579:3: note: Value stored to 'bbtblocks'=
 is never read
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/mtd/nand/raw/nand_onfi.c:254:6: warning: The result of the left =
shift is undefined because the right operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                           1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
                             ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:147:25: note: Calling 'nand_to_mtd'
           struct mtd_info *mtd =3D nand_to_mtd(chip);
                                  ^~~~~~~~~~~~~~~~~
   include/linux/mtd/rawnand.h:1315:2: note: Returning without writing to '=
chip->parameters.model', which participates in a condition later
           return &chip->base.mtd;
           ^
   drivers/mtd/nand/raw/nand_onfi.c:147:25: note: Returning from 'nand_to_m=
td'
           struct mtd_info *mtd =3D nand_to_mtd(chip);
                                  ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:161:6: note: Assuming 'ret' is 0
           if (ret || strncmp(id, "ONFI", 4))
               ^~~
   drivers/mtd/nand/raw/nand_onfi.c:161:6: note: Left side of '||' is false
   drivers/mtd/nand/raw/nand_onfi.c:161:13: note: Assuming the condition is=
 false
           if (ret || strncmp(id, "ONFI", 4))
                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:161:2: note: Taking false branch
           if (ret || strncmp(id, "ONFI", 4))
           ^
   drivers/mtd/nand/raw/nand_onfi.c:165:9: note: Calling 'kzalloc'
           pbuf =3D kzalloc((sizeof(*pbuf) * ONFI_PARAM_PAGES), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:165:9: note: Returning from 'kzalloc'
           pbuf =3D kzalloc((sizeof(*pbuf) * ONFI_PARAM_PAGES), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:166:6: note: Assuming 'pbuf' is non-null
           if (!pbuf)
               ^~~~~
   drivers/mtd/nand/raw/nand_onfi.c:166:2: note: Taking false branch
           if (!pbuf)
           ^
   drivers/mtd/nand/raw/nand_onfi.c:169:7: note: Calling 'nand_has_exec_op'
           if (!nand_has_exec_op(chip) ||
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:117:6: note: Assuming field 'controller=
' is null
           if (!chip->controller || !chip->controller->ops ||
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:117:24: note: Left side of '||' is true
           if (!chip->controller || !chip->controller->ops ||
                                 ^
   drivers/mtd/nand/raw/internals.h:119:3: note: Returning without writing =
to 'chip->parameters.model', which participates in a condition later
                   return false;
                   ^
   drivers/mtd/nand/raw/nand_onfi.c:169:7: note: Returning from 'nand_has_e=
xec_op'
           if (!nand_has_exec_op(chip) ||
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_onfi.c:169:30: note: Left side of '||' is true
           if (!nand_has_exec_op(chip) ||
                                       ^
   drivers/mtd/nand/raw/nand_onfi.c:173:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < ONFI_PARAM_PAGES; i++) {
           ^
   drivers/mtd/nand/raw/nand_onfi.c:174:8: note: 'i' is 0
                   if (!i)
                        ^
   drivers/mtd/nand/raw/nand_onfi.c:174:3: note: Taking true branch
                   if (!i)
                   ^
   drivers/mtd/nand/raw/nand_onfi.c:184:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/mtd/nand/raw/nand_onfi.c:184:3: note: Taking false branch
--
           if (0)                                                          \
           ^
   drivers/i2c/busses/i2c-highlander.c:262:23: note: The value 2 is assigne=
d to 'i'
           for (i =3D 0; i < cnt; i++) {
                                ^~~
   drivers/i2c/busses/i2c-highlander.c:262:14: note: Assuming 'i' is < 'cnt'
           for (i =3D 0; i < cnt; i++) {
                       ^~~~~~~
   drivers/i2c/busses/i2c-highlander.c:262:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < cnt; i++) {
           ^
   drivers/i2c/busses/i2c-highlander.c:263:3: note: 1st function call argum=
ent is an uninitialized value
                   iowrite16(data[i], dev->base + SMTRDR + (i * sizeof(u16)=
));
                   ^         ~~~~~~~
   include/asm-generic/io.h:751:19: note: expanded from macro 'iowrite16'
   #define iowrite16 iowrite16
                     ^
   include/uapi/linux/swab.h:176:9: warning: 1st function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
           return __swab16(*p);
                  ^
   include/uapi/linux/swab.h:102:28: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                              ^
   drivers/i2c/busses/i2c-highlander.c:285:2: note: Taking false branch
           dev_dbg(dev->dev, "addr %04x, command %02x, read_write %d, size =
%d\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/i2c/busses/i2c-highlander.c:291:2: note: Control jumps to 'case =
8:'  at line 296
           switch (size) {
           ^
   drivers/i2c/busses/i2c-highlander.c:299:3: note:  Execution continues on=
 line 308
                   break;
                   ^
   drivers/i2c/busses/i2c-highlander.c:311:2: note: Control jumps to 'case =
32:'  at line 321
           switch (dev->buf_len) {
           ^
   drivers/i2c/busses/i2c-highlander.c:323:3: note:  Execution continues on=
 line 329
                   break;
                   ^
   drivers/i2c/busses/i2c-highlander.c:339:6: note: Assuming 'read_write' i=
s equal to I2C_SMBUS_READ
           if (read_write =3D=3D I2C_SMBUS_READ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-highlander.c:339:2: note: Taking true branch
           if (read_write =3D=3D I2C_SMBUS_READ)
           ^
   drivers/i2c/busses/i2c-highlander.c:340:10: note: Calling 'highlander_i2=
c_read'
                   return highlander_i2c_read(dev);
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-highlander.c:214:6: note: Assuming the condition =
is false
           if (highlander_i2c_wait_for_bbsy(dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-highlander.c:214:2: note: Taking false branch
           if (highlander_i2c_wait_for_bbsy(dev))
           ^
   drivers/i2c/busses/i2c-highlander.c:219:2: note: Taking false branch
           if (highlander_i2c_wait_xfer_done(dev)) {
           ^
   drivers/i2c/busses/i2c-highlander.c:236:6: note: Assuming 'iic_read_dela=
y' is 0
           if (iic_read_delay && time_before(jiffies, dev->last_read_time +
               ^~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-highlander.c:236:21: note: Left side of '&&' is f=
alse
           if (iic_read_delay && time_before(jiffies, dev->last_read_time +
                              ^
   drivers/i2c/busses/i2c-highlander.c:242:14: note: Assuming 'i' is >=3D '=
cnt'
           for (i =3D 0; i < cnt; i++) {
                       ^~~~~~~
   drivers/i2c/busses/i2c-highlander.c:242:2: note: Loop condition is false=
. Execution continues on line 247
           for (i =3D 0; i < cnt; i++) {
           ^
   drivers/i2c/busses/i2c-highlander.c:247:2: note: Calling 'smbus_read_dat=
a'
           smbus_read_data(data, dev->buf, dev->buf_len);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-highlander.c:102:9: note: Assuming 'len' is > 1
           for (; len > 1; len -=3D 2) {
                  ^~~~~~~
   drivers/i2c/busses/i2c-highlander.c:102:2: note: Loop condition is true.=
  Entering loop body
           for (; len > 1; len -=3D 2) {
           ^
   drivers/i2c/busses/i2c-highlander.c:103:20: note: Calling '__cpu_to_be16=
p'
                   *(__be16 *)dst =3D cpu_to_be16p(src++);
                                    ^
   include/linux/byteorder/generic.h:108:22: note: expanded from macro 'cpu=
_to_be16p'
   #define cpu_to_be16p __cpu_to_be16p
                        ^
   include/uapi/linux/byteorder/little_endian.h:87:25: note: Calling '__swa=
b16p'
           return (__force __be16)__swab16p(p);
                                  ^~~~~~~~~~~~
   include/uapi/linux/swab.h:176:9: note: 1st function call argument is an =
uninitialized value
           return __swab16(*p);
                  ^
   include/uapi/linux/swab.h:102:28: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                              ^                 ~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
>> drivers/media/platform/st/sti/delta/delta-debug.c:57:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-debug.c:57:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-debug.c:58:27: warning: Value =
stored to 's' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct delta_streaminfo *s =3D &ctx->streaminfo;
                                    ^   ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-debug.c:58:27: note: Value sto=
red to 's' during its initialization is never read
           struct delta_streaminfo *s =3D &ctx->streaminfo;
                                    ^   ~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-debug.c:59:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-debug.c:59:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
>> drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:41:2: warning: Val=
ue stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:41:2: note: Value =
stored to 'b' is never read
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:59:2: warning: Val=
ue stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:59:2: note: Value =
stored to 'b' is never read
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   16 warnings generated.
   drivers/media/platform/st/sti/hva/hva-v4l2.c:230:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:230:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:231:25: warning: Value stor=
ed to 'stream' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:231:25: note: Value stored =
to 'stream' during its initialization is never read
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:232:24: warning: Value stor=
ed to 'frame' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:232:24: note: Value stored =
to 'frame' during its initialization is never read
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:339:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:339:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:403:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:403:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:453:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:453:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:483:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:483:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:557:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:557:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:620:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:620:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:695:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:695:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:866:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:866:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:876:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:876:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:914:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:914:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:936:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:936:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:1069:17: warning: Value sto=
red to 'dev' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~

vim +/delta +63 drivers/media/platform/st/sti/delta/delta-v4l2.c

f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  60  =

f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  61  static void dump_au(struct delta_ctx *ctx, struct delta_au=
 *au)
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  62  {
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02 @63  	struct delta_dev *delta =3D ctx->dev;
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  64  	u32 size =3D 10;	/* dump first & last 10 bytes */
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02 @65  	u8 *data =3D (u8 *)(au->vaddr);
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  66  =

f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  67  	if (au->size <=3D (size * 2))
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  68  		dev_dbg(delta->dev, "%s dump au[%d] dts=3D%lld size=3D%d=
 data=3D%*ph\n",
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  69  			ctx->name, au->vbuf.vb2_buf.index, au->dts, au->size,
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  70  			au->size, data);
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  71  	else
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  72  		dev_dbg(delta->dev, "%s dump au[%d] dts=3D%lld size=3D%d=
 data=3D%*ph..%*ph\n",
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  73  			ctx->name, au->vbuf.vb2_buf.index, au->dts, au->size,
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  74  			size, data, size, data + au->size - size);
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  75  }
f386509e495945 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruchet=
 2017-02-02  76  =


:::::: The code at line 63 was first introduced by commit
:::::: f386509e49594591f80af2e5a73d4c9ce389aa29 [media] st-delta: STiH4xx m=
ulti-format video decoder v4l2 driver

:::::: TO: Hugues Fruchet <hugues.fruchet@st.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3586446635072794802==--

