Content-Type: multipart/mixed; boundary="===============7110861837966490300=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [l1k:smsc95xx_5.17 15/201] kernel/printk/printk.c:2900:2: warning: Value stored to 'seq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 10 Apr 2022 08:00:19 +0800
Message-ID: <202204100705.ZlwSIlL5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7110861837966490300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Lukas Wunner <lukas@wunner.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   240f56c27361c195cd502d95aba51c6b8e5b808c
commit: 3d78fbbbe0e517f040f53e18d3df78070682d3a6 [15/201] printk: add infra=
stucture for atomic consoles
:::::: branch date: 33 hours ago
:::::: commit date: 11 days ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220410/202204100705.ZlwSIlL5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c=
18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/l1k/linux/commit/3d78fbbbe0e517f040f53e18d3df7=
8070682d3a6
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k smsc95xx_5.17
        git checkout 3d78fbbbe0e517f040f53e18d3df78070682d3a6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                         ^
   include/linux/thread_info.h:221:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:221:26: note: Assuming 'sz' is < 'bytes', wh=
ich participates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/thread_info.h:221:15: note: 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/thread_info.h:221:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:221:26: note: 'sz' is < 'bytes', which parti=
cipates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/thread_info.h:221:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:222:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/remoteproc/remoteproc_debugfs.c:82:8: note: Returning from 'copy=
_from_user'
           ret =3D copy_from_user(buf, user_buf, count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_debugfs.c:83:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/remoteproc/remoteproc_debugfs.c:83:2: note: Taking false branch
           if (ret)
           ^
   drivers/remoteproc/remoteproc_debugfs.c:87:21: note: The left operand of=
 '=3D=3D' is a garbage value due to array index out of bounds
           if (buf[count - 1] =3D=3D '\n')
               ~~~~~~~~~~~~~~ ^
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/printk/printk.c:157:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:157:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:159:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:159:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
>> kernel/printk/printk.c:2900:2: warning: Value stored to 'seq' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2900:2: note: Value stored to 'seq' is never read
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its in=
itialization is never read
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
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
   5 warnings generated.
   drivers/media/i2c/tvp7002.c:637:37: warning: The right operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           lpfr =3D lpf_lsb | ((TVP7002_CL_MASK & lpf_msb) << TVP7002_CL_SH=
IFT);
                                              ^
   drivers/media/i2c/tvp7002.c:753:2: note: Calling 'tvp7002_query_dv'
           tvp7002_query_dv(sd, &detected);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:616:2: note: 'lpf_msb' declared without an i=
nitial value
           u8 lpf_msb;
           ^~~~~~~~~~
   drivers/media/i2c/tvp7002.c:625:2: note: Calling 'tvp7002_read_err'
           tvp7002_read_err(sd, TVP7002_L_FRAME_STAT_MSBS, &lpf_msb, &error=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:475:6: note: Assuming the condition is false
           if (!*err)
               ^~~~~
   drivers/media/i2c/tvp7002.c:475:2: note: Taking false branch
           if (!*err)
           ^
   drivers/media/i2c/tvp7002.c:477:1: note: Returning without writing to '*=
dst'
   }
   ^
   drivers/media/i2c/tvp7002.c:625:2: note: Returning from 'tvp7002_read_er=
r'
           tvp7002_read_err(sd, TVP7002_L_FRAME_STAT_MSBS, &lpf_msb, &error=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   drivers/media/i2c/tvp7002.c:627:2: note: Taking false branch
           if (error < 0)

vim +/seq +2900 kernel/printk/printk.c

3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
858  =

6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
859  /*
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
860   * Print one record for the given console. The record printed is whate=
ver
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
861   * record is the next available record for the given console.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
862   *
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
863   * @text is a buffer of size CONSOLE_LOG_MAX.
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
864   *
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
865   * If extended messages should be printed, @ext_text is a buffer of si=
ze
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
866   * CONSOLE_EXT_LOG_MAX. Otherwise @ext_text must be NULL.
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
867   *
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
868   * If dropped messages should be printed, @dropped_text is a buffer of=
 size
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
869   * DROPPED_TEXT_MAX. Otherwise @dropped_text must be NULL.
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
870   *
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
871   * @atomic_printing specifies if atomic printing should be used.
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
872   *
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
873   * Requires the console_lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
874   *
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
875   * Returns false if the given console has no next record to print, oth=
erwise
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
876   * true.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
877   *
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
878   * @handover will be set to true if a printk waiter has taken over the
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
879   * console_lock, in which case the caller is no longer holding the
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
880   * console_lock. Otherwise it is set to false. A NULL pointer may be p=
rovided
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
881   * to disable allowing the console_lock to be taken over by a printk w=
aiter.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
882   */
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
883  static bool console_emit_next_record(struct console *con, char *text, =
char *ext_text,
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
884  				     char *dropped_text, bool atomic_printing,
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
885  				     bool *handover)
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
886  {
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
887  	struct printk_info info;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
888  	struct printk_record r;
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
889  	unsigned long flags;
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
890  	bool allow_handover;
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
891  	char *write_text;
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
892  	size_t len;
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
893  	u64 seq;
78944e549d3667 kernel/printk.c        Antonino A. Daplas      2006-08-05  2=
894  =

00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
895  	prb_rec_init_rd(&r, &info, text, CONSOLE_LOG_MAX);
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
896  =

905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
897  	if (handover)
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
898  		*handover =3D false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
899  =

3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04 @2=
900  	seq =3D read_console_seq(con);
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
901  =

3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
902  	if (!prb_read_valid(prb, seq, &r))
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
903  		return false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
904  =

3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
905  	if (seq !=3D r.info->seq) {
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
906  		atomic_long_add((unsigned long)(r.info->seq - seq), &con->dropped);
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
907  		write_console_seq(con, r.info->seq, atomic_printing);
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
908  		seq =3D r.info->seq;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
909  	}
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
910  =

6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
911  	/* Skip record that has level above the console loglevel. */
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
912  	if (suppress_message_printing(r.info->level)) {
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
913  		write_console_seq(con, seq + 1, atomic_printing);
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2=
914  		goto skip;
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2=
915  	}
649e6ee33f73ba kernel/printk.c        Kay Sievers             2012-05-10  2=
916  =

00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
917  	if (ext_text) {
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
918  		write_text =3D ext_text;
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
919  		len =3D info_print_ext_header(ext_text, CONSOLE_EXT_LOG_MAX, r.info);
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
920  		len +=3D msg_print_ext_body(ext_text + len, CONSOLE_EXT_LOG_MAX - le=
n,
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
921  					  &r.text_buf[0], r.info->text_len, &r.info->dev_info);
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
922  	} else {
00e59e6f86fa55 kernel/printk/printk.c John Ogness             2022-02-07  2=
923  		write_text =3D text;
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
924  		len =3D record_print_text(&r, console_msg_format & MSG_FORMAT_SYSLOG=
, printk_time);
6fe29354befe4c kernel/printk/printk.c Tejun Heo               2015-06-25  2=
925  	}
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
926  =

905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
927  	/* Handovers may only happen between trylock contexts. */
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
928  	allow_handover =3D (handover && atomic_read(&console_lock_count) =3D=
=3D -1);
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
929  =

905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
930  	if (allow_handover) {
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
931) 		/*
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
932) 		 * While actively printing out messages, if another printk()
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
933) 		 * were to occur on another CPU, it may wait for this one to
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
934) 		 * finish. This task can not be preempted if there is a
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
935) 		 * waiter waiting to take over.
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
936  		 *
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
937  		 * Interrupts are disabled because the hand over to a waiter
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
938  		 * must not be interrupted until the hand over is completed
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
939  		 * (@console_waiter is cleared).
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
940) 		 */
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
941  		printk_safe_enter_irqsave(flags);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2=
942  		console_lock_spinning_enable();
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
943  	}
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
944) =

81d68a96a39844 kernel/printk.c        Steven Rostedt          2008-05-12  2=
945  	stop_critical_timings();	/* don't trace print latency */
3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
946  	call_console_driver(con, write_text, len, dropped_text, atomic_printi=
ng);
81d68a96a39844 kernel/printk.c        Steven Rostedt          2008-05-12  2=
947  	start_critical_timings();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
948) =

3d78fbbbe0e517 kernel/printk/printk.c John Ogness             2022-02-04  2=
949  	write_console_seq(con, seq + 1, atomic_printing);
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
950  =

905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
951  	if (allow_handover) {
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
952  		*handover =3D console_lock_spinning_disable_and_check();
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2=
953  		printk_safe_exit_irqrestore(flags);
905897bc823b80 kernel/printk/printk.c John Ogness             2022-02-07  2=
954  	}
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
955  =

6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
956  	printk_delay(r.info->level);
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
957  skip:
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
958  	return true;
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
959  }
6b43079079e51c kernel/printk/printk.c John Ogness             2022-02-07  2=
960  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7110861837966490300==--

