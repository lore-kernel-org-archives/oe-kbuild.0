Content-Type: multipart/mixed; boundary="===============1917397266797410636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 01 Jun 2022 16:18:28 +0800
Message-ID: <202206011620.OySYChYh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1917397266797410636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/r=
pmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or undefined [c=
lang-analyzer-core.uninitialized.Assign]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   700170bf6b4d773e328fa54ebb70ba444007c702
commit: 617d32938d1be0d67bad73a914635bf787c319c1 rpmsg: Move the rpmsg cont=
rol device from rpmsg_char to rpmsg_ctrl
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-c004-20220531 (https://download.01.org/0day-ci/arch=
ive/20220601/202206011620.OySYChYh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D617d32938d1be0d67bad73a914635bf787c319c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 617d32938d1be0d67bad73a914635bf787c319c1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/nvme/target/fc.c:1454:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/nvme/target/fc.c:1468:2: note: Memory is released
           kfree(tgtport);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/nvme/target/fc.c:1476:2: note: Returning; memory was released
           kref_put(&tgtport->ref, nvmet_fc_free_tgtport);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/fc.c:1063:3: note: Returning; memory was released vi=
a 1st parameter
                   nvmet_fc_tgtport_put(tgtport);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/fc.c:1125:20: note: Returning; memory was released v=
ia 1st parameter
           assoc->hostport =3D nvmet_fc_alloc_hostport(tgtport, hosthandle);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/target/fc.c:1126:2: note: Taking false branch
           if (IS_ERR(assoc->hostport))
           ^
   drivers/nvme/target/fc.c:1133:2: note: Loop condition is false.  Exiting=
 loop
           INIT_WORK(&assoc->del_work, nvmet_fc_delete_assoc);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/nvme/target/fc.c:1136:2: note: Loop condition is true.  Entering=
 loop body
           while (needrandom) {
           ^
   drivers/nvme/target/fc.c:1140:3: note: Calling 'spinlock_check'
                   spin_lock_irqsave(&tgtport->lock, flags);
                   ^
   include/linux/spinlock.h:379:24: note: expanded from macro 'spin_lock_ir=
qsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:242:34: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                                                  ^~~~
   include/linux/spinlock.h:324:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: Left side of '&&' is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:4: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
             ^
   drivers/rpmsg/rpmsg_ctrl.c:80:13: note: '?' condition is true
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
                      ^
   include/uapi/linux/rpmsg.h:29:32: note: expanded from macro 'RPMSG_CREAT=
E_EPT_IOCTL'
   #define RPMSG_CREATE_EPT_IOCTL  _IOW(0xb5, 0x1, struct rpmsg_endpoint_in=
fo)
                                   ^
   include/uapi/asm-generic/ioctl.h:87:57: note: expanded from macro '_IOW'
   #define _IOW(type,nr,size)      _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECH=
ECK(size)))
                                                                ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/rpmsg/rpmsg_ctrl.c:80:6: note: Assuming the condition is false
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:80:2: note: Taking false branch
           if (cmd !=3D RPMSG_CREATE_EPT_IOCTL)
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
rc'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
rc'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:83:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:83:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:88:13: note: Assigned value is garbage or und=
efined
           chinfo.src =3D eptinfo.src;
                      ^ ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/nvme/host/core.c:3957:3: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]
                   nvme_put_ns(ns);
                   ^
   drivers/nvme/host/core.c:4147:6: note: Assuming field 'state' is equal t=
o NVME_CTRL_LIVE
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:4147:6: note: Left side of '||' is false
   drivers/nvme/host/core.c:4147:39: note: Assuming field 'tagset' is non-n=
ull
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
                                                ^~~~~~~~~~~~~
   drivers/nvme/host/core.c:4147:2: note: Taking false branch
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
           ^
   drivers/nvme/host/core.c:4150:2: note: Taking false branch

vim +88 drivers/rpmsg/rpmsg_ctrl.c

617d32938d1be0 Arnaud Pouliquen 2022-01-24  71  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  72  static long rpmsg_ctrldev_i=
octl(struct file *fp, unsigned int cmd,
617d32938d1be0 Arnaud Pouliquen 2022-01-24  73  				unsigned long arg)
617d32938d1be0 Arnaud Pouliquen 2022-01-24  74  {
617d32938d1be0 Arnaud Pouliquen 2022-01-24  75  	struct rpmsg_ctrldev *ctrl=
dev =3D fp->private_data;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  76  	void __user *argp =3D (voi=
d __user *)arg;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  77  	struct rpmsg_endpoint_info=
 eptinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  78  	struct rpmsg_channel_info =
chinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  79  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  80  	if (cmd !=3D RPMSG_CREATE_=
EPT_IOCTL)
617d32938d1be0 Arnaud Pouliquen 2022-01-24  81  		return -EINVAL;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  82  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  83  	if (copy_from_user(&eptinf=
o, argp, sizeof(eptinfo)))
617d32938d1be0 Arnaud Pouliquen 2022-01-24  84  		return -EFAULT;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  85  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  86  	memcpy(chinfo.name, eptinf=
o.name, RPMSG_NAME_SIZE);
617d32938d1be0 Arnaud Pouliquen 2022-01-24  87  	chinfo.name[RPMSG_NAME_SIZ=
E - 1] =3D '\0';
617d32938d1be0 Arnaud Pouliquen 2022-01-24 @88  	chinfo.src =3D eptinfo.src;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  89  	chinfo.dst =3D eptinfo.dst;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  90  =

617d32938d1be0 Arnaud Pouliquen 2022-01-24  91  	return rpmsg_chrdev_eptdev=
_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
617d32938d1be0 Arnaud Pouliquen 2022-01-24  92  };
617d32938d1be0 Arnaud Pouliquen 2022-01-24  93  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1917397266797410636==--

