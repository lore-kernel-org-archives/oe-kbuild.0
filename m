Content-Type: multipart/mixed; boundary="===============1120712560491030236=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.18.y-rt-rebase 16/88] kernel/printk/printk.c:3000:2: warning: Value stored to 'seq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 09 May 2022 06:23:09 +0800
Message-ID: <202205090654.TUAtvl6m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1120712560491030236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.18.y-rt-rebase
head:   85d3fa34b4aeae67ba73c8f509b04fb0f480714c
commit: 3d1c5b7496835657ed920d5709a5e5b9b8ba2ce0 [16/88] printk: add infras=
tucture for atomic consoles
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220509/202205090654.TUAtvl6m-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3D3d1c5b7496835657ed920d5709a5e5b9b8ba2ce0
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.18.y-rt-rebase
        git checkout 3d1c5b7496835657ed920d5709a5e5b9b8ba2ce0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:117:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:117:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:119:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing t=
o 'to->it_value.tv_sec'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:119:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:121:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:121:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:123:2: note: Returning without writing to 'to->i=
t_value.tv_sec'
           return res;
           ^
   include/linux/uaccess.h:152:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:153:2: note: Returning without writing to 'to->i=
t_value.tv_sec'
           return n;
           ^
   kernel/time/itimer.c:317:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&v, i, sizeof(struct __kernel_old_itimerval)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/itimer.c:317:2: note: Taking false branch
           if (copy_from_user(&v, i, sizeof(struct __kernel_old_itimerval)))
           ^
   kernel/time/itimer.c:321:7: note: The left operand of '>=3D' is a garbag=
e value
           if (!timeval_valid(&v.it_value) ||
                ^
   kernel/time/itimer.c:204:16: note: expanded from macro 'timeval_valid'
           (((t)->tv_sec >=3D 0) && (((unsigned long) (t)->tv_usec) < USEC_=
PER_SEC))
             ~~~~~~~~~~~ ^
   kernel/time/itimer.c:343:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&set_buffer, 0, sizeof(set_buffer));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   kernel/time/itimer.c:343:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&set_buffer, 0, sizeof(set_buffer));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   kernel/printk/printk.c:165:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:165:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:167:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:167:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:2633:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf + 4, str, sizeof(buf) - 5);
                   ^~~~~~~
   kernel/printk/printk.c:2633:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf + 4, str, sizeof(buf) - 5);
                   ^~~~~~~
   kernel/printk/printk.c:2635:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf, str, sizeof(buf) - 1);
                   ^~~~~~~
   kernel/printk/printk.c:2635:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf, str, sizeof(buf) - 1);
                   ^~~~~~~
>> kernel/printk/printk.c:3000:2: warning: Value stored to 'seq' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:3000:2: note: Value stored to 'seq' is never read
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   kernel/resource.c:83:2: warning: The expression is an uninitialized valu=
e. The computed value will also be garbage [clang-analyzer-core.uninitializ=
ed.Assign]
           (*pos)++;
           ^
   kernel/resource.c:1654:2: note: 'l' declared without an initial value
           loff_t l;
           ^~~~~~~~
   kernel/resource.c:1657:2: note: Loop condition is true.  Entering loop b=
ody
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
           ^
   kernel/resource.c:1662:7: note: Assuming the condition is true
                   if (p->start >=3D addr + size)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/resource.c:1662:3: note: Taking true branch
                   if (p->start >=3D addr + size)
                   ^
   kernel/resource.c:1663:4: note:  Execution continues on line 1657
                           continue;
                           ^
   kernel/resource.c:1657:29: note: Calling 'r_next'
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
                                      ^~~~~~~~~~~~~~~~~~~
   kernel/resource.c:83:2: note: The expression is an uninitialized value. =
