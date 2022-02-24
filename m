Content-Type: multipart/mixed; boundary="===============6655615943211966423=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/seq_file.h:136:25: warning: Null pointer passed as 1st argument to string length function [clang-analyzer-unix.cstring.NullArg]
Date: Fri, 25 Feb 2022 07:35:08 +0800
Message-ID: <202202250700.AJ0M66HP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6655615943211966423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   73878e5eb1bd3c9656685ca60bc3a49d17311e0c
commit: 372904c080be44629d84bb15ed5e12eed44b5f9f seq_file: move seq_escape(=
) to a header
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220224 (https://download.01.org/0day-ci/arc=
hive/20220225/202202250700.AJ0M66HP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D372904c080be44629d84bb15ed5e12eed44b5f9f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 372904c080be44629d84bb15ed5e12eed44b5f9f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/list.h:284:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:314:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:284:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:284:9: note: Use of memory after it is freed
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/usb/gadget/udc/snps_udc_core.c:439:2: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D desc->bEndpointAddress;
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:439:2: note: Value stored to 'tmp=
' is never read
           tmp =3D desc->bEndpointAddress;
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2117:5: warning: Value stored to =
'req' is never read [clang-analyzer-deadcode.DeadStores]
                                   req =3D list_entry(ep->queue.next,
                                   ^
   drivers/usb/gadget/udc/snps_udc_core.c:2117:5: note: Value stored to 're=
q' is never read
   drivers/usb/gadget/udc/snps_udc_core.c:2613:4: warning: Value stored to =
'count' is never read [clang-analyzer-deadcode.DeadStores]
                           count =3D AMD_GETBITS(count, UDC_EPSTS_RX_PKT_SI=
ZE);
                           ^
   drivers/usb/gadget/udc/snps_udc_core.c:2613:4: note: Value stored to 'co=
unt' is never read
   drivers/usb/gadget/udc/snps_udc_core.c:2797:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2797:3: note: Value stored to 'tm=
p' is never read
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2857:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/usb/gadget/udc/snps_udc_core.c:2857:3: note: Value stored to 'tm=
p' is never read
                   tmp =3D dev->driver->setup(&dev->gadget, &setup_data.req=
uest);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> include/linux/seq_file.h:136:25: warning: Null pointer passed as 1st arg=
ument to string length function [clang-analyzer-unix.cstring.NullArg]
           seq_escape_mem(m, src, strlen(src), flags, esc);
                                  ^
   security/selinux/hooks.c:1113:6: note: Assuming the condition is false
           if (!(sbsec->flags & SE_SBINITIALIZED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:1113:2: note: Taking false branch
           if (!(sbsec->flags & SE_SBINITIALIZED))
           ^
   security/selinux/hooks.c:1116:6: note: Assuming the condition is false
           if (!selinux_initialized(&selinux_state))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:1116:2: note: Taking false branch
           if (!selinux_initialized(&selinux_state))
           ^
   security/selinux/hooks.c:1119:6: note: Assuming the condition is true
           if (sbsec->flags & FSCONTEXT_MNT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:1119:2: note: Taking true branch
           if (sbsec->flags & FSCONTEXT_MNT) {
           ^
   security/selinux/hooks.c:1122:8: note: Calling 'show_sid'
                   rc =3D show_sid(m, sbsec->sid);
                        ^~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:1092:7: note: Value assigned to 'context'
           rc =3D security_sid_to_context(&selinux_state, sid,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/hooks.c:1094:6: note: Assuming 'rc' is 0
           if (!rc) {
               ^~~
   security/selinux/hooks.c:1094:2: note: Taking true branch
           if (!rc) {
           ^
   security/selinux/hooks.c:1095:20: note: Assuming 'context' is null
                   bool has_comma =3D context && strchr(context, ',');
                                    ^~~~~~~
   security/selinux/hooks.c:1095:28: note: Left side of '&&' is false
                   bool has_comma =3D context && strchr(context, ',');
                                            ^
   security/selinux/hooks.c:1098:7: note: 'has_comma' is false
                   if (has_comma)
                       ^~~~~~~~~
   security/selinux/hooks.c:1098:3: note: Taking false branch
                   if (has_comma)
                   ^
   security/selinux/hooks.c:1100:17: note: Passing null pointer value via 2=
nd parameter 's'
                   seq_escape(m, context, "\"\n\\");
                                 ^~~~~~~
   security/selinux/hooks.c:1100:3: note: Calling 'seq_escape'
                   seq_escape(m, context, "\"\n\\");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:152:20: note: Passing null pointer value via 2n=
d parameter 'src'
           seq_escape_str(m, s, ESCAPE_OCTAL, esc);
                             ^
   include/linux/seq_file.h:152:2: note: Calling 'seq_escape_str'
           seq_escape_str(m, s, ESCAPE_OCTAL, esc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:136:25: note: Null pointer passed as 1st argume=
nt to string length function
           seq_escape_mem(m, src, strlen(src), flags, esc);
                                  ^      ~~~
   security/selinux/hooks.c:6606:3: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   error =3D -EPERM;
                   ^       ~~~~~~
   security/selinux/hooks.c:6606:3: note: Value stored to 'error' is never =
read
                   error =3D -EPERM;
                   ^       ~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   security/apparmor/apparmorfs.c:1584:3: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
                   strcpy(s, "../../");
                   ^~~~~~
   security/apparmor/apparmorfs.c:1584:3: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
                   strcpy(s, "../../");
                   ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +136 include/linux/seq_file.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  115  =

6798a8caaf64fa Joe Perches     2015-09-11  116  __printf(2, 0)
6798a8caaf64fa Joe Perches     2015-09-11  117  void seq_vprintf(struct seq=
_file *m, const char *fmt, va_list args);
6798a8caaf64fa Joe Perches     2015-09-11  118  __printf(2, 3)
6798a8caaf64fa Joe Perches     2015-09-11  119  void seq_printf(struct seq_=
file *m, const char *fmt, ...);
6798a8caaf64fa Joe Perches     2015-09-11  120  void seq_putc(struct seq_fi=
le *m, char c);
6798a8caaf64fa Joe Perches     2015-09-11  121  void seq_puts(struct seq_fi=
le *m, const char *s);
d1be35cb6f9697 Andrei Vagin    2018-04-10  122  void seq_put_decimal_ull_wi=
dth(struct seq_file *m, const char *delimiter,
d1be35cb6f9697 Andrei Vagin    2018-04-10  123  			       unsigned long lon=
g num, unsigned int width);
75ba1d07fd6a49 Joe Perches     2016-10-07  124  void seq_put_decimal_ull(st=
ruct seq_file *m, const char *delimiter,
6798a8caaf64fa Joe Perches     2015-09-11  125  			 unsigned long long num);
75ba1d07fd6a49 Joe Perches     2016-10-07  126  void seq_put_decimal_ll(str=
uct seq_file *m, const char *delimiter, long long num);
0e3dc019143104 Andrei Vagin    2018-04-10  127  void seq_put_hex_ll(struct =
seq_file *m, const char *delimiter,
0e3dc019143104 Andrei Vagin    2018-04-10  128  		    unsigned long long v,=
 unsigned int width);
0e3dc019143104 Andrei Vagin    2018-04-10  129  =

1d31aa172a4e67 Andy Shevchenko 2021-06-30  130  void seq_escape_mem(struct =
seq_file *m, const char *src, size_t len,
1d31aa172a4e67 Andy Shevchenko 2021-06-30  131  		    unsigned int flags, c=
onst char *esc);
e7ed4a3b922b04 Andy Shevchenko 2021-06-30  132  =

e7ed4a3b922b04 Andy Shevchenko 2021-06-30  133  static inline void seq_esca=
pe_str(struct seq_file *m, const char *src,
e7ed4a3b922b04 Andy Shevchenko 2021-06-30  134  				  unsigned int flags, c=
onst char *esc)
e7ed4a3b922b04 Andy Shevchenko 2021-06-30  135  {
e7ed4a3b922b04 Andy Shevchenko 2021-06-30 @136  	seq_escape_mem(m, src, str=
len(src), flags, esc);
e7ed4a3b922b04 Andy Shevchenko 2021-06-30  137  }
e7ed4a3b922b04 Andy Shevchenko 2021-06-30  138  =


:::::: The code at line 136 was first introduced by commit
:::::: e7ed4a3b922b04d2042cd2e19d1096fa457b6c11 seq_file: add seq_escape_st=
r() as replica of string_escape_str()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6655615943211966423==--

