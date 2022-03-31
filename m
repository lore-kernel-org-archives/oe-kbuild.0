Content-Type: multipart/mixed; boundary="===============1962639216642912013=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/host/ioctl.c:193:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 31 Mar 2022 11:58:57 +0800
Message-ID: <202203311116.PVvMfM4M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1962639216642912013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Keith Busch <kbusch@kernel.org>
CC: "Javier Gonz=C3=A1lez" <javier.gonz@samsung.com>
CC: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   74164d284b2909de0ba13518cc063e9ea9334749
commit: 2405252a680e2151046f4f256d706c3ca92fedef nvme: move the ioctl code =
to a separate file
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-c004-20220328 (https://download.01.org/0day-ci/arch=
ive/20220331/202203311116.PVvMfM4M-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
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
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^~~~~~~~~~~~~~~
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:594:6: note: Returning from '__ilog2_u32'
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:35: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ^~~~~~~~~~~~~~~
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:594:6: note: The result of the left shift i=
s undefined because the left operand is negative
                                    AXP813_ADC_RATE_HZ(rate));
                                    ^
   drivers/iio/adc/axp20x_adc.c:41:34: note: expanded from macro 'AXP813_AD=
C_RATE_HZ'
   #define AXP813_ADC_RATE_HZ(x)                   (AXP20X_ADC_RATE_HZ(x) |=
 AXP813_V_I_ADC_RATE_HZ(x))
                                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/axp20x_adc.c:37:51: note: expanded from macro 'AXP20X_AD=
C_RATE_HZ'
   #define AXP20X_ADC_RATE_HZ(x)                   ((ilog2((x) / 25) << 6) =
& AXP20X_ADC_RATE_MASK)
                                                     ~~~~~~~~~~~~~~~ ^
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
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
           ^
   arch/mips/include/asm/uaccess.h:441:2: note: expanded from macro '__put_=
user_check'
           __typeof__(*(ptr)) __pu_val =3D (x);                            =
  \
           ^
   drivers/nvme/host/ioctl.c:355:2: note: Taking true branch
           if (is_ctrl_ioctl(cmd))
           ^
   drivers/nvme/host/ioctl.c:356:10: note: Calling 'nvme_ctrl_ioctl'
                   return nvme_ctrl_ioctl(ns->ctrl, cmd, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:293:2: note: Control jumps to 'case 3225964097=
:'  at line 294
           switch (cmd) {
           ^
   drivers/nvme/host/ioctl.c:295:10: note: Calling 'nvme_user_cmd'

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1962639216642912013==--

