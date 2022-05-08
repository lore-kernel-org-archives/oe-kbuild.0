Content-Type: multipart/mixed; boundary="===============0752930636179720207=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rpmsg/rpmsg_ctrl.c:88:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 08 May 2022 17:58:29 +0800
Message-ID: <202205081701.gRKOwqUq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0752930636179720207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 617d32938d1be0d67bad73a914635bf787c319c1 rpmsg: Move the rpmsg cont=
rol device from rpmsg_char to rpmsg_ctrl
date:   8 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 weeks ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205081701.gRKOwqUq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D617d32938d1be0d67bad73a914635bf787c319c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 617d32938d1be0d67bad73a914635bf787c319c1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   8 warnings generated.
   drivers/media/i2c/ov2659.c:895:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:895:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:986:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:986:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1002:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1002:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1028:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1028:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1151:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1151:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1160:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1160:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D ov2659->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1312:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov2659.c:1312:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/spi/spi-tegra210-quad.c:1167:3: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1167:3: note: Value stored to 'err' is n=
ever read
                   err =3D tegra_qspi_start_dma_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1169:3: warning: Value stored to 'err' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra210-quad.c:1169:3: note: Value stored to 'err' is n=
ever read
                   err =3D tegra_qspi_start_cpu_based_transfer(tqspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/spi/spi-tegra20-slink.c:952:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_slink_start_dma_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:952:3: note: Value stored to 'err' is ne=
ver read
                   err =3D tegra_slink_start_dma_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:954:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_slink_start_cpu_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:954:3: note: Value stored to 'err' is ne=
ver read
                   err =3D tegra_slink_start_cpu_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/trace/trace.c:361:2: warning: Access to field 'next' results in a=
 dereference of a null pointer [clang-analyzer-core.NullDereference]
           rcu_assign_pointer(*p, (*p)->next);
           ^
   include/linux/rcupdate.h:449:35: note: expanded from macro 'rcu_assign_p=
ointer'
           uintptr_t _r_a_p__v =3D (uintptr_t)(v);                         =
        \
                                            ^
   kernel/trace/trace.c:404:2: note: Value assigned to 'ftrace_exports_list'
           mutex_lock(&ftrace_export_lock);

vim +88 drivers/rpmsg/rpmsg_ctrl.c

617d32938d1be0d Arnaud Pouliquen 2022-01-24  71  =

617d32938d1be0d Arnaud Pouliquen 2022-01-24  72  static long rpmsg_ctrldev_=
ioctl(struct file *fp, unsigned int cmd,
617d32938d1be0d Arnaud Pouliquen 2022-01-24  73  				unsigned long arg)
617d32938d1be0d Arnaud Pouliquen 2022-01-24  74  {
617d32938d1be0d Arnaud Pouliquen 2022-01-24  75  	struct rpmsg_ctrldev *ctr=
ldev =3D fp->private_data;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  76  	void __user *argp =3D (vo=
id __user *)arg;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  77  	struct rpmsg_endpoint_inf=
o eptinfo;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  78  	struct rpmsg_channel_info=
 chinfo;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  79  =

617d32938d1be0d Arnaud Pouliquen 2022-01-24  80  	if (cmd !=3D RPMSG_CREATE=
_EPT_IOCTL)
617d32938d1be0d Arnaud Pouliquen 2022-01-24  81  		return -EINVAL;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  82  =

617d32938d1be0d Arnaud Pouliquen 2022-01-24  83  	if (copy_from_user(&eptin=
fo, argp, sizeof(eptinfo)))
617d32938d1be0d Arnaud Pouliquen 2022-01-24  84  		return -EFAULT;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  85  =

617d32938d1be0d Arnaud Pouliquen 2022-01-24  86  	memcpy(chinfo.name, eptin=
fo.name, RPMSG_NAME_SIZE);
617d32938d1be0d Arnaud Pouliquen 2022-01-24  87  	chinfo.name[RPMSG_NAME_SI=
ZE - 1] =3D '\0';
617d32938d1be0d Arnaud Pouliquen 2022-01-24 @88  	chinfo.src =3D eptinfo.sr=
c;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  89  	chinfo.dst =3D eptinfo.ds=
t;
617d32938d1be0d Arnaud Pouliquen 2022-01-24  90  =

617d32938d1be0d Arnaud Pouliquen 2022-01-24  91  	return rpmsg_chrdev_eptde=
v_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
617d32938d1be0d Arnaud Pouliquen 2022-01-24  92  };
617d32938d1be0d Arnaud Pouliquen 2022-01-24  93  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0752930636179720207==--

