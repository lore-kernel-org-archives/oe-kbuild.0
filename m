Content-Type: multipart/mixed; boundary="===============0549640738660998214=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:cec 382/417] drivers/media/platform/chips-media/coda-common.c:478:38: warning: Array access (from variable 'formats') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Tue, 22 Mar 2022 17:14:22 +0800
Message-ID: <202203221700.lbB4GiIC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0549640738660998214==
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
commit: bfc08fd88e458b98c7c771e4eeb5df3fd4e42feb [382/417] media: platform:=
 rename coda/ to chips-media/
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220322/202203221700.lbB4GiIC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media=
_tree.git
        git fetch --no-tags hverkuil-media-tree cec
        git checkout bfc08fd88e458b98c7c771e4eeb5df3fd4e42feb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   net/core/dev.c:7574:2: note: '__ret_do_once' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:7574:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   net/core/dev.c:7574:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   net/core/dev.c:7576:28: note: Assuming pointer value is null
           changeupper_info.master =3D netdev_master_upper_dev_get(dev) =3D=
=3D upper_dev;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/core/dev.c:7589:30: note: Passing null pointer value via 1st paramet=
er 'dev'
           __netdev_update_lower_level(upper_dev, priv);
                                       ^~~~~~~~~
   net/core/dev.c:7589:2: note: Calling '__netdev_update_lower_level'
           __netdev_update_lower_level(upper_dev, priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7151:19: note: Access to field 'lower_level' results in a=
 dereference of a null pointer (loaded from variable 'dev')
           dev->lower_level =3D __netdev_lower_depth(dev) + 1;
           ~~~              ^
   net/core/dev.c:10228:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dev->name, name);
           ^~~~~~
   net/core/dev.c:10228:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(dev->name, name);
           ^~~~~~
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   9 warnings generated.
>> drivers/media/platform/chips-media/coda-common.c:478:38: warning: Array =
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
   drivers/media/platform/chips-media/coda.h:300:3: note: expanded from mac=
ro 'coda_dbg'
                   if (coda_debug >=3D (level))                            =
  \
                   ^
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Loop cond=
ition is false.  Exiting loop
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^
   drivers/media/platform/chips-media/coda.h:299:2: note: expanded from mac=
ro 'coda_dbg'
           do {                                                            \
           ^
   drivers/media/platform/chips-media/coda-common.c:2121:6: note: Assuming =
field 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2121:2: note: Taking tr=
ue branch
           if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
           ^
   drivers/media/platform/chips-media/coda-common.c:2128:3: note: Loop cond=
ition is false. Execution continues on line 2140
                   while ((buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)=
))
                   ^
   drivers/media/platform/chips-media/coda-common.c:2140:6: note: Assuming =
