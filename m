Content-Type: multipart/mixed; boundary="===============0539952095749475419=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/v4l2-core/v4l2-ioctl.c:3308:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 29 Sep 2021 14:25:48 +0800
Message-ID: <202109291432.F0TORghF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0539952095749475419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4e6f95a891ac08bd09d62e3e6dae239b150f4c1
commit: 8dbcc3fa387c16abfc88a628cf528c439c91b332 media: v4l2: prepare compa=
t-ioctl rework
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20210927 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8dbcc3fa387c16abfc88a628cf528c439c91b332
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8dbcc3fa387c16abfc88a628cf528c439c91b332
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   include/uapi/asm-generic/ioctl.h:94:23: note: expanded from macro '_IOC_=
DIR'
   #define _IOC_DIR(nr)            (((nr) >> _IOC_DIRSHIFT) & _IOC_DIRMASK)
                                   ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3275:2: note: Taking true branch
           if (_IOC_DIR(cmd) !=3D _IOC_NONE) {
           ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3276:7: note: Assuming the conditio=
n is true
                   if (ioc_size <=3D sizeof(sbuf)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3276:3: note: Taking true branch
                   if (ioc_size <=3D sizeof(sbuf)) {
                   ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3286:9: note: Calling 'video_get_us=
er'
                   err =3D video_get_user((void __user *)arg, parg, cmd,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3121:6: note: Assuming the conditio=
n is false
           if (!(_IOC_DIR(cmd) & _IOC_WRITE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3121:2: note: Taking false branch
           if (!(_IOC_DIR(cmd) & _IOC_WRITE)) {
           ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3134:2: note: Taking false branch
           if (v4l2_is_known_ioctl(real_cmd)) {
           ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3142:6: note: 'cmd' is equal to 're=
al_cmd'
           if (cmd =3D=3D real_cmd) {
               ^~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3142:2: note: Taking true branch
           if (cmd =3D=3D real_cmd) {
           ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3143:7: note: Calling 'copy_from_us=
er'
                   if (copy_from_user(parg, (void __user *)arg, n))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking false branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3143:7: note: Returning from 'copy_=
from_user'
                   if (copy_from_user(parg, (void __user *)arg, n))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3143:3: note: Taking false branch
                   if (copy_from_user(parg, (void __user *)arg, n))
                   ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3182:7: note: 'err' is 0
           if (!err && n < _IOC_SIZE(real_cmd))
                ^~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3182:6: note: Left side of '&&' is =
true
           if (!err && n < _IOC_SIZE(real_cmd))
               ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3182:2: note: Taking false branch
           if (!err && n < _IOC_SIZE(real_cmd))
           ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3184:2: note: Returning zero (loade=
d from 'err'), which participates in a condition later
           return err;
           ^~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3286:9: note: Returning from 'video=
_get_user'
                   err =3D video_get_user((void __user *)arg, parg, cmd,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3288:7: note: 'err' is 0
                   if (err)
                       ^~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3288:3: note: Taking false branch
                   if (err)
                   ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3292:8: note: Calling 'check_array_=
args'
           err =3D check_array_args(cmd, parg, &array_size, &user_ptr, &ker=
nel_ptr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3032:2: note: Control jumps to 'cas=
e 3222820425:' @line 3071
           switch (cmd) {
           ^
   drivers/media/v4l2-core/v4l2-ioctl.c:3074:20: note: The left operand of =
'!=3D' is a garbage value
                   if (ctrls->count !=3D 0) {
                       ~~~~~~~~~~~~ ^
>> drivers/media/v4l2-core/v4l2-ioctl.c:3308:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3308:3: note: Value stored to 'err'=
 is never read
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/configfs/file.c:149:10: warning: Value stored to 'len' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           ssize_t len =3D min_t(size_t, count, PAGE_SIZE);
                   ^~~
   fs/configfs/file.c:149:10: note: Value stored to 'len' during its initia=
lization is never read
           ssize_t len =3D min_t(size_t, count, PAGE_SIZE);
                   ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/configfs/symlink.c:72:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(s,"../");
                   ^~~~~~
   fs/configfs/symlink.c:72:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(s,"../");
                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/i2c-core-smbus.c:101:2: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return (status < 0) ? status : data.byte;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-smbus.c:98:11: note: Calling 'i2c_smbus_xfer'
           status =3D i2c_smbus_xfer(client->adapter, client->addr, client-=
>flags,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/i2c/i2c-core-smbus.c:539:6: note: Assuming 'res' is not equal to=
 0
           if (res)
               ^~~
   drivers/i2c/i2c-core-smbus.c:539:2: note: Taking true branch
           if (res)
           ^
   drivers/i2c/i2c-core-smbus.c:540:3: note: Returning without writing to '=
data->byte'
                   return res;
                   ^
   drivers/i2c/i2c-core-smbus.c:98:11: note: Returning from 'i2c_smbus_xfer'
           status =3D i2c_smbus_xfer(client->adapter, client->addr, client-=
>flags,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/i2c/i2c-core-smbus.c:101:10: note: Assuming 'status' is >=3D 0
           return (status < 0) ? status : data.byte;
                   ^~~~~~~~~~
   drivers/i2c/i2c-core-smbus.c:101:9: note: '?' condition is false
           return (status < 0) ? status : data.byte;
                  ^
   drivers/i2c/i2c-core-smbus.c:101:2: note: Undefined or garbage value ret=
urned to caller
           return (status < 0) ? status : data.byte;

vim +/err +3308 drivers/media/v4l2-core/v4l2-ioctl.c

c8ef1a6076bfb98 drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2019-12-16  3257  =

fc0a80798576f80 drivers/media/video/v4l2-ioctl.c     Laurent Pinchart      =
2010-07-12  3258  long
c8ef1a6076bfb98 drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2019-12-16  3259  video_usercopy(struct file *file, unsigned int orig_cmd, =
unsigned long arg,
fc0a80798576f80 drivers/media/video/v4l2-ioctl.c     Laurent Pinchart      =
2010-07-12  3260  	       v4l2_kioctl func)
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3261  {
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3262  	char	sbuf[128];
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3263  	void    *mbuf =3D NULL;
1d94aa369da073a drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2010-04-06  3264  	void	*parg =3D (void *)arg;
069b747931f13ed drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-12-30  3265  	long	err  =3D -EINVAL;
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3266  	bool	has_array_args;
043f77edae8bd50 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2017-05-10  3267  	bool	always_copy =3D false;
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3268  	size_t  array_size =3D 0;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3269  	void __user *user_ptr =3D NULL;
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3270  	void	**kernel_ptr =3D NULL;
c8ef1a6076bfb98 drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2019-12-16  3271  	unsigned int cmd =3D video_translate_cmd(orig_cmd);
f8a695c4b43d02c drivers/media/v4l2-core/v4l2-ioctl.c Mauro Carvalho Chehab =
2018-03-26  3272  	const size_t ioc_size =3D _IOC_SIZE(cmd);
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3273  =

35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3274  	/*  Copy arguments into temp kernel buffer  */
337f9d205972bfe drivers/media/video/v4l2-ioctl.c     Trent Piepho          =
2009-03-04  3275  	if (_IOC_DIR(cmd) !=3D _IOC_NONE) {
f8a695c4b43d02c drivers/media/v4l2-core/v4l2-ioctl.c Mauro Carvalho Chehab =
2018-03-26  3276  		if (ioc_size <=3D sizeof(sbuf)) {
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3277  			parg =3D sbuf;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3278  		} else {
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3279  			/* too big to allocate from stack */
f8a695c4b43d02c drivers/media/v4l2-core/v4l2-ioctl.c Mauro Carvalho Chehab =
2018-03-26  3280  			mbuf =3D kvmalloc(ioc_size, GFP_KERNEL);
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3281  			if (NULL =3D=3D mbuf)
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3282  				return -ENOMEM;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3283  			parg =3D mbuf;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3284  		}
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3285  =

8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3286  		err =3D video_get_user((void __user *)arg, parg, cmd,
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3287  				     orig_cmd, &always_copy);
c8ef1a6076bfb98 drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2019-12-16  3288  		if (err)
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3289  			goto out;
1dc8b65c944e5cf drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-01-08  3290  	}
19c96e4b7d3c800 drivers/media/video/v4l2-ioctl.c     Trent Piepho          =
2009-03-04  3291  =

d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3292  	err =3D check_array_args(cmd, parg, &array_size, &user_p=
tr, &kernel_ptr);
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3293  	if (err < 0)
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3294  		goto out;
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3295  	has_array_args =3D err;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3296  =

d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3297  	if (has_array_args) {
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3298  		/*
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3299  		 * When adding new types of array args, make sure that =
the
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3300  		 * parent argument to ioctl (which contains the pointer=
 to the
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3301  		 * array) fits into sbuf (so that mbuf will still remain
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3302  		 * unused up to here).
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3303  		 */
758d90e161382c1 drivers/media/v4l2-core/v4l2-ioctl.c Tomasz Figa           =
2017-06-19  3304  		mbuf =3D kvmalloc(array_size, GFP_KERNEL);
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3305  		err =3D -ENOMEM;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3306  		if (NULL =3D=3D mbuf)
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3307  			goto out_array_args;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20 @3308  		err =3D -EFAULT;
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3309  		if (in_compat_syscall())
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3310  			err =3D v4l2_compat_get_array_args(file, mbuf, user_pt=
r,
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3311  							 array_size, orig_cmd,
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3312  							 parg);
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3313  		else
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3314  			err =3D copy_from_user(mbuf, user_ptr, array_size) ?
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3315  								-EFAULT : 0;
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3316  		if (err)
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3317  			goto out_array_args;
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3318  		*kernel_ptr =3D mbuf;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3319  	}
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3320  =

35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3321  	/* Handles IOCTL */
fc0a80798576f80 drivers/media/video/v4l2-ioctl.c     Laurent Pinchart      =
2010-07-12  3322  	err =3D func(file, cmd, parg);
181a4a2d5a0a7b4 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2018-01-30  3323  	if (err =3D=3D -ENOTTY || err =3D=3D -ENOIOCTLCMD) {
02bbb814d8db7b6 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2012-02-08  3324  		err =3D -ENOTTY;
181a4a2d5a0a7b4 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2018-01-30  3325  		goto out;
181a4a2d5a0a7b4 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2018-01-30  3326  	}
181a4a2d5a0a7b4 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2018-01-30  3327  =

aa32f4c0bcce7da drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2013-12-16  3328  	if (err =3D=3D 0) {
aa32f4c0bcce7da drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2013-12-16  3329  		if (cmd =3D=3D VIDIOC_DQBUF)
aa32f4c0bcce7da drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2013-12-16  3330  			trace_v4l2_dqbuf(video_devdata(file)->minor, parg);
aa32f4c0bcce7da drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2013-12-16  3331  		else if (cmd =3D=3D VIDIOC_QBUF)
aa32f4c0bcce7da drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2013-12-16  3332  			trace_v4l2_qbuf(video_devdata(file)->minor, parg);
aa32f4c0bcce7da drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2013-12-16  3333  	}
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3334  =

d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3335  	if (has_array_args) {
ba2d35c14b6fc55 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2014-03-17  3336  		*kernel_ptr =3D (void __force *)user_ptr;
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3337  		if (in_compat_syscall()) {
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3338  			int put_err;
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3339  =

8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3340  			put_err =3D v4l2_compat_put_array_args(file, user_ptr,=
 mbuf,
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3341  							     array_size, orig_cmd,
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3342  							     parg);
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3343  			if (put_err)
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3344  				err =3D put_err;
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3345  		} else if (copy_to_user(user_ptr, mbuf, array_size)) {
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3346  			err =3D -EFAULT;
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3347  		}
d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3348  		goto out_array_args;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3349  	}
043f77edae8bd50 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2017-05-10  3350  	/*
043f77edae8bd50 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2017-05-10  3351  	 * Some ioctls can return an error, but still have valid
043f77edae8bd50 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2017-05-10  3352  	 * results that must be returned.
043f77edae8bd50 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2017-05-10  3353  	 */
043f77edae8bd50 drivers/media/v4l2-core/v4l2-ioctl.c Hans Verkuil          =
2017-05-10  3354  	if (err < 0 && !always_copy)
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3355  		goto out;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3356  =

d14e6d76ebf740f drivers/media/video/v4l2-ioctl.c     Pawel Osciak          =
2010-12-23  3357  out_array_args:
8dbcc3fa387c16a drivers/media/v4l2-core/v4l2-ioctl.c Arnd Bergmann         =
2020-10-30  3358  	if (video_put_user((void __user *)arg, parg, cmd, orig_c=
md))
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3359  		err =3D -EFAULT;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3360  out:
758d90e161382c1 drivers/media/v4l2-core/v4l2-ioctl.c Tomasz Figa           =
2017-06-19  3361  	kvfree(mbuf);
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3362  	return err;
35ea11ff84719b1 drivers/media/video/v4l2-ioctl.c     Hans Verkuil          =
2008-07-20  3363  }
fc0a80798576f80 drivers/media/video/v4l2-ioctl.c     Laurent Pinchart      =
2010-07-12  3364  =


:::::: The code@line 3308 was first introduced by commit
:::::: 35ea11ff84719b1bfab2909903a9640a86552fd1 V4L/DVB (8430): videodev: m=
ove some functions from v4l2-dev.h to v4l2-common.h or v4l2-ioctl.h

:::::: TO: Hans Verkuil <hverkuil@xs4all.nl>
:::::: CC: Mauro Carvalho Chehab <mchehab@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0539952095749475419==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0539952095749475419==--

