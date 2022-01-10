Content-Type: multipart/mixed; boundary="===============2492078656997756336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: crypto/tcrypt.c:696:2: warning: Potential leak of memory pointed to by 'req' [clang-analyzer-unix.Malloc]
Date: Tue, 11 Jan 2022 04:52:01 +0800
Message-ID: <202201110433.WA2PFWhg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2492078656997756336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-c001-20220108 (https://download.01.org/0day-ci/arch=
ive/20220111/202201110433.WA2PFWhg-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344=
d2125fa37e59bae1b0874442c650a19607)
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
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   lib/kunit/executor.c:120:2: note: Taking false branch
           if (filter_glob_param)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/kunit/executor.c:125:2: note: Loop condition is false. Execution con=
tinues on line 128
           for (suites =3D suite_set.start; suites < suite_set.end; suites+=
+)
           ^
   lib/kunit/executor.c:128:2: note: Assuming 'filter_glob_param' is non-nu=
ll
           if (filter_glob_param) { /* a copy was made of each array */
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/kunit/executor.c:128:2: note: '?' condition is false
           if (filter_glob_param) { /* a copy was made of each array */
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/kunit/executor.c:128:6: note: 'filter_glob_param' is non-null
           if (filter_glob_param) { /* a copy was made of each array */
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
   lib/kunit/executor.c:128:2: note: '?' condition is true
           if (filter_glob_param) { /* a copy was made of each array */
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
   lib/kunit/executor.c:128:2: note: Taking true branch
           if (filter_glob_param) { /* a copy was made of each array */
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/kunit/executor.c:129:3: note: Loop condition is false. Execution con=
tinues on line 131
                   for (suites =3D suite_set.start; suites < suite_set.end;=
 suites++)
                   ^
   lib/kunit/executor.c:131:3: note: Argument to kfree() is the address of =
the global variable '__kunit_suites_start', which is not memory allocated b=
y malloc()
                   kfree(suite_set.start);
                   ^     ~~~~~~~~~~~~~~~
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
   crypto/drbg.c:245:17: warning: Value stored to 'entropylen' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:245:17: note: Value stored to 'entropylen' during its init=
ialization is never read
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> crypto/tcrypt.c:696:2: warning: Potential leak of memory pointed to by '=
req' [clang-analyzer-unix.Malloc]
           crypto_free_aead(tfm);
           ^
   crypto/tcrypt.c:549:6: note: Assuming 'iv' is non-null
           if (!iv)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:549:2: note: '?' condition is false
           if (!iv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/tcrypt.c:549:7: note: 'iv' is non-null
           if (!iv)
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
   crypto/tcrypt.c:549:2: note: '?' condition is false
           if (!iv)
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
   crypto/tcrypt.c:549:2: note: Taking false branch
           if (!iv)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/tcrypt.c:552:6: note: Assuming the condition is false
           if (aad_size >=3D PAGE_SIZE) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:552:2: note: '?' condition is false
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/tcrypt.c:552:2: note: '?' condition is false
           if (aad_size >=3D PAGE_SIZE) {
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
   crypto/tcrypt.c:552:2: note: Taking false branch
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/tcrypt.c:557:6: note: Assuming 'enc' is equal to 1
           if (enc =3D=3D ENCRYPT)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:557:2: note: '?' condition is false
           if (enc =3D=3D ENCRYPT)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   kernel/time/ntp.c:335:2: note: '?' condition is false
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
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
   kernel/time/ntp.c:335:2: note: Taking false branch
           if (unlikely(secs > 1 << (SHIFT_PLL + 1 + time_constant)))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/time/ntp.c:341:16: note: Assuming '__UNIQUE_ID___x223' is >=3D '_=
_UNIQUE_ID___y224'
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   kernel/time/ntp.c:341:16: note: '?' condition is false
           freq_adj    =3D min(freq_adj + time_freq, MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   kernel/time/ntp.c:343:16: note: '__UNIQUE_ID___x225' is > '__UNIQUE_ID__=
_y226'
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   kernel/time/ntp.c:343:16: note: '?' condition is true
           time_freq   =3D max(freq_adj, -MAXFREQ_SCALED);
                         ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   kernel/time/ntp.c:345:33: note: The result of the left shift is undefine=
d because the left operand is negative
           time_offset =3D div_s64(offset64 << NTP_SCALE_SHIFT, NTP_INTERVA=
L_FREQ);
                                 ~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
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
   4 warnings generated.
>> fs/ecryptfs/crypto.c:346:2: warning: Potential leak of memory pointed to=
 by 'req' [clang-analyzer-unix.Malloc]
           return rc;
           ^
   fs/ecryptfs/crypto.c:514:9: note: Assuming the condition is false
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ecryptfs/crypto.c:514:2: note: '?' condition is false
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ecryptfs/crypto.c:514:2: note: '?' condition is false
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
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
   fs/ecryptfs/crypto.c:514:2: note: Taking false branch
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ecryptfs/crypto.c:514:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ecryptfs/crypto.c:521:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ecryptfs/crypto.c:521:2: note: '?' condition is false
           if (rc < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ecryptfs/crypto.c:521:6: note: 'rc' is >=3D 0
           if (rc < 0) {
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
   fs/ecryptfs/crypto.c:521:2: note: '?' condition is false
           if (rc < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/char/ipmi/ipmi_msghandler.c:711:2: note: Memory is released
           kfree(intf);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:4682:4: note: Returning; memory was =
released
                           kref_put(&intf->refcount, intf_free);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:4693:2: note: Calling 'spinlock_chec=
k'
           spin_lock_irqsave(&intf->seq_lock, flags);
           ^
   include/linux/spinlock.h:393:24: note: expanded from macro 'spin_lock_ir=
qsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:34: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                                                  ^~~~
   include/linux/spinlock.h:338:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
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
   lib/asn1_encoder.c:167:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   lib/asn1_encoder.c:167:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
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
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
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
   3 warnings generated.
>> drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:135:10: warning: Pote=
ntial leak of memory pointed to by 'out' [clang-analyzer-unix.Malloc]
                   return false;
                          ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:187:2: note: '?' cond=
ition is false
           DO_TEST();
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:183:19: note: expande=
d from macro 'DO_TEST'
   #define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
                     ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:17:20: note: expande=
d from macro 'FAIL_ON'
   #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
                      ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:11:3: note: expanded=
 from macro 'FAIL'
                   if (test) { \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:187:2: note: '?' cond=
ition is false
           DO_TEST();
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:183:19: note: expande=
d from macro 'DO_TEST'
   #define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
                     ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:17:20: note: expande=
d from macro 'FAIL_ON'
   #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
                      ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:11:3: note: expanded=
 from macro 'FAIL'
                   if (test) { \
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
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:187:2: note: Taking f=
alse branch
           DO_TEST();
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:183:19: note: expande=
d from macro 'DO_TEST'
   #define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
                     ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:17:20: note: expande=
d from macro 'FAIL_ON'
   #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
                      ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:11:3: note: expanded=
 from macro 'FAIL'
                   if (test) { \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:187:2: note: Loop con=
dition is false.  Exiting loop
           DO_TEST();
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:183:19: note: expande=
d from macro 'DO_TEST'
   #define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
                     ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:17:20: note: expande=
d from macro 'FAIL_ON'
   #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
                      ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:10:2: note: expanded=
 from macro 'FAIL'
           do { \
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:191:2: note: '?' cond=
ition is false
           DO_TEST();
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:183:19: note: expande=
d from macro 'DO_TEST'
   #define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
                     ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:17:20: note: expande=
d from macro 'FAIL_ON'
   #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
                      ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:11:3: note: expanded=
 from macro 'FAIL'
                   if (test) { \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:191:2: note: '?' cond=
ition is false
           DO_TEST();
           ^
   drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c:183:19: note: expande=
d from macro 'DO_TEST'
   #define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
                     ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:17:20: note: expande=
d from macro 'FAIL_ON'
   #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
                      ^
   drivers/gpu/drm/selftests/test-drm_modeset_common.h:11:3: note: expanded=
 from macro 'FAIL'
                   if (test) { \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:523:15: note: Left side of '&&' is false
           dax_region =3D container_of(kref, struct dax_region, kref);
                        ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dax/bus.c:523:15: note: Taking false branch
           dax_region =3D container_of(kref, struct dax_region, kref);
                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
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
   drivers/dax/bus.c:523:15: note: Loop condition is false.  Exiting loop
           dax_region =3D container_of(kref, struct dax_region, kref);
                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/dax/bus.c:524:2: note: Memory is released
           kfree(dax_region);
           ^~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/dax/bus.c:529:2: note: Returning; memory was released
           kref_put(&dax_region->kref, dax_region_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:539:2: note: Returning; memory was released via 1st pa=
rameter
           dax_region_put(dax_region);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:255:3: note: Returning; memory was released via 1=
st parameter
                   action(data);
                   ^~~~~~~~~~~~
   drivers/dax/bus.c:585:6: note: Returning; memory was released via 3rd pa=
rameter
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:585:2: note: '?' condition is false
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:585:6: note: Use of memory after it is freed
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
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
   drivers/dax/bus.c:818:7: warning: Value stored to 'is_shrink' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool is_shrink =3D resource_size(res) > size;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:818:7: note: Value stored to 'is_shrink' during its in=
itialization is never read
           bool is_shrink =3D resource_size(res) > size;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dax/bus.c:875:33: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
                   struct dax_mapping *mapping =3D dev_dax->ranges[i].mappi=
ng;
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:873:34: note: Assuming 'i' is >=3D 0
           for (i =3D dev_dax->nr_range - 1; i >=3D 0; i--) {
                                           ^~~~~~
   drivers/dax/bus.c:873:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D dev_dax->nr_range - 1; i >=3D 0; i--) {
           ^
   drivers/dax/bus.c:879:12: note: Assuming '__UNIQUE_ID___x217' is >=3D '_=
_UNIQUE_ID___y218'
                   shrink =3D min_t(u64, to_shrink, range_len(range));
                            ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/dax/bus.c:879:12: note: '?' condition is false
                   shrink =3D min_t(u64, to_shrink, range_len(range));
                            ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/dax/bus.c:880:3: note: '?' condition is false
                   if (shrink >=3D range_len(range)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:880:3: note: '?' condition is true
                   if (shrink >=3D range_len(range)) {
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
   drivers/dax/bus.c:880:3: note: Taking true branch
                   if (shrink >=3D range_len(range)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:883:4: note: Calling 'trim_dev_dax_range'
                           trim_dev_dax_range(dev_dax);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:376:2: note: '?' condition is true
           dev_dbg(&dev_dax->dev, "delete range[%d]: %#llx:%#llx\n", i,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:376:2: note: Taking false branch
           dev_dbg(&dev_dax->dev, "delete range[%d]: %#llx:%#llx\n", i,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:381:6: note: Assuming the condition is false
           if (--dev_dax->nr_range =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:381:2: note: '?' condition is false
           if (--dev_dax->nr_range =3D=3D 0) {
--
                         ^
   drivers/hid/hid-core.c:1412:22: note: The result of the left shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'unsigned int'
                   u8 bit_mask =3D ((1U << n) - 1);
                                      ^  ~
   drivers/hid/hid-core.c:1984:3: warning: Value stored to 'len' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   len +=3D sprintf(buf + len, "%shidraw%d", len ? "," : "",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1984:3: note: Value stored to 'len' is never read
                   len +=3D sprintf(buf + len, "%shidraw%d", len ? "," : "",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/leds/leds-pca9532.c:516:23: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:516:23: note: Value stored to 'data' during =
its initialization is never read
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   drivers/mmc/core/regulator.c:181:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   drivers/mmc/core/regulator.c:181:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/mmc/core/mmc_test.c:384:3: warning: Array subscript is undefined=
 [clang-analyzer-core.uninitialized.ArraySubscript]
                   mem->arr[mem->cnt].page =3D page;
                   ^        ~~~~~~~~
   drivers/mmc/core/mmc_test.c:347:6: note: Assuming 'max_page_cnt' is <=3D=
 'limit'
           if (max_page_cnt > limit)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mmc/core/mmc_test.c:347:2: note: '?' condition is false
           if (max_page_cnt > limit)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/core/mmc_test.c:347:6: note: 'max_page_cnt' is <=3D 'limit'
           if (max_page_cnt > limit)
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
   drivers/mmc/core/mmc_test.c:347:2: note: '?' condition is false
           if (max_page_cnt > limit)
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
   drivers/mmc/core/mmc_test.c:347:2: note: Taking false branch
           if (max_page_cnt > limit)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/core/mmc_test.c:349:6: note: Assuming 'min_page_cnt' is <=3D=
 'max_page_cnt'
           if (min_page_cnt > max_page_cnt)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mmc/core/mmc_test.c:349:2: note: '?' condition is false
           if (min_page_cnt > max_page_cnt)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mmc/core/mmc_test.c:349:6: note: 'min_page_cnt' is <=3D 'max_pag=
e_cnt'
           if (min_page_cnt > max_page_cnt)
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
   drivers/mmc/core/mmc_test.c:349:2: note: '?' condition is false
           if (min_page_cnt > max_page_cnt)
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
   drivers/mmc/core/mmc_test.c:349:2: note: Taking false branch
           if (min_page_cnt > max_page_cnt)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mmc/core/mmc_test.c:352:6: note: Assuming 'max_seg_page_cnt' is =
<=3D 'max_page_cnt'
           if (max_seg_page_cnt > max_page_cnt)

vim +/req +696 crypto/tcrypt.c

53f52d7aecb4cb Tim Chen             2013-12-11  525  =

3e3dc25fe7d5e3 Mark Rustad          2014-07-25  526  static void test_aead_=
speed(const char *algo, int enc, unsigned int secs,
53f52d7aecb4cb Tim Chen             2013-12-11  527  			    struct aead_spe=
ed_template *template,
53f52d7aecb4cb Tim Chen             2013-12-11  528  			    unsigned int tc=
ount, u8 authsize,
53f52d7aecb4cb Tim Chen             2013-12-11  529  			    unsigned int aa=
d_size, u8 *keysize)
53f52d7aecb4cb Tim Chen             2013-12-11  530  {
53f52d7aecb4cb Tim Chen             2013-12-11  531  	unsigned int i, j;
53f52d7aecb4cb Tim Chen             2013-12-11  532  	struct crypto_aead *t=
fm;
53f52d7aecb4cb Tim Chen             2013-12-11  533  	int ret =3D -ENOMEM;
53f52d7aecb4cb Tim Chen             2013-12-11  534  	const char *key;
53f52d7aecb4cb Tim Chen             2013-12-11  535  	struct aead_request *=
req;
53f52d7aecb4cb Tim Chen             2013-12-11  536  	struct scatterlist *s=
g;
53f52d7aecb4cb Tim Chen             2013-12-11  537  	struct scatterlist *s=
gout;
53f52d7aecb4cb Tim Chen             2013-12-11  538  	const char *e;
53f52d7aecb4cb Tim Chen             2013-12-11  539  	void *assoc;
96692a7305c498 Cristian Stoica      2015-01-28  540  	char *iv;
53f52d7aecb4cb Tim Chen             2013-12-11  541  	char *xbuf[XBUFSIZE];
53f52d7aecb4cb Tim Chen             2013-12-11  542  	char *xoutbuf[XBUFSIZ=
E];
53f52d7aecb4cb Tim Chen             2013-12-11  543  	char *axbuf[XBUFSIZE];
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  544  	const int *b_size;
53f52d7aecb4cb Tim Chen             2013-12-11  545  	unsigned int iv_len;
646710419a978c Gilad Ben-Yossef     2017-10-18  546  	struct crypto_wait wa=
it;
53f52d7aecb4cb Tim Chen             2013-12-11  547  =

96692a7305c498 Cristian Stoica      2015-01-28  548  	iv =3D kzalloc(MAX_IV=
LEN, GFP_KERNEL);
96692a7305c498 Cristian Stoica      2015-01-28  549  	if (!iv)
96692a7305c498 Cristian Stoica      2015-01-28  550  		return;
96692a7305c498 Cristian Stoica      2015-01-28  551  =

ac5f863f8c548a Christian Engelmayer 2014-04-21  552  	if (aad_size >=3D PAG=
E_SIZE) {
ac5f863f8c548a Christian Engelmayer 2014-04-21  553  		pr_err("associate da=
ta length (%u) too big\n", aad_size);
96692a7305c498 Cristian Stoica      2015-01-28  554  		goto out_noxbuf;
ac5f863f8c548a Christian Engelmayer 2014-04-21  555  	}
ac5f863f8c548a Christian Engelmayer 2014-04-21  556  =

53f52d7aecb4cb Tim Chen             2013-12-11  557  	if (enc =3D=3D ENCRYP=
T)
53f52d7aecb4cb Tim Chen             2013-12-11  558  		e =3D "encryption";
53f52d7aecb4cb Tim Chen             2013-12-11  559  	else
53f52d7aecb4cb Tim Chen             2013-12-11  560  		e =3D "decryption";
53f52d7aecb4cb Tim Chen             2013-12-11  561  =

53f52d7aecb4cb Tim Chen             2013-12-11  562  	if (testmgr_alloc_buf=
(xbuf))
53f52d7aecb4cb Tim Chen             2013-12-11  563  		goto out_noxbuf;
53f52d7aecb4cb Tim Chen             2013-12-11  564  	if (testmgr_alloc_buf=
(axbuf))
53f52d7aecb4cb Tim Chen             2013-12-11  565  		goto out_noaxbuf;
53f52d7aecb4cb Tim Chen             2013-12-11  566  	if (testmgr_alloc_buf=
(xoutbuf))
53f52d7aecb4cb Tim Chen             2013-12-11  567  		goto out_nooutbuf;
53f52d7aecb4cb Tim Chen             2013-12-11  568  =

a3f2185a29df08 Herbert Xu           2015-05-27  569  	sg =3D kmalloc(sizeof=
(*sg) * 9 * 2, GFP_KERNEL);
53f52d7aecb4cb Tim Chen             2013-12-11  570  	if (!sg)
53f52d7aecb4cb Tim Chen             2013-12-11  571  		goto out_nosg;
a3f2185a29df08 Herbert Xu           2015-05-27  572  	sgout =3D &sg[9];
53f52d7aecb4cb Tim Chen             2013-12-11  573  =

5e4b8c1fcc7001 Herbert Xu           2015-08-13  574  	tfm =3D crypto_alloc_=
aead(algo, 0, 0);
53f52d7aecb4cb Tim Chen             2013-12-11  575  	if (IS_ERR(tfm)) {
53f52d7aecb4cb Tim Chen             2013-12-11  576  		pr_err("alg: aead: F=
ailed to load transform for %s: %ld\n", algo,
53f52d7aecb4cb Tim Chen             2013-12-11  577  		       PTR_ERR(tfm));
a2ea6ed6a631e2 Christian Engelmayer 2014-04-21  578  		goto out_notfm;
53f52d7aecb4cb Tim Chen             2013-12-11  579  	}
53f52d7aecb4cb Tim Chen             2013-12-11  580  =

7b3d52683b3a47 Tianjia Zhang        2021-08-13  581  	ret =3D crypto_aead_s=
etauthsize(tfm, authsize);
7b3d52683b3a47 Tianjia Zhang        2021-08-13  582  	if (ret) {
7b3d52683b3a47 Tianjia Zhang        2021-08-13  583  		pr_err("alg: aead: F=
ailed to setauthsize for %s: %d\n", algo,
7b3d52683b3a47 Tianjia Zhang        2021-08-13  584  		       ret);
7b3d52683b3a47 Tianjia Zhang        2021-08-13  585  		goto out_noreq;
7b3d52683b3a47 Tianjia Zhang        2021-08-13  586  	}
7b3d52683b3a47 Tianjia Zhang        2021-08-13  587  =

646710419a978c Gilad Ben-Yossef     2017-10-18  588  	crypto_init_wait(&wai=
t);
263a8df0d32eca Luca Clementi        2014-06-25  589  	printk(KERN_INFO "\nt=
esting speed of %s (%s) %s\n", algo,
263a8df0d32eca Luca Clementi        2014-06-25  590  			get_driver_name(cry=
pto_aead, tfm), e);
263a8df0d32eca Luca Clementi        2014-06-25  591  =

53f52d7aecb4cb Tim Chen             2013-12-11  592  	req =3D aead_request_=
alloc(tfm, GFP_KERNEL);
53f52d7aecb4cb Tim Chen             2013-12-11  593  	if (!req) {
53f52d7aecb4cb Tim Chen             2013-12-11  594  		pr_err("alg: aead: F=
ailed to allocate request for %s\n",
53f52d7aecb4cb Tim Chen             2013-12-11  595  		       algo);
6af1f93e2a0192 Christian Engelmayer 2014-04-21  596  		goto out_noreq;
53f52d7aecb4cb Tim Chen             2013-12-11  597  	}
53f52d7aecb4cb Tim Chen             2013-12-11  598  =

1425d2d17f7309 Vutla, Lokesh        2015-07-07  599  	aead_request_set_call=
back(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
646710419a978c Gilad Ben-Yossef     2017-10-18  600  				  crypto_req_done,=
 &wait);
1425d2d17f7309 Vutla, Lokesh        2015-07-07  601  =

53f52d7aecb4cb Tim Chen             2013-12-11  602  	i =3D 0;
53f52d7aecb4cb Tim Chen             2013-12-11  603  	do {
53f52d7aecb4cb Tim Chen             2013-12-11  604  		b_size =3D aead_size=
s;
53f52d7aecb4cb Tim Chen             2013-12-11  605  		do {
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  606  			u32 bs =3D round_up=
(*b_size, crypto_aead_blocksize(tfm));
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  607  =

53f52d7aecb4cb Tim Chen             2013-12-11  608  			assoc =3D axbuf[0];
53f52d7aecb4cb Tim Chen             2013-12-11  609  			memset(assoc, 0xff,=
 aad_size);
53f52d7aecb4cb Tim Chen             2013-12-11  610  =

ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  611  			if ((*keysize + bs)=
 > TVMEMSIZE * PAGE_SIZE) {
53f52d7aecb4cb Tim Chen             2013-12-11  612  				pr_err("template (=
%u) too big for tvmem (%lu)\n",
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  613  				       *keysize + =
bs,
53f52d7aecb4cb Tim Chen             2013-12-11  614  					TVMEMSIZE * PAGE_=
SIZE);
53f52d7aecb4cb Tim Chen             2013-12-11  615  				goto out;
53f52d7aecb4cb Tim Chen             2013-12-11  616  			}
53f52d7aecb4cb Tim Chen             2013-12-11  617  =

53f52d7aecb4cb Tim Chen             2013-12-11  618  			key =3D tvmem[0];
53f52d7aecb4cb Tim Chen             2013-12-11  619  			for (j =3D 0; j < t=
count; j++) {
53f52d7aecb4cb Tim Chen             2013-12-11  620  				if (template[j].kl=
en =3D=3D *keysize) {
53f52d7aecb4cb Tim Chen             2013-12-11  621  					key =3D template[=
j].key;
53f52d7aecb4cb Tim Chen             2013-12-11  622  					break;
53f52d7aecb4cb Tim Chen             2013-12-11  623  				}
53f52d7aecb4cb Tim Chen             2013-12-11  624  			}
7b3d52683b3a47 Tianjia Zhang        2021-08-13  625  =

53f52d7aecb4cb Tim Chen             2013-12-11  626  			ret =3D crypto_aead=
_setkey(tfm, key, *keysize);
7b3d52683b3a47 Tianjia Zhang        2021-08-13  627  			if (ret) {
7b3d52683b3a47 Tianjia Zhang        2021-08-13  628  				pr_err("setkey() f=
ailed flags=3D%x: %d\n",
7b3d52683b3a47 Tianjia Zhang        2021-08-13  629  					crypto_aead_get_f=
lags(tfm), ret);
7b3d52683b3a47 Tianjia Zhang        2021-08-13  630  				goto out;
7b3d52683b3a47 Tianjia Zhang        2021-08-13  631  			}
53f52d7aecb4cb Tim Chen             2013-12-11  632  =

53f52d7aecb4cb Tim Chen             2013-12-11  633  			iv_len =3D crypto_a=
ead_ivsize(tfm);
53f52d7aecb4cb Tim Chen             2013-12-11  634  			if (iv_len)
96692a7305c498 Cristian Stoica      2015-01-28  635  				memset(iv, 0xff, i=
v_len);
53f52d7aecb4cb Tim Chen             2013-12-11  636  =

53f52d7aecb4cb Tim Chen             2013-12-11  637  			crypto_aead_clear_f=
lags(tfm, ~0);
53f52d7aecb4cb Tim Chen             2013-12-11  638  			printk(KERN_INFO "t=
est %u (%d bit key, %d byte blocks): ",
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  639  					i, *keysize * 8, =
bs);
53f52d7aecb4cb Tim Chen             2013-12-11  640  =

53f52d7aecb4cb Tim Chen             2013-12-11  641  			memset(tvmem[0], 0x=
ff, PAGE_SIZE);
53f52d7aecb4cb Tim Chen             2013-12-11  642  =

ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  643  			sg_init_aead(sg, xb=
uf, bs + (enc ? 0 : authsize),
5601e014fe7229 Tudor-Dan Ambarus    2017-11-14  644  				     assoc, aad_si=
ze);
53f52d7aecb4cb Tim Chen             2013-12-11  645  =

31267270a35594 Herbert Xu           2015-06-17  646  			sg_init_aead(sgout,=
 xoutbuf,
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  647  				     bs + (enc ? a=
uthsize : 0), assoc,
5601e014fe7229 Tudor-Dan Ambarus    2017-11-14  648  				     aad_size);
31267270a35594 Herbert Xu           2015-06-17  649  =

4431bd49530c73 Gilad Ben-Yossef     2017-12-17  650  			aead_request_set_ad=
(req, aad_size);
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  651  =

4431bd49530c73 Gilad Ben-Yossef     2017-12-17  652  			if (!enc) {
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  653  =

4431bd49530c73 Gilad Ben-Yossef     2017-12-17  654  				/*
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  655  				 * For decryption =
we need a proper auth so
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  656  				 * we do the encry=
ption path once with buffers
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  657  				 * reversed (input=
 <-> output) to calculate it
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  658  				 */
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  659  				aead_request_set_c=
rypt(req, sgout, sg,
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  660  						       bs, iv);
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  661  				ret =3D do_one_aea=
d_op(req,
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  662  						     crypto_aead=
_encrypt(req));
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  663  =

4431bd49530c73 Gilad Ben-Yossef     2017-12-17  664  				if (ret) {
129a4dba1b1ba9 Randy Dunlap         2020-07-30  665  					pr_err("calculati=
ng auth failed (%d)\n",
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  666  					       ret);
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  667  					break;
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  668  				}
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  669  			}
4431bd49530c73 Gilad Ben-Yossef     2017-12-17  670  =

7aacbfcb331cef Robert Baronescu     2017-10-10  671  			aead_request_set_cr=
ypt(req, sg, sgout,
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  672  					       bs + (enc =
? 0 : authsize),
7aacbfcb331cef Robert Baronescu     2017-10-10  673  					       iv);
53f52d7aecb4cb Tim Chen             2013-12-11  674  =

2af632996b8986 Horia Geant=C4=83         2018-07-23  675  			if (secs) {
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  676  				ret =3D test_aead_=
jiffies(req, enc, bs,
3e3dc25fe7d5e3 Mark Rustad          2014-07-25  677  							secs);
2af632996b8986 Horia Geant=C4=83         2018-07-23  678  				cond_resched(=
);
2af632996b8986 Horia Geant=C4=83         2018-07-23  679  			} else {
ad6d66bcac77e5 Ard Biesheuvel       2020-11-20  680  				ret =3D test_aead_=
cycles(req, enc, bs);
2af632996b8986 Horia Geant=C4=83         2018-07-23  681  			}
53f52d7aecb4cb Tim Chen             2013-12-11  682  =

53f52d7aecb4cb Tim Chen             2013-12-11  683  			if (ret) {
53f52d7aecb4cb Tim Chen             2013-12-11  684  				pr_err("%s() faile=
d return code=3D%d\n", e, ret);
53f52d7aecb4cb Tim Chen             2013-12-11  685  				break;
53f52d7aecb4cb Tim Chen             2013-12-11  686  			}
53f52d7aecb4cb Tim Chen             2013-12-11  687  			b_size++;
53f52d7aecb4cb Tim Chen             2013-12-11  688  			i++;
53f52d7aecb4cb Tim Chen             2013-12-11  689  		} while (*b_size);
53f52d7aecb4cb Tim Chen             2013-12-11  690  		keysize++;
53f52d7aecb4cb Tim Chen             2013-12-11  691  	} while (*keysize);
53f52d7aecb4cb Tim Chen             2013-12-11  692  =

53f52d7aecb4cb Tim Chen             2013-12-11  693  out:
6af1f93e2a0192 Christian Engelmayer 2014-04-21  694  	aead_request_free(req=
);
6af1f93e2a0192 Christian Engelmayer 2014-04-21  695  out_noreq:
53f52d7aecb4cb Tim Chen             2013-12-11 @696  	crypto_free_aead(tfm);
a2ea6ed6a631e2 Christian Engelmayer 2014-04-21  697  out_notfm:
53f52d7aecb4cb Tim Chen             2013-12-11  698  	kfree(sg);
53f52d7aecb4cb Tim Chen             2013-12-11  699  out_nosg:
53f52d7aecb4cb Tim Chen             2013-12-11  700  	testmgr_free_buf(xout=
buf);
53f52d7aecb4cb Tim Chen             2013-12-11  701  out_nooutbuf:
53f52d7aecb4cb Tim Chen             2013-12-11  702  	testmgr_free_buf(axbu=
f);
53f52d7aecb4cb Tim Chen             2013-12-11  703  out_noaxbuf:
53f52d7aecb4cb Tim Chen             2013-12-11  704  	testmgr_free_buf(xbuf=
);
53f52d7aecb4cb Tim Chen             2013-12-11  705  out_noxbuf:
96692a7305c498 Cristian Stoica      2015-01-28  706  	kfree(iv);
53f52d7aecb4cb Tim Chen             2013-12-11  707  }
d5dc392742a981 Sebastian Siewior    2008-03-11  708  =


:::::: The code at line 696 was first introduced by commit
:::::: 53f52d7aecb4cb3772872c902b73e0c685a56901 crypto: tcrypt - Added spee=
d tests for AEAD crypto alogrithms in tcrypt test suite

:::::: TO: Tim Chen <tim.c.chen@linux.intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2492078656997756336==--