'stop' is true
           if (stop) {
               ^~~~
   drivers/media/platform/chips-media/coda-common.c:2140:2: note: Taking tr=
ue branch
           if (stop) {
           ^
   drivers/media/platform/chips-media/coda-common.c:2143:7: note: Assuming =
field 'seq_end_work' is null
                   if (ctx->ops->seq_end_work) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2143:3: note: Taking fa=
lse branch
                   if (ctx->ops->seq_end_work) {
                   ^
   drivers/media/platform/chips-media/coda-common.c:2148:3: note: Loop cond=
ition is true.  Entering loop body
                   while (!list_empty(&ctx->buffer_meta_list)) {
                   ^
   drivers/media/platform/chips-media/coda-common.c:2152:4: note: Memory is=
 released
                           kfree(meta);
                           ^~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2148:3: note: Loop cond=
ition is true.  Entering loop body
                   while (!list_empty(&ctx->buffer_meta_list)) {
                   ^
   drivers/media/platform/chips-media/coda-common.c:2151:4: note: Calling '=
list_del'
                           list_del(&meta->list);
                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
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
--
   drivers/hwmon/adc128d818.c:217:21: note: '?' condition is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                              ^
   include/linux/math.h:89:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/hwmon/adc128d818.c:217:11: note: Assuming '__UNIQUE_ID___x252' i=
s <=3D '__UNIQUE_ID___y253'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
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
   drivers/hwmon/adc128d818.c:217:11: note: '__UNIQUE_ID___x254' is < '__UN=
IQUE_ID___y255'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
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
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is true
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
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
   drivers/hwmon/adc128d818.c:217:2: note: The value -128 is assigned to 'r=
egval'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adc128d818.c:218:29: note: The result of the left shift is=
 undefined because the left operand is negative
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/media/platform/chips-media/coda-bit.c:1127:2: warning: Value sto=
red to 'value' is never read [clang-analyzer-deadcode.DeadStores]
           value =3D 0;
           ^       ~
   drivers/media/platform/chips-media/coda-bit.c:1127:2: note: Value stored=
 to 'value' is never read
           value =3D 0;
           ^       ~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/media/platform/chips-media/coda-bit.c:1794:6: note: Assuming fie=
ld 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (rb->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1794:2: note: Taking false=
 branch
           if (rb->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
           ^
   drivers/media/platform/chips-media/coda-bit.c:1797:6: note: Assuming fie=
ld 'count' is not equal to 0
           if (rb->count) {
               ^~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1797:2: note: Taking true =
branch
           if (rb->count) {
           ^
   drivers/media/platform/chips-media/coda-bit.c:1800:7: note: 'ret' is >=
=3D 0
                   if (ret < 0)
                       ^~~
   drivers/media/platform/chips-media/coda-bit.c:1800:3: note: Taking false=
 branch
                   if (ret < 0)
                   ^
   drivers/media/platform/chips-media/coda-bit.c:1802:9: note: Calling 'cod=
a_alloc_bitstream_buffer'
                   ret =3D coda_alloc_bitstream_buffer(ctx, q_data_src);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1760:6: note: Assuming fie=
ld 'vaddr' is null
           if (ctx->bitstream.vaddr)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1760:2: note: Taking false=
 branch
           if (ctx->bitstream.vaddr)
           ^
   drivers/media/platform/chips-media/coda-bit.c:1763:24: note: '?' conditi=
on is false
           ctx->bitstream.size =3D roundup_pow_of_two(q_data->sizeimage * 2=
);
                                 ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/media/platform/chips-media/coda-bit.c:1763:24: note: Calling '__=
roundup_pow_of_two'
           ctx->bitstream.size =3D roundup_pow_of_two(q_data->sizeimage * 2=
);
                                 ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:155:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
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
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);

vim +/formats +478 drivers/media/platform/chips-media/coda-common.c

12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  439  =

22e244b813ddd9 drivers/media/platform/coda.c             Philipp Zabel 2014=
-07-18  440  static int coda_enum_fmt(struct file *file, void *priv,
22e244b813ddd9 drivers/media/platform/coda.c             Philipp Zabel 2014=
-07-18  441  			 struct v4l2_fmtdesc *f)
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  442  {
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  443  	struct video_device *vdev =3D video_devdata(file);
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  444  	const struct coda_video_device *cvd =3D to_coda_video_device(=
vdev);
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  445  	struct coda_ctx *ctx =3D fh_to_ctx(priv);
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  446  	const u32 *formats;
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  447  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  448  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  449  		formats =3D cvd->src_formats;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  450  	else if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  451  		struct coda_q_data *q_data_src;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  452  		struct vb2_queue *src_vq;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  453  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  454  		formats =3D cvd->dst_formats;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  455  =

12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  456  		/*
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  457  		 * If the source format is already fixed, only allow the same
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  458  		 * chroma subsampling.
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  459  		 */
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  460  		q_data_src =3D get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  461  		src_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  462  					 V4L2_BUF_TYPE_VIDEO_OUTPUT);
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  463  		if (q_data_src->fourcc =3D=3D V4L2_PIX_FMT_JPEG &&
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  464  		    vb2_is_streaming(src_vq)) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  465  			if (ctx->params.jpeg_chroma_subsampling =3D=3D
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  466  			    V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  467  				formats =3D coda_formats_420;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  468  			} else if (ctx->params.jpeg_chroma_subsampling =3D=3D
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  469  				   V4L2_JPEG_CHROMA_SUBSAMPLING_422) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  470  				f->pixelformat =3D V4L2_PIX_FMT_YUV422P;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  471  				return f->index ? -EINVAL : 0;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  472  			}
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  473  		}
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  474  	} else {
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  475  		return -EINVAL;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  476  	}
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  477  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02 @478  	if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=
=3D 0)
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  479  		return -EINVAL;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  480  =

9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  481  	/* Skip YUYV if the vdoa is not available */
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  482  	if (!ctx->vdoa && f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE =
&&
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  483  	    formats[f->index] =3D=3D V4L2_PIX_FMT_YUYV)
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  484  		return -EINVAL;
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  485  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  486  	f->pixelformat =3D formats[f->index];
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  487  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  488  	return 0;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  489  }
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  490  =


:::::: The code at line 478 was first introduced by commit
:::::: 2c11d1bdfc7175cc75a603e433367caaf038ab69 [media] coda: add coda_vide=
o_device descriptors

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0549640738660998214==--

