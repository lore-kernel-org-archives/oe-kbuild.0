Content-Type: multipart/mixed; boundary="===============6533766577063060265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:freeze-5.18 5/12] drivers/scsi/sr.c:486:23: warning: Although the value stored to 'cd' is used in the enclosing expression, the value is never actually read from 'cd' [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Feb 2022 22:40:00 +0800
Message-ID: <202202222219.UaX3FsHz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6533766577063060265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git freeze-5.18
head:   160aadf96a0cc9afd4b49f9a097e23494f7f33b6
commit: 511f348c57ee61fe305de34c2860a6663175c3cc [5/12] sr: implement ->fre=
e_disk
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
222/202202222219.UaX3FsHz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block freeze-5.18
        git checkout 511f348c57ee61fe305de34c2860a6663175c3cc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/base/cacheinfo.c:241:3: note: Taking false branch
                   if (!cpumask_empty(&this_leaf->shared_cpu_map))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/base/cacheinfo.c:245:3: note: Loop condition is true.  Entering =
loop body
                   for_each_online_cpu(i) {
                   ^
   include/linux/cpumask.h:815:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:248:8: note: 'i' is not equal to 'cpu'
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/base/cacheinfo.c:248:8: note: Left side of '||' is false
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   drivers/base/cacheinfo.c:248:20: note: Assuming field 'info_list' is null
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/base/cacheinfo.c:248:4: note: '?' condition is false
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/base/cacheinfo.c:248:8: note: 'i' is not equal to 'cpu'
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/base/cacheinfo.c:248:8: note: Left side of '||' is false
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   drivers/base/cacheinfo.c:248:4: note: '?' condition is true
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/base/cacheinfo.c:248:4: note: Taking true branch
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/base/cacheinfo.c:249:5: note:  Execution continues on line 245
                                   continue;/* skip if itself or no cachein=
fo */
                                   ^
   drivers/base/cacheinfo.c:245:3: note: Loop condition is false. Execution=
 continues on line 257
                   for_each_online_cpu(i) {
                   ^
   include/linux/cpumask.h:815:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:257:7: note: Access to field 'coherency_line_si=
ze' results in a dereference of a null pointer (loaded from variable 'this_=
leaf')
                   if (this_leaf->coherency_line_size > coherency_max_size)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   1 warning generated.
>> drivers/scsi/sr.c:486:23: warning: Although the value stored to 'cd' is =
used in the enclosing expression, the value is never actually read from 'cd=
' [clang-analyzer-deadcode.DeadStores]
           struct scsi_cd *cd =3D cd =3D scsi_cd(bdev->bd_disk);
                                ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/sr.c:486:23: note: Although the value stored to 'cd' is use=
d in the enclosing expression, the value is never actually read from 'cd'
           struct scsi_cd *cd =3D cd =3D scsi_cd(bdev->bd_disk);
                                ^    ~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/nvme/host/core.c:3957:3: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]
                   nvme_put_ns(ns);
                   ^
   drivers/nvme/host/core.c:4147:6: note: Assuming field 'state' is equal t=
o NVME_CTRL_LIVE
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:4147:6: note: Left side of '||' is false
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
               ^
   drivers/nvme/host/core.c:4147:39: note: Assuming field 'tagset' is non-n=
ull
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
                                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/core.c:4147:2: note: '?' condition is false
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:4147:12: note: Field 'state' is equal to NVME_C=
TRL_LIVE
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
                     ^
   drivers/nvme/host/core.c:4147:6: note: Left side of '||' is false
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
               ^
   drivers/nvme/host/core.c:4147:46: note: Field 'tagset' is non-null
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
                                                       ^
   drivers/nvme/host/core.c:4147:2: note: '?' condition is false
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:4147:2: note: Taking false branch
           if (ctrl->state !=3D NVME_CTRL_LIVE || !ctrl->tagset)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/core.c:4150:2: note: '?' condition is false
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/core.c:4150:2: note: Assuming the condition is false
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
           ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/nvme/host/core.c:4150:2: note: '?' condition is false
           if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events=
)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/core.c:4150:2: note: Taking false branch

vim +486 drivers/scsi/sr.c

38a2b557e23874 Christoph Hellwig 2020-09-08  483  =

40cc51be699e37 Al Viro           2008-03-02  484  static int sr_block_open(=
struct block_device *bdev, fmode_t mode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  485  {
511f348c57ee61 Christoph Hellwig 2022-02-18 @486  	struct scsi_cd *cd =3D c=
d =3D scsi_cd(bdev->bd_disk);
511f348c57ee61 Christoph Hellwig 2022-02-18  487  	struct scsi_device *sdev=
 =3D cd->device;
40cc51be699e37 Al Viro           2008-03-02  488  	int ret =3D -ENXIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  489  =

511f348c57ee61 Christoph Hellwig 2022-02-18  490  	if (scsi_device_get(cd->=
device))
511f348c57ee61 Christoph Hellwig 2022-02-18  491  		return -ENXIO;
1214fd7b497400 Bart Van Assche   2018-08-02  492  =

1214fd7b497400 Bart Van Assche   2018-08-02  493  	scsi_autopm_get_device(s=
dev);
afd35c4f573d7e Christoph Hellwig 2020-09-08  494  	if (bdev_check_media_cha=
nge(bdev))
38a2b557e23874 Christoph Hellwig 2020-09-08  495  		sr_revalidate_disk(cd);
2bbea6e117357d Maurizio Lombardi 2018-03-09  496  =

51a858817dcdbb Merlijn Wajer     2020-02-18  497  	mutex_lock(&cd->lock);
40cc51be699e37 Al Viro           2008-03-02  498  	ret =3D cdrom_open(&cd->=
cdi, bdev, mode);
51a858817dcdbb Merlijn Wajer     2020-02-18  499  	mutex_unlock(&cd->lock);
1214fd7b497400 Bart Van Assche   2018-08-02  500  =

1214fd7b497400 Bart Van Assche   2018-08-02  501  	scsi_autopm_put_device(s=
dev);
40cc51be699e37 Al Viro           2008-03-02  502  	if (ret)
511f348c57ee61 Christoph Hellwig 2022-02-18  503  		scsi_device_put(cd->dev=
ice);
^1da177e4c3f41 Linus Torvalds    2005-04-16  504  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  505  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  506  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6533766577063060265==--