The computed value will also be garbage
           (*pos)++;
           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   kernel/capability.c:250:20: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
                   effective.cap[i] =3D kdata[i].effective;
                                    ^
   kernel/capability.c:222:1: note: Calling '__do_sys_capset'
   SYSCALL_DEFINE2(capset, cap_user_header_t, header, const cap_user_data_t=
, data)
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
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   kernel/capability.c:232:6: note: 'ret' is equal to 0
           if (ret !=3D 0)
               ^~~
   kernel/capability.c:232:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   kernel/capability.c:235:6: note: '?' condition is true
           if (get_user(pid, &header->pid))
               ^
   arch/mips/include/asm/uaccess.h:97:2: note: expanded from macro 'get_use=
r'
           access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
           ^
   include/asm-generic/access_ok.h:45:31: note: expanded from macro 'access=
_ok'
   #define access_ok(addr, size) likely(__access_ok(addr, size))
                                 ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   kernel/capability.c:235:6: note: Control jumps to 'case 4:'  at line 235
           if (get_user(pid, &header->pid))
               ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_us=
er'
           access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
                                          ^
   arch/mips/include/asm/uaccess.h:175:2: note: expanded from macro '__get_=
user'
           switch (sizeof(*__gu_ptr)) {                                    \
           ^
   kernel/capability.c:235:6: note:  Execution continues on line 235
           if (get_user(pid, &header->pid))
               ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_us=
er'
           access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
                                          ^
   arch/mips/include/asm/uaccess.h:184:3: note: expanded from macro '__get_=
user'
                   break;                                                  \
                   ^
   kernel/capability.c:235:6: note: Assuming the condition is false
           if (get_user(pid, &header->pid))
               ^
   arch/mips/include/asm/uaccess.h:92:31: note: expanded from macro 'get_us=
er'

vim +/seq +3000 kernel/printk/printk.c

3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  2=
957  =

2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
958  /*
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
959   * Print one record for the given console. The record printed is whate=
ver
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
960   * record is the next available record for the given console.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
961   *
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
962   * @text is a buffer of size CONSOLE_LOG_MAX.
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
963   *
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
964   * If extended messages should be printed, @ext_text is a buffer of si=
ze
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
965   * CONSOLE_EXT_LOG_MAX. Otherwise @ext_text must be NULL.
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
966   *
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
967   * If dropped messages should be printed, @dropped_text is a buffer of=
 size
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
968   * DROPPED_TEXT_MAX. Otherwise @dropped_text must be NULL.
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
969   *
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  2=
970   * @atomic_printing specifies if atomic printing should be used.
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  2=
971   *
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
972   * @handover will be set to true if a printk waiter has taken over the
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
973   * console_lock, in which case the caller is no longer holding the
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
974   * console_lock. Otherwise it is set to false. A NULL pointer may be p=
rovided
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
975   * to disable allowing the console_lock to be taken over by a printk w=
aiter.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
976   *
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
977   * Returns false if the given console has no next record to print, oth=
erwise
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
978   * true.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
979   *
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
980   * Requires the console_lock if @handover is non-NULL.
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
981   * Requires con->lock otherwise.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
982   */
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
983  static bool __console_emit_next_record(struct console *con, char *text=
, char *ext_text,
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  2=
984  				       char *dropped_text, bool atomic_printing,
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  2=
985  				       bool *handover)
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
986  {
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
987  	static atomic_t panic_console_dropped =3D ATOMIC_INIT(0);
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
988  	struct printk_info info;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
989  	struct printk_record r;
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
990  	unsigned long flags;
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
991  	char *write_text;
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
992  	size_t len;
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  2=
993  	u64 seq;
78944e549d3667 kernel/printk.c        Antonino A. Daplas      2006-08-05  2=
994  =

8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  2=
995  	prb_rec_init_rd(&r, &info, text, CONSOLE_LOG_MAX);
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
996  =

12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  2=
997  	if (handover)
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  2=
998  		*handover =3D false;
78944e549d3667 kernel/printk.c        Antonino A. Daplas      2006-08-05  2=
999  =

3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04 @3=
000  	seq =3D read_console_seq(con);
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
001  =

3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
002  	if (!prb_read_valid(prb, seq, &r))
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
003  		return false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  3=
004  =

3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
005  	if (seq !=3D r.info->seq) {
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
006  		atomic_long_add((unsigned long)(r.info->seq - seq), &con->dropped);
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
007  		write_console_seq(con, r.info->seq, atomic_printing);
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
008  		seq =3D r.info->seq;
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
009  		if (panic_in_progress() &&
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
010  		    atomic_fetch_inc_relaxed(&panic_console_dropped) > 10) {
13fb0f74d7029d kernel/printk/printk.c Stephen Brennan         2022-02-02  3=
011  			suppress_panic_printk =3D 1;
13fb0f74d7029d kernel/printk/printk.c Stephen Brennan         2022-02-02  3=
012  			pr_warn_once("Too many dropped messages. Suppress messages on non-p=
anic CPUs to prevent livelock.\n");
13fb0f74d7029d kernel/printk/printk.c Stephen Brennan         2022-02-02  3=
013  		}
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  3=
014  	}
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  3=
015  =

2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
016  	/* Skip record that has level above the console loglevel. */
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  3=
017  	if (suppress_message_printing(r.info->level)) {
3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
018  		write_console_seq(con, seq + 1, atomic_printing);
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  3=
019  		goto skip;
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  3=
020  	}
649e6ee33f73ba kernel/printk.c        Kay Sievers             2012-05-10  3=
021  =

8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  3=
022  	if (ext_text) {
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  3=
023  		write_text =3D ext_text;
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  3=
024  		len =3D info_print_ext_header(ext_text, CONSOLE_EXT_LOG_MAX, r.info);
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  3=
025  		len +=3D msg_print_ext_body(ext_text + len, CONSOLE_EXT_LOG_MAX - le=
n,
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
026  					  &r.text_buf[0], r.info->text_len, &r.info->dev_info);
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
027  	} else {
8c4dae430b12f6 kernel/printk/printk.c John Ogness             2022-04-20  3=
028  		write_text =3D text;
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
029  		len =3D record_print_text(&r, console_msg_format & MSG_FORMAT_SYSLOG=
, printk_time);
6fe29354befe4c kernel/printk/printk.c Tejun Heo               2015-06-25  3=
030  	}
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  3=
031  =

12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
032  	if (handover) {
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
033) 		/*
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
034) 		 * While actively printing out messages, if another printk()
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
035) 		 * were to occur on another CPU, it may wait for this one to
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
036) 		 * finish. This task can not be preempted if there is a
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
037) 		 * waiter waiting to take over.
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  3=
038  		 *
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  3=
039  		 * Interrupts are disabled because the hand over to a waiter
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  3=
040  		 * must not be interrupted until the hand over is completed
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  3=
041  		 * (@console_waiter is cleared).
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
042) 		 */
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  3=
043  		printk_safe_enter_irqsave(flags);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  3=
044  		console_lock_spinning_enable();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
045) =

12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
046  		/* don't trace irqsoff print latency */
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
047  		stop_critical_timings();
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
048  	}
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
049  =

3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
050  	call_console_driver(con, write_text, len, dropped_text, atomic_printi=
ng);
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  3=
051) =

3d1c5b74968356 kernel/printk/printk.c John Ogness             2022-02-04  3=
052  	write_console_seq(con, seq + 1, atomic_printing);
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
053  =

12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
054  	if (handover) {
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
055  		start_critical_timings();
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
056  		*handover =3D console_lock_spinning_disable_and_check();
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  3=
057  		printk_safe_exit_irqrestore(flags);
12c5dd5ab7c1bd kernel/printk/printk.c John Ogness             2022-04-25  3=
058  	}
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
059  skip:
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
060  	return true;
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
061  }
2a0dffd316b367 kernel/printk/printk.c John Ogness             2022-04-20  3=
062  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1120712560491030236==--

