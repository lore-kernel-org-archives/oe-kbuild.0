Content-Type: multipart/mixed; boundary="===============6485609494908806700=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:bpf 2/2] include/linux/skmsg.h:185:19: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 07 May 2022 11:20:37 +0800
Message-ID: <202205071113.LDJfVE4y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6485609494908806700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>

tree:   https://github.com/congwang/linux.git bpf
head:   d6cae019e880ce9f03a12e9da56255f4bc638dc5
commit: d6cae019e880ce9f03a12e9da56255f4bc638dc5 [2/2] skmsg: improve error=
 handling for sk_psock_queue_msg()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
507/202205071113.LDJfVE4y-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a=
645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/congwang/linux/commit/d6cae019e880ce9f03a12e9d=
a56255f4bc638dc5
        git remote add congwang https://github.com/congwang/linux.git
        git fetch --no-tags congwang bpf
        git checkout d6cae019e880ce9f03a12e9da56255f4bc638dc5
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/reiserfs/resize.c:106:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(jbitmap[i].bitmaps, jb->bitmaps, copy_siz=
e);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/reiserfs/resize.c:155:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(bh->b_data, 0, sb_blocksize(sb));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/reiserfs/resize.c:155:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(bh->b_data, 0, sb_blocksize(sb));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   sound/drivers/mpu401/mpu401_uart.c:586:3: warning: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(rmidi->name, sizeof(rmidi->name), "%s MIDI",
                   ^~~~~~~~
   sound/drivers/mpu401/mpu401_uart.c:586:3: note: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(rmidi->name, sizeof(rmidi->name), "%s MIDI",
                   ^~~~~~~~
   sound/drivers/mpu401/mpu401_uart.c:589:3: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(rmidi->name, "MPU-401 MIDI %d-%d",card->number, =
device);
                   ^~~~~~~
   sound/drivers/mpu401/mpu401_uart.c:589:3: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(rmidi->name, "MPU-401 MIDI %d-%d",card->number, =
device);
                   ^~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/leds/leds-dac124s085.c:66:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(led->name, sizeof(led->name), "dac124s085-%d", =
i);
                   ^~~~~~~~
   drivers/leds/leds-dac124s085.c:66:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(led->name, sizeof(led->name), "dac124s085-%d", =
i);
                   ^~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/staging/greybus/bootrom.c:166:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(firmware_name, sizeof(firmware_name),
           ^~~~~~~~
   drivers/staging/greybus/bootrom.c:166:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(firmware_name, sizeof(firmware_name),
           ^~~~~~~~
   drivers/staging/greybus/bootrom.c:291:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(firmware_response->data, fw->data + offset, size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/staging/greybus/bootrom.c:291:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(firmware_response->data, fw->data + offset, size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
   net/ipv4/tcp_cubic.c:109:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ca, 0, offsetof(struct bictcp, unused));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv4/tcp_cubic.c:109:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(ca, 0, offsetof(struct bictcp, unused));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
>> include/linux/skmsg.h:185:19: warning: The left expression of the compou=
nd assignment is an uninitialized value. The computed value will also be ga=
rbage [clang-analyzer-core.uninitialized.Assign]
           dst->sg.size               +=3D size;
                                      ^
   net/ipv4/tcp_bpf.c:22:8: note: Calling 'kzalloc'
           tmp =3D kzalloc(sizeof(*tmp), __GFP_NOWARN | GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Uninitialized value stored to field 's=
ize'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:22:8: note: Returning from 'kzalloc'
           tmp =3D kzalloc(sizeof(*tmp), __GFP_NOWARN | GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:23:15: note: Assuming 'tmp' is non-null
           if (unlikely(!tmp))
                        ^
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
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/tcp_bpf.c:23:16: note: 'tmp' is non-null
           if (unlikely(!tmp))
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
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/tcp_bpf.c:23:2: note: '?' condition is false
           if (unlikely(!tmp))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/tcp_bpf.c:23:16: note: 'tmp' is non-null
           if (unlikely(!tmp))
                         ^
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
   net/ipv4/tcp_bpf.c:23:16: note: 'tmp' is non-null
           if (unlikely(!tmp))
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
   net/ipv4/tcp_bpf.c:23:2: note: '?' condition is false
           if (unlikely(!tmp))
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
   net/ipv4/tcp_bpf.c:23:2: note: Taking false branch
           if (unlikely(!tmp))

vim +185 include/linux/skmsg.h

604326b41a6fb9 Daniel Borkmann 2018-10-13  179  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  180  static inline void sk_msg_x=
fer(struct sk_msg *dst, struct sk_msg *src,
604326b41a6fb9 Daniel Borkmann 2018-10-13  181  			       int which, u32 si=
ze)
604326b41a6fb9 Daniel Borkmann 2018-10-13  182  {
604326b41a6fb9 Daniel Borkmann 2018-10-13  183  	dst->sg.data[which] =3D sr=
c->sg.data[which];
604326b41a6fb9 Daniel Borkmann 2018-10-13  184  	dst->sg.data[which].length=
  =3D size;
3f4c3127d33200 John Fastabend  2018-10-16 @185  	dst->sg.size		   +=3D size;
81aabbb9fb7b4b John Fastabend  2020-05-04  186  	src->sg.size		   -=3D size;
604326b41a6fb9 Daniel Borkmann 2018-10-13  187  	src->sg.data[which].length=
 -=3D size;
604326b41a6fb9 Daniel Borkmann 2018-10-13  188  	src->sg.data[which].offset=
 +=3D size;
604326b41a6fb9 Daniel Borkmann 2018-10-13  189  }
604326b41a6fb9 Daniel Borkmann 2018-10-13  190  =


:::::: The code at line 185 was first introduced by commit
:::::: 3f4c3127d332000530349db4843deece27fe5e0c bpf: sockmap, fix skmsg rec=
vmsg handler to track size correctly

:::::: TO: John Fastabend <john.fastabend@gmail.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6485609494908806700==--

