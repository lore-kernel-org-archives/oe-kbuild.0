Content-Type: multipart/mixed; boundary="===============4887501725224889212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [CFT][PATCH] ucounts: Fix signal ucount refcounting
Date: Fri, 26 Nov 2021 23:09:01 +0800
Message-ID: <202111262308.9Mq1UEM2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4887501725224889212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <87mtnavszx.fsf_-_@disp2133>
References: <87mtnavszx.fsf_-_@disp2133>
TO: "Eric W. Biederman" <ebiederm@xmission.com>

Hi "Eric,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Eric-W-Biederman/ucounts-F=
ix-signal-ucount-refcounting/20211016-061359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
8fe31e0995f048d16b378b90926793a0aa4af1e5
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20211017 (https://download.01.org/0day-ci/archi=
ve/20211126/202111262308.9Mq1UEM2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3=
ef19fe82d7ad6a6e1515317dcc01b41515)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/e042a898defa264b6a95a439b=
8570486b47bcd49
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Eric-W-Biederman/ucounts-Fix-signa=
l-ucount-refcounting/20211016-061359
        git checkout e042a898defa264b6a95a439b8570486b47bcd49
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/notify/fsnotify.c:212:15: note: Left side of '&&' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   fs/notify/fsnotify.c:212:33: note: Assuming 'p_mask' is not equal to 0
           if (unlikely(parent_watched && !p_mask))
                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:2: note: Taking false branch
           if (unlikely(parent_watched && !p_mask))
           ^
   fs/notify/fsnotify.c:220:6: note: 'parent_needed' is false
           if (parent_needed || parent_interested) {
               ^~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:6: note: Left side of '||' is false
   fs/notify/fsnotify.c:220:23: note: Assuming 'parent_interested' is true
           if (parent_needed || parent_interested) {
                                ^~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:2: note: Taking true branch
           if (parent_needed || parent_interested) {
           ^
   fs/notify/fsnotify.c:222:45: note: Passing null pointer value via 1st pa=
rameter 'data'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                                             ^
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   fs/notify/fsnotify.c:222:25: note: Calling 'fsnotify_data_inode'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                         ^
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   include/linux/fsnotify_backend.h:255:2: note: Control jumps to 'case FSN=
OTIFY_EVENT_PATH:'  at line 258
           switch (data_type) {
           ^
   include/linux/fsnotify_backend.h:259:18: note: Access to field 'dentry' =
results in a dereference of a null pointer (loaded from variable 'data')
                   return d_inode(((const struct path *)data)->dentry);
                                  ^                     ~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   5 warnings generated.
   include/linux/list.h:808:10: warning: Access to field 'pprev' results in=
 a dereference of a null pointer (loaded from variable 'h') [clang-analyzer=
-core.NullDereference]
           return !h->pprev;
                   ^
   kernel/ucount.c:251:23: note: Assuming pointer value is null
           for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
                                ^~~~
   kernel/ucount.c:251:2: note: Loop condition is false. Execution continue=
s on line 255
           for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
           ^
   kernel/ucount.c:255:14: note: Passing null pointer value via 1st paramet=
er 'ucounts'
           put_ucounts(ucounts);
                       ^~~~~~~
   kernel/ucount.c:255:2: note: Calling 'put_ucounts'
           put_ucounts(ucounts);
           ^~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:204:6: note: Assuming the condition is true
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, =
flags)) {
               ^
   include/linux/spinlock.h:490:21: note: expanded from macro 'atomic_dec_a=
nd_lock_irqsave'
                   __cond_lock(lock, _atomic_dec_and_lock_irqsave(atomic, l=
ock, &(flags)))
                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:48:28: note: expanded from macro '__cond_=
lock'
   # define __cond_lock(x,c) (c)
                              ^
   kernel/ucount.c:204:2: note: Taking true branch
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, =
flags)) {
           ^
   kernel/ucount.c:205:18: note: Passing null pointer value via 1st paramet=
er 'n'
                   hlist_del_init(&ucounts->node);
                                  ^~~~~~~~~~~~~~
   kernel/ucount.c:205:3: note: Calling 'hlist_del_init'
                   hlist_del_init(&ucounts->node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:865:22: note: Passing null pointer value via 1st pa=
rameter 'h'
           if (!hlist_unhashed(n)) {
                               ^
   include/linux/list.h:865:7: note: Calling 'hlist_unhashed'
           if (!hlist_unhashed(n)) {
                ^~~~~~~~~~~~~~~~~
   include/linux/list.h:808:10: note: Access to field 'pprev' results in a =
dereference of a null pointer (loaded from variable 'h')
           return !h->pprev;
                   ^
>> kernel/ucount.c:291:44: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           for (iter =3D ucounts; iter !=3D last; iter =3D iter->ns->ucount=
s) {
                                                     ^
   kernel/ucount.c:309:2: note: Loop condition is true.  Entering loop body
           for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
           ^
   kernel/ucount.c:310:14: note: Left side of '||' is false
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/ucount.c:310:14: note: Left side of '||' is false
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/ucount.c:310:14: note: Left side of '||' is true
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/ucount.c:310:14: note: Taking false branch
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/ucount.c:310:14: note: Loop condition is false.  Exiting loop
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/ucount.c:312:7: note: Assuming 'new' is >=3D 0
                   if (new < 0 || new > max)
                       ^~~~~~~
   kernel/ucount.c:312:7: note: Left side of '||' is false
   kernel/ucount.c:312:18: note: Assuming 'new' is <=3D 'max'
                   if (new < 0 || new > max)
                                  ^~~~~~~~~
   kernel/ucount.c:312:3: note: Taking false branch
                   if (new < 0 || new > max)
                   ^
   kernel/ucount.c:314:12: note: 'iter' is equal to 'ucounts'
                   else if (iter =3D=3D ucounts)
                            ^~~~
   kernel/ucount.c:314:8: note: Taking true branch
                   else if (iter =3D=3D ucounts)
                        ^
   kernel/ucount.c:316:8: note: Assuming 'new' is not equal to 1
                   if ((new =3D=3D 1) && (get_ucounts(iter) !=3D iter))
                        ^~~~~~~~
   kernel/ucount.c:316:18: note: Left side of '&&' is false
                   if ((new =3D=3D 1) && (get_ucounts(iter) !=3D iter))
                                  ^
   kernel/ucount.c:309:2: note: Loop condition is true.  Entering loop body

vim +291 kernel/ucount.c

21d1c5e386bc751 Alexey Gladkov    2021-04-22  286  =

e042a898defa264 Eric W. Biederman 2021-10-15  287  static void do_dec_rlimi=
t_put_ucounts(struct ucounts *ucounts,
e042a898defa264 Eric W. Biederman 2021-10-15  288  				struct ucounts *last=
, enum ucount_type type)
e042a898defa264 Eric W. Biederman 2021-10-15  289  {
e042a898defa264 Eric W. Biederman 2021-10-15  290  	struct ucounts *iter;
e042a898defa264 Eric W. Biederman 2021-10-15 @291  	for (iter =3D ucounts; =
iter !=3D last; iter =3D iter->ns->ucounts) {
e042a898defa264 Eric W. Biederman 2021-10-15  292  		long dec =3D atomic_lo=
ng_add_return(-1, &iter->ucount[type]);
e042a898defa264 Eric W. Biederman 2021-10-15  293  		WARN_ON_ONCE(dec < 0);
e042a898defa264 Eric W. Biederman 2021-10-15  294  		if (dec =3D=3D 0)
e042a898defa264 Eric W. Biederman 2021-10-15  295  			put_ucounts(iter);
e042a898defa264 Eric W. Biederman 2021-10-15  296  	}
e042a898defa264 Eric W. Biederman 2021-10-15  297  }
e042a898defa264 Eric W. Biederman 2021-10-15  298  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4887501725224889212==--

