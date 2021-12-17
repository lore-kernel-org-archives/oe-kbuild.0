Content-Type: multipart/mixed; boundary="===============5089254650730081962=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/greybus/manifest.c:48:2: warning: Argument to kfree() is the address of the local variable 'list', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Fri, 17 Dec 2021 11:02:36 +0800
Message-ID: <202112171003.KKEb2pfD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5089254650730081962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fa36bbe6d43f3bbce1f10a187e153587c7584d83
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20211216 (https://download.01.org/0day-ci/ar=
chive/20211217/202112171003.KKEb2pfD-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   kernel/trace/trace.c:7738:3: note: '?' condition is false
                   if (!err)
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
   kernel/trace/trace.c:7738:3: note: Taking false branch
                   if (!err)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/trace/trace.c:7814:8: note: Returned allocated memory
           err =3D get_tracing_log_err(tr);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:7815:6: note: Assuming the condition is true
           if (PTR_ERR(err) =3D=3D -ENOMEM) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/trace/trace.c:7815:2: note: '?' condition is false
           if (PTR_ERR(err) =3D=3D -ENOMEM) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/trace/trace.c:7815:2: note: '?' condition is true
           if (PTR_ERR(err) =3D=3D -ENOMEM) {
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
   kernel/trace/trace.c:7815:2: note: Taking true branch
           if (PTR_ERR(err) =3D=3D -ENOMEM) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/trace/trace.c:7816:3: note: Potential leak of memory pointed to b=
y 'err'
                   mutex_unlock(&tracing_err_log_lock);
                   ^
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   3 warnings generated.
   fs/readdir.c:156:2: warning: Value stored to 'd_ino' is never read [clan=
g-analyzer-deadcode.DeadStores]
           d_ino =3D ino;
           ^       ~~~
   fs/readdir.c:156:2: note: Value stored to 'd_ino' is never read
           d_ino =3D ino;
           ^       ~~~
   fs/readdir.c:239:2: warning: Value stored to 'd_ino' is never read [clan=
g-analyzer-deadcode.DeadStores]
           d_ino =3D ino;
           ^       ~~~
   fs/readdir.c:239:2: note: Value stored to 'd_ino' is never read
           d_ino =3D ino;
           ^       ~~~
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
   4 warnings generated.
>> drivers/greybus/manifest.c:48:2: warning: Argument to kfree() is the add=
ress of the local variable 'list', which is not memory allocated by malloc(=
) [clang-analyzer-unix.Malloc]
           kfree(descriptor);
           ^
   drivers/greybus/manifest.c:240:2: note: Left side of '&&' is false
           list_for_each_entry_safe(desc, next, &intf->manifest_descs, link=
s) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/greybus/manifest.c:240:2: note: '?' condition is true
           list_for_each_entry_safe(desc, next, &intf->manifest_descs, link=
s) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/greybus/manifest.c:240:2: note: Left side of '&&' is false
           list_for_each_entry_safe(desc, next, &intf->manifest_descs, link=
s) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/greybus/manifest.c:240:2: note: Taking false branch
           list_for_each_entry_safe(desc, next, &intf->manifest_descs, link=
s) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/greybus/manifest.c:240:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry_safe(desc, next, &intf->manifest_descs, link=
s) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/greybus/manifest.c:240:2: note: Left side of '&&' is false
           list_for_each_entry_safe(desc, next, &intf->manifest_descs, link=
s) {

vim +/list +48 drivers/greybus/manifest.c

b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01  44=
  =

b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01  45=
  static void release_manifest_descriptor(struct manifest_desc *descriptor)
b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01  46=
  {
b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01  47=
  	list_del(&descriptor->links);
b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01 @48=
  	kfree(descriptor);
b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01  49=
  }
b09c94a1b71c82 drivers/staging/greybus/manifest.c Alex Elder 2014-10-01  50=
  =


:::::: The code at line 48 was first introduced by commit
:::::: b09c94a1b71c82385ffa5f3c913d7d6e14eaea3d greybus: start improving ma=
nifest parsing

:::::: TO: Alex Elder <elder@linaro.org>
:::::: CC: Greg Kroah-Hartman <greg@kroah.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5089254650730081962==--

