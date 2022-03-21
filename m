Content-Type: multipart/mixed; boundary="===============6410849684268517214=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [amir73il:fsnotify-volatile 8/9] fs/notify/fanotify/fanotify_user.c:1202:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 21 Mar 2022 12:44:26 +0800
Message-ID: <202203211233.Vk5Tdqt8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6410849684268517214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fsnotify-volatile
head:   20c431f640f13d125fa3d80fde9ae4a28892a029
commit: 068909e55d92d27d6c7e5688b4689235707613ba [8/9] fanotify: factor out=
 helper fanotify_mark_update_flags()
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20321/202203211233.Vk5Tdqt8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/068909e55d92d27d6c7e5688=
b4689235707613ba
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il fsnotify-volatile
        git checkout 068909e55d92d27d6c7e5688b4689235707613ba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/notify/fanotify/fanotify_user.c:422:23: warning: Access to field 'typ=
e' results in a dereference of a null pointer (loaded from variable 'fh') [=
clang-analyzer-core.NullDereference]
           handle.handle_type =3D fh->type;
                                ^~
   fs/notify/fanotify/fanotify_user.c:381:18: note: Assuming 'fh' is null
           size_t fh_len =3D fh ? fh->len : 0;
                           ^~
   fs/notify/fanotify/fanotify_user.c:381:18: note: '?' condition is false
   fs/notify/fanotify/fanotify_user.c:385:2: note: Taking false branch
           pr_debug("%s: fh_len=3D%zu name_len=3D%zu, info_len=3D%zu, count=
=3D%zu\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/notify/fanotify/fanotify_user.c:388:19: note: Left side of '||' is fa=
lse
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
                            ^
   fs/notify/fanotify/fanotify_user.c:388:41: note: Assuming 'len' is <=3D =
'count'
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
                                                  ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:388:6: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/notify/fanotify/fanotify_user.c:388:2: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
           ^
   fs/notify/fanotify/fanotify_user.c:395:2: note: Control jumps to 'case 3=
:'  at line 397
           switch (info_type) {
           ^
   fs/notify/fanotify/fanotify_user.c:398:7: note: Taking false branch
                   if (WARN_ON_ONCE(name_len))
                       ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/notify/fanotify/fanotify_user.c:398:3: note: Taking false branch
                   if (WARN_ON_ONCE(name_len))
                   ^
   fs/notify/fanotify/fanotify_user.c:400:3: note:  Execution continues on =
line 411
                   break;
                   ^
   fs/notify/fanotify/fanotify_user.c:414:6: note: Calling 'copy_to_user'
           if (copy_to_user(buf, &info, sizeof(info)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:199:6: note: Assuming the condition is false
           if (likely(check_copy_size(from, n, true)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:199:2: note: Taking true branch
           if (likely(check_copy_size(from, n, true)))
           ^
   include/linux/uaccess.h:201:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   fs/notify/fanotify/fanotify_user.c:414:6: note: Returning from 'copy_to_=
user'
           if (copy_to_user(buf, &info, sizeof(info)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:414:6: note: Assuming the condition i=
s false
           if (copy_to_user(buf, &info, sizeof(info)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:414:2: note: Taking false branch
           if (copy_to_user(buf, &info, sizeof(info)))
           ^
   fs/notify/fanotify/fanotify_user.c:419:6: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(handle)))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/notify/fanotify/fanotify_user.c:419:2: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(handle)))
           ^
   fs/notify/fanotify/fanotify_user.c:422:23: note: Access to field 'type' =
results in a dereference of a null pointer (loaded from variable 'fh')
           handle.handle_type =3D fh->type;
                                ^~
   fs/notify/fanotify/fanotify_user.c:609:3: warning: Value stored to 'buf'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   buf +=3D ret;
                   ^      ~~~
   fs/notify/fanotify/fanotify_user.c:609:3: note: Value stored to 'buf' is=
 never read
                   buf +=3D ret;
                   ^      ~~~
   fs/notify/fanotify/fanotify_user.c:610:3: warning: Value stored to 'coun=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   count -=3D ret;
                   ^        ~~~
   fs/notify/fanotify/fanotify_user.c:610:3: note: Value stored to 'count' =
is never read
                   count -=3D ret;
                   ^        ~~~
>> fs/notify/fanotify/fanotify_user.c:1202:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/notify/fanotify/fanotify_user.c:1202:2: note: Value stored to 'ret' i=
s never read
           ret =3D 0;
           ^     ~
   fs/notify/fanotify/fanotify_user.c:1693:14: warning: Access to field 'i_=
mode' results in a dereference of a null pointer (loaded from variable 'ino=
de') [clang-analyzer-core.NullDereference]
           if (mnt || !S_ISDIR(inode->i_mode)) {
                       ^
   include/uapi/linux/stat.h:23:22: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                             ^
   fs/notify/fanotify/fanotify_user.c:1741:1: note: Calling '__se_sys_fanot=
ify_mark'
   SYSCALL_DEFINE5(fanotify_mark, int, fanotify_fd, unsigned int, flags,
   ^
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
   #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:231:2: note: expanded from macro =
'__SYSCALL_DEFINEx'
           __X64_SYS_STUBx(x, name, __VA_ARGS__)                           \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:97:2: note: expanded from macro '=
__X64_SYS_STUBx'
           __SYS_STUBx(x64, sys##name,                                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/notify/fanotify/fanotify_user.c:1741:1: note: Calling '__do_sys_fanot=
ify_mark'
   SYSCALL_DEFINE5(fanotify_mark, int, fanotify_fd, unsigned int, flags,
   ^
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
   #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:235:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/notify/fanotify/fanotify_user.c:1745:9: note: Calling 'do_fanotify_ma=
rk'
           return do_fanotify_mark(fanotify_fd, flags, mask, dfd, pathname);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1537:2: note: 'inode' initialized to =
a null pointer value
           struct inode *inode =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1550:2: note: Taking false branch
           pr_debug("%s: fanotify_fd=3D%d flags=3D%x dfd=3D%d pathname=3D%p=
 mask=3D%llx\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/notify/fanotify/fanotify_user.c:1554:6: note: Assuming the condition =
is false
           if (upper_32_bits(mask))
               ^
   include/linux/kernel.h:74:27: note: expanded from macro 'upper_32_bits'
   #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
                             ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1554:2: note: Taking false branch
           if (upper_32_bits(mask))
           ^
   fs/notify/fanotify/fanotify_user.c:1557:6: note: Assuming the condition =
is false
           if (flags & ~FANOTIFY_MARK_FLAGS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1557:2: note: Taking false branch
           if (flags & ~FANOTIFY_MARK_FLAGS)
           ^
   fs/notify/fanotify/fanotify_user.c:1560:2: note: Control jumps to 'case =
16:'  at line 1564
           switch (mark_type) {
           ^
   fs/notify/fanotify/fanotify_user.c:1566:3: note:  Execution continues on=
 line 1574
                   break;
                   ^
   fs/notify/fanotify/fanotify_user.c:1574:2: note: Control jumps to 'case =
128:'  at line 1580
           switch (flags & (FAN_MARK_ADD | FAN_MARK_REMOVE | FAN_MARK_FLUSH=
)) {
           ^
   fs/notify/fanotify/fanotify_user.c:1581:7: note: Assuming the condition =
is false
                   if (flags & ~(FANOTIFY_MARK_TYPE_BITS | FAN_MARK_FLUSH))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1581:3: note: Taking false branch
                   if (flags & ~(FANOTIFY_MARK_TYPE_BITS | FAN_MARK_FLUSH))
                   ^
   fs/notify/fanotify/fanotify_user.c:1583:3: note:  Execution continues on=
 line 1588
                   break;
                   ^
   fs/notify/fanotify/fanotify_user.c:1588:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_FANOTIFY_ACCESS_PERMISSIONS))
           ^
   fs/notify/fanotify/fanotify_user.c:1591:6: note: Assuming the condition =
is false
           if (mask & ~valid_mask)
               ^~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1591:2: note: Taking false branch
           if (mask & ~valid_mask)
           ^

vim +/ret +1202 fs/notify/fanotify/fanotify_user.c

5e9c070ca08543 Lino Sanfilippo         2013-07-08  1178  =

eaa2c6b0c9181c Amir Goldstein          2018-06-23  1179  static int fanotif=
y_add_mark(struct fsnotify_group *group,
ad69cd9972e79a Amir Goldstein          2021-11-29  1180  			     fsnotify_c=
onnp_t *connp, unsigned int obj_type,
77115225acc67d Amir Goldstein          2019-01-10  1181  			     __u32 mask=
, unsigned int flags,
77115225acc67d Amir Goldstein          2019-01-10  1182  			     __kernel_f=
sid_t *fsid)
2a3edf86040a7e Eric Paris              2009-12-17  1183  {
40822e8f3f162d Amir Goldstein          2022-03-20  1184  	struct fsnotify_m=
ark *fsn_mark =3D NULL;
40822e8f3f162d Amir Goldstein          2022-03-20  1185  	void *prealloc_co=
nn =3D NULL, *prealloc_mark =3D NULL;
40822e8f3f162d Amir Goldstein          2022-03-20  1186  	int ret =3D -ENOM=
EM;
40822e8f3f162d Amir Goldstein          2022-03-20  1187  =

40822e8f3f162d Amir Goldstein          2022-03-20  1188  	fsn_mark =3D fsno=
tify_find_mark(connp, group);
40822e8f3f162d Amir Goldstein          2022-03-20  1189  	/* Preallocate ne=
w mark and connector outside of group lock */
40822e8f3f162d Amir Goldstein          2022-03-20  1190  	if (!fsn_mark) {
40822e8f3f162d Amir Goldstein          2022-03-20  1191  		prealloc_conn =
=3D fsnotify_conn_alloc(GFP_KERNEL);
40822e8f3f162d Amir Goldstein          2022-03-20  1192  		if (!prealloc_co=
nn)
40822e8f3f162d Amir Goldstein          2022-03-20  1193  			goto out;
40822e8f3f162d Amir Goldstein          2022-03-20  1194  =

40822e8f3f162d Amir Goldstein          2022-03-20  1195  		prealloc_mark =
=3D kmem_cache_alloc(fanotify_mark_cache,
40822e8f3f162d Amir Goldstein          2022-03-20  1196  						 GFP_KERNEL);
40822e8f3f162d Amir Goldstein          2022-03-20  1197  		if (!prealloc_ma=
rk)
40822e8f3f162d Amir Goldstein          2022-03-20  1198  			goto out;
40822e8f3f162d Amir Goldstein          2022-03-20  1199  	}
88826276dcaf4c Eric Paris              2009-12-17  1200  =

7b18527c4a9539 Lino Sanfilippo         2013-07-08  1201  	mutex_lock(&group=
->mark_mutex);
40822e8f3f162d Amir Goldstein          2022-03-20 @1202  	ret =3D 0;
40822e8f3f162d Amir Goldstein          2022-03-20  1203  	/* Check again un=
der lock - if found will not use preallocated mark */
40822e8f3f162d Amir Goldstein          2022-03-20  1204  	if (!fsn_mark)
b812a9f5896379 Amir Goldstein          2018-06-23  1205  		fsn_mark =3D fsn=
otify_find_mark(connp, group);
88826276dcaf4c Eric Paris              2009-12-17  1206  	if (!fsn_mark) {
40822e8f3f162d Amir Goldstein          2022-03-20  1207  		fsn_mark =3D fan=
otify_add_new_mark(group, connp, obj_type, fsid,
40822e8f3f162d Amir Goldstein          2022-03-20  1208  						 &prealloc_m=
ark,
40822e8f3f162d Amir Goldstein          2022-03-20  1209  						 &prealloc_c=
onn);
5e9c070ca08543 Lino Sanfilippo         2013-07-08  1210  		if (IS_ERR(fsn_m=
ark)) {
40822e8f3f162d Amir Goldstein          2022-03-20  1211  			ret =3D PTR_ERR=
(fsn_mark);
40822e8f3f162d Amir Goldstein          2022-03-20  1212  			fsn_mark =3D NU=
LL;
40822e8f3f162d Amir Goldstein          2022-03-20  1213  			goto out_unlock;
88826276dcaf4c Eric Paris              2009-12-17  1214  		}
7b18527c4a9539 Lino Sanfilippo         2013-07-08  1215  	}
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1216  =

734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1217  	/*
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1218  	 * Error events a=
re pre-allocated per group, only if strictly
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1219  	 * needed (i.e. F=
AN_FS_ERROR was requested).
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1220  	 */
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1221  	if (!(flags & FAN=
_MARK_IGNORED_MASK) && (mask & FAN_FS_ERROR)) {
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1222  		ret =3D fanotify=
_group_init_error_pool(group);
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1223  		if (ret)
40822e8f3f162d Amir Goldstein          2022-03-20  1224  			goto out_unlock;
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1225  	}
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1226  =

068909e55d92d2 Amir Goldstein          2022-03-20  1227  	ret =3D fanotify_=
mark_add_to_mask(fsn_mark, mask, flags);
734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1228  =

40822e8f3f162d Amir Goldstein          2022-03-20  1229  out_unlock:
c97476400d3b73 Jan Kara                2016-12-14  1230  	mutex_unlock(&gro=
up->mark_mutex);
5e9c070ca08543 Lino Sanfilippo         2013-07-08  1231  =

40822e8f3f162d Amir Goldstein          2022-03-20  1232  out:
40822e8f3f162d Amir Goldstein          2022-03-20  1233  	if (fsn_mark)
fa218ab98c31ee Lino Sanfilippo         2010-11-09  1234  		fsnotify_put_mar=
k(fsn_mark);
40822e8f3f162d Amir Goldstein          2022-03-20  1235  	if (prealloc_mark)
40822e8f3f162d Amir Goldstein          2022-03-20  1236  		kmem_cache_free(=
fanotify_mark_cache, prealloc_mark);
40822e8f3f162d Amir Goldstein          2022-03-20  1237  	if (prealloc_conn)
40822e8f3f162d Amir Goldstein          2022-03-20  1238  		fsnotify_conn_fr=
ee(prealloc_conn);
40822e8f3f162d Amir Goldstein          2022-03-20  1239  =

734a1a5eccc5f7 Gabriel Krisman Bertazi 2021-10-25  1240  	return ret;
88826276dcaf4c Eric Paris              2009-12-17  1241  }
88826276dcaf4c Eric Paris              2009-12-17  1242  =


:::::: The code at line 1202 was first introduced by commit
:::::: 40822e8f3f162d918ef07b72b1495a2799b93420 fanotify: preallocate conne=
ctor and mark outside of group lock

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6410849684268517214==--

