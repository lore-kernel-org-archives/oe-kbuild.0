Content-Type: multipart/mixed; boundary="===============2166450945295876843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/core/oss/pcm_oss.c:2377:3: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 17 Dec 2021 07:08:07 +0800
Message-ID: <202112170722.QJcRozeU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2166450945295876843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fa36bbe6d43f3bbce1f10a187e153587c7584d83
commit: fc63a6e08a8c97a3dc3a6f2e1946b949b9a6c2d3 locking/atomic: arm: move =
to ARCH_ATOMIC
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20211215 (https://download.01.org/0day-ci/archi=
ve/20211217/202112170722.QJcRozeU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfc63a6e08a8c97a3dc3a6f2e1946b949b9a6c2d3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fc63a6e08a8c97a3dc3a6f2e1946b949b9a6c2d3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:733:6: note: 'min_period_size' is 0
           if (min_period_size) {
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
   sound/core/oss/pcm_oss.c:733:2: note: '?' condition is false
           if (min_period_size) {
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
   sound/core/oss/pcm_oss.c:733:2: note: Taking false branch
           if (min_period_size) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/oss/pcm_oss.c:742:2: note: Assuming 'max_period_size' is not =
equal to 0
           if (max_period_size) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:742:2: note: '?' condition is false
           if (max_period_size) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:742:6: note: 'max_period_size' is not equal to 0
           if (max_period_size) {
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
   sound/core/oss/pcm_oss.c:742:2: note: '?' condition is true
           if (max_period_size) {
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
   sound/core/oss/pcm_oss.c:742:2: note: Taking true branch
           if (max_period_size) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/oss/pcm_oss.c:744:21: note: '?' condition is false
                   max_period_size =3D rounddown_pow_of_two(max_period_size=
);
                                     ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   sound/core/oss/pcm_oss.c:744:21: note: Calling '__rounddown_pow_of_two'
                   max_period_size =3D rounddown_pow_of_two(max_period_size=
);
                                     ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
>> sound/core/oss/pcm_oss.c:2377:3: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   struct snd_pcm_substream *substream =3D pcm_oss_file->st=
reams[cidx];
                   ^
   sound/core/oss/pcm_oss.c:2396:2: note: Assuming 'rpcm_oss_file' is null
           if (rpcm_oss_file)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2396:2: note: '?' condition is false
           if (rpcm_oss_file)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:2396:6: note: 'rpcm_oss_file' is null
           if (rpcm_oss_file)
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
   sound/core/oss/pcm_oss.c:2396:2: note: '?' condition is false
           if (rpcm_oss_file)
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
   sound/core/oss/pcm_oss.c:2396:2: note: Taking false branch
           if (rpcm_oss_file)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/oss/pcm_oss.c:2399:17: note: Calling 'kzalloc'
           pcm_oss_file =3D kzalloc(sizeof(*pcm_oss_file), GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Storing uninitialized value
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:2399:17: note: Returning from 'kzalloc'
           pcm_oss_file =3D kzalloc(sizeof(*pcm_oss_file), GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:2400:6: note: Assuming 'pcm_oss_file' is not eq=
ual to null
           if (pcm_oss_file =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2400:2: note: '?' condition is false
           if (pcm_oss_file =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:2400:6: note: 'pcm_oss_file' is not equal to nu=
ll
           if (pcm_oss_file =3D=3D NULL)
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
   sound/core/oss/pcm_oss.c:2400:2: note: '?' condition is false
           if (pcm_oss_file =3D=3D NULL)
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
--
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2421:3: note: '?' condition is false
                   if (err < 0) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:2421:7: note: 'err' is < 0
                   if (err < 0) {
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
   sound/core/oss/pcm_oss.c:2421:3: note: '?' condition is true
                   if (err < 0) {
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
   sound/core/oss/pcm_oss.c:2421:3: note: Taking true branch
                   if (err < 0) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/oss/pcm_oss.c:2422:4: note: Calling 'snd_pcm_oss_release_file'
                           snd_pcm_oss_release_file(pcm_oss_file);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:2374:7: note: 'pcm_oss_file' is non-null
           if (!pcm_oss_file)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2374:2: note: '?' condition is false
           if (!pcm_oss_file)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:2374:7: note: 'pcm_oss_file' is non-null
           if (!pcm_oss_file)
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
   sound/core/oss/pcm_oss.c:2374:2: note: '?' condition is false
           if (!pcm_oss_file)
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
   sound/core/oss/pcm_oss.c:2374:2: note: Taking false branch
           if (!pcm_oss_file)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/oss/pcm_oss.c:2376:7: note: The value 0 is assigned to 'cidx'
           for (cidx =3D 0; cidx < 2; ++cidx) {
                ^~~~~~~~
   sound/core/oss/pcm_oss.c:2376:2: note: Loop condition is true.  Entering=
 loop body
           for (cidx =3D 0; cidx < 2; ++cidx) {
           ^
   sound/core/oss/pcm_oss.c:2377:3: note: Assigned value is garbage or unde=
fined
                   struct snd_pcm_substream *substream =3D pcm_oss_file->st=
reams[cidx];
                   ^                                     ~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
>> sound/core/oss/pcm_oss.c:2430:6: warning: Branch condition evaluates to =
a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!pcm_oss_file->streams[0] && !pcm_oss_file->streams[1]) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2396:2: note: Assuming 'rpcm_oss_file' is null
           if (rpcm_oss_file)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2396:2: note: '?' condition is false
           if (rpcm_oss_file)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:2396:6: note: 'rpcm_oss_file' is null
           if (rpcm_oss_file)
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
   sound/core/oss/pcm_oss.c:2396:2: note: '?' condition is false
           if (rpcm_oss_file)
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
   sound/core/oss/pcm_oss.c:2396:2: note: Taking false branch
           if (rpcm_oss_file)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/core/oss/pcm_oss.c:2399:17: note: Calling 'kzalloc'
           pcm_oss_file =3D kzalloc(sizeof(*pcm_oss_file), GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Storing uninitialized value
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:2399:17: note: Returning from 'kzalloc'
           pcm_oss_file =3D kzalloc(sizeof(*pcm_oss_file), GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:2400:6: note: Assuming 'pcm_oss_file' is not eq=
ual to null
           if (pcm_oss_file =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/core/oss/pcm_oss.c:2400:2: note: '?' condition is false
           if (pcm_oss_file =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/core/oss/pcm_oss.c:2400:6: note: 'pcm_oss_file' is not equal to nu=
ll
           if (pcm_oss_file =3D=3D NULL)
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
   sound/core/oss/pcm_oss.c:2400:2: note: '?' condition is false
           if (pcm_oss_file =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +2377 sound/core/oss/pcm_oss.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2370  =

6ac77bc180fbd9 Takashi Iwai   2005-11-17  2371  static int snd_pcm_oss_rele=
ase_file(struct snd_pcm_oss_file *pcm_oss_file)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2372  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2373  	int cidx;
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  2374  	if (!pcm_oss_file)
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  2375  		return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2376  	for (cidx =3D 0; cidx < 2;=
 ++cidx) {
6ac77bc180fbd9 Takashi Iwai   2005-11-17 @2377  		struct snd_pcm_substream =
*substream =3D pcm_oss_file->streams[cidx];
3bf75f9b90c981 Takashi Iwai   2006-03-27  2378  		if (substream)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2379  			snd_pcm_release_substrea=
m(substream);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2380  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2381  	kfree(pcm_oss_file);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2382  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2383  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2384  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2385  static int snd_pcm_oss_open=
_file(struct file *file,
6ac77bc180fbd9 Takashi Iwai   2005-11-17  2386  				 struct snd_pcm *pcm,
6ac77bc180fbd9 Takashi Iwai   2005-11-17  2387  				 struct snd_pcm_oss_fil=
e **rpcm_oss_file,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2388  				 int minor,
060d77b9c04acd Takashi Iwai   2006-03-27  2389  				 struct snd_pcm_oss_set=
up *setup)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2390  {
3bf75f9b90c981 Takashi Iwai   2006-03-27  2391  	int idx, err;
6ac77bc180fbd9 Takashi Iwai   2005-11-17  2392  	struct snd_pcm_oss_file *p=
cm_oss_file;
3bf75f9b90c981 Takashi Iwai   2006-03-27  2393  	struct snd_pcm_substream *=
substream;
aeb5d727062a02 Al Viro        2008-09-02  2394  	fmode_t f_mode =3D file->f=
_mode;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2395  =

7eaa943c8ed8e9 Takashi Iwai   2008-08-08  2396  	if (rpcm_oss_file)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2397  		*rpcm_oss_file =3D NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2398  =

ca2c0966562cfb Takashi Iwai   2005-09-09  2399  	pcm_oss_file =3D kzalloc(s=
izeof(*pcm_oss_file), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2400  	if (pcm_oss_file =3D=3D NU=
LL)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2401  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2402  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2403  	if ((f_mode & (FMODE_WRITE=
|FMODE_READ)) =3D=3D (FMODE_WRITE|FMODE_READ) &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2404  	    (pcm->info_flags & SND=
RV_PCM_INFO_HALF_DUPLEX))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2405  		f_mode =3D FMODE_WRITE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2406  =

0df63e44c3e315 Takashi Iwai   2006-04-28  2407  	file->f_flags &=3D ~O_APPE=
ND;
3bf75f9b90c981 Takashi Iwai   2006-03-27  2408  	for (idx =3D 0; idx < 2; i=
dx++) {
060d77b9c04acd Takashi Iwai   2006-03-27  2409  		if (setup[idx].disable)
3bf75f9b90c981 Takashi Iwai   2006-03-27  2410  			continue;
6cb53e7ed77d42 Takashi Iwai   2006-08-02  2411  		if (! pcm->streams[idx].s=
ubstream_count)
6cb53e7ed77d42 Takashi Iwai   2006-08-02  2412  			continue; /* no matching=
 substream */
3bf75f9b90c981 Takashi Iwai   2006-03-27  2413  		if (idx =3D=3D SNDRV_PCM_=
STREAM_PLAYBACK) {
3bf75f9b90c981 Takashi Iwai   2006-03-27  2414  			if (! (f_mode & FMODE_WR=
ITE))
3bf75f9b90c981 Takashi Iwai   2006-03-27  2415  				continue;
3bf75f9b90c981 Takashi Iwai   2006-03-27  2416  		} else {
3bf75f9b90c981 Takashi Iwai   2006-03-27  2417  			if (! (f_mode & FMODE_RE=
AD))
3bf75f9b90c981 Takashi Iwai   2006-03-27  2418  				continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2419  		}
3bf75f9b90c981 Takashi Iwai   2006-03-27  2420  		err =3D snd_pcm_open_subs=
tream(pcm, idx, file, &substream);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2421  		if (err < 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2422  			snd_pcm_oss_release_file=
(pcm_oss_file);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2423  			return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2424  		}
3bf75f9b90c981 Takashi Iwai   2006-03-27  2425  =

3bf75f9b90c981 Takashi Iwai   2006-03-27  2426  		pcm_oss_file->streams[idx=
] =3D substream;
060d77b9c04acd Takashi Iwai   2006-03-27  2427  		snd_pcm_oss_init_substrea=
m(substream, &setup[idx], minor);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2428  	}
3bf75f9b90c981 Takashi Iwai   2006-03-27  2429  	=

bbdc1b7dbe4157 OGAWA Hirofumi 2006-04-06 @2430  	if (!pcm_oss_file->streams=
[0] && !pcm_oss_file->streams[1]) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2431  		snd_pcm_oss_release_file(=
pcm_oss_file);
3bf75f9b90c981 Takashi Iwai   2006-03-27  2432  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2433  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2434  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2435  	file->private_data =3D pcm=
_oss_file;
7eaa943c8ed8e9 Takashi Iwai   2008-08-08  2436  	if (rpcm_oss_file)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2437  		*rpcm_oss_file =3D pcm_os=
s_file;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2438  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2439  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2440  =


:::::: The code at line 2377 was first introduced by commit
:::::: 6ac77bc180fbd985988015020c2e2347e802959d [ALSA] Remove xxx_t typedef=
s: PCM OSS-emulation

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2166450945295876843==--

