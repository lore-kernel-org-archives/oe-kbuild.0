Content-Type: multipart/mixed; boundary="===============5098944437886921418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/seq_file.h:136:25: warning: Null pointer passed as 1st argument to string length function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 28 Nov 2021 19:58:12 +0800
Message-ID: <202111281932.BFFvMode-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5098944437886921418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 372904c080be44629d84bb15ed5e12eed44b5f9f seq_file: move seq_escape(=
) to a header
date:   3 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20211123 (https://download.01.org/0day-ci/archi=
ve/20211128/202111281932.BFFvMode-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e383=
8145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D372904c080be44629d84bb15ed5e12eed44b5f9f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 372904c080be44629d84bb15ed5e12eed44b5f9f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/comedi/drivers/das08.c:181:2: warning: Value stored to 'range' i=
s never read [clang-analyzer-deadcode.DeadStores]
           range =3D CR_RANGE(insn->chanspec);
           ^
   drivers/comedi/drivers/das08.c:181:2: note: Value stored to 'range' is n=
ever read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   4 warnings generated.
   drivers/clocksource/timer-ixp4xx.c:48:8: warning: Excessive padding in '=
struct ixp4xx_timer' (48 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   clkevt, =

   base, =

   latch, =

   delay_timer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/clocksource/timer-ixp4xx.c:48:8: note: Excessive padding in 'str=
uct ixp4xx_timer' (48 padding bytes, where 16 is optimal). Optimal fields o=
rder: clkevt, base, latch, delay_timer, consider reordering the fields or a=
dding explicit padding members
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iio/gyro/itg3200_core.c:94:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:94:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
--===============5098944437886921418==--

