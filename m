Content-Type: multipart/mixed; boundary="===============2836487153794046470=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] fanotify: define struct members to hold response decision context
Date: Thu, 19 May 2022 17:43:37 +0800
Message-ID: <202205191729.nCgCYNGJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2836487153794046470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1520f08c023d1e919b1a2af161d5a19367b6b4bf.1652730821.git.rgb(a=
)redhat.com>
References: <1520f08c023d1e919b1a2af161d5a19367b6b4bf.1652730821.git.rgb@=
redhat.com>
TO: Richard Guy Briggs <rgb@redhat.com>
TO: "Linux-Audit Mailing List" <linux-audit@redhat.com>
TO: LKML <linux-kernel@vger.kernel.org>
TO: linux-fsdevel(a)vger.kernel.org
CC: Paul Moore <paul@paul-moore.com>
CC: Eric Paris <eparis@parisplace.org>
CC: Steve Grubb <sgrubb@redhat.com>
CC: Richard Guy Briggs <rgb@redhat.com>
CC: Jan Kara <jack@suse.cz>
CC: Amir Goldstein <amir73il@gmail.com>

Hi Richard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jack-fs/fsnotify]
[also build test WARNING on pcmoore-audit/next linux/master linus/master v5=
.18-rc7 next-20220518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Guy-Briggs/f=
anotify-Allow-user-space-to-pass-back-additional-audit-info/20220517-044904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git f=
snotify
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001-20220516 (https://download.01.org/0day-ci/arch=
ive/20220519/202205191729.nCgCYNGJ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4d1fc23ae264424a200=
7ef5a3cfc1b4dbc8d82db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Richard-Guy-Briggs/fanotify-Allow-=
user-space-to-pass-back-additional-audit-info/20220517-044904
        git checkout 4d1fc23ae264424a2007ef5a3cfc1b4dbc8d82db
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   fs/notify/fanotify/fanotify_user.c:401:2: note: Loop condition is false.=
  Exiting loop
           pr_debug("%s: fh_len=3D%zu name_len=3D%zu, info_len=3D%zu, count=
=3D%zu\n",
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   fs/notify/fanotify/fanotify_user.c:404:19: note: Left side of '||' is fa=
lse
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
                            ^
   fs/notify/fanotify/fanotify_user.c:404:41: note: Assuming 'len' is <=3D =
'count'
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
                                                  ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:404:6: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/notify/fanotify/fanotify_user.c:404:2: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(info) || len > count))
           ^
   fs/notify/fanotify/fanotify_user.c:411:2: note: Control jumps to 'case 3=
:'  at line 413
           switch (info_type) {
           ^
   fs/notify/fanotify/fanotify_user.c:414:7: note: Taking false branch
                   if (WARN_ON_ONCE(name_len))
                       ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/notify/fanotify/fanotify_user.c:414:3: note: Taking false branch
                   if (WARN_ON_ONCE(name_len))
                   ^
   fs/notify/fanotify/fanotify_user.c:416:3: note:  Execution continues on =
line 427
                   break;
                   ^
   fs/notify/fanotify/fanotify_user.c:430:6: note: Assuming the condition i=
s false
           if (copy_to_user(buf, &info, sizeof(info)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:430:2: note: Taking false branch
           if (copy_to_user(buf, &info, sizeof(info)))
           ^
   fs/notify/fanotify/fanotify_user.c:435:6: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(handle)))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/notify/fanotify/fanotify_user.c:435:2: note: Taking false branch
           if (WARN_ON_ONCE(len < sizeof(handle)))
           ^
   fs/notify/fanotify/fanotify_user.c:438:23: note: Access to field 'type' =
results in a dereference of a null pointer (loaded from variable 'fh')
           handle.handle_type =3D fh->type;
                                ^~
   fs/notify/fanotify/fanotify_user.c:459:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bounce, fh_buf, fh_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:459:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(bounce, fh_buf, fh_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:625:3: warning: Value stored to 'buf'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   buf +=3D ret;
                   ^      ~~~
   fs/notify/fanotify/fanotify_user.c:625:3: note: Value stored to 'buf' is=
 never read
                   buf +=3D ret;
                   ^      ~~~
   fs/notify/fanotify/fanotify_user.c:626:3: warning: Value stored to 'coun=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   count -=3D ret;
                   ^        ~~~
   fs/notify/fanotify/fanotify_user.c:626:3: note: Value stored to 'count' =
is never read
                   count -=3D ret;
                   ^        ~~~
>> fs/notify/fanotify/fanotify_user.c:853:9: warning: Value stored to 'size=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           size_t size =3D min(count, sizeof(struct fanotify_response));
                  ^~~~
   fs/notify/fanotify/fanotify_user.c:853:9: note: Value stored to 'size' d=
uring its initialization is never read
           size_t size =3D min(count, sizeof(struct fanotify_response));
                  ^~~~
   fs/notify/fanotify/fanotify_user.c:1721:14: warning: Access to field 'i_=
mode' results in a dereference of a null pointer (loaded from variable 'ino=
de') [clang-analyzer-core.NullDereference]
           if (mnt || !S_ISDIR(inode->i_mode)) {
                       ^
   include/uapi/linux/stat.h:23:22: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                             ^
   fs/notify/fanotify/fanotify_user.c:1778:1: note: Calling '__se_sys_fanot=
ify_mark'
   SYSCALL32_DEFINE6(fanotify_mark,
   ^
   include/linux/syscalls.h:279:27: note: expanded from macro 'SYSCALL32_DE=
FINE6'
   #define SYSCALL32_DEFINE6 SYSCALL_DEFINE6
                             ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
   #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/x86/include/asm/syscall_wrapper.h:117:2: note: expanded from macro =
'__IA32_SYS_STUBx'
           __SYS_STUBx(ia32, sys##name,                                    \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/notify/fanotify/fanotify_user.c:1778:1: note: Calling '__do_sys_fanot=
ify_mark'
   SYSCALL32_DEFINE6(fanotify_mark,
   ^
   include/linux/syscalls.h:279:27: note: expanded from macro 'SYSCALL32_DE=
FINE6'
   #define SYSCALL32_DEFINE6 SYSCALL_DEFINE6
                             ^
   include/linux/syscalls.h:222:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
   #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS=
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
   fs/notify/fanotify/fanotify_user.c:1783:9: note: Calling 'do_fanotify_ma=
rk'
           return do_fanotify_mark(fanotify_fd, flags, SC_VAL64(__u64, mask=
),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/notify/fanotify/fanotify_user.c:1557:2: note: 'inode' initialized to =
a null pointer value
           struct inode *inode =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1570:2: note: Taking false branch
           pr_debug("%s: fanotify_fd=3D%d flags=3D%x dfd=3D%d pathname=3D%p=
 mask=3D%llx\n",
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   fs/notify/fanotify/fanotify_user.c:1570:2: note: Loop condition is false=
.  Exiting loop
           pr_debug("%s: fanotify_fd=3D%d flags=3D%x dfd=3D%d pathname=3D%p=
 mask=3D%llx\n",
           ^
   include/linux/printk.h:570:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   fs/notify/fanotify/fanotify_user.c:1574:6: note: Assuming the condition =
is false
           if (upper_32_bits(mask))
               ^
   include/linux/kernel.h:74:27: note: expanded from macro 'upper_32_bits'
   #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
                             ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1574:2: note: Taking false branch
           if (upper_32_bits(mask))
           ^
   fs/notify/fanotify/fanotify_user.c:1577:6: note: Assuming the condition =
is false
           if (flags & ~FANOTIFY_MARK_FLAGS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1577:2: note: Taking false branch
           if (flags & ~FANOTIFY_MARK_FLAGS)
           ^
   fs/notify/fanotify/fanotify_user.c:1580:2: note: Control jumps to 'case =
256:'  at line 1587
           switch (mark_type) {

vim +/size +853 fs/notify/fanotify/fanotify_user.c

a1014f10232239 Eric Paris         2009-12-17  847  =

b2d879096ac799 Eric Paris         2009-12-17  848  static ssize_t fanotify_=
write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
b2d879096ac799 Eric Paris         2009-12-17  849  {
4d1fc23ae26442 Richard Guy Briggs 2022-05-16  850  	struct fanotify_respons=
e response;
b2d879096ac799 Eric Paris         2009-12-17  851  	struct fsnotify_group *=
group;
b2d879096ac799 Eric Paris         2009-12-17  852  	int ret;
4d1fc23ae26442 Richard Guy Briggs 2022-05-16 @853  	size_t size =3D min(cou=
nt, sizeof(struct fanotify_response));
b2d879096ac799 Eric Paris         2009-12-17  854  =

6685df31255493 Miklos Szeredi     2017-10-30  855  	if (!IS_ENABLED(CONFIG_=
FANOTIFY_ACCESS_PERMISSIONS))
6685df31255493 Miklos Szeredi     2017-10-30  856  		return -EINVAL;
6685df31255493 Miklos Szeredi     2017-10-30  857  =

b2d879096ac799 Eric Paris         2009-12-17  858  	group =3D file->private=
_data;
b2d879096ac799 Eric Paris         2009-12-17  859  =

4d1fc23ae26442 Richard Guy Briggs 2022-05-16  860  	if (count < offsetofend=
(struct fanotify_response, response))
5e23663b49e1e8 Fabian Frederick   2020-05-12  861  		return -EINVAL;
5e23663b49e1e8 Fabian Frederick   2020-05-12  862  =

b2d879096ac799 Eric Paris         2009-12-17  863  	pr_debug("%s: group=3D%=
p count=3D%zu\n", __func__, group, count);
b2d879096ac799 Eric Paris         2009-12-17  864  =

4d1fc23ae26442 Richard Guy Briggs 2022-05-16  865  	if (copy_from_user(&res=
ponse, buf, size))
b2d879096ac799 Eric Paris         2009-12-17  866  		return -EFAULT;
b2d879096ac799 Eric Paris         2009-12-17  867  =

4d1fc23ae26442 Richard Guy Briggs 2022-05-16  868  	ret =3D process_access_=
response(group, &response, count);
b2d879096ac799 Eric Paris         2009-12-17  869  	if (ret < 0)
b2d879096ac799 Eric Paris         2009-12-17  870  		count =3D ret;
b2d879096ac799 Eric Paris         2009-12-17  871  =

b2d879096ac799 Eric Paris         2009-12-17  872  	return count;
b2d879096ac799 Eric Paris         2009-12-17  873  }
b2d879096ac799 Eric Paris         2009-12-17  874  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2836487153794046470==--

