Content-Type: multipart/mixed; boundary="===============5400321732344698158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12725/13576] lib/vsprintf.c:2770:5: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 21 Mar 2022 03:05:14 +0800
Message-ID: <202203210246.cqK2SBcz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5400321732344698158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Gary Guo <gary@garyguo.net>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 67e2d8d8627c16710f160bf3ea16ab634b31d3a7 [12725/13576] vsprintf: ad=
d new `%pA` format specifier
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
321/202203210246.cqK2SBcz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D67e2d8d8627c16710f160bf3ea16ab634b31d3a7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 67e2d8d8627c16710f160bf3ea16ab634b31d3a7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   lib/vsprintf.c:219:6: note: 'r' is < 100
           if (r < 100)
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
   lib/vsprintf.c:219:2: note: '?' condition is true
           if (r < 100)
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
   lib/vsprintf.c:219:2: note: Taking true branch
           if (r < 100)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:220:3: note: Control jumps to line 249
                   goto out_r;
                   ^
   lib/vsprintf.c:250:9: note: Assuming 'r' is >=3D 10
           buf +=3D r < 10 ? 1 : 2;
                  ^~~~~~
   lib/vsprintf.c:250:9: note: '?' condition is false
   lib/vsprintf.c:1341:16: note: Returning from 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1342:3: note: '?' condition is false
                   if (leading_zeros) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:1342:7: note: 'leading_zeros' is false
                   if (leading_zeros) {
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
   lib/vsprintf.c:1342:3: note: '?' condition is false
                   if (leading_zeros) {
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
   lib/vsprintf.c:1342:3: note: Taking false branch
                   if (leading_zeros) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:1349:10: note: The value 1 is assigned to 'digits'
                   while (digits--)
                          ^~~~~~~~
   lib/vsprintf.c:1349:3: note: Loop condition is true.  Entering loop body
                   while (digits--)
                   ^
   lib/vsprintf.c:1350:9: note: Assigned value is garbage or undefined
                           *p++ =3D temp[digits];
                                ^ ~~~~~~~~~~~~
   lib/vsprintf.c:1413:4: warning: Value stored to 'needcolon' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1413:4: note: Value stored to 'needcolon' is never read
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1781:2: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   lib/vsprintf.c:1781:2: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
>> lib/vsprintf.c:2770:5: warning: Null pointer passed as 1st argument to m=
emory copy function [clang-analyzer-unix.cstring.NullArg]
                                   memcpy(str, old_fmt, copy);
                                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^                ~
   lib/vsprintf.c:2746:19: note: Assuming the condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   lib/vsprintf.c:2746:6: note: Taking false branch
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2746:2: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   lib/vsprintf.c:2746:6: note: Taking false branch
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2746:2: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
--
           ^
   lib/vsprintf.c:2819:4: note: Taking false branch
                           if (str < end)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2821:4: note: Null pointer value stored to 'str'
                           ++str;
                           ^~~~~
   lib/vsprintf.c:2822:4: note:  Execution continues on line 2758
                           break;
                           ^
   lib/vsprintf.c:2758:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:2764:3: note: Control jumps to 'case FORMAT_TYPE_NONE:'  =
at line 2765
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:2767:4: note: '?' condition is false
                           if (str < end) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2767:8: note: 'str' is < 'end'
                           if (str < end) {
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
   lib/vsprintf.c:2767:4: note: '?' condition is true
                           if (str < end) {
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
   lib/vsprintf.c:2767:4: note: Taking true branch
                           if (str < end) {
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2768:9: note: Assuming the condition is false
                                   if (copy > end - str)
                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/vsprintf.c:2768:5: note: '?' condition is false
                                   if (copy > end - str)
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2768:5: note: '?' condition is false
                                   if (copy > end - str)
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
   lib/vsprintf.c:2768:5: note: Taking false branch
                                   if (copy > end - str)
                                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2770:5: note: Null pointer passed as 1st argument to memo=
ry copy function
                                   memcpy(str, old_fmt, copy);
                                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^                ~
>> lib/vsprintf.c:2790:12: warning: Dereference of null pointer (loaded fro=
m variable 'str') [clang-analyzer-core.NullDereference]
                                                   *str =3D ' ';
                                                    ~~~ ^
   lib/vsprintf.c:2746:19: note: Assuming the condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   lib/vsprintf.c:2746:6: note: Taking false branch
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2746:2: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/vsprintf.c:2746:6: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   lib/vsprintf.c:2746:6: note: Taking false branch
           if (WARN_ON_ONCE(size > INT_MAX))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/vsprintf.c:2746:2: note: '?' condition is false
           if (WARN_ON_ONCE(size > INT_MAX))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +2770 lib/vsprintf.c

4d72ba014b4b09 Rasmus Villemoes      2016-01-15  2709  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  2710  /**
^1da177e4c3f41 Linus Torvalds        2005-04-16  2711   * vsnprintf - Forma=
t a string and place it in a buffer
^1da177e4c3f41 Linus Torvalds        2005-04-16  2712   * @buf: The buffer =
to place the result into
^1da177e4c3f41 Linus Torvalds        2005-04-16  2713   * @size: The size o=
f the buffer, including the trailing null space
^1da177e4c3f41 Linus Torvalds        2005-04-16  2714   * @fmt: The format =
string to use
^1da177e4c3f41 Linus Torvalds        2005-04-16  2715   * @args: Arguments =
for the format string
^1da177e4c3f41 Linus Torvalds        2005-04-16  2716   *
d7ec9a05d6defd Rasmus Villemoes      2015-11-06  2717   * This function gen=
erally follows C99 vsnprintf, but has some
d7ec9a05d6defd Rasmus Villemoes      2015-11-06  2718   * extensions and a =
few limitations:
d7ec9a05d6defd Rasmus Villemoes      2015-11-06  2719   *
6cc89134c07b22 Mauro Carvalho Chehab 2017-03-30  2720   *  - ``%n`` is unsu=
pported
6cc89134c07b22 Mauro Carvalho Chehab 2017-03-30  2721   *  - ``%p*`` is han=
dled by pointer()
5e4ee7b13b522d Martin Kletzander     2015-11-06  2722   *
27e7c0e813aa5c Jonathan Corbet       2017-12-21  2723   * See pointer() or =
Documentation/core-api/printk-formats.rst for more
5e4ee7b13b522d Martin Kletzander     2015-11-06  2724   * extensive descrip=
tion.
20036fdcaf05fa Andi Kleen            2008-10-15  2725   *
5e4ee7b13b522d Martin Kletzander     2015-11-06  2726   * **Please update t=
he documentation in both places when making changes**
80f548e04d0b1d Andrew Morton         2012-07-30  2727   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  2728   * The return value =
is the number of characters which would
^1da177e4c3f41 Linus Torvalds        2005-04-16  2729   * be generated for =
the given input, excluding the trailing
^1da177e4c3f41 Linus Torvalds        2005-04-16  2730   * '\0', as per ISO =
C99. If you want to have the exact
^1da177e4c3f41 Linus Torvalds        2005-04-16  2731   * number of charact=
ers written into @buf as return value
72fd4a35a82433 Robert P. J. Day      2007-02-10  2732   * (not including th=
e trailing '\0'), use vscnprintf(). If the
^1da177e4c3f41 Linus Torvalds        2005-04-16  2733   * return is greater=
 than or equal to @size, the resulting
^1da177e4c3f41 Linus Torvalds        2005-04-16  2734   * string is truncat=
ed.
^1da177e4c3f41 Linus Torvalds        2005-04-16  2735   *
ba1835eb30a80a Uwe Kleine-K=C3=B6nig      2011-04-06  2736   * If you're no=
t already dealing with a va_list consider using snprintf().
^1da177e4c3f41 Linus Torvalds        2005-04-16  2737   */
^1da177e4c3f41 Linus Torvalds        2005-04-16  2738  int vsnprintf(char *=
buf, size_t size, const char *fmt, va_list args)
^1da177e4c3f41 Linus Torvalds        2005-04-16  2739  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  2740  	unsigned long long =
num;
d4be151b2180fb Andr=C3=A9 Goddard Rosa    2009-12-14  2741  	char *str, *en=
d;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2742  	struct printf_spec =
spec =3D {0};
^1da177e4c3f41 Linus Torvalds        2005-04-16  2743  =

f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2744  	/* Reject out-of-ra=
nge values early.  Large positive sizes are
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2745  	   used for unknown=
 buffer sizes. */
2aa2f9e21e4eb2 Rasmus Villemoes      2015-02-12  2746  	if (WARN_ON_ONCE(si=
ze > INT_MAX))
^1da177e4c3f41 Linus Torvalds        2005-04-16  2747  		return 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2748  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  2749  	str =3D buf;
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2750  	end =3D buf + size;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2751  =

f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2752  	/* Make sure end is=
 always >=3D buf */
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2753  	if (end < buf) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  2754  		end =3D ((void *)-=
1);
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2755  		size =3D end - buf;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2756  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  2757  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2758  	while (*fmt) {
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2759  		const char *old_fm=
t =3D fmt;
d4be151b2180fb Andr=C3=A9 Goddard Rosa    2009-12-14  2760  		int read =3D =
format_decode(fmt, &spec);
^1da177e4c3f41 Linus Torvalds        2005-04-16  2761  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2762  		fmt +=3D read;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2763  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2764  		switch (spec.type)=
 {
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2765  		case FORMAT_TYPE_N=
ONE: {
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2766  			int copy =3D read;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2767  			if (str < end) {
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2768  				if (copy > end -=
 str)
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2769  					copy =3D end - =
str;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06 @2770  				memcpy(str, old_=
fmt, copy);
^1da177e4c3f41 Linus Torvalds        2005-04-16  2771  			}
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2772  			str +=3D read;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2773  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2774  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  2775  =

ed681a91ab8053 Vegard Nossum         2009-03-14  2776  		case FORMAT_TYPE_W=
IDTH:
4d72ba014b4b09 Rasmus Villemoes      2016-01-15  2777  			set_field_width(&=
spec, va_arg(args, int));
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2778  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2779  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2780  		case FORMAT_TYPE_P=
RECISION:
4d72ba014b4b09 Rasmus Villemoes      2016-01-15  2781  			set_precision(&sp=
ec, va_arg(args, int));
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2782  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2783  =

d4be151b2180fb Andr=C3=A9 Goddard Rosa    2009-12-14  2784  		case FORMAT_T=
YPE_CHAR: {
d4be151b2180fb Andr=C3=A9 Goddard Rosa    2009-12-14  2785  			char c;
d4be151b2180fb Andr=C3=A9 Goddard Rosa    2009-12-14  2786  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2787  			if (!(spec.flags =
& LEFT)) {
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2788  				while (--spec.fi=
eld_width > 0) {
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2789  					if (str < end)
^1da177e4c3f41 Linus Torvalds        2005-04-16 @2790  						*str =3D ' ';
^1da177e4c3f41 Linus Torvalds        2005-04-16  2791  					++str;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2792  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  2793  				}
^1da177e4c3f41 Linus Torvalds        2005-04-16  2794  			}
^1da177e4c3f41 Linus Torvalds        2005-04-16  2795  			c =3D (unsigned c=
har) va_arg(args, int);
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2796  			if (str < end)
^1da177e4c3f41 Linus Torvalds        2005-04-16  2797  				*str =3D c;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2798  			++str;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2799  			while (--spec.fie=
ld_width > 0) {
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2800  				if (str < end)
^1da177e4c3f41 Linus Torvalds        2005-04-16  2801  					*str =3D ' ';
^1da177e4c3f41 Linus Torvalds        2005-04-16  2802  				++str;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2803  			}
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2804  			break;
d4be151b2180fb Andr=C3=A9 Goddard Rosa    2009-12-14  2805  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  2806  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2807  		case FORMAT_TYPE_S=
TR:
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2808  			str =3D string(st=
r, end, va_arg(args, char *), spec);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2809  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2810  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2811  		case FORMAT_TYPE_P=
TR:
ffbfed03b4bdd2 Rasmus Villemoes      2015-02-12  2812  			str =3D pointer(f=
mt, str, end, va_arg(args, void *),
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2813  				      spec);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2814  			while (isalnum(*f=
mt))
4d8a743cdd2690 Linus Torvalds        2008-07-06  2815  				fmt++;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2816  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2817  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2818  		case FORMAT_TYPE_P=
ERCENT_CHAR:
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2819  			if (str < end)
^1da177e4c3f41 Linus Torvalds        2005-04-16  2820  				*str =3D '%';
^1da177e4c3f41 Linus Torvalds        2005-04-16  2821  			++str;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2822  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  2823  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2824  		case FORMAT_TYPE_I=
NVALID:
b006f19b055f90 Rasmus Villemoes      2015-11-06  2825  			/*
b006f19b055f90 Rasmus Villemoes      2015-11-06  2826  			 * Presumably the=
 arguments passed gcc's type
b006f19b055f90 Rasmus Villemoes      2015-11-06  2827  			 * checking, but =
there is no safe or sane way
b006f19b055f90 Rasmus Villemoes      2015-11-06  2828  			 * for us to cont=
inue parsing the format and
b006f19b055f90 Rasmus Villemoes      2015-11-06  2829  			 * fetching from =
the va_list; the remaining
b006f19b055f90 Rasmus Villemoes      2015-11-06  2830  			 * specifiers and=
 arguments would be out of
b006f19b055f90 Rasmus Villemoes      2015-11-06  2831  			 * sync.
b006f19b055f90 Rasmus Villemoes      2015-11-06  2832  			 */
b006f19b055f90 Rasmus Villemoes      2015-11-06  2833  			goto out;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2834  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2835  		default:
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2836  			switch (spec.type=
) {
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2837  			case FORMAT_TYPE_=
LONG_LONG:
^1da177e4c3f41 Linus Torvalds        2005-04-16  2838  				num =3D va_arg(a=
rgs, long long);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2839  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2840  			case FORMAT_TYPE_=
ULONG:
^1da177e4c3f41 Linus Torvalds        2005-04-16  2841  				num =3D va_arg(a=
rgs, unsigned long);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2842  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2843  			case FORMAT_TYPE_=
LONG:
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2844  				num =3D va_arg(a=
rgs, long);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2845  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2846  			case FORMAT_TYPE_=
SIZE_T:
ef12496022d591 Jason Gunthorpe       2012-12-17  2847  				if (spec.flags &=
 SIGN)
ef12496022d591 Jason Gunthorpe       2012-12-17  2848  					num =3D va_arg(=
args, ssize_t);
ef12496022d591 Jason Gunthorpe       2012-12-17  2849  				else
^1da177e4c3f41 Linus Torvalds        2005-04-16  2850  					num =3D va_arg(=
args, size_t);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2851  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2852  			case FORMAT_TYPE_=
PTRDIFF:
8032230694ec56 Al Viro               2005-08-23  2853  				num =3D va_arg(a=
rgs, ptrdiff_t);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2854  				break;
a4e94ef0dd391e Zhaolei               2009-03-27  2855  			case FORMAT_TYPE_=
UBYTE:
a4e94ef0dd391e Zhaolei               2009-03-27  2856  				num =3D (unsigne=
d char) va_arg(args, int);
a4e94ef0dd391e Zhaolei               2009-03-27  2857  				break;
a4e94ef0dd391e Zhaolei               2009-03-27  2858  			case FORMAT_TYPE_=
BYTE:
a4e94ef0dd391e Zhaolei               2009-03-27  2859  				num =3D (signed =
char) va_arg(args, int);
a4e94ef0dd391e Zhaolei               2009-03-27  2860  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2861  			case FORMAT_TYPE_=
USHORT:
^1da177e4c3f41 Linus Torvalds        2005-04-16  2862  				num =3D (unsigne=
d short) va_arg(args, int);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2863  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2864  			case FORMAT_TYPE_=
SHORT:
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2865  				num =3D (short) =
va_arg(args, int);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2866  				break;
39e874f8afbdb3 Frederic Weisbecker   2009-03-09  2867  			case FORMAT_TYPE_=
INT:
39e874f8afbdb3 Frederic Weisbecker   2009-03-09  2868  				num =3D (int) va=
_arg(args, int);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2869  				break;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2870  			default:
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2871  				num =3D va_arg(a=
rgs, unsigned int);
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2872  			}
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2873  =

fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2874  			str =3D number(st=
r, end, num, spec);
^1da177e4c3f41 Linus Torvalds        2005-04-16  2875  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  2876  	}
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2877  =

b006f19b055f90 Rasmus Villemoes      2015-11-06  2878  out:
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2879  	if (size > 0) {
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2880  		if (str < end)
^1da177e4c3f41 Linus Torvalds        2005-04-16  2881  			*str =3D '\0';
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2882  		else
0a6047eef1c465 Linus Torvalds        2006-06-28  2883  			end[-1] =3D '\0';
f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2884  	}
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2885  =

f796937a062c7a Jeremy Fitzhardinge   2006-06-25  2886  	/* the trailing nul=
l byte doesn't count towards the total */
^1da177e4c3f41 Linus Torvalds        2005-04-16  2887  	return str-buf;
fef20d9c1380f0 Frederic Weisbecker   2009-03-06  2888  =


:::::: The code@line 2770 was first introduced by commit
:::::: fef20d9c1380f04ba9492d6463148db07b413708 vsprintf: unify the format =
decoding layer for its 3 users

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5400321732344698158==--

