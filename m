Content-Type: multipart/mixed; boundary="===============4020771244116156624=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/host/ioctl.c:193:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 05 Dec 2021 21:43:52 +0800
Message-ID: <202112052142.JqvLRFgR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4020771244116156624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Keith Busch <kbusch@kernel.org>
CC: "Javier Gonz=C3=A1lez" <javier.gonz@samsung.com>
CC: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79a72162048e42a677bc7336a9f5d86fc3ff9558
commit: 2405252a680e2151046f4f256d706c3ca92fedef nvme: move the ioctl code =
to a separate file
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-c004-20211203 (https://download.01.org/0day-ci/arch=
ive/20211205/202112052142.JqvLRFgR-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b=
06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2405252a680e2151046f4f256d706c3ca92fedef
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2405252a680e2151046f4f256d706c3ca92fedef
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/usb/host/ehci-q.c:792:2: note: Taking false branch
           if (maxp > 1024) {
           ^
   drivers/usb/host/ehci-q.c:805:6: note: Assuming 'type' is equal to PIPE_=
INTERRUPT
           if (type =3D=3D PIPE_INTERRUPT) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-q.c:805:2: note: Taking true branch
           if (type =3D=3D PIPE_INTERRUPT) {
           ^
   drivers/usb/host/ehci-q.c:812:7: note: Assuming field 'speed' is not equ=
al to USB_SPEED_HIGH
                   if (urb->dev->speed =3D=3D USB_SPEED_HIGH) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-q.c:812:3: note: Taking false branch
                   if (urb->dev->speed =3D=3D USB_SPEED_HIGH) {
                   ^
   drivers/usb/host/ehci-q.c:842:8: note: 'is_input' is 0
                           if (is_input) {         // SPLIT, gap, CSPLIT+DA=
TA
                               ^~~~~~~~
   drivers/usb/host/ehci-q.c:842:4: note: Taking false branch
                           if (is_input) {         // SPLIT, gap, CSPLIT+DA=
TA
                           ^
   drivers/usb/host/ehci-q.c:850:17: note: Assuming 'tt' is null
                           think_time =3D tt ? tt->think_time : 0;
                                        ^~
   drivers/usb/host/ehci-q.c:850:17: note: '?' condition is false
   drivers/usb/host/ehci-q.c:854:8: note: Assuming field 'interval' is <=3D=
 field 'periodic_size'
                           if (urb->interval > ehci->periodic_size)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/ehci-q.c:854:4: note: Taking false branch
                           if (urb->interval > ehci->periodic_size)
                           ^
   drivers/usb/host/ehci-q.c:859:10: note: Assuming '__UNIQUE_ID___x396' is=
 >=3D '__UNIQUE_ID___y397'
                           tmp =3D min_t(unsigned, EHCI_BANDWIDTH_FRAMES,
                                 ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/usb/host/ehci-q.c:859:10: note: '?' condition is false
                           tmp =3D min_t(unsigned, EHCI_BANDWIDTH_FRAMES,
                                 ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/usb/host/ehci-q.c:861:10: note: '?' condition is false
                           tmp =3D rounddown_pow_of_two(tmp);
                                 ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/usb/host/ehci-q.c:861:10: note: Calling '__rounddown_pow_of_two'
                           tmp =3D rounddown_pow_of_two(tmp);
                                 ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   drivers/base/regmap/regmap-mmio.c:52:3: warning: Value stored to 'min_st=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   min_stride =3D 0;
                   ^            ~
   drivers/base/regmap/regmap-mmio.c:52:3: note: Value stored to 'min_strid=
e' is never read
                   min_stride =3D 0;
                   ^            ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/nvme/host/ioctl.c:193:6: warning: Branch condition evaluates to =
a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (cmd.flags)
               ^
   drivers/nvme/host/ioctl.c:437:2: note: Control jumps to 'case 3225964097=
:'  at line 438
           switch (cmd) {
           ^
   drivers/nvme/host/ioctl.c:439:10: note: Calling 'nvme_user_cmd'
                   return nvme_user_cmd(ctrl, NULL, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:189:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:189:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   drivers/nvme/host/ioctl.c:191:6: note: Calling 'copy_from_user'
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:616:2: note: Taking false branch
           if (eva_kernel_access())
           ^
   arch/mips/include/asm/uaccess.h:619:3: note: Returning without writing t=
o 'to->flags'
                   return __invoke_copy_from_user(to, from, n);
                   ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
lags'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->f=
lags'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/nvme/host/ioctl.c:191:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:191:2: note: Taking false branch
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
           ^
   drivers/nvme/host/ioctl.c:193:6: note: Branch condition evaluates to a g=
arbage value
           if (cmd.flags)
               ^~~~~~~~~
   drivers/nvme/host/ioctl.c:224:7: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   if (put_user(result, &ucmd->result))
                       ^
   arch/mips/include/asm/uaccess.h:154:2: note: expanded from macro 'put_us=
er'
           __put_user_check((x), (ptr), sizeof(*(ptr)))

vim +193 drivers/nvme/host/ioctl.c

2405252a680e21 Christoph Hellwig 2021-04-10  179  =

2405252a680e21 Christoph Hellwig 2021-04-10  180  static int nvme_user_cmd(=
struct nvme_ctrl *ctrl, struct nvme_ns *ns,
2405252a680e21 Christoph Hellwig 2021-04-10  181  			struct nvme_passthru_c=
md __user *ucmd)
2405252a680e21 Christoph Hellwig 2021-04-10  182  {
2405252a680e21 Christoph Hellwig 2021-04-10  183  	struct nvme_passthru_cmd=
 cmd;
2405252a680e21 Christoph Hellwig 2021-04-10  184  	struct nvme_command c;
2405252a680e21 Christoph Hellwig 2021-04-10  185  	unsigned timeout =3D 0;
2405252a680e21 Christoph Hellwig 2021-04-10  186  	u64 result;
2405252a680e21 Christoph Hellwig 2021-04-10  187  	int status;
2405252a680e21 Christoph Hellwig 2021-04-10  188  =

2405252a680e21 Christoph Hellwig 2021-04-10  189  	if (!capable(CAP_SYS_ADM=
IN))
2405252a680e21 Christoph Hellwig 2021-04-10  190  		return -EACCES;
2405252a680e21 Christoph Hellwig 2021-04-10  191  	if (copy_from_user(&cmd,=
 ucmd, sizeof(cmd)))
2405252a680e21 Christoph Hellwig 2021-04-10  192  		return -EFAULT;
2405252a680e21 Christoph Hellwig 2021-04-10 @193  	if (cmd.flags)
2405252a680e21 Christoph Hellwig 2021-04-10  194  		return -EINVAL;
2405252a680e21 Christoph Hellwig 2021-04-10  195  	if (ns && cmd.nsid !=3D =
ns->head->ns_id) {
2405252a680e21 Christoph Hellwig 2021-04-10  196  		dev_err(ctrl->device,
2405252a680e21 Christoph Hellwig 2021-04-10  197  			"%s: nsid (%u) in cmd =
does not match nsid (%u) of namespace\n",
2405252a680e21 Christoph Hellwig 2021-04-10  198  			current->comm, cmd.nsi=
d, ns->head->ns_id);
2405252a680e21 Christoph Hellwig 2021-04-10  199  		return -EINVAL;
2405252a680e21 Christoph Hellwig 2021-04-10  200  	}
2405252a680e21 Christoph Hellwig 2021-04-10  201  =

2405252a680e21 Christoph Hellwig 2021-04-10  202  	memset(&c, 0, sizeof(c));
2405252a680e21 Christoph Hellwig 2021-04-10  203  	c.common.opcode =3D cmd.=
opcode;
2405252a680e21 Christoph Hellwig 2021-04-10  204  	c.common.flags =3D cmd.f=
lags;
2405252a680e21 Christoph Hellwig 2021-04-10  205  	c.common.nsid =3D cpu_to=
_le32(cmd.nsid);
2405252a680e21 Christoph Hellwig 2021-04-10  206  	c.common.cdw2[0] =3D cpu=
_to_le32(cmd.cdw2);
2405252a680e21 Christoph Hellwig 2021-04-10  207  	c.common.cdw2[1] =3D cpu=
_to_le32(cmd.cdw3);
2405252a680e21 Christoph Hellwig 2021-04-10  208  	c.common.cdw10 =3D cpu_t=
o_le32(cmd.cdw10);
2405252a680e21 Christoph Hellwig 2021-04-10  209  	c.common.cdw11 =3D cpu_t=
o_le32(cmd.cdw11);
2405252a680e21 Christoph Hellwig 2021-04-10  210  	c.common.cdw12 =3D cpu_t=
o_le32(cmd.cdw12);
2405252a680e21 Christoph Hellwig 2021-04-10  211  	c.common.cdw13 =3D cpu_t=
o_le32(cmd.cdw13);
2405252a680e21 Christoph Hellwig 2021-04-10  212  	c.common.cdw14 =3D cpu_t=
o_le32(cmd.cdw14);
2405252a680e21 Christoph Hellwig 2021-04-10  213  	c.common.cdw15 =3D cpu_t=
o_le32(cmd.cdw15);
2405252a680e21 Christoph Hellwig 2021-04-10  214  =

2405252a680e21 Christoph Hellwig 2021-04-10  215  	if (cmd.timeout_ms)
2405252a680e21 Christoph Hellwig 2021-04-10  216  		timeout =3D msecs_to_ji=
ffies(cmd.timeout_ms);
2405252a680e21 Christoph Hellwig 2021-04-10  217  =

2405252a680e21 Christoph Hellwig 2021-04-10  218  	status =3D nvme_submit_u=
ser_cmd(ns ? ns->queue : ctrl->admin_q, &c,
2405252a680e21 Christoph Hellwig 2021-04-10  219  			nvme_to_user_ptr(cmd.a=
ddr), cmd.data_len,
2405252a680e21 Christoph Hellwig 2021-04-10  220  			nvme_to_user_ptr(cmd.m=
etadata), cmd.metadata_len,
2405252a680e21 Christoph Hellwig 2021-04-10  221  			0, &result, timeout);
2405252a680e21 Christoph Hellwig 2021-04-10  222  =

2405252a680e21 Christoph Hellwig 2021-04-10  223  	if (status >=3D 0) {
2405252a680e21 Christoph Hellwig 2021-04-10  224  		if (put_user(result, &u=
cmd->result))
2405252a680e21 Christoph Hellwig 2021-04-10  225  			return -EFAULT;
2405252a680e21 Christoph Hellwig 2021-04-10  226  	}
2405252a680e21 Christoph Hellwig 2021-04-10  227  =

2405252a680e21 Christoph Hellwig 2021-04-10  228  	return status;
2405252a680e21 Christoph Hellwig 2021-04-10  229  }
2405252a680e21 Christoph Hellwig 2021-04-10  230  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4020771244116156624==--

