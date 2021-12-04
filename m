Content-Type: multipart/mixed; boundary="===============8240812734785077463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:randconfig-5.16-min 150/191] drivers/video/fbdev/core/fb_device.c:89:3: warning: Value stored to 'dst' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 04 Dec 2021 23:07:48 +0800
Message-ID: <202112042308.iTnjmJna-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8240812734785077463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-5.16-min
head:   7a16665b8fd19f170c0c15f1432c90e4750183f2
commit: afe2d6eb5b95934595688e04a31c657cce11c01b [150/191] fbdev: move chrd=
ev code into fb_device.c
:::::: branch date: 4 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-c001-20211202 (https://download.01.org/0day-ci/arch=
ive/20211204/202112042308.iTnjmJna-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.g=
it/commit/?id=3Dafe2d6eb5b95934595688e04a31c657cce11c01b
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux=
/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-5.16-min
        git checkout afe2d6eb5b95934595688e04a31c657cce11c01b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/hid.h:1007:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/async.c:125:2: warning: Value stored to 'calltime' is never read =
[clang-analyzer-deadcode.DeadStores]
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   kernel/async.c:125:2: note: Value stored to 'calltime' is never read
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   kernel/async.c:275:2: warning: Value stored to 'starttime' is never read=
 [clang-analyzer-deadcode.DeadStores]
           starttime =3D ktime_get();
           ^           ~~~~~~~~~~~
   kernel/async.c:275:2: note: Value stored to 'starttime' is never read
           starttime =3D ktime_get();
           ^           ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/comedi/drivers/pcmmio.c:578:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val |=3D inb(iobase + PCMMIO_AI_MSB_REG) << 8;
           ^
   drivers/comedi/drivers/pcmmio.c:578:2: note: Value stored to 'val' is ne=
ver read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/core/fbcvt.c:261:4: warning: Value stored to 'cnt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:261:4: note: Value stored to 'cnt' is n=
ever read
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: warning: Value stored to 'offset=
' is never read [clang-analyzer-deadcode.DeadStores]
                           offset +=3D read;
                           ^         ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: note: Value stored to 'offset' i=
s never read
                           offset +=3D read;
                           ^         ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/video/fbdev/core/fb_device.c:89:3: warning: Value stored to 'dst=
' is never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fb_device.c:89:3: note: Value stored to 'dst' i=
s never read
                   dst +=3D c;
                   ^      ~
>> drivers/video/fbdev/core/fb_device.c:167:3: warning: Value stored to 'sr=
c' is never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fb_device.c:167:3: note: Value stored to 'src' =
is never read
                   src +=3D c;
                   ^      ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/core/fbcon.c:2828:4: warning: Value stored to 'pendi=
ng' is never read [clang-analyzer-deadcode.DeadStores]
                           pending =3D cancel_work_sync(&info->queue);
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcon.c:2828:4: note: Value stored to 'pending'=
 is never read
                           pending =3D cancel_work_sync(&info->queue);
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   block/badblocks.c:68:3: warning: Value stored to 'sectors' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:68:3: note: Value stored to 'sectors' is never read
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:348:3: warning: Value stored to 'sectors' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:348:3: note: Value stored to 'sectors' is never read
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   block/partitions/amiga.c:118:19: warning: The left operand of '<' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (dostype[3] < ' ')
                               ~~~~~~~~~~ ^
   block/partitions/amiga.c:38:2: note: Loop condition is true.  Entering l=
oop body
           for (blk =3D 0; ; blk++, put_dev_sector(sect)) {
           ^
   block/partitions/amiga.c:39:7: note: 'blk' is not equal to RDB_ALLOCATIO=
N_LIMIT
                   if (blk =3D=3D RDB_ALLOCATION_LIMIT)
                       ^~~
   block/partitions/amiga.c:39:3: note: Taking false branch
                   if (blk =3D=3D RDB_ALLOCATION_LIMIT)
                   ^
   block/partitions/amiga.c:42:7: note: Assuming 'data' is non-null
                   if (!data) {
                       ^~~~~
   block/partitions/amiga.c:42:3: note: Taking false branch
                   if (!data) {
                   ^
   block/partitions/amiga.c:48:7: note: Assuming the condition is false
                   if (*(__be32 *)data !=3D cpu_to_be32(IDNAME_RIGIDDISK))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/amiga.c:48:3: note: Taking false branch
                   if (*(__be32 *)data !=3D cpu_to_be32(IDNAME_RIGIDDISK))
                   ^
   block/partitions/amiga.c:52:7: note: Assuming the condition is true
                   if (checksum_block((__be32 *)data, be32_to_cpu(rdb->rdb_=
SummedLongs) & 0x7F) =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/amiga.c:52:3: note: Taking true branch
                   if (checksum_block((__be32 *)data, be32_to_cpu(rdb->rdb_=
SummedLongs) & 0x7F) =3D=3D 0)
                   ^
   block/partitions/amiga.c:53:4: note:  Execution continues on line 70
                           break;
                           ^
   block/partitions/amiga.c:81:17: note: Assuming 'blk' is > 0
           for (part =3D 1; blk>0 && part<=3D16; part++, put_dev_sector(sec=
t)) {
                          ^~~~~
   block/partitions/amiga.c:81:17: note: Left side of '&&' is true
   block/partitions/amiga.c:81:2: note: Loop condition is true.  Entering l=
oop body
           for (part =3D 1; blk>0 && part<=3D16; part++, put_dev_sector(sec=
t)) {
           ^
   block/partitions/amiga.c:84:7: note: Assuming 'data' is non-null
                   if (!data) {
                       ^~~~~
   block/partitions/amiga.c:84:3: note: Taking false branch
                   if (!data) {
                   ^
   block/partitions/amiga.c:92:7: note: Assuming the condition is false

vim +/dst +89 drivers/video/fbdev/core/fb_device.c

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   41  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   42  static ssize_t
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   43  fb_read(struct file *file, ch=
ar __user *buf, size_t count, loff_t *ppos)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   44  {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   45  	unsigned long p =3D *ppos;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   46  	struct fb_info *info =3D fil=
e_fb_info(file);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   47  	u8 *buffer, *dst;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   48  	u8 __iomem *src;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   49  	int c, cnt =3D 0, err =3D 0;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   50  	unsigned long total_size;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   51  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   52  	if (!info || ! info->screen_=
base)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   53  		return -ENODEV;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   54  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   55  	if (info->state !=3D FBINFO_=
STATE_RUNNING)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   56  		return -EPERM;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   57  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   58  	if (info->fbops->fb_read)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   59  		return info->fbops->fb_read=
(info, buf, count, ppos);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   60  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   61  	total_size =3D info->screen_=
size;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   62  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   63  	if (total_size =3D=3D 0)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   64  		total_size =3D info->fix.sm=
em_len;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   65  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   66  	if (p >=3D total_size)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   67  		return 0;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   68  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   69  	if (count >=3D total_size)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   70  		count =3D total_size;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   71  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   72  	if (count + p > total_size)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   73  		count =3D total_size - p;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   74  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   75  	buffer =3D kmalloc((count > =
PAGE_SIZE) ? PAGE_SIZE : count,
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   76  			 GFP_KERNEL);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   77  	if (!buffer)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   78  		return -ENOMEM;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   79  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   80  	src =3D (u8 __iomem *) (info=
->screen_base + p);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   81  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   82  	if (info->fbops->fb_sync)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   83  		info->fbops->fb_sync(info);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   84  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   85  	while (count) {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   86  		c  =3D (count > PAGE_SIZE) =
? PAGE_SIZE : count;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   87  		dst =3D buffer;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   88  		fb_memcpy_fromfb(dst, src, =
c);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  @89  		dst +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   90  		src +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   91  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28   92  		if (copy_to_user(buf, buffe=
r, c)) {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   93  			err =3D -EFAULT;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   94  			break;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   95  		}
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   96  		*ppos +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   97  		buf +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   98  		cnt +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28   99  		count -=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  100  	}
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  101  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  102  	kfree(buffer);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  103  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  104  	return (err) ? err : cnt;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  105  }
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  106  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  107  static ssize_t
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  108  fb_write(struct file *file, c=
onst char __user *buf, size_t count, loff_t *ppos)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  109  {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  110  	unsigned long p =3D *ppos;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  111  	struct fb_info *info =3D fil=
e_fb_info(file);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  112  	u8 *buffer, *src;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  113  	u8 __iomem *dst;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  114  	int c, cnt =3D 0, err =3D 0;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  115  	unsigned long total_size;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  116  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  117  	if (!info || !info->screen_b=
ase)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  118  		return -ENODEV;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  119  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  120  	if (info->state !=3D FBINFO_=
STATE_RUNNING)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  121  		return -EPERM;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  122  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  123  	if (info->fbops->fb_write)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  124  		return info->fbops->fb_writ=
e(info, buf, count, ppos);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  125  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  126  	total_size =3D info->screen_=
size;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  127  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  128  	if (total_size =3D=3D 0)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  129  		total_size =3D info->fix.sm=
em_len;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  130  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  131  	if (p > total_size)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  132  		return -EFBIG;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  133  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  134  	if (count > total_size) {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  135  		err =3D -EFBIG;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  136  		count =3D total_size;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  137  	}
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  138  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  139  	if (count + p > total_size) {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  140  		if (!err)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  141  			err =3D -ENOSPC;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  142  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  143  		count =3D total_size - p;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  144  	}
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  145  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  146  	buffer =3D kmalloc((count > =
PAGE_SIZE) ? PAGE_SIZE : count,
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  147  			 GFP_KERNEL);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  148  	if (!buffer)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  149  		return -ENOMEM;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  150  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  151  	dst =3D (u8 __iomem *) (info=
->screen_base + p);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  152  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  153  	if (info->fbops->fb_sync)
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  154  		info->fbops->fb_sync(info);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  155  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  156  	while (count) {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  157  		c =3D (count > PAGE_SIZE) ?=
 PAGE_SIZE : count;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  158  		src =3D buffer;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  159  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  160  		if (copy_from_user(src, buf=
, c)) {
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  161  			err =3D -EFAULT;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  162  			break;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  163  		}
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  164  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  165  		fb_memcpy_tofb(dst, src, c);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  166  		dst +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28 @167  		src +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  168  		*ppos +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  169  		buf +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  170  		cnt +=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  171  		count -=3D c;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  172  	}
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  173  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  174  	kfree(buffer);
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  175  =

afe2d6eb5b9593 Arnd Bergmann 2021-10-28  176  	return (cnt) ? cnt : err;
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  177  }
afe2d6eb5b9593 Arnd Bergmann 2021-10-28  178  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8240812734785077463==--

