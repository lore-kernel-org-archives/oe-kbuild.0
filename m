Content-Type: multipart/mixed; boundary="===============3492107697950913117=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/fuse/dev.c:1751:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 02 Dec 2021 04:41:31 +0800
Message-ID: <202112020447.iC1mkMaO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3492107697950913117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   10 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-c007-20211118 (https://download.01.org/0day-ci/ar=
chive/20211202/202112020447.iC1mkMaO-lkp(a)intel.com/config)
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
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fuse/dev.c:993:4: note: '?' condition is false
                           if (err)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:993:8: note: 'err' is 0
                           if (err)
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
   fs/fuse/dev.c:993:4: note: '?' condition is false
                           if (err)
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
   fs/fuse/dev.c:993:4: note: Taking false branch
                           if (err)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:990:2: note: Loop condition is false. Execution continues =
on line 998
           while (size) {
           ^
   fs/fuse/dev.c:1520:8: note: Returning from 'fuse_copy_one'
           err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1521:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1521:6: note: 'err' is 0
           if (err)
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
   fs/fuse/dev.c:1521:2: note: '?' condition is false
           if (err)
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
   fs/fuse/dev.c:1521:2: note: Taking false branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:1525:21: note: The left operand of '>' is a garbage value
           if (outarg.namelen > FUSE_NAME_MAX)
                              ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> fs/fuse/dev.c:1751:9: warning: Assigned value is garbage or undefined [c=
lang-analyzer-core.uninitialized.Assign]
           nodeid =3D outarg.nodeid;
                  ^
   fs/fuse/dev.c:1849:6: note: Assuming the condition is false
           if (nbytes < sizeof(struct fuse_out_header))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fuse/dev.c:1849:2: note: '?' condition is false
           if (nbytes < sizeof(struct fuse_out_header))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1849:2: note: '?' condition is false
           if (nbytes < sizeof(struct fuse_out_header))
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
   fs/fuse/dev.c:1849:2: note: Taking false branch
           if (nbytes < sizeof(struct fuse_out_header))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:1853:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1853:6: note: 'err' is 0
           if (err)
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
   fs/fuse/dev.c:1853:2: note: '?' condition is false
           if (err)
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
   fs/fuse/dev.c:1853:2: note: Taking false branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:1857:6: note: Assuming 'nbytes' is equal to field 'len'
           if (oh.len !=3D nbytes)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fuse/dev.c:1857:2: note: '?' condition is false
           if (oh.len !=3D nbytes)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1857:16: note: 'nbytes' is equal to field 'len'
           if (oh.len !=3D nbytes)
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:46:2: note: Returning without writing =
to 'to->base_addr'
           return ret;
           ^
   arch/x86/include/asm/uaccess_64.h:52:9: note: Returning from 'copy_user_=
generic'
           return copy_user_generic(dst, (__force void *)src, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:52:2: note: Returning without writing =
to 'dst->base_addr'
           return copy_user_generic(dst, (__force void *)src, size);
           ^
   include/linux/uaccess.h:114:9: note: Returning from 'raw_copy_from_user'
           return raw_copy_from_user(to, from, n);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:114:2: note: Returning without writing to 'to->b=
ase_addr'
           return raw_copy_from_user(to, from, n);
           ^
   arch/x86/kernel/tls.c:281:11: note: Returning from '__copy_from_user'
           else if (__copy_from_user(infobuf, ubuf, count))
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
   arch/x86/kernel/tls.c:281:7: note: Assuming the condition is false
           else if (__copy_from_user(infobuf, ubuf, count))
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
   arch/x86/kernel/tls.c:281:7: note: '?' condition is false
           else if (__copy_from_user(infobuf, ubuf, count))
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
   arch/x86/kernel/tls.c:281:7: note: Taking false branch
           else if (__copy_from_user(infobuf, ubuf, count))
                ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/tls.c:286:14: note: Assuming the condition is true
           for (i =3D 0; i < count / sizeof(struct user_desc); i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/tls.c:286:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < count / sizeof(struct user_desc); i++)
           ^
   arch/x86/kernel/tls.c:287:8: note: Calling 'tls_desc_okay'
                   if (!tls_desc_okay(info + i))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/tls.c:55:6: note: The left operand of '=3D=3D' is a garb=
age value
           if (LDT_empty(info) || LDT_zero(info))
               ^
   arch/x86/include/asm/desc.h:355:22: note: expanded from macro 'LDT_empty'
           ((info)->base_addr              =3D=3D 0    &&      \
                                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
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
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/cpu/sgx/encl.c:423:13: note: Loop condition is false.  E=
xiting loop
                   va_page =3D list_first_entry(&encl->va_pages, struct sgx=
_va_page,
                             ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   arch/x86/kernel/cpu/sgx/encl.c:425:3: note: Calling 'list_del'
                   list_del(&va_page->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: '?' condition is false
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/list.h:132:2: note: '?' condition is false
           if (!__list_del_entry_valid(entry))
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
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
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
   arch/x86/kernel/kvm.c:336:7: warning: Value stored to 'pa' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
                   u64 pa =3D slow_virt_to_phys(this_cpu_ptr(&apf_reason));
                       ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kvm.c:336:7: note: Value stored to 'pa' during its initi=
alization is never read
                   u64 pa =3D slow_virt_to_phys(this_cpu_ptr(&apf_reason));
                       ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   arch/x86/kernel/unwind_orc.c:38:7: warning: Value stored to 'mid' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int *mid =3D first, *found =3D first;
                ^~~   ~~~~~
   arch/x86/kernel/unwind_orc.c:38:7: note: Value stored to 'mid' during it=
s initialization is never read
           int *mid =3D first, *found =3D first;
                ^~~   ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> arch/x86/kernel/amd_gart_64.c:743:12: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           aper_base       =3D info.aper_base;
                           ^ ~~~~~~~~~~~~~~
   arch/x86/kernel/amd_gart_64.c:717:6: note: Assuming the condition is fal=
se
           if (!amd_nb_has_feature(AMD_NB_GART))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:717:2: note: '?' condition is false
           if (!amd_nb_has_feature(AMD_NB_GART))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/amd_gart_64.c:717:6: note: Assuming the condition is fal=
se
           if (!amd_nb_has_feature(AMD_NB_GART))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
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
   arch/x86/kernel/amd_gart_64.c:717:2: note: '?' condition is false
           if (!amd_nb_has_feature(AMD_NB_GART))
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
   arch/x86/kernel/amd_gart_64.c:717:2: note: Taking false branch
           if (!amd_nb_has_feature(AMD_NB_GART))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/amd_gart_64.c:730:6: note: Assuming 'no_iommu' is 0
           if (no_iommu ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:730:6: note: Left side of '||' is false
           if (no_iommu ||
               ^
   arch/x86/kernel/amd_gart_64.c:731:7: note: Assuming 'force_iommu' is not=
 equal to 0
               (!force_iommu && max_pfn <=3D MAX_DMA32_PFN) ||
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:731:20: note: Left side of '&&' is false
               (!force_iommu && max_pfn <=3D MAX_DMA32_PFN) ||
                             ^
   arch/x86/kernel/amd_gart_64.c:732:6: note: Assuming 'gart_iommu_aperture=
' is not equal to 0
               !gart_iommu_aperture ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:730:6: note: Left side of '||' is false
           if (no_iommu ||
               ^
   arch/x86/kernel/amd_gart_64.c:733:7: note: 'no_agp' is 1
               (no_agp && init_amd_gatt(&info) < 0)) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:733:7: note: Left side of '&&' is true
               (no_agp && init_amd_gatt(&info) < 0)) {
                ^
   arch/x86/kernel/amd_gart_64.c:733:17: note: Calling 'init_amd_gatt'
               (no_agp && init_amd_gatt(&info) < 0)) {
--
                                                      ^~~~
   security/keys/dh.c:375:2: note: '?' condition is false
           if (kdfcopy) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:375:6: note: 'kdfcopy' is non-null
           if (kdfcopy) {
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
   security/keys/dh.c:375:2: note: '?' condition is true
           if (kdfcopy) {
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
   security/keys/dh.c:375:2: note: Taking true branch
           if (kdfcopy) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:380:7: note: Assuming the condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:380:3: note: '?' condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:380:7: note: Assuming the condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
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
   security/keys/dh.c:380:3: note: '?' condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
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
   security/keys/dh.c:380:3: note: Taking false branch
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:386:31: note: Passing null pointer value via 1st para=
meter 'sdesc'
                   ret =3D keyctl_dh_compute_kdf(sdesc, buffer, buflen, out=
buf,
                                               ^~~~~
   security/keys/dh.c:386:9: note: Calling 'keyctl_dh_compute_kdf'
                   ret =3D keyctl_dh_compute_kdf(sdesc, buffer, buflen, out=
buf,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   security/keys/dh.c:206:33: note: Dereference of null pointer
                                       crypto_shash_digestsize(sdesc->shash=
.tfm));
                                                               ^
   include/linux/math.h:60:18: note: expanded from macro 'roundup'
           typeof(y) __y =3D y;                              \
                           ^
>> security/keys/dh.c:400:2: warning: Potential leak of memory pointed to b=
y 'outbuf' [clang-analyzer-unix.Malloc]
           crypto_free_kpp(tfm);
           ^
   security/keys/dh.c:245:6: note: Assuming 'params' is non-null
           if (!params || (!buffer && buflen)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:6: note: Left side of '||' is false
           if (!params || (!buffer && buflen)) {
               ^
   security/keys/dh.c:245:18: note: Assuming 'buffer' is non-null
           if (!params || (!buffer && buflen)) {
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:26: note: Left side of '&&' is false
           if (!params || (!buffer && buflen)) {
                                   ^
   security/keys/dh.c:245:2: note: '?' condition is false
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:245:7: note: 'params' is non-null
           if (!params || (!buffer && buflen)) {
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
   security/keys/dh.c:245:6: note: Left side of '||' is false
           if (!params || (!buffer && buflen)) {
               ^
   security/keys/dh.c:245:19: note: 'buffer' is non-null
           if (!params || (!buffer && buflen)) {
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
   security/keys/dh.c:245:26: note: Left side of '&&' is false
           if (!params || (!buffer && buflen)) {
                                   ^
   security/keys/dh.c:245:2: note: '?' condition is false
           if (!params || (!buffer && buflen)) {
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
   security/keys/dh.c:245:2: note: Taking false branch
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:249:2: note: '?' condition is false
           if (copy_from_user(&pcopy, params, sizeof(pcopy)) !=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:249:6: note: Assuming the condition is false
           if (copy_from_user(&pcopy, params, sizeof(pcopy)) !=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           (cond) ?                                        \
            ^~~~
   security/keys/dh.c:343:2: note: '?' condition is false
           if (!outbuf) {
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
   security/keys/dh.c:343:2: note: Taking false branch
           if (!outbuf) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:351:2: note: '?' condition is false
           if (!req) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:351:7: note: 'req' is null
           if (!req) {
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
   security/keys/dh.c:351:2: note: '?' condition is true
           if (!req) {
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
   security/keys/dh.c:351:2: note: Taking true branch
           if (!req) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:353:3: note: Control jumps to line 398
                   goto out5;
                   ^
   security/keys/dh.c:400:2: note: Potential leak of memory pointed to by '=
outbuf'
           crypto_free_kpp(tfm);
           ^
   3 warnings generated.
   arch/x86/kernel/cpu/common.c:1586:4: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(c->x86_model_id, p);
                           ^~~~~~
   arch/x86/kernel/cpu/common.c:1586:4: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                           strcpy(c->x86_model_id, p);
                           ^~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/utids.c:80:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(hid->string, obj_desc->string.pointer);
                   ^~~~~~
   drivers/acpi/acpica/utids.c:80:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(hid->string, obj_desc->string.pointer);
                   ^~~~~~
   drivers/acpi/acpica/utids.c:158:3: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(uid->string, obj_desc->string.pointer);
                   ^~~~~~
   drivers/acpi/acpica/utids.c:158:3: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                   strcpy(uid->string, obj_desc->string.pointer);
                   ^~~~~~
   drivers/acpi/acpica/utids.c:292:4: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(next_id_string, cid_objects[i]->string.po=
inter);
                           ^~~~~~
   drivers/acpi/acpica/utids.c:292:4: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                           strcpy(next_id_string, cid_objects[i]->string.po=
inter);
                           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> arch/x86/kernel/cpu/sgx/main.c:80:2: warning: Address of stack memory as=
sociated with local variable 'dirty' is still referred to by the global var=
iable 'sgx_dirty_page_list' upon returning to the caller.  This will be a d=
angling reference [clang-analyzer-core.StackAddressEscape]
           list_splice(&dirty, dirty_page_list);
           ^
   arch/x86/kernel/cpu/sgx/main.c:424:2: note: Calling '__sgx_sanitize_page=
s'
           __sgx_sanitize_pages(&sgx_dirty_page_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:58:9: note: Assuming the condition is fal=
se
           while (!list_empty(dirty_page_list)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:58:2: note: Loop condition is false. Exec=
ution continues on line 80
           while (!list_empty(dirty_page_list)) {
           ^
   arch/x86/kernel/cpu/sgx/main.c:80:2: note: Address of stack memory assoc=
iated with local variable 'dirty' is still referred to by the global variab=
le 'sgx_dirty_page_list' upon returning to the caller.  This will be a dang=
ling reference
           list_splice(&dirty, dirty_page_list);
           ^
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
   drivers/tty/serial/8250/8250_mid.c:93:10: warning: 3rd function call arg=
ument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   ret |=3D hsu_dma_do_irq(chip, mid->dma_index * 2 + 1, st=
atus);
                          ^                                            ~~~~=
~~
   drivers/tty/serial/8250/8250_mid.c:81:2: note: 'status' declared without=
 an initial value
           u32 status;
           ^~~~~~~~~~
   drivers/tty/serial/8250/8250_mid.c:88:8: note: Calling 'hsu_dma_get_stat=
us'
           err =3D hsu_dma_get_status(chip, mid->dma_index * 2 + 1, &status=
);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma/hsu.h:50:2: note: Returning without writing to '*statu=
s'
           return 0;
           ^
   drivers/tty/serial/8250/8250_mid.c:88:8: note: Returning from 'hsu_dma_g=
et_status'
           err =3D hsu_dma_get_status(chip, mid->dma_index * 2 + 1, &status=
);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_mid.c:89:2: note: '?' condition is false
           if (err > 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/tty/serial/8250/8250_mid.c:89:6: note: 'err' is <=3D 0
           if (err > 0) {
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
   drivers/tty/serial/8250/8250_mid.c:89:2: note: '?' condition is false
           if (err > 0) {
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
   drivers/tty/serial/8250/8250_mid.c:89:2: note: Taking false branch
           if (err > 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/tty/serial/8250/8250_mid.c:92:9: note: '?' condition is false
           } else if (err =3D=3D 0)
                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/tty/serial/8250/8250_mid.c:92:13: note: 'err' is equal to 0
           } else if (err =3D=3D 0)
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
   drivers/tty/serial/8250/8250_mid.c:92:9: note: '?' condition is true
           } else if (err =3D=3D 0)
--
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
   fs/splice.c:632:16: note: 'array' is non-null
           if (unlikely(!array))
                         ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
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
   fs/splice.c:632:2: note: '?' condition is false
           if (unlikely(!array))
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
   fs/splice.c:632:2: note: Taking false branch
           if (unlikely(!array))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/splice.c:638:2: note: Loop condition is false. Execution continues on=
 line 717
           while (sd.total_len) {
           ^
   fs/splice.c:722:2: note: '?' condition is false
           if (sd.num_spliced)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/splice.c:722:9: note: Field 'num_spliced' is 0
           if (sd.num_spliced)
                  ^
   fs/splice.c:722:2: note: '?' condition is false
           if (sd.num_spliced)
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
   fs/splice.c:722:2: note: Taking false branch
           if (sd.num_spliced)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/splice.c:725:2: note: Undefined or garbage value returned to caller
           return ret;
           ^      ~~~
   fs/splice.c:853:2: warning: Value stored to 'ret' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/splice.c:853:2: note: Value stored to 'ret' is never read
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> kernel/events/uprobes.c:1773:3: warning: The expression is an uninitiali=
zed value. The computed value will also be garbage [clang-analyzer-core.uni=
nitialized.Assign]
                   n_utask->depth++;
                   ^
   kernel/events/uprobes.c:1806:6: note: Assuming 'utask' is non-null
           if (!utask || !utask->return_instances)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/uprobes.c:1806:6: note: Left side of '||' is false
           if (!utask || !utask->return_instances)
               ^
   kernel/events/uprobes.c:1806:16: note: Assuming field 'return_instances'=
 is non-null
           if (!utask || !utask->return_instances)
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/uprobes.c:1806:2: note: '?' condition is false
           if (!utask || !utask->return_instances)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/events/uprobes.c:1806:7: note: 'utask' is non-null
           if (!utask || !utask->return_instances)
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
   kernel/events/uprobes.c:1806:6: note: Left side of '||' is false
           if (!utask || !utask->return_instances)
               ^
   kernel/events/uprobes.c:1806:24: note: Field 'return_instances' is non-n=
ull
           if (!utask || !utask->return_instances)
                                 ^
   kernel/events/uprobes.c:1806:2: note: '?' condition is false
           if (!utask || !utask->return_instances)
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
   kernel/events/uprobes.c:1806:2: note: Taking false branch
           if (!utask || !utask->return_instances)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/events/uprobes.c:1809:6: note: Assuming 'mm' is not equal to fiel=
d 'mm'
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/uprobes.c:1809:18: note: Left side of '&&' is false
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
                           ^
   kernel/events/uprobes.c:1809:2: note: '?' condition is false
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/events/uprobes.c:1809:6: note: 'mm' is not equal to field 'mm'
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
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
--
   ^
   drivers/pci/hotplug/pci_hotplug_core.c:56:11: note: expanded from macro =
'GET_STATUS'
           if (ops->get_##name)                                            \
                    ^
   note: expanded from here
   drivers/pci/hotplug/pci_hotplug_core.c:65:1: note: '?' condition is false
   GET_STATUS(adapter_status, u8)
   ^
   drivers/pci/hotplug/pci_hotplug_core.c:56:2: note: expanded from macro '=
GET_STATUS'
           if (ops->get_##name)                                            \
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
   drivers/pci/hotplug/pci_hotplug_core.c:65:1: note: Taking false branch
   GET_STATUS(adapter_status, u8)
   ^
   drivers/pci/hotplug/pci_hotplug_core.c:56:2: note: expanded from macro '=
GET_STATUS'
           if (ops->get_##name)                                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/pci_hotplug_core.c:65:1: note: Returning without wri=
ting to '*value'
   GET_STATUS(adapter_status, u8)
   ^
   drivers/pci/hotplug/pci_hotplug_core.c:59:2: note: expanded from macro '=
GET_STATUS'
           return retval;                                                  \
           ^
   drivers/pci/hotplug/pci_hotplug_core.c:191:11: note: Returning from 'get=
_adapter_status'
           retval =3D get_adapter_status(pci_slot->hotplug, &value);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/hotplug/pci_hotplug_core.c:192:2: note: '?' condition is fal=
se
           if (retval)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/pci/hotplug/pci_hotplug_core.c:192:6: note: 'retval' is 0
           if (retval)
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
   drivers/pci/hotplug/pci_hotplug_core.c:192:2: note: '?' condition is fal=
se
           if (retval)
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
   drivers/pci/hotplug/pci_hotplug_core.c:192:2: note: Taking false branch
           if (retval)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/pci/hotplug/pci_hotplug_core.c:195:9: note: 3rd function call ar=
gument is an uninitialized value
           return sysfs_emit(buf, "%d\n", value);
                  ^                       ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   kernel/gcov/fs.c:532:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(node->name, name);
                   ^~~~~~
   kernel/gcov/fs.c:532:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(node->name, name);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (1 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 with check filters).
   3 warnings generated.
>> kernel/kprobes.c:237:8: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                               ^
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
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
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
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
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
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
   kernel/kprobes.c:253:2: note: Left side of '||' is true
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   kernel/kprobes.c:253:2: note: '?' condition is true
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
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
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
--
                                                      ^~~~
   kernel/kprobes.c:199:6: note: Assuming field 'nused' is equal to 0
           if (kip->nused =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/kprobes.c:199:2: note: '?' condition is false
           if (kip->nused =3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:199:11: note: Field 'nused' is equal to 0
           if (kip->nused =3D=3D 0) {
                    ^
   kernel/kprobes.c:199:2: note: '?' condition is true
           if (kip->nused =3D=3D 0) {
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
   kernel/kprobes.c:199:2: note: Taking true branch
           if (kip->nused =3D=3D 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:206:3: note: '?' condition is false
                   if (!list_is_singular(&kip->list)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:206:3: note: '?' condition is true
                   if (!list_is_singular(&kip->list)) {
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
   kernel/kprobes.c:206:3: note: Taking true branch
                   if (!list_is_singular(&kip->list)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:217:4: note: Memory is released
                           kfree(kip);
                           ^~~~~~~~~~
   kernel/kprobes.c:237:43: note: Returning; memory was released via 1st pa=
rameter
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                                                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/kprobes.c:237:4: note: '?' condition is false
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:237:8: note: Use of memory after it is freed
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
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
>> kernel/kprobes.c:2037:2: warning: Potential leak of memory pointed to by=
 'inst' [clang-analyzer-unix.Malloc]
           refcount_set(&rp->rph->ref, i);
           ^
   kernel/kprobes.c:1991:2: note: Assuming 'ret' is 0
           if (ret)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/kprobes.c:1991:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:1991:6: note: 'ret' is 0
           if (ret)
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
   kernel/kprobes.c:1991:2: note: '?' condition is false
           if (ret)
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
   kernel/kprobes.c:1991:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:1995:13: note: Field 'addr' is non-null
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
                      ^
   kernel/kprobes.c:1995:6: note: Left side of '&&' is true
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
               ^
   kernel/kprobes.c:1995:2: note: '?' condition is false
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:1995:6: note: Assuming field 'addr' is null
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
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
   kernel/kprobes.c:1995:18: note: Left side of '&&' is false
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
                           ^
   kernel/kprobes.c:1995:2: note: '?' condition is false
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
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
   kernel/kprobes.c:1995:2: note: Taking false branch
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:1998:2: note: Assuming 'kretprobe_blacklist_size' is 0
           if (kretprobe_blacklist_size) {
--
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/regulator/core.c:1647:3: note: Control jumps to line 1656
                   goto fail;
                   ^
   drivers/regulator/core.c:1657:2: note: 1st function call argument is an =
uninitialized value
           kfree(new_node->dev_name);
           ^     ~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:3791:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3791:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/dax/bus.c:585:6: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
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
   drivers/dax/bus.c:553:2: note: Assuming the condition is true
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:553:2: note: '?' condition is false
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:553:2: note: '?' condition is false
           if (dev_get_drvdata(parent)) {
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
   drivers/dax/bus.c:553:2: note: Taking false branch
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:558:7: note: Assuming the condition is true
           if (!IS_ALIGNED(range->start, align)
                ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:558:6: note: Left side of '||' is false
           if (!IS_ALIGNED(range->start, align)
               ^
   drivers/dax/bus.c:559:8: note: Assuming the condition is true
                           || !IS_ALIGNED(range_len(range), align))
                               ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:558:2: note: '?' condition is false
           if (!IS_ALIGNED(range->start, align)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:558:6: note: Left side of '||' is false
           if (!IS_ALIGNED(range->start, align)
               ^
   drivers/dax/bus.c:558:2: note: '?' condition is false
           if (!IS_ALIGNED(range->start, align)
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
   drivers/dax/bus.c:558:2: note: Taking false branch
           if (!IS_ALIGNED(range->start, align)
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
   drivers/dax/bus.c:879:12: note: Assuming '__UNIQUE_ID___x311' is >=3D '_=
_UNIQUE_ID___y312'
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
                  ^~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/write.c:1787:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(page_list)) {
           ^
   fs/nfs/write.c:1791:7: note: Assuming field 'dreq' is null
                   if (!cinfo->dreq)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/nfs/write.c:1791:3: note: '?' condition is false
                   if (!cinfo->dreq)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/nfs/write.c:1791:15: note: Field 'dreq' is null
                   if (!cinfo->dreq)
                               ^
   fs/nfs/write.c:1791:3: note: '?' condition is true
                   if (!cinfo->dreq)
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
   fs/nfs/write.c:1791:3: note: Taking true branch
                   if (!cinfo->dreq)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nfs/write.c:1792:4: note: Calling 'nfs_clear_page_commit'
                           nfs_clear_page_commit(req->wb_page);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/write.c:953:2: note: Calling '__dec_node_page_state'
           dec_node_page_state(page, NR_WRITEBACK);
           ^
   include/linux/vmstat.h:401:29: note: expanded from macro 'dec_node_page_=
state'
   #define dec_node_page_state __dec_node_page_state
                               ^
   include/linux/vmstat.h:388:19: note: Calling 'page_pgdat'
           __dec_node_state(page_pgdat(page), item);
                            ^~~~~~~~~~~~~~~~
   include/linux/mm.h:1546:19: note: Calling 'page_to_nid'
           return NODE_DATA(page_to_nid(page));
                            ^~~~~~~~~~~~~~~~~
   include/linux/mm.h:1378:10: note: Access to field 'flags' results in a d=
ereference of a null pointer
           return (PF_POISONED_CHECK(p)->flags >> NODES_PGSHIFT) & NODES_MA=
SK;
                   ^
   include/linux/page-flags.h:246:33: note: expanded from macro 'PF_POISONE=
D_CHECK'
   #define PF_POISONED_CHECK(page) ({                                      \
                                   ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/misc/dw-xdata-pcie.c:96:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:96:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:164:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:164:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:389:2: warning: Value stored=
 to 'hop2_pte_addr' is never read [clang-analyzer-deadcode.DeadStores]
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:389:2: note: Value stored to=
 'hop2_pte_addr' is never read
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
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
>> drivers/misc/habanalabs/common/device.c:134:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           if (!hl_hpriv_put(hpriv))
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
   drivers/misc/habanalabs/common/device.c:120:6: note: Assuming 'hdev' is =
non-null
           if (!hdev) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:120:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/device.c:120:7: note: 'hdev' is non-null
           if (!hdev) {
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
   drivers/misc/habanalabs/common/device.c:120:2: note: '?' condition is fa=
lse
           if (!hdev) {
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
   drivers/misc/habanalabs/common/device.c:120:2: note: Taking false branch
           if (!hdev) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/misc/habanalabs/common/device.c:134:7: note: Calling 'hl_hpriv_p=
ut'
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:102:9: note: Calling 'kref_put'
           return kref_put(&hpriv->refcount, hpriv_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
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
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'hpriv_release'
                   release(kref);
--
   drivers/usb/gadget/configfs.c:892:2: note: 'cdev' initialized to a null =
pointer value
           struct usb_composite_dev *cdev =3D &gi->cdev;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/configfs.c:894:3: note: Left side of '&&' is false
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/configfs.c:894:3: note: '?' condition is true
                   container_of(to_config_group(usb_cfg_ci),
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
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/usb/gadget/configfs.c:894:3: note: Left side of '&&' is false
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/configfs.c:894:3: note: Taking false branch
                   container_of(to_config_group(usb_cfg_ci),
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
   drivers/usb/gadget/configfs.c:894:3: note: Loop condition is false.  Exi=
ting loop
                   container_of(to_config_group(usb_cfg_ci),
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
   drivers/usb/gadget/configfs.c:900:2: note: Access to field 'next' result=
s in a dereference of a null pointer
           list_for_each_entry(c, &cdev->configs, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
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
>> drivers/media/dvb-frontends/au8522_common.c:111:56: warning: The express=
ion is an uninitialized value. The computed value will also be garbage [cla=
ng-analyzer-core.uninitialized.Assign]
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                                                                 ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Left side of '&=
&' is false
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: '?' condition i=
s true
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Left side of '&=
&' is false
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Taking false br=
anch
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Loop condition =
is false.  Exiting loop
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
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
   fs/fuse/cuse.c:359:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:359:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/btrfs/ctree.c:1137:4: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           ret =3D wret;
                           ^     ~~~~
   fs/btrfs/ctree.c:1137:4: note: Value stored to 'ret' is never read
                           ret =3D wret;
                           ^     ~~~~
   fs/btrfs/ctree.c:1191:4: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           ret =3D wret;
                           ^     ~~~~
   fs/btrfs/ctree.c:1191:4: note: Value stored to 'ret' is never read
                           ret =3D wret;
                           ^     ~~~~
   fs/btrfs/ctree.c:1505:3: warning: Value stored to 'b' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   b =3D p->nodes[level];
                   ^   ~~~~~~~~~~~~~~~
   fs/btrfs/ctree.c:1505:3: note: Value stored to 'b' is never read
                   b =3D p->nodes[level];
                   ^   ~~~~~~~~~~~~~~~
   fs/btrfs/ctree.c:3769:2: warning: Value stored to 'data_end' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           data_end =3D old_data;
           ^          ~~~~~~~~
   fs/btrfs/ctree.c:3769:2: note: Value stored to 'data_end' is never read
           data_end =3D old_data;
           ^          ~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/dvb-frontends/cx24117.c:1133:56: warning: The expression i=
s an uninitialized value. The computed value will also be garbage [clang-an=
alyzer-core.uninitialized.Assign]
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                                                                 ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Left side of '&&' is=
 false
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: '?' condition is true
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Left side of '&&' is=
 false
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Taking false branch
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Loop condition is fa=
lse.  Exiting loop
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
   include/linux/inetdevice.h:284:2: note: '?' condition is true
           if (logmask)
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
   include/linux/inetdevice.h:284:2: note: Taking true branch
           if (logmask)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/inetdevice.h:285:21: note: The result of the left shift is=
 undefined because the right operand is negative
                   return htonl(~((1U<<(32-logmask))-1));
                                     ^
   include/linux/byteorder/generic.h:139:27: note: expanded from macro 'hto=
nl'
   #define htonl(x) ___htonl(x)
                             ^
   include/linux/byteorder/generic.h:134:35: note: expanded from macro '___=
htonl'
   #define ___htonl(x) __cpu_to_be32(x)
                                     ^
   include/uapi/linux/byteorder/little_endian.h:39:53: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                                       ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   net/ipv4/devinet.c:1267:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ifr.ifr_name, ifa->ifa_label);
                   ^~~~~~
   net/ipv4/devinet.c:1267:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(ifr.ifr_name, ifa->ifa_label);
                   ^~~~~~
   net/ipv4/devinet.c:1496:4: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1496:4: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                           strcat(ifa->ifa_label, dot);
                           ^~~~~~
   net/ipv4/devinet.c:1498:4: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1498:4: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                           strcpy(ifa->ifa_label + (IFNAMSIZ - strlen(dot) =
- 1), dot);
                           ^~~~~~
   net/ipv4/devinet.c:1540:5: warning: Value stored to 'in_dev' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   net/ipv4/devinet.c:1540:5: note: Value stored to 'in_dev' is never read
                                   in_dev =3D inetdev_init(dev);
                                   ^        ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/usb/gadget/function/f_mass_storage.c:350:3: warning: Value store=
d to 'name' is never read [clang-analyzer-deadcode.DeadStores]
                   name =3D "bulk-in";
                   ^      ~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:350:3: note: Value stored t=
o 'name' is never read
                   name =3D "bulk-in";
                   ^      ~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:352:3: warning: Value store=
d to 'name' is never read [clang-analyzer-deadcode.DeadStores]
                   name =3D "bulk-out";
                   ^      ~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:352:3: note: Value stored t=
o 'name' is never read
                   name =3D "bulk-out";
                   ^      ~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:354:3: warning: Value store=
d to 'name' is never read [clang-analyzer-deadcode.DeadStores]
                   name =3D ep->name;
                   ^      ~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:354:3: note: Value stored t=
o 'name' is never read
                   name =3D ep->name;
                   ^      ~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:924:2: warning: Value store=
d to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc =3D invalidate_mapping_pages(inode->i_mapping, 0, -1);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:924:2: note: Value stored t=
o 'rc' is never read
           rc =3D invalidate_mapping_pages(inode->i_mapping, 0, -1);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1583:3: warning: Value stor=
ed to 'sdinfo' is never read [clang-analyzer-deadcode.DeadStores]
                   sdinfo =3D curlun->sense_data_info;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1583:3: note: Value stored =
to 'sdinfo' is never read
                   sdinfo =3D curlun->sense_data_info;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c:1592:3: warning: Value stor=
ed to 'sd' is never read [clang-analyzer-deadcode.DeadStores]
                   sd =3D SS_INVALID_COMMAND;
                   ^
   drivers/usb/gadget/function/f_mass_storage.c:1592:3: note: Value stored =
to 'sd' is never read
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/usb/gadget/function/f_fs.c:1050:8: warning: Potential leak of me=
mory pointed to by 'data' [clang-analyzer-unix.Malloc]
                   WARN(1, "%s: data_len =3D=3D -EINVAL\n", __func__);
                        ^
   drivers/usb/gadget/function/f_fs.c:951:14: note: Assuming field 'state' =
is equal to FFS_ACTIVE
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
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
   drivers/usb/gadget/function/f_fs.c:951:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/gadget/function/f_fs.c:951:2: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
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
   drivers/usb/gadget/function/f_fs.c:951:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/gadget/function/f_fs.c:951:2: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/typec/class.c:520:7: note: 'alt' is non-null
           if (!alt) {
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
   drivers/usb/typec/class.c:520:2: note: '?' condition is false
           if (!alt) {
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
   drivers/usb/typec/class.c:520:2: note: Taking false branch
           if (!alt) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/typec/class.c:528:13: note: Assigned value is garbage or und=
efined
           alt->roles =3D desc->roles;
                      ^ ~~~~~~~~~~~
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
   6 warnings generated.
   fs/minix/dir.c:337:3: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(de3->name, ".");
                   ^~~~~~
   fs/minix/dir.c:337:3: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
                   strcpy(de3->name, ".");
                   ^~~~~~
   fs/minix/dir.c:340:3: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(de3->name, "..");
                   ^~~~~~
   fs/minix/dir.c:340:3: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
                   strcpy(de3->name, "..");
                   ^~~~~~
   fs/minix/dir.c:345:3: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(de->name, ".");
                   ^~~~~~
   fs/minix/dir.c:345:3: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
                   strcpy(de->name, ".");
                   ^~~~~~
   fs/minix/dir.c:348:3: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(de->name, "..");
                   ^~~~~~
   fs/minix/dir.c:348:3: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
                   strcpy(de->name, "..");
                   ^~~~~~
   fs/minix/dir.c:429:3: warning: Value stored to 'err' is never read [clan=
g-analyzer-deadcode.DeadStores]
                   err =3D dir_commit_chunk(page, pos, sbi->s_dirsize);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/minix/dir.c:429:3: note: Value stored to 'err' is never read
                   err =3D dir_commit_chunk(page, pos, sbi->s_dirsize);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
>> drivers/media/tuners/mxl5007t.c:853:63: warning: The expression is an un=
initialized value. The computed value will also be garbage [clang-analyzer-=
core.uninitialized.Assign]
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                                                                        ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mxl5007t.c:853:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/media/tuners/mxl5007t.c:853:13: note: '?' condition is true
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/mxl5007t.c:853:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/media/tuners/mxl5007t.c:853:13: note: Taking false branch
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/tuners/mxl5007t.c:853:13: note: Loop condition is false.  =
Exiting loop
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
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
   drivers/media/tuners/max2165.c:66:3: note: '?' condition is false
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
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
   drivers/media/tuners/max2165.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:24:3: note: expanded from macro 'dprintk'
                   if (debug) \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/max2165.c:66:3: note: Loop condition is false.  Exi=
ting loop
                   dprintk("%s: error reg=3D0x%x, ret=3D%i\n", __func__, re=
g, ret);
                   ^
   drivers/media/tuners/max2165.c:23:2: note: expanded from macro 'dprintk'
           do { \
           ^
   drivers/media/tuners/max2165.c:67:3: note: Returning without writing to =
'*p_data'
                   return -EIO;
                   ^
   drivers/media/tuners/max2165.c:101:3: note: Returning from 'max2165_read=
_reg'
                   max2165_read_reg(priv, REG_ROM_TABLE_DATA, &dat[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/max2165.c:99:2: note: Loop condition is false. Exec=
ution continues on line 104
           for (i =3D 0; i < 3; i++) {
           ^
   drivers/media/tuners/max2165.c:108:36: note: The left operand of '&' is =
a garbage value
           priv->bb_filter_7mhz_cfg =3D dat[2] & 0x0F;
                                      ~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/hfsplus/xattr_security.c:53:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(xattr_name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/hfsplus/xattr_security.c:53:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(xattr_name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/hfsplus/xattr_security.c:54:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(xattr_name +
                   ^~~~~~
   fs/hfsplus/xattr_security.c:54:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(xattr_name +
                   ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ecryptfs/inode.c:933:4: warning: Value stored to 'rc' is never read [=
clang-analyzer-deadcode.DeadStores]
                           rc =3D 0;
                           ^    ~
   fs/ecryptfs/inode.c:933:4: note: Value stored to 'rc' is never read
                           rc =3D 0;
                           ^    ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ecryptfs/main.c:401:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(mount_crypt_stat->global_default_fn_cipher_name,
                   ^~~~~~
   fs/ecryptfs/main.c:401:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(mount_crypt_stat->global_default_fn_cipher_name,
                   ^~~~~~
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
   drivers/char/agp/isoch.c:441:2: note: '?' condition is true
           if (isoch) {
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
   drivers/char/agp/isoch.c:441:2: note: Taking true branch
           if (isoch) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/agp/isoch.c:443:3: note: Assuming 'ret' is not equal to 0
                   if (ret) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/agp/isoch.c:443:3: note: '?' condition is false
                   if (ret) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/agp/isoch.c:443:7: note: 'ret' is not equal to 0
                   if (ret) {
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
   drivers/char/agp/isoch.c:443:3: note: '?' condition is true
                   if (ret) {
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
   drivers/char/agp/isoch.c:443:3: note: Taking true branch
                   if (ret) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/agp/isoch.c:444:4: note: Loop condition is false.  Exiting =
loop
                           dev_info(&td->dev, "something bad happened setti=
ng "
                           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/char/agp/isoch.c:451:55: note: Passing the value 0 via 3rd param=
eter 'ndevs'
           agp_3_5_nonisochronous_node_enable(bridge, dev_list, ndevs);
                                                                ^~~~~
   drivers/char/agp/isoch.c:451:2: note: Calling 'agp_3_5_nonisochronous_no=
de_enable'
           agp_3_5_nonisochronous_node_enable(bridge, dev_list, ndevs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/agp/isoch.c:295:12: note: Division by zero
           mrq =3D trq / ndevs;
                 ~~~~^~~~~~~
>> drivers/char/agp/isoch.c:365:5: warning: Potential leak of memory pointe=
d to by 'cur' [clang-analyzer-unix.Malloc]
                                   if ((cur =3D kmalloc(sizeof(*cur), GFP_K=
ERNEL)) =3D=3D NULL) {
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   drivers/char/agp/isoch.c:329:6: note: Assuming 'isoch' is not equal to 0
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/agp/isoch.c:329:2: note: '?' condition is false
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/agp/isoch.c:329:6: note: 'isoch' is not equal to 0
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
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
   drivers/char/agp/isoch.c:329:2: note: '?' condition is false
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
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
   drivers/char/agp/isoch.c:329:2: note: Taking false branch
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/agp/isoch.c:336:6: note: Assuming the condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/agp/isoch.c:336:2: note: '?' condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/agp/isoch.c:336:6: note: Assuming the condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
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
   drivers/char/agp/isoch.c:336:2: note: '?' condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
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
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/nvme/host/core.c:590:23: note: Taking false branch
           struct nvme_ns *ns =3D container_of(kref, struct nvme_ns, kref);
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
   drivers/nvme/host/core.c:590:23: note: Loop condition is false.  Exiting=
 loop
           struct nvme_ns *ns =3D container_of(kref, struct nvme_ns, kref);
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
   drivers/nvme/host/core.c:595:2: note: Memory is released
           kfree(ns);
           ^~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/nvme/host/core.c:605:2: note: Returning; memory was released
           kref_put(&ns->kref, nvme_free_ns);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3872:2: note: Returning; memory was released vi=
a 1st parameter
           nvme_put_ns(ns);
           ^~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3880:3: note: Returning; memory was released vi=
a 1st parameter
                   nvme_ns_remove(ns);
                   ^~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:3881:3: note: Use of memory after it is freed
                   nvme_put_ns(ns);
                   ^           ~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/cxd2841er.c:3600:25: warning: Value stored t=
o 'priv' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3600:25: note: Value stored to '=
priv' during its initialization is never read
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3759:25: warning: Value stored t=
o 'priv' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3759:25: note: Value stored to '=
priv' during its initialization is never read
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3812:34: warning: Value stored t=
o 'p' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3812:34: note: Value stored to '=
p' during its initialization is never read
           struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: warning: Value stored to=
 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: note: Value stored to 's=
tatus' is never read
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: warning: Value stored to=
 'operation_mode' is never read [clang-analyzer-deadcode.DeadStores]
                   operation_mode |=3D OFDM_SC_RA_RAM_OP_AUTO_RATE__M;
                   ^
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: note: Value stored to 'o=
peration_mode' is never read
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: warning: Value stored to=
 'fec_rs_prescale' is never read [clang-analyzer-deadcode.DeadStores]
           fec_rs_prescale =3D 1;
           ^                 ~
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: note: Value stored to 'f=
ec_rs_prescale' is never read
           fec_rs_prescale =3D 1;
           ^                 ~
>> drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value=
 is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           *ucblocks =3D (u32) err;
                     ^ ~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6676:2: note: 'err' declared wit=
hout an initial value
           u16 err;
           ^~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Assuming 'debug' i=
s < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
   ~~~~^~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: '?' condition is f=
alse
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   include/linux/compiler.h:56:28: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: 'debug' is < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~
   include/linux/compiler.h:56:47: note: expanded from macro '\if'
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
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: '?' condition is f=
alse
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   include/linux/compiler.h:56:28: note: expanded from macro '\if'
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
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Taking false branch
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   include/linux/compiler.h:56:23: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Loop condition is =
false.  Exiting loop
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:6: note: Assuming field 'm_=
drxk_state' is not equal to DRXK_NO_DEV
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/dvb-frontends/drxk_hard.c:6680:2: note: '?' condition is f=
alse
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:13: note: Field 'm_drxk_sta=
te' is not equal to DRXK_NO_DEV
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
                      ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:2: note: '?' condition is f=
alse
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/nfs/callback_xdr.c:893:2: note: '?' condition is false
           if (status =3D=3D htonl(NFS4ERR_OP_ILLEGAL))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/nfs/callback_xdr.c:893:6: note: Assuming the condition is false
           if (status =3D=3D htonl(NFS4ERR_OP_ILLEGAL))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
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
   fs/nfs/callback_xdr.c:893:2: note: '?' condition is false
           if (status =3D=3D htonl(NFS4ERR_OP_ILLEGAL))
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
   fs/nfs/callback_xdr.c:893:2: note: Taking false branch
           if (status =3D=3D htonl(NFS4ERR_OP_ILLEGAL))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nfs/callback_xdr.c:895:2: note: Assuming 'status' is not equal to 0
           if (status)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/nfs/callback_xdr.c:895:2: note: '?' condition is false
           if (status)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/nfs/callback_xdr.c:895:6: note: 'status' is not equal to 0
           if (status)
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
   fs/nfs/callback_xdr.c:895:2: note: '?' condition is true
           if (status)
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
   fs/nfs/callback_xdr.c:895:2: note: Taking true branch
           if (status)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nfs/callback_xdr.c:896:3: note: Control jumps to line 914
                   goto encode_hdr;
                   ^
   fs/nfs/callback_xdr.c:914:8: note: 2nd function call argument is an unin=
itialized value
           res =3D encode_op_hdr(xdr_out, op_nr, status);
                 ^                      ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/hpfs/dnode.c:252:2: warning: Potential leak of memory pointed to by '=
nname' [clang-analyzer-unix.Malloc]
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:252:16: note: Memory is allocated
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: Potential leak of memory pointed to by 'nna=
me'
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:289:11: warning: Potential leak of memory pointed to by =
'nd' [clang-analyzer-unix.Malloc]
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:252:2: note: Taking false branch
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:257:6: note: Assuming 'namelen' is < 256
           if (namelen >=3D 256) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:257:2: note: '?' condition is false
           if (namelen >=3D 256) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:257:6: note: 'namelen' is < 256
           if (namelen >=3D 256) {
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
   fs/hpfs/dnode.c:257:2: note: '?' condition is false
           if (namelen >=3D 256) {
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
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:289:7: note: 'nd' is null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:2: note: '?' condition is true
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:2: note: Taking true branch
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:289:22: note: Memory is allocated
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:289:17: note: Assuming 'nd' is non-null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:289:11: note: '?' condition is false
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:289:17: note: Assuming 'nd' is non-null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:11: note: '?' condition is false
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
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
   fs/hpfs/dnode.c:289:11: note: Potential leak of memory pointed to by 'nd'
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:496:2: warning: Potential leak of memory pointed to by '=
nde' [clang-analyzer-unix.Malloc]
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:444:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/hpfs/dnode.c:445:3: note: Assuming field 'sb_chk' is 0
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:445:3: note: '?' condition is false
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:445:25: note: Field 'sb_chk' is 0
                   if (hpfs_sb(i->i_sb)->sb_chk)
                                         ^
   fs/hpfs/dnode.c:445:3: note: '?' condition is false
                   if (hpfs_sb(i->i_sb)->sb_chk)
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
   fs/hpfs/dnode.c:445:3: note: Taking false branch
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:448:9: note: Assuming 'dnode' is non-null
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:448:3: note: '?' condition is false
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:448:9: note: Assuming 'dnode' is non-null
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
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
   fs/hpfs/dnode.c:448:3: note: '?' condition is false
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
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
   fs/hpfs/dnode.c:448:3: note: Taking false branch
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:463:12: note: Field 'down' is 0
                   if (!de->down) break;
                            ^
   fs/hpfs/dnode.c:463:3: note: '?' condition is true
                   if (!de->down) break;
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
   fs/hpfs/dnode.c:463:3: note: Taking true branch
                   if (!de->down) break;
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:463:18: note:  Execution continues on line 467
                   if (!de->down) break;
                                  ^
   fs/hpfs/dnode.c:467:11: note: Assuming 'de' is non-null
           while (!(de =3D dnode_pre_last_de(dnode))) {
                    ^~
   fs/hpfs/dnode.c:467:2: note: Loop condition is false. Execution continue=
s on line 493
           while (!(de =3D dnode_pre_last_de(dnode))) {
           ^
   fs/hpfs/dnode.c:496:14: note: Memory is allocated
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:496:8: note: Assuming 'nde' is non-null
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:496:2: note: '?' condition is false
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:496:8: note: Assuming 'nde' is non-null
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
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
   fs/hpfs/dnode.c:496:2: note: '?' condition is false
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
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
   fs/hpfs/dnode.c:496:2: note: Potential leak of memory pointed to by 'nde'
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:610:3: warning: Potential leak of memory pointed to by '=
de_cp' [clang-analyzer-unix.Malloc]
                   if (!(de_cp =3D kmalloc(le16_to_cpu(de->length), GFP_NOF=
S))) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:528:2: note: Assuming the condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:528:2: note: '?' condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:528:2: note: Assuming the condition is true
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
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
   fs/hpfs/dnode.c:528:2: note: '?' condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
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
   fs/hpfs/dnode.c:528:2: note: Taking false branch
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:529:8: note: Assuming 'dnode' is non-null
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:529:2: note: '?' condition is false
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:529:8: note: Assuming 'dnode' is non-null
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
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
   fs/hpfs/dnode.c:529:2: note: '?' condition is false
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
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
                         ^
   fs/xfs/xfs_file.c:50:3: note: '?' condition is false
                   if (!is_power_of_2(mp->m_sb.sb_rextsize)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/xfs_file.c:50:3: note: '?' condition is true
                   if (!is_power_of_2(mp->m_sb.sb_rextsize)) {
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
   fs/xfs/xfs_file.c:50:3: note: Taking true branch
                   if (!is_power_of_2(mp->m_sb.sb_rextsize)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/xfs/xfs_file.c:54:4: note: The value 0 is assigned to 'rextbytes'
                           rextbytes =3D XFS_FSB_TO_B(mp, mp->m_sb.sb_rexts=
ize);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/xfs/xfs_file.c:55:21: note: Passing the value 0 via 2nd parameter 'di=
visor'
                           div_u64_rem(pos, rextbytes, &mod);
                                            ^~~~~~~~~
   fs/xfs/xfs_file.c:55:4: note: Calling 'div_u64_rem'
                           div_u64_rem(pos, rextbytes, &mod);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:28:24: note: Division by zero
           *remainder =3D dividend % divisor;
                        ~~~~~~~~~^~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/input/touchscreen/pixcir_i2c_ts.c:152:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D &ts->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/pixcir_i2c_ts.c:152:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D &ts->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
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
   drivers/input/touchscreen/sur40.c:403:22: warning: Value stored to 'sur4=
0' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct sur40_state *sur40 =3D input_get_drvdata(input);
                               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/sur40.c:403:22: note: Value stored to 'sur40' =
during its initialization is never read
           struct sur40_state *sur40 =3D input_get_drvdata(input);
                               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
>> fs/hpfs/ea.c:54:2: warning: Potential leak of memory pointed to by 'ret'=
 [clang-analyzer-unix.Malloc]
           if (!(ret =3D kmalloc(size + 1, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/ea.c:138:29: note: Assuming 'ea' is < 'ea_end'
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
                                      ^~~~~~~~~~~
   fs/hpfs/ea.c:138:2: note: Loop condition is true.  Entering loop body
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
           ^
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/ea.c:139:7: note: Assuming the condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: Taking false branch
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/ea.c:138:29: note: Assuming 'ea' is < 'ea_end'
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
                                      ^~~~~~~~~~~
   fs/hpfs/ea.c:138:2: note: Loop condition is true.  Entering loop body
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
           ^
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/ea.c:139:7: note: Assuming the condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
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
   fs/hpfs/ea.c:139:3: note: Taking false branch
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/usb/dvb-usb-v2/af9015.c:144:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:144:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:270:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:270:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:342:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:342:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:542:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:542:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:556:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:556:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:923:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:923:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1105:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1105:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1298:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1298:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1319:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1319:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1398:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1398:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/xfs/xfs_ioctl32.c:456:3: warning: Value stored to 'cmd' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   cmd =3D _NATIVE_IOC(cmd, struct xfs_flock64);
                   ^
   fs/xfs/xfs_ioctl32.c:456:3: note: Value stored to 'cmd' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/xfs/xfs_pnfs.c:39:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_pnfs.c:39:3: note: Value stored to 'error' is never read
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> fs/xfs/scrub/bmap.c:625:2: warning: Undefined or garbage value returned =
to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return error;
           ^      ~~~~~
   fs/xfs/scrub/bmap.c:582:26: note: Assuming 'whichfork' is not equal to 0
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:582:26: note: '?' condition is false
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/scrub/bmap.c:582:26: note: Assuming 'whichfork' is equal to 1
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:582:26: note: '?' condition is true
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/scrub/bmap.c:586:2: note: 'error' declared without an initial val=
ue
           int                     error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:588:6: note: Assuming the condition is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:589:6: note: 'whichfork' is not equal to 2
               whichfork =3D=3D XFS_COW_FORK ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:588:2: note: Assuming the condition is true
           if (!xfs_has_rmapbt(sc->mp) ||
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:588:2: note: '?' condition is false
           if (!xfs_has_rmapbt(sc->mp) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:589:6: note: 'whichfork' is not equal to 2
               whichfork =3D=3D XFS_COW_FORK ||
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
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:588:2: note: '?' condition is false
           if (!xfs_has_rmapbt(sc->mp) ||
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
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/fc.c:2375:17: note: Field 'tagset' is null
           if (ctrl->ctrl.tagset) {
                          ^
   drivers/nvme/host/fc.c:2375:2: note: '?' condition is false
           if (ctrl->ctrl.tagset) {
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
   drivers/nvme/host/fc.c:2375:2: note: Taking false branch
           if (ctrl->ctrl.tagset) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/fc.c:2381:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&ctrl->rport->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/nvme/host/fc.c:2381:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&ctrl->rport->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/nvme/host/fc.c:2396:2: note: Assuming field 'opts' is null
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/fc.c:2396:2: note: '?' condition is false
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/fc.c:2396:17: note: Field 'opts' is null
           if (ctrl->ctrl.opts)
                          ^
   drivers/nvme/host/fc.c:2396:2: note: '?' condition is false
           if (ctrl->ctrl.opts)
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
   drivers/nvme/host/fc.c:2396:2: note: Taking false branch
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/fc.c:2398:2: note: Memory is released
           kfree(ctrl);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2404:2: note: Returning; memory was released
           kref_put(&ctrl->ref, nvme_fc_ctrl_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2754:3: note: Returning; memory was released via =
1st parameter
                   nvme_fc_ctrl_put(ctrl);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2756:7: note: Use of memory after it is freed
                   if (ctrl->rport->remoteport.port_state =3D=3D FC_OBJSTAT=
E_ONLINE &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> drivers/nvme/host/fc.c:3799:9: warning: Assigned value is garbage or und=
efined [clang-analyzer-core.uninitialized.Assign]
                   lport =3D rport->lport;
                         ^ ~~~~~~~~~~~~
   drivers/nvme/host/fc.c:3761:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&nvme_fc_lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/nvme/host/fc.c:3761:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&nvme_fc_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/nvme/host/fc.c:3763:2: note: Left side of '&&' is false
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/nvme/host/fc.c:3763:2: note: '?' condition is true
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/nvme/host/fc.c:3763:2: note: Left side of '&&' is false
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/nvme/host/fc.c:3763:2: note: Taking false branch
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   drivers/nvme/host/fc.c:3763:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
--
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
   drivers/media/tuners/tda18250.c:439:2: note: '?' condition is false
           if (ret)
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
   drivers/media/tuners/tda18250.c:439:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/tda18250.c:443:6: note: Assuming 'exp' is > 5
           if (exp > 5)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/tuners/tda18250.c:443:2: note: '?' condition is false
           if (exp > 5)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/tuners/tda18250.c:443:6: note: 'exp' is > 5
           if (exp > 5)
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
   drivers/media/tuners/tda18250.c:443:6: note: 'exp' is > 5
           if (exp > 5)
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
   drivers/media/tuners/tda18250.c:443:2: note: '?' condition is true
           if (exp > 5)
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
   drivers/media/tuners/tda18250.c:443:2: note: Taking true branch
           if (exp > 5)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/tda18250.c:445:11: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'int'
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> fs/hpfs/name.c:67:2: warning: Potential leak of memory pointed to by 'to=
' [clang-analyzer-unix.Malloc]
           if (!(to =3D kmalloc(len, GFP_KERNEL))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/name.c:59:6: note: Assuming field 'sb_chk' is >=3D 2
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/name.c:59:2: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/name.c:59:18: note: Field 'sb_chk' is >=3D 2
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                           ^
   fs/hpfs/name.c:59:2: note: '?' condition is true
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
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
   fs/hpfs/name.c:59:2: note: Taking true branch
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/name.c:59:35: note: Assuming the condition is true
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/name.c:59:31: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/name.c:59:35: note: Assuming the condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
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
   fs/hpfs/name.c:59:31: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
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
   fs/hpfs/name.c:59:31: note: Taking false branch
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/name.c:66:6: note: Assuming 'lc' is not equal to 0
           if (!lc) return from;
--
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/pci/bt8xx/bttv-risc.c:810:4: warning: Value stored to 'cpa=
dding' is never read [clang-analyzer-deadcode.DeadStores]
                           cpadding =3D buf->vb.width >> buf->fmt->hshift;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/bt8xx/bttv-risc.c:810:4: note: Value stored to 'cpaddi=
ng' is never read
                           cpadding =3D buf->vb.width >> buf->fmt->hshift;
                           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/pci/bt8xx/bttv-vbi.c:74:15: warning: Value stored to 'btv'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct bttv *btv =3D fh->btv;
                        ^~~   ~~~~~~~
   drivers/media/pci/bt8xx/bttv-vbi.c:74:15: note: Value stored to 'btv' du=
ring its initialization is never read
           struct bttv *btv =3D fh->btv;
                        ^~~   ~~~~~~~
   drivers/media/pci/bt8xx/bttv-vbi.c:217:15: warning: Value stored to 'btv=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct bttv *btv =3D fh->btv;
                        ^~~   ~~~~~~~
   drivers/media/pci/bt8xx/bttv-vbi.c:217:15: note: Value stored to 'btv' d=
uring its initialization is never read
           struct bttv *btv =3D fh->btv;
                        ^~~   ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   drivers/media/pci/mantis/mantis_i2c.c:164:6: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
                                           ret =3D -EIO;
                                           ^     ~~~~
   drivers/media/pci/mantis/mantis_i2c.c:164:6: note: Value stored to 'ret'=
 is never read
                                           ret =3D -EIO;
                                           ^     ~~~~
   drivers/media/pci/mantis/mantis_i2c.c:170:5: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/media/pci/mantis/mantis_i2c.c:170:5: note: Value stored to 'ret'=
 is never read
                                   ret =3D -EIO;
                                   ^     ~~~~
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
   drivers/media/pci/mantis/mantis_hif.c:202:2: warning: Value stored to 'i=
rqcfg' is never read [clang-analyzer-deadcode.DeadStores]
           irqcfg =3D mmread(MANTIS_GPIF_IRQCFG);
           ^
   drivers/media/pci/mantis/mantis_hif.c:202:2: note: Value stored to 'irqc=
fg' is never read
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
   7 warnings generated.
   drivers/media/usb/siano/smsusb.c:309:3: warning: Value stored to 'produc=
t_string' is never read [clang-analyzer-deadcode.DeadStores]
                   product_string =3D "none";
                   ^                ~~~~~~
   drivers/media/usb/siano/smsusb.c:309:3: note: Value stored to 'product_s=
tring' is never read
                   product_string =3D "none";
                   ^                ~~~~~~
>> drivers/media/usb/siano/smsusb.c:417:6: warning: Branch condition evalua=
tes to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!dev->in_ep || !dev->out_ep || align < 0) {  /* Missing endp=
oints? */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/usb/siano/smsusb.c:395:8: note: Calling 'kzalloc'
           dev =3D kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'i=
n_ep'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:395:8: note: Returning from 'kzalloc'
           dev =3D kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:396:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/usb/siano/smsusb.c:396:2: note: '?' condition is false
           if (!dev)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/usb/siano/smsusb.c:396:7: note: 'dev' is non-null
           if (!dev)
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
   drivers/media/usb/siano/smsusb.c:396:2: note: '?' condition is false
           if (!dev)
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
   drivers/media/usb/siano/smsusb.c:396:2: note: Taking false branch
           if (!dev)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/usb/siano/smsusb.c:400:2: note: Calling 'usb_set_intfdata'
           usb_set_intfdata(intf, dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:270:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&intf->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
in_ep'
   }
   ^
   include/linux/usb.h:270:2: note: Returning from 'dev_set_drvdata'
           dev_set_drvdata(&intf->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:271:1: note: Returning without writing to 'data->in_=
ep'
   }
   ^
   drivers/media/usb/siano/smsusb.c:400:2: note: Returning from 'usb_set_in=
tfdata'
           usb_set_intfdata(intf, dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:404:14: note: Assuming 'i' is >=3D fiel=
d 'bNumEndpoints'
           for (i =3D 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++)=
 {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:404:2: note: Loop condition is false. E=
xecution continues on line 416
           for (i =3D 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++)=
 {
           ^
   drivers/media/usb/siano/smsusb.c:416:2: note: '?' condition is true
           pr_debug("in_ep =3D %02x, out_ep =3D %02x\n", dev->in_ep, dev->o=
ut_ep);
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/compression.c:900:14: note: '?' condition is true
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
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
   fs/btrfs/compression.c:900:14: note: Left side of '&&' is false
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/compression.c:900:14: note: Taking false branch
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   fs/btrfs/compression.c:900:14: note: Loop condition is false.  Exiting l=
oop
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
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
   fs/btrfs/compression.c:904:2: note: 1st function call argument is an uni=
nitialized value
           kfree(workspace->bucket_b);
           ^     ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
>> drivers/media/usb/tm6000/tm6000-video.c:207:18: warning: Dereference of =
null pointer [clang-analyzer-core.NullDereference]
                                           linewidth =3D vbuf->vb.width << =
1;
                                                       ^~~~~~~~~~~~~~
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Left side of '&&' =
is false
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: '?' condition is t=
rue
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
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
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Left side of '&&' =
is false
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Taking false branch
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
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
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Loop condition is =
false.  Exiting loop
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
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
   drivers/media/usb/tm6000/tm6000-video.c:124:2: note: 'vbuf' initialized =
to a null pointer value
           struct tm6000_buffer *vbuf =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/tm6000/tm6000-video.c:128:6: note: Assuming field 'rad=
io' is not equal to 0
           if (!dev->radio) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/usb/tm6000/tm6000-video.c:128:2: note: '?' condition is fa=
lse
           if (!dev->radio) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/usb/tm6000/tm6000-video.c:128:12: note: Field 'radio' is n=
ot equal to 0
           if (!dev->radio) {
                     ^
   drivers/media/usb/tm6000/tm6000-video.c:128:2: note: '?' condition is fa=
lse
--
                                                                           ^
   include/linux/list.h:113:2: note: Loop condition is false.  Exiting loop
           WRITE_ONCE(prev->next, next);
           ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   include/linux/list.h:135:2: note: Returning from '__list_del'
           __list_del(entry->prev, entry->next);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Returning from '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3050:4: note: Returning from 'list_del'
                           list_del(&r10_bio->retry_list);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3051:4: note: Assuming field 'degraded' is 0
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/raid10.c:3051:4: note: '?' condition is false
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3051:15: note: Field 'degraded' is 0
                           if (mddev->degraded)
                                      ^
   drivers/md/raid10.c:3051:4: note: '?' condition is false
                           if (mddev->degraded)
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
   drivers/md/raid10.c:3051:4: note: Taking false branch
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/raid10.c:3054:4: note: '?' condition is false
                           if (test_bit(R10BIO_WriteError,
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3054:4: note: Assuming the condition is false
                           if (test_bit(R10BIO_WriteError,
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
   drivers/md/raid10.c:3054:4: note: '?' condition is false
                           if (test_bit(R10BIO_WriteError,
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
   drivers/md/raid10.c:3054:4: note: Taking false branch
                           if (test_bit(R10BIO_WriteError,
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/raid10.c:3057:4: note: Calling 'raid_end_bio_io'
                           raid_end_bio_io(r10_bio);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:294:2: note: Assigned value is garbage or undefined
           struct bio *bio =3D r10_bio->master_bio;
           ^                 ~~~~~~~~~~~~~~~~~~~
>> drivers/md/raid10.c:406:21: warning: Access to field 'bitmap' results in=
 a dereference of an undefined pointer value (loaded from field 'mddev') [c=
lang-analyzer-core.NullDereference]
           md_bitmap_endwrite(r10_bio->mddev->bitmap, r10_bio->sector,
                              ^
   drivers/md/raid10.c:3036:50: note: Left side of '&&' is false
           if (!list_empty_careful(&conf->bio_end_io_list) &&
                                                           ^
   drivers/md/raid10.c:3036:2: note: '?' condition is false
           if (!list_empty_careful(&conf->bio_end_io_list) &&
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3036:6: note: Left side of '&&' is true
           if (!list_empty_careful(&conf->bio_end_io_list) &&
               ^
   drivers/md/raid10.c:3036:2: note: Assuming the condition is true
           if (!list_empty_careful(&conf->bio_end_io_list) &&
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
   drivers/md/raid10.c:3036:2: note: '?' condition is true
           if (!list_empty_careful(&conf->bio_end_io_list) &&
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
   drivers/md/raid10.c:3036:2: note: Taking true branch
           if (!list_empty_careful(&conf->bio_end_io_list) &&
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/raid10.c:3039:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&conf->device_lock, flags);
                   ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/md/raid10.c:3039:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&conf->device_lock, flags);
                   ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/md/raid10.c:3040:3: note: '?' condition is false
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3040:3: note: Assuming the condition is false
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
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
   drivers/md/raid10.c:3040:3: note: '?' condition is false
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
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
   drivers/md/raid10.c:3040:3: note: Taking false branch
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +1751 fs/fuse/dev.c

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1729  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1730  static int fuse_notify_retr=
ieve(struct fuse_conn *fc, unsigned int size,
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1731  				struct fuse_copy_state =
*cs)
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1732  {
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1733  	struct fuse_notify_retriev=
e_out outarg;
fcee216beb9c15 Max Reitz      2020-05-06  1734  	struct fuse_mount *fm;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1735  	struct inode *inode;
fcee216beb9c15 Max Reitz      2020-05-06  1736  	u64 nodeid;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1737  	int err;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1738  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1739  	err =3D -EINVAL;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1740  	if (size !=3D sizeof(outar=
g))
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1741  		goto copy_finish;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1742  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1743  	err =3D fuse_copy_one(cs, =
&outarg, sizeof(outarg));
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1744  	if (err)
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1745  		goto copy_finish;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1746  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1747  	fuse_copy_finish(cs);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1748  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1749  	down_read(&fc->killsb);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1750  	err =3D -ENOENT;
fcee216beb9c15 Max Reitz      2020-05-06 @1751  	nodeid =3D outarg.nodeid;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1752  =

fcee216beb9c15 Max Reitz      2020-05-06  1753  	inode =3D fuse_ilookup(fc,=
 nodeid, &fm);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1754  	if (inode) {
fcee216beb9c15 Max Reitz      2020-05-06  1755  		err =3D fuse_retrieve(fm,=
 inode, &outarg);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1756  		iput(inode);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1757  	}
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1758  	up_read(&fc->killsb);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1759  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1760  	return err;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1761  =

2d45ba381a74a7 Miklos Szeredi 2010-07-12  1762  copy_finish:
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1763  	fuse_copy_finish(cs);
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1764  	return err;
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1765  }
2d45ba381a74a7 Miklos Szeredi 2010-07-12  1766  =


:::::: The code at line 1751 was first introduced by commit
:::::: fcee216beb9c15c3e1466bb76575358415687c55 fuse: split fuse_mount off =
of fuse_conn

:::::: TO: Max Reitz <mreitz@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3492107697950913117==--

