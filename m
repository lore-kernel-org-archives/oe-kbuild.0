Content-Type: multipart/mixed; boundary="===============6227100831253073784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 03 Jun 2022 20:20:46 +0800
Message-ID: <202206032016.QOZxWZ22-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6227100831253073784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores=
]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Emil Renner Berthing <kernel@esmil.dk>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Emil,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
commit: 299e6f788eab0b0aef97efb29ddc6971e7d0daf3 reset: starfive-jh7100: Fi=
x 32bit compilation
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220603/202206032016.QOZxWZ22-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D299e6f788eab0b0aef97efb29ddc6971e7d0daf3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 299e6f788eab0b0aef97efb29ddc6971e7d0daf3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:431:16: warning: Value sto=
red to 'str' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:431:16: note: Value stored=
 to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:456:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:456:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:460:16: warning: Value sto=
red to 'str' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:460:16: note: Value stored=
 to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:495:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:495:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:549:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:549:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:609:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:609:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:645:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:645:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:649:16: warning: Value sto=
red to 'str' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:649:16: note: Value stored=
 to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:766:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:766:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:809:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:809:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1045:20: warning: Value st=
ored to 'delta' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1045:20: note: Value store=
d to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1055:20: warning: Value st=
ored to 'delta' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1055:20: note: Value store=
d to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1118:20: warning: Value st=
ored to 'delta' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1118:20: note: Value store=
d to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1314:16: warning: Value st=
ored to 'str1' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           unsigned char str1[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1314:16: note: Value store=
d to 'str1' during its initialization is never read
           unsigned char str1[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1315:16: warning: Value st=
ored to 'str2' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           unsigned char str2[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1315:16: note: Value store=
d to 'str2' during its initialization is never read
           unsigned char str2[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1420:20: warning: Value st=
ored to 'delta' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-v4l2.c:1420:20: note: Value store=
d to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-starfive.c:640:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   1 warning generated.
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1064:38: warning: Value stored to=
 'f' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           const struct bcm281xx_pin_function *f =3D &pdata->functions[func=
tion];
                                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1064:38: note: Value stored to 'f=
' during its initialization is never read
           const struct bcm281xx_pin_function *f =3D &pdata->functions[func=
tion];
                                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   1 warning generated.
   drivers/gpu/drm/drm_framebuffer.c:855:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(fb->comm, current->comm);
           ^~~~~~
   drivers/gpu/drm/drm_framebuffer.c:855:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(fb->comm, current->comm);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-petalynx.c:41:6: note: Assuming the condition is true
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_LOGIVENDOR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-petalynx.c:41:2: note: Taking true branch
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_LOGIVENDOR) {
           ^
   drivers/hid/hid-petalynx.c:42:3: note: Control jumps to 'case 90:'  at l=
ine 43
                   switch (usage->hid & HID_USAGE) {
                   ^
   drivers/hid/hid-petalynx.c:43:15: note: Calling 'hid_map_usage_clear'
                   case 0x05a: pl_map_key_clear(KEY_TEXT);         break;
                               ^
   drivers/hid/hid-petalynx.c:35:29: note: expanded from macro 'pl_map_key_=
clear'
   #define pl_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:660:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:643:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:660:2: note: expanded from macro 'pr_warn_ratelim=
ited'
--
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:874:2: note: Loop condition is false.  Exitin=
g loop
           BUG_ON(!(NULL =3D=3D sf ||
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:876:2: note: Argument to kfree() is the addre=
ss of the local variable 'initial_stack_frame', which is not memory allocat=
ed by malloc()
           kfree(sf);
           ^     ~~
   include/asm-generic/unaligned.h:37:2: warning: Undefined or garbage valu=
e returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return le64_to_cpu(__get_unaligned_t(__le64, p));
           ^
   fs/btrfs/check-integrity.c:891:9: note: Assuming 'first_hdr' is non-null
           BUG_ON(!first_hdr);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/btrfs/check-integrity.c:891:2: note: Taking false branch
           BUG_ON(!first_hdr);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/check-integrity.c:891:2: note: Loop condition is false.  Exitin=
g loop
           BUG_ON(!first_hdr);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/check-integrity.c:904:6: note: Assuming 0 is equal to field 'le=
vel'
           if (0 =3D=3D sf->hdr->level) {
               ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:904:2: note: Taking true branch
           if (0 =3D=3D sf->hdr->level) {
           ^
   fs/btrfs/check-integrity.c:908:3: note: Taking true branch
                   if (-1 =3D=3D sf->i) {
                   ^
   fs/btrfs/check-integrity.c:911:8: note: Assuming the condition is false
                           if (state->print_mask & BTRFSIC_PRINT_MASK_VERBO=
SE)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:911:4: note: Taking false branch
                           if (state->print_mask & BTRFSIC_PRINT_MASK_VERBO=
SE)
                           ^
   fs/btrfs/check-integrity.c:921:7: note: 0 is equal to field 'num_copies'
                   if (0 =3D=3D sf->num_copies || sf->mirror_num > sf->num_=
copies) {
                       ^
   fs/btrfs/check-integrity.c:921:27: note: Left side of '||' is true
                   if (0 =3D=3D sf->num_copies || sf->mirror_num > sf->num_=
copies) {
                                           ^
   fs/btrfs/check-integrity.c:926:7: note: Assuming field 'i' is < field 'n=
r'
                   if (sf->i < sf->nr) {
                       ^~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:926:3: note: Taking true branch
                   if (sf->i < sf->nr) {
                   ^
   fs/btrfs/check-integrity.c:936:8: note: Assuming the condition is false
                           if (disk_item_offset + sizeof(struct btrfs_item)=
 >
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/check-integrity.c:936:4: note: Taking false branch
                           if (disk_item_offset + sizeof(struct btrfs_item)=
 >
                           ^
   fs/btrfs/check-integrity.c:954:8: note: Assuming 'type' is equal to BTRF=
S_ROOT_ITEM_KEY
                           if (BTRFS_ROOT_ITEM_KEY =3D=3D type) {
                               ^
   include/uapi/linux/btrfs_tree.h:170:29: note: expanded from macro 'BTRFS=
_ROOT_ITEM_KEY'
   #define BTRFS_ROOT_ITEM_KEY     132
                                   ^
   fs/btrfs/check-integrity.c:954:4: note: Taking true branch
                           if (BTRFS_ROOT_ITEM_KEY =3D=3D type) {
                           ^
   fs/btrfs/check-integrity.c:961:9: note: Assuming the condition is false
                                   if (root_item_offset + item_size >
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/check-integrity.c:961:5: note: Taking false branch
                                   if (root_item_offset + item_size >
                                   ^
   fs/btrfs/check-integrity.c:968:19: note: Calling 'btrfs_root_bytenr'
                                   next_bytenr =3D btrfs_root_bytenr(&root_=
item);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/btrfs/ctree.h:2227:1: note: Calling 'get_unaligned_le64'
   BTRFS_SETGET_STACK_FUNCS(root_bytenr, struct btrfs_root_item, bytenr, 64=
);
   ^
   fs/btrfs/ctree.h:1645:9: note: expanded from macro 'BTRFS_SETGET_STACK_F=
UNCS'
           return get_unaligned_le##bits(&s->member);                      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   include/asm-generic/unaligned.h:37:2: note: Undefined or garbage value r=
eturned to caller
           return le64_to_cpu(__get_unaligned_t(__le64, p));
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-starfive.c:640:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   1 warning generated.
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1064:38: warning: Value stored to=
 'f' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           const struct bcm281xx_pin_function *f =3D &pdata->functions[func=
tion];
                                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1064:38: note: Value stored to 'f=
' during its initialization is never read
           const struct bcm281xx_pin_function *f =3D &pdata->functions[func=
tion];
                                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/i2c/tvp7002.c:637:37: warning: The right operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           lpfr =3D lpf_lsb | ((TVP7002_CL_MASK & lpf_msb) << TVP7002_CL_SH=
IFT);
                                              ^
   drivers/media/i2c/tvp7002.c:753:2: note: Calling 'tvp7002_query_dv'
           tvp7002_query_dv(sd, &detected);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:616:2: note: 'lpf_msb' declared without an i=
nitial value
           u8 lpf_msb;
           ^~~~~~~~~~
   drivers/media/i2c/tvp7002.c:625:2: note: Calling 'tvp7002_read_err'
           tvp7002_read_err(sd, TVP7002_L_FRAME_STAT_MSBS, &lpf_msb, &error=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:475:6: note: Assuming the condition is false
           if (!*err)
               ^~~~~
   drivers/media/i2c/tvp7002.c:475:2: note: Taking false branch
           if (!*err)
           ^
   drivers/media/i2c/tvp7002.c:477:1: note: Returning without writing to '*=
dst'
   }
   ^
   drivers/media/i2c/tvp7002.c:625:2: note: Returning from 'tvp7002_read_er=
r'
           tvp7002_read_err(sd, TVP7002_L_FRAME_STAT_MSBS, &lpf_msb, &error=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:633:6: note: 'error' is >=3D 0
           if (error < 0)
               ^~~~~
   drivers/media/i2c/tvp7002.c:633:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:637:37: note: The right operand of '&' is a =
garbage value
           lpfr =3D lpf_lsb | ((TVP7002_CL_MASK & lpf_msb) << TVP7002_CL_SH=
IFT);
                                              ^ ~~~~~~~
   drivers/media/i2c/tvp7002.c:638:37: warning: The right operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           cpln =3D cpl_lsb | ((TVP7002_CL_MASK & cpl_msb) << TVP7002_CL_SH=
IFT);
                                              ^
   drivers/media/i2c/tvp7002.c:753:2: note: Calling 'tvp7002_query_dv'
           tvp7002_query_dv(sd, &detected);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:618:2: note: 'cpl_msb' declared without an i=
nitial value
           u8 cpl_msb;
           ^~~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:631:2: note: Calling 'tvp7002_read_err'
           tvp7002_read_err(sd, TVP7002_CLK_L_STAT_MSBS, &cpl_msb, &error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:475:2: note: Taking false branch
           if (!*err)
           ^
   drivers/media/i2c/tvp7002.c:477:1: note: Returning without writing to '*=
dst'
   }
   ^
   drivers/media/i2c/tvp7002.c:631:2: note: Returning from 'tvp7002_read_er=
r'
           tvp7002_read_err(sd, TVP7002_CLK_L_STAT_MSBS, &cpl_msb, &error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:633:6: note: 'error' is >=3D 0
           if (error < 0)
               ^~~~~
   drivers/media/i2c/tvp7002.c:633:2: note: Taking false branch
           if (error < 0)
           ^
   drivers/media/i2c/tvp7002.c:638:37: note: The right operand of '&' is a =
garbage value
           cpln =3D cpl_lsb | ((TVP7002_CL_MASK & cpl_msb) << TVP7002_CL_SH=
IFT);
                                              ^ ~~~~~~~
   drivers/media/i2c/tvp7002.c:1004:2: warning: Value stored to 'error' is =
never read [clang-analyzer-deadcode.DeadStores]
           error =3D tvp7002_s_dv_timings(sd, &timings);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:1004:2: note: Value stored to 'error' is nev=
er read
           error =3D tvp7002_s_dv_timings(sd, &timings);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/dev +640 drivers/pinctrl/pinctrl-starfive.c

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  635  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  636  static int starfive_se=
t_mux(struct pinctrl_dev *pctldev,
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  637  			    unsigned int fs=
el, unsigned int gsel)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  638  {
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  639  	struct starfive_pinct=
rl *sfp =3D pinctrl_dev_get_drvdata(pctldev);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06 @640  	struct device *dev =
=3D sfp->gc.parent;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  641  	const struct group_de=
sc *group;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  642  	const u32 *pinmux;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  643  	unsigned int i;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  644  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  645  	group =3D pinctrl_gen=
eric_get_group(pctldev, gsel);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  646  	if (!group)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  647  		return -EINVAL;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  648  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  649  	pinmux =3D group->dat=
a;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  650  	for (i =3D 0; i < gro=
up->num_pins; i++) {
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  651  		u32 v =3D pinmux[i];
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  652  		unsigned int gpio =
=3D starfive_pinmux_to_gpio(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  653  		u32 dout =3D starfiv=
e_pinmux_to_dout(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  654  		u32 doen =3D starfiv=
e_pinmux_to_doen(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  655  		u32 din =3D starfive=
_pinmux_to_din(v);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  656  		void __iomem *reg_do=
ut;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  657  		void __iomem *reg_do=
en;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  658  		void __iomem *reg_di=
n;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  659  		unsigned long flags;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  660  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  661  		dev_dbg(dev, "GPIO%u=
: dout=3D0x%x doen=3D0x%x din=3D0x%x\n",
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  662  			gpio, dout, doen, d=
in);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  663  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  664  		reg_dout =3D sfp->ba=
se + GPON_DOUT_CFG + 8 * gpio;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  665  		reg_doen =3D sfp->ba=
se + GPON_DOEN_CFG + 8 * gpio;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  666  		if (din !=3D GPI_NON=
E)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  667  			reg_din =3D sfp->ba=
se + GPI_CFG_OFFSET + 4 * din;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  668  		else
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  669  			reg_din =3D NULL;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  670  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  671  		raw_spin_lock_irqsav=
e(&sfp->lock, flags);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  672  		writel_relaxed(dout,=
 reg_dout);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  673  		writel_relaxed(doen,=
 reg_doen);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  674  		if (reg_din)
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  675  			writel_relaxed(gpio=
 + 2, reg_din);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  676  		raw_spin_unlock_irqr=
estore(&sfp->lock, flags);
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  677  	}
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  678  =

ec648f6b7686b7 Emil Renner Berthing 2021-07-06  679  	return 0;
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  680  }
ec648f6b7686b7 Emil Renner Berthing 2021-07-06  681  =


:::::: The code at line 640 was first introduced by commit
:::::: ec648f6b7686b716424e8e73eebb4c11ae199187 pinctrl: starfive: Add pinc=
trl driver for StarFive SoCs

:::::: TO: Emil Renner Berthing <kernel@esmil.dk>
:::::: CC: Emil Renner Berthing <kernel@esmil.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6227100831253073784==--

