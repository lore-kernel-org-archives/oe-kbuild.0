Content-Type: multipart/mixed; boundary="===============1125691568450359054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/host/ioctl.c:193:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 09 Jan 2022 13:49:43 +0800
Message-ID: <202201091309.HFm9hkOZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1125691568450359054==
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
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: 2405252a680e2151046f4f256d706c3ca92fedef nvme: move the ioctl code =
to a separate file
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-c004-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201091309.HFm9hkOZ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
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
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/rcu/rcutorture.c:1588:2: note: Loop condition is false.  Exiting =
loop
           __this_cpu_inc(rcu_torture_batch[completed]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   note: expanded from here
   include/asm-generic/percpu.h:227:34: note: expanded from macro 'raw_cpu_=
add_4'
   #define raw_cpu_add_4(pcp, val)         raw_cpu_generic_to_op(pcp, val, =
+=3D)
                                           ^
   include/asm-generic/percpu.h:70:48: note: expanded from macro 'raw_cpu_g=
eneric_to_op'
   #define raw_cpu_generic_to_op(pcp, val, op)                             \
                                                                           ^
   kernel/rcu/rcutorture.c:1588:2: note:  Execution continues on line 1588
           __this_cpu_inc(rcu_torture_batch[completed]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   include/linux/percpu-defs.h:379:42: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                                                          ^
   kernel/rcu/rcutorture.c:1588:2: note: Loop condition is false.  Exiting =
loop
           __this_cpu_inc(rcu_torture_batch[completed]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   include/linux/percpu-defs.h:373:50: note: expanded from macro '__pcpu_si=
ze_call'
   #define __pcpu_size_call(stem, variable, ...)                           \
                                                                           ^
   kernel/rcu/rcutorture.c:1589:2: note: Taking false branch
           preempt_enable();
           ^
   include/linux/preempt.h:191:2: note: expanded from macro 'preempt_enable'
           if (unlikely(preempt_count_dec_and_test())) \
           ^
   kernel/rcu/rcutorture.c:1589:2: note: Loop condition is false.  Exiting =
loop
           preempt_enable();
           ^
   include/linux/preempt.h:188:26: note: expanded from macro 'preempt_enabl=
e'
   #define preempt_enable() \
                            ^
   kernel/rcu/rcutorture.c:1590:6: note: Assuming field 'get_gp_state' is n=
on-null
           if (cur_ops->get_gp_state && cur_ops->poll_gp_state)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcutorture.c:1590:6: note: Left side of '&&' is true
   kernel/rcu/rcutorture.c:1590:31: note: Assuming field 'poll_gp_state' is=
 non-null
           if (cur_ops->get_gp_state && cur_ops->poll_gp_state)
                                        ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcutorture.c:1590:2: note: Taking true branch
           if (cur_ops->get_gp_state && cur_ops->poll_gp_state)
           ^
   kernel/rcu/rcutorture.c:1591:13: note: 1st function call argument is an =
uninitialized value
                   WARN_ONCE(cur_ops->poll_gp_state(cookie),
                             ^
   include/asm-generic/bug.h:157:27: note: expanded from macro 'WARN_ONCE'
           int __ret_warn_once =3D !!(condition);                    \
                                    ^~~~~~~~~
   kernel/rcu/rcutorture.c:2667:4: warning: Value stored to 'errexit' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           errexit =3D true;
                           ^         ~~~~
   kernel/rcu/rcutorture.c:2667:4: note: Value stored to 'errexit' is never=
 read
                           errexit =3D true;
                           ^         ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
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
   drivers/nvme/host/ioctl.c:189:7: note: Calling 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/capability.h:235:2: note: Returning the value 1, which par=
ticipates in a condition later
           return true;
           ^~~~~~~~~~~
   drivers/nvme/host/ioctl.c:189:7: note: Returning from 'capable'
           if (!capable(CAP_SYS_ADMIN))
                ^~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/uaccess.h:157:33: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
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
--===============1125691568450359054==--

