Content-Type: multipart/mixed; boundary="===============8578372973508082762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/overflow 13/25] drivers/video/fbdev/tmiofb.c:396:23: warning: The left operand of '>>' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 23 Aug 2021 02:34:26 +0800
Message-ID: <202108230213.4BxouY6w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8578372973508082762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/overflow
head:   18ce9ecf54d4ad2826d3afe3b128a00d4a9a5201
commit: b45c0896242fc93c9051fe5c2381491f4d427b7e [13/25] compiler_types.h: =
Remove __compiletime_object_size()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-c006-20210822 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a83d99=
c55ebb14532c414066a5aa3bdb65389965)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3Db45c0896242fc93c9051fe5c2381491f4d427b7e
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git
        git fetch --no-tags kees for-next/overflow
        git checkout b45c0896242fc93c9051fe5c2381491f4d427b7e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (ksize > in_size)
               ^~~~~
   drivers/dma-buf/dma-heap.c:164:2: note: Taking false branch
           if (ksize > in_size)
           ^
   drivers/dma-buf/dma-heap.c:167:2: note: Control jumps to 'case 322281676=
8:'  at line 168
           switch (kcmd) {
           ^
   drivers/dma-buf/dma-heap.c:169:9: note: Calling 'dma_heap_ioctl_allocate'
                   ret =3D dma_heap_ioctl_allocate(file, kdata);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:101:6: note: Branch condition evaluates to a =
garbage value
           if (heap_allocation->fd)
               ^~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/regulator/qcom_spmi-regulator.c:390:8: warning: Excessive paddin=
g in 'struct spmi_regulator_mapping' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   ops, =

   set_points, =

   type, =

   subtype, =

   logical_type, =

   revision_min, =

   revision_max, =

   hpm_min_load, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct spmi_regulator_mapping {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:390:8: note: Excessive padding i=
n 'struct spmi_regulator_mapping' (8 padding bytes, where 0 is optimal). Op=
timal fields order: ops, set_points, type, subtype, logical_type, revision_=
min, revision_max, hpm_min_load, consider reordering the fields or adding e=
xplicit padding members
   struct spmi_regulator_mapping {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:401:8: warning: Excessive paddin=
g in 'struct spmi_regulator_data' (12 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   name, =

   supply, =

   ocp, =

   base, =

   force_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:401:8: note: Excessive padding i=
n 'struct spmi_regulator_data' (12 padding bytes, where 4 is optimal). Opti=
mal fields order: name, supply, ocp, base, force_type, consider reordering =
the fields or adding explicit padding members
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1159:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1159:2: note: Value stored to 'r=
et' is never read
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/video/fbdev/tmiofb.c:396:23: warning: The left operand of '>>' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   tmio_iowrite16(*cmd >> 16, par->lcr + LCR_CMDH);
                                       ^
   drivers/video/fbdev/tmiofb.c:507:2: note: Control jumps to 'case 2086900=
480:'  at line 523
           switch (cmd) {
           ^
   drivers/video/fbdev/tmiofb.c:528:7: note: '?' condition is true
                   if (get_user(len, argp))
                       ^
   include/asm-generic/uaccess.h:229:2: note: expanded from macro 'get_user'
           access_ok(__p, sizeof(*ptr)) ?          \
           ^
   include/asm-generic/uaccess.h:124:31: note: expanded from macro 'access_=
ok'
   #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
                                 ^
   drivers/video/fbdev/tmiofb.c:528:7: note: Control jumps to 'case 4:'  at=
 line 528
                   if (get_user(len, argp))
                       ^
   include/asm-generic/uaccess.h:230:3: note: expanded from macro 'get_user'
                   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
                   ^
   include/asm-generic/uaccess.h:189:2: note: expanded from macro '__get_us=
er'
           switch (sizeof(*(ptr))) {                               \
           ^
   drivers/video/fbdev/tmiofb.c:528:7: note:  Execution continues on line 5=
28
                   if (get_user(len, argp))
                       ^
   include/asm-generic/uaccess.h:230:3: note: expanded from macro 'get_user'
                   __get_user((x), (__typeof__(*(ptr)) __user *)__p) :\
                   ^
   include/asm-generic/uaccess.h:209:3: note: expanded from macro '__get_us=
er'
                   break;                                          \
                   ^
   drivers/video/fbdev/tmiofb.c:528:3: note: Taking false branch
                   if (get_user(len, argp))
                   ^
   drivers/video/fbdev/tmiofb.c:530:7: note: Assuming the condition is false
                   if (len > ARRAY_SIZE(acc))
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/tmiofb.c:530:3: note: Taking false branch
                   if (len > ARRAY_SIZE(acc))
                   ^
   drivers/video/fbdev/tmiofb.c:532:7: note: Calling 'copy_from_user'
                   if (copy_from_user(acc, argp + 1, sizeof(u32) * len))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:207:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:207:26: note: Assuming 'sz' is < 'bytes'
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:208:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/video/fbdev/tmiofb.c:532:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(acc, argp + 1, sizeof(u32) * len))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/tmiofb.c:532:7: note: Assuming the condition is false
                   if (copy_from_user(acc, argp + 1, sizeof(u32) * len))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/tmiofb.c:532:3: note: Taking false branch
                   if (copy_from_user(acc, argp + 1, sizeof(u32) * len))
                   ^
   drivers/video/fbdev/tmiofb.c:535:10: note: Calling 'tmiofb_acc_write'
                   return tmiofb_acc_write(fbi, acc, len);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/tmiofb.c:392:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/video/fbdev/tmiofb.c:392:2: note: Taking false branch
           if (ret)
--
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking true branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 true
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking true branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:40:3: note: The value 63 is assigned =
to 'num'
                   num +=3D 1;
                   ^~~~~~~~
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 63 (l=
oaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:130:20: note: Returning from '__ffs'
           min_shift_group =3D __ffs(val);
                             ^~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:130:2: note: The value 63 is assigned =
to 'min_shift_group'
           min_shift_group =3D __ffs(val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:133:13: note: The result of the left s=
hift is undefined due to shifting by '63', which is greater or equal to the=
 width of type 'int'
           writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
                      ^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                                     ^
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
     ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   net/atm/common.c:238:2: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
           skb_queue_walk_safe(&queue, skb, tmp) {
           ^
   include/linux/skbuff.h:3537:33: note: expanded from macro 'skb_queue_wal=
k_safe'
                   for (skb =3D (queue)->next, tmp =3D skb->next;          =
            \
                                                 ^ ~~~~~~~~~
   net/atm/common.c:231:2: note: Calling '__skb_queue_head_init'
           __skb_queue_head_init(&queue);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/atm/common.c:231:2: note: Returning from '__skb_queue_head_init'
           __skb_queue_head_init(&queue);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/atm/common.c:234:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&rq->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/atm/common.c:234:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&rq->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/atm/common.c:235:2: note: Calling 'skb_queue_splice_init'
           skb_queue_splice_init(rq, &queue);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:1979:6: note: Assuming the condition is false
           if (!skb_queue_empty(list)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:1979:2: note: Taking false branch
           if (!skb_queue_empty(list)) {
           ^
   net/atm/common.c:235:2: note: Returning from 'skb_queue_splice_init'
           skb_queue_splice_init(rq, &queue);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/atm/common.c:238:2: note: Assigned value is garbage or undefined
           skb_queue_walk_safe(&queue, skb, tmp) {
           ^
   include/linux/skbuff.h:3537:33: note: expanded from macro 'skb_queue_wal=
k_safe'
                   for (skb =3D (queue)->next, tmp =3D skb->next;          =
            \
                                                 ^ ~~~~~~~~~
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (10 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> net/atm/lec.c:693:23: warning: The left operand of '<' is a garbage valu=
e [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (ioc_data.dev_num < 0 || ioc_data.dev_num >=3D MAX_LEC_ITF)
                                ^
   net/atm/lec.c:996:2: note: Control jumps to 'case 25041:'  at line 999
           switch (cmd) {
           ^
   net/atm/lec.c:1000:3: note: Taking false branch
                   if (!capable(CAP_NET_ADMIN))
                   ^
   net/atm/lec.c:1002:3: note:  Execution continues on line 1007
                   break;
                   ^
   net/atm/lec.c:1007:2: note: Control jumps to 'case 25041:'  at line 1016
           switch (cmd) {
           ^
   net/atm/lec.c:1017:9: note: Calling 'lec_vcc_attach'
                   err =3D lec_vcc_attach(vcc, (void __user *)arg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/atm/lec.c:690:15: note: Calling 'copy_from_user'
           bytes_left =3D copy_from_user(&ioc_data, arg, sizeof(struct atml=
ec_ioc));
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->d=
ev_num'
           return n;
           ^
   net/atm/lec.c:690:15: note: Returning from 'copy_from_user'
           bytes_left =3D copy_from_user(&ioc_data, arg, sizeof(struct atml=
ec_ioc));
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/atm/lec.c:691:6: note: 'bytes_left' is not equal to 0
           if (bytes_left !=3D 0)
               ^~~~~~~~~~
   net/atm/lec.c:691:2: note: Taking true branch
           if (bytes_left !=3D 0)
           ^
   net/atm/lec.c:693:23: note: The left operand of '<' is a garbage value
           if (ioc_data.dev_num < 0 || ioc_data.dev_num >=3D MAX_LEC_ITF)
               ~~~~~~~~~~~~~~~~ ^
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   net/decnet/af_decnet.c:1765:4: warning: Value stored to 'rv' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           rv =3D -EFAULT;
                           ^    ~~~~~~~
   net/decnet/af_decnet.c:1765:4: note: Value stored to 'rv' is never read
                           rv =3D -EFAULT;
                           ^    ~~~~~~~
   net/decnet/af_decnet.c:1962:2: warning: Value stored to 'mss' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           mss =3D scp->segsize_rem;
           ^     ~~~~~~~~~~~~~~~~
   net/decnet/af_decnet.c:1962:2: note: Value stored to 'mss' is never read
           mss =3D scp->segsize_rem;
           ^     ~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   net/decnet/dn_nsp_in.c:763:3: warning: Value stored to 'ptr' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D 2;
                   ^      ~
   net/decnet/dn_nsp_in.c:763:3: note: Value stored to 'ptr' is never read
                   ptr +=3D 2;
                   ^      ~
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   net/decnet/dn_route.c:827:20: warning: Value stored to 'cb' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:827:20: note: Value stored to 'cb' during its init=
ialization is never read
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:839:20: warning: Value stored to 'cb' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:839:20: note: Value stored to 'cb' during its init=
ialization is never read
           struct dn_skb_cb *cb =3D DN_SKB_CB(skb);
                             ^~
   net/decnet/dn_route.c:890:39: warning: Access to field 'mtu' results in =
a dereference of a null pointer (loaded from field 'dev') [clang-analyzer-c=
ore.NullDereference]
           if (dst_metric(&rt->dst, RTAX_MTU) > rt->dst.dev->mtu)
                                                ^
   net/decnet/dn_route.c:1652:2: note: Taking false branch
           if (!net_eq(net, &init_net))
           ^
   net/decnet/dn_route.c:1657:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/decnet/dn_route.c:1657:2: note: Taking false branch
           if (err < 0)
           ^
   net/decnet/dn_route.c:1664:6: note: Assuming 'skb' is not equal to NULL
           if (skb =3D=3D NULL)
               ^~~~~~~~~~~
   net/decnet/dn_route.c:1664:2: note: Taking false branch
           if (skb =3D=3D NULL)
           ^
   net/decnet/dn_route.c:1669:6: note: Assuming the condition is true
           if (tb[RTA_SRC])

vim +396 drivers/video/fbdev/tmiofb.c

b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  381  =

b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  382  /*
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  383   * =
Writes an accelerator command to the accelerator's FIFO.
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  384   */
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  385  sta=
tic int
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  386  tmi=
ofb_acc_write(struct fb_info *info, const u32 *cmd, unsigned int count)
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  387  {
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  388  	st=
ruct tmiofb_par *par =3D info->par;
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  389  	in=
t ret;
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  390  =

b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  391  	re=
t =3D tmiofb_acc_wait(info, TMIOFB_FIFO_SIZE - count);
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  392  	if=
 (ret)
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  393  		r=
eturn ret;
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  394  =

b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  395  	fo=
r (; count; count--, cmd++) {
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15 @396  		t=
mio_iowrite16(*cmd >> 16, par->lcr + LCR_CMDH);
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  397  		t=
mio_iowrite16(*cmd, par->lcr + LCR_CMDL);
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  398  	}
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  399  =

b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  400  	re=
turn ret;
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  401  }
b53cde3557b8f9 drivers/video/tmiofb.c Dmitry Baryshkov 2008-10-15  402  =


:::::: The code at line 396 was first introduced by commit
:::::: b53cde3557b8f97e6a635782875d442551a89bf1 fbdev: add new TMIO framebu=
ffer driver

:::::: TO: Dmitry Baryshkov <dbaryshkov@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8578372973508082762==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CgIA
--===============8578372973508082762==--

