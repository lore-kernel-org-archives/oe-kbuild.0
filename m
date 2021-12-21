Content-Type: multipart/mixed; boundary="===============0706924428192879232=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/seq_file.h:136:25: warning: Null pointer passed as 1st argument to string length function [clang-analyzer-unix.cstring.NullArg]
Date: Tue, 21 Dec 2021 14:59:14 +0800
Message-ID: <202112211442.wm3AiUM2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0706924428192879232==
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
head:   6e0567b7305209c2d689ce57180a63d8dc657ad8
commit: 372904c080be44629d84bb15ed5e12eed44b5f9f seq_file: move seq_escape(=
) to a header
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-c001-20211219 (https://download.01.org/0day-ci/arch=
ive/20211221/202112211442.wm3AiUM2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31=
a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D372904c080be44629d84bb15ed5e12eed44b5f9f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 372904c080be44629d84bb15ed5e12eed44b5f9f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   mm/secretmem.c:165:15: warning: Value stored to 'file' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct file *file =3D ERR_PTR(-ENOMEM);
                        ^~~~   ~~~~~~~~~~~~~~~~
   mm/secretmem.c:165:15: note: Value stored to 'file' during its initializ=
ation is never read
           struct file *file =3D ERR_PTR(-ENOMEM);
                        ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/memfd.c:281:2: warning: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   mm/memfd.c:281:2: note: Call to function 'strcpy' is insecure as it does=
 not provide bounding of the memory buffer. Replace unbounded copy function=
s with analogous functions that support length arguments such as 'strlcpy'.=
 CWE-119
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/jbd2/commit.c:619:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   fs/jbd2/commit.c:619:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/sysfs/file.c:54:2: warning: Null pointer passed as 1st argument to me=
mory set function [clang-analyzer-unix.cstring.NullArg]
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   fs/sysfs/file.c:49:10: note: Calling 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:66:9: note: Assuming field 'count' is <=3D fiel=
d 'size'
           BUG_ON(m->count > m->size);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/seq_file.h:66:2: note: Taking false branch
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/seq_file.h:66:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/seq_file.h:67:6: note: Assuming field 'count' is >=3D fiel=
d 'size'
           if (m->count < m->size)
               ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:67:2: note: Taking false branch
           if (m->count < m->size)

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
--===============0706924428192879232==--

