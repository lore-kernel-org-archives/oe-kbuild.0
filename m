Content-Type: multipart/mixed; boundary="===============2986223267505826186=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5930/6564] mm/memfd.c:80:2: warning: Value stored to 'count' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 18 Feb 2022 09:15:03 +0800
Message-ID: <202202180934.WeFxWgEq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2986223267505826186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: wangyong <wang.yong12@zte.com.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
commit: 27323748616bf2fd2f3b70e1a5fff9843dae5840 [5930/6564] memfd: fix shm=
em huge page failed to set F_SEAL_WRITE attribute problem
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20218/202202180934.WeFxWgEq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a=
783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D27323748616bf2fd2f3b70e1a5fff9843dae5840
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 27323748616bf2fd2f3b70e1a5fff9843dae5840
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           tmp =3D (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x257' is <=3D =
'__UNIQUE_ID___y258'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/lm75.h:27:14: note: '?' condition is false
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x259' is < '__UNIQUE_ID=
___y260'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
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
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> mm/memfd.c:80:2: warning: Value stored to 'count' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           count =3D 0;
           ^       ~
   mm/memfd.c:80:2: note: Value stored to 'count' is never read
           count =3D 0;
           ^       ~
   mm/memfd.c:291:2: warning: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   mm/memfd.c:291:2: note: Call to function 'strcpy' is insecure as it does=
 not provide bounding of the memory buffer. Replace unbounded copy function=
s with analogous functions that support length arguments such as 'strlcpy'.=
 CWE-119
           strcpy(name, MFD_NAME_PREFIX);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/stat.c:227:20: warning: The left expression of the compound assignmen=
t is an uninitialized value. The computed value will also be garbage [clang=
-analyzer-core.uninitialized.Assign]
           stat->result_mask |=3D STATX_MNT_ID;
                             ^
   fs/stat.c:392:1: note: Calling '__se_sys_newlstat'
   SYSCALL_DEFINE2(newlstat, const char __user *, filename,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:231:2: note: expanded from macro =
'__SYSCALL_DEFINEx'
           __X64_SYS_STUBx(x, name, __VA_ARGS__)                           \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:97:2: note: expanded from macro '=
__X64_SYS_STUBx'
           __SYS_STUBx(x64, sys##name,                                     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/stat.c:392:1: note: Calling '__do_sys_newlstat'
   SYSCALL_DEFINE2(newlstat, const char __user *, filename,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:235:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/stat.c:398:10: note: Calling 'vfs_lstat'
           error =3D vfs_lstat(filename, &stat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3288:9: note: Calling 'vfs_fstatat'
           return vfs_fstatat(AT_FDCWD, name, stat, AT_SYMLINK_NOFOLLOW);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:243:9: note: Calling 'vfs_statx'
           return vfs_statx(dfd, filename, flags | AT_NO_AUTOMOUNT,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:209:2: note: Taking false branch
           if (flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT | AT_EMPTY_P=
ATH |
           ^
   fs/stat.c:213:2: note: Taking false branch
           if (!(flags & AT_SYMLINK_NOFOLLOW))
           ^
   fs/stat.c:215:2: note: Taking false branch
           if (!(flags & AT_NO_AUTOMOUNT))
           ^
   fs/stat.c:217:2: note: Taking false branch
           if (flags & AT_EMPTY_PATH)
           ^
   fs/stat.c:222:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/stat.c:222:2: note: Taking false branch
           if (error)
           ^
   fs/stat.c:225:10: note: Calling 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/count +80 mm/memfd.c

5d752600a8c373 Mike Kravetz            2018-06-07   61  =

5d752600a8c373 Mike Kravetz            2018-06-07   62  /*
5d752600a8c373 Mike Kravetz            2018-06-07   63   * Setting SEAL_WRI=
TE requires us to verify there's no pending writer. However,
5d752600a8c373 Mike Kravetz            2018-06-07   64   * via get_user_pag=
es(), drivers might have some pending I/O without any active
5d752600a8c373 Mike Kravetz            2018-06-07   65   * user-space mappi=
ngs (eg., direct-IO, AIO). Therefore, we look at all pages
5d752600a8c373 Mike Kravetz            2018-06-07   66   * and see whether =
it has an elevated ref-count. If so, we tag them and wait for
5d752600a8c373 Mike Kravetz            2018-06-07   67   * them to be dropp=
ed.
5d752600a8c373 Mike Kravetz            2018-06-07   68   * The caller must =
guarantee that no new user will acquire writable references
5d752600a8c373 Mike Kravetz            2018-06-07   69   * to those pages t=
o avoid races.
5d752600a8c373 Mike Kravetz            2018-06-07   70   */
5d752600a8c373 Mike Kravetz            2018-06-07   71  static int memfd_wa=
it_for_pins(struct address_space *mapping)
5d752600a8c373 Mike Kravetz            2018-06-07   72  {
2313216f861f95 Matthew Wilcox          2017-11-22   73  	XA_STATE(xas, &map=
ping->i_pages, 0);
5d752600a8c373 Mike Kravetz            2018-06-07   74  	struct page *page;
27323748616bf2 wangyong                2022-02-16   75  	int error, scan, c=
ount;
5d752600a8c373 Mike Kravetz            2018-06-07   76  =

ef3038a573aa8b Matthew Wilcox          2017-11-22   77  	memfd_tag_pins(&xa=
s);
5d752600a8c373 Mike Kravetz            2018-06-07   78  =

5d752600a8c373 Mike Kravetz            2018-06-07   79  	error =3D 0;
27323748616bf2 wangyong                2022-02-16  @80  	count =3D 0;
5d752600a8c373 Mike Kravetz            2018-06-07   81  	for (scan =3D 0; s=
can <=3D LAST_SCAN; scan++) {
2313216f861f95 Matthew Wilcox          2017-11-22   82  		unsigned int tagg=
ed =3D 0;
2313216f861f95 Matthew Wilcox          2017-11-22   83  =

2313216f861f95 Matthew Wilcox          2017-11-22   84  		if (!xas_marked(&=
xas, MEMFD_TAG_PINNED))
5d752600a8c373 Mike Kravetz            2018-06-07   85  			break;
5d752600a8c373 Mike Kravetz            2018-06-07   86  =

5d752600a8c373 Mike Kravetz            2018-06-07   87  		if (!scan)
5d752600a8c373 Mike Kravetz            2018-06-07   88  			lru_add_drain_al=
l();
5d752600a8c373 Mike Kravetz            2018-06-07   89  		else if (schedule=
_timeout_killable((HZ << scan) / 200))
5d752600a8c373 Mike Kravetz            2018-06-07   90  			scan =3D LAST_SC=
AN;
5d752600a8c373 Mike Kravetz            2018-06-07   91  =

2313216f861f95 Matthew Wilcox          2017-11-22   92  		xas_set(&xas, 0);
2313216f861f95 Matthew Wilcox          2017-11-22   93  		xas_lock_irq(&xas=
);
2313216f861f95 Matthew Wilcox          2017-11-22   94  		xas_for_each_mark=
ed(&xas, page, ULONG_MAX, MEMFD_TAG_PINNED) {
2313216f861f95 Matthew Wilcox          2017-11-22   95  			bool clear =3D t=
rue;
2313216f861f95 Matthew Wilcox          2017-11-22   96  			if (xa_is_value(=
page))
5d752600a8c373 Mike Kravetz            2018-06-07   97  				continue;
27323748616bf2 wangyong                2022-02-16   98  =

4101196b19d7f9 Matthew Wilcox (Oracle  2019-09-23   99) 			page =3D find_su=
bpage(page, xas.xa_index);
27323748616bf2 wangyong                2022-02-16  100  			count =3D page_c=
ount(page);
27323748616bf2 wangyong                2022-02-16  101  			if (PageTransCom=
pound(page))
27323748616bf2 wangyong                2022-02-16  102  				count -=3D (1 <=
< compound_order(compound_head(page))) - 1;
27323748616bf2 wangyong                2022-02-16  103  			if (count - page=
_mapcount(page) !=3D 1) {
5d752600a8c373 Mike Kravetz            2018-06-07  104  				/*
5d752600a8c373 Mike Kravetz            2018-06-07  105  				 * On the last =
scan, we clean up all those tags
5d752600a8c373 Mike Kravetz            2018-06-07  106  				 * we inserted;=
 but make a note that we still
5d752600a8c373 Mike Kravetz            2018-06-07  107  				 * found pages =
pinned.
5d752600a8c373 Mike Kravetz            2018-06-07  108  				 */
2313216f861f95 Matthew Wilcox          2017-11-22  109  				if (scan =3D=3D=
 LAST_SCAN)
5d752600a8c373 Mike Kravetz            2018-06-07  110  					error =3D -EBU=
SY;
2313216f861f95 Matthew Wilcox          2017-11-22  111  				else
2313216f861f95 Matthew Wilcox          2017-11-22  112  					clear =3D fals=
e;
5d752600a8c373 Mike Kravetz            2018-06-07  113  			}
2313216f861f95 Matthew Wilcox          2017-11-22  114  			if (clear)
2313216f861f95 Matthew Wilcox          2017-11-22  115  				xas_clear_mark(=
&xas, MEMFD_TAG_PINNED);
2313216f861f95 Matthew Wilcox          2017-11-22  116  			if (++tagged % X=
A_CHECK_SCHED)
2313216f861f95 Matthew Wilcox          2017-11-22  117  				continue;
5d752600a8c373 Mike Kravetz            2018-06-07  118  =

2313216f861f95 Matthew Wilcox          2017-11-22  119  			xas_pause(&xas);
2313216f861f95 Matthew Wilcox          2017-11-22  120  			xas_unlock_irq(&=
xas);
2313216f861f95 Matthew Wilcox          2017-11-22  121  			cond_resched();
2313216f861f95 Matthew Wilcox          2017-11-22  122  			xas_lock_irq(&xa=
s);
5d752600a8c373 Mike Kravetz            2018-06-07  123  		}
2313216f861f95 Matthew Wilcox          2017-11-22  124  		xas_unlock_irq(&x=
as);
5d752600a8c373 Mike Kravetz            2018-06-07  125  	}
5d752600a8c373 Mike Kravetz            2018-06-07  126  =

5d752600a8c373 Mike Kravetz            2018-06-07  127  	return error;
5d752600a8c373 Mike Kravetz            2018-06-07  128  }
5d752600a8c373 Mike Kravetz            2018-06-07  129  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2986223267505826186==--

