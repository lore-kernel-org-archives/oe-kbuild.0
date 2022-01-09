Content-Type: multipart/mixed; boundary="===============8431859289071221025=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/fcntl.c:301:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 10 Jan 2022 02:40:50 +0800
Message-ID: <202201100235.j9W82E92-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8431859289071221025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b MIPS: Remove get_fs/set_fs
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-c004-20211227 (https://download.01.org/0day-ci/arch=
ive/20220110/202201100235.j9W82E92-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 04324f44cb69a03fdc8f2ee52386a4fdf6a0043b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/tty/tty_io.c:2641:18: warning: The left operand of '&' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           flags =3D v.flags & ASYNC_DEPRECATED;
                           ^
   drivers/tty/tty_io.c:2688:2: note: Taking false branch
           if (tty_paranoia_check(tty, file_inode(file), "tty_ioctl"))
           ^
   drivers/tty/tty_io.c:2696:2: note: 'Default' branch taken. Execution con=
tinues on line 2716
           switch (cmd) {
           ^
   drivers/tty/tty_io.c:2716:2: note: Control jumps to 'case 21637:'  at li=
ne 2789
           switch (cmd) {
           ^
   drivers/tty/tty_io.c:2790:10: note: Calling 'tty_tiocsserial'
                   return tty_tiocsserial(tty, p);
                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_io.c:2638:6: note: Calling 'copy_from_user'
           if (copy_from_user(&v, ss, sizeof(*ss)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:472:2: note: Returning without writing t=
o 'to->flags'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
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
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
lags'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->f=
lags'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/tty/tty_io.c:2638:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&v, ss, sizeof(*ss)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_io.c:2638:2: note: Taking false branch
           if (copy_from_user(&v, ss, sizeof(*ss)))
           ^
   drivers/tty/tty_io.c:2641:18: note: The left operand of '&' is a garbage=
 value
           flags =3D v.flags & ASYNC_DEPRECATED;
                   ~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/fcntl.c:301:8: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
                   hint =3D (enum rw_hint) h;
                        ^
   fs/fcntl.c:480:1: note: Calling '__do_sys_fcntl64'
   SYSCALL_DEFINE3(fcntl64, unsigned int, fd, unsigned int, cmd,
   ^
   include/linux/syscalls.h:216:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:225:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:246:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/fcntl.c:488:6: note: Assuming field 'file' is non-null
           if (!f.file)
               ^~~~~~~
   fs/fcntl.c:488:2: note: Taking false branch
           if (!f.file)
           ^
   fs/fcntl.c:491:6: note: Assuming the condition is false
           if (unlikely(f.file->f_mode & FMODE_PATH)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'
   #define __branch_check__(x, expect, is_constant) ({                     \
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/fcntl.c:491:2: note: Taking false branch
           if (unlikely(f.file->f_mode & FMODE_PATH)) {
           ^
   fs/fcntl.c:497:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/fcntl.c:497:2: note: Taking false branch
           if (err)
           ^
   fs/fcntl.c:500:2: note: Control jumps to the 'default' case at line 519
           switch (cmd) {
           ^
   fs/fcntl.c:520:9: note: Calling 'do_fcntl'
                   err =3D do_fcntl(fd, cmd, arg, f.file);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fcntl.c:337:2: note: Control jumps to 'case 1038:'  at line 434
           switch (cmd) {
           ^
   fs/fcntl.c:435:9: note: Calling 'fcntl_rw_hint'
                   err =3D fcntl_rw_hint(filp, cmd, arg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fcntl.c:290:2: note: 'h' declared without an initial value
           u64 h;
           ^~~~~
   fs/fcntl.c:292:2: note: Control jumps to 'case 1038:'  at line 298
           switch (cmd) {
           ^
   fs/fcntl.c:299:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&h, argp, sizeof(h)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
--
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mfd/max8997-irq.c:248:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_FLASH=
STATUS,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/mfd/max8997-irq.c:248:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_FLASH=
STATUS,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
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
   drivers/tty/serial/fsl_lpuart.c:1220:33: warning: The result of the left=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^
   drivers/tty/serial/fsl_lpuart.c:2788:6: note: Assuming field 'suspended'=
 is 0
           if (sport->port.suspended && !irq_wake)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2788:28: note: Left side of '&&' is false
           if (sport->port.suspended && !irq_wake)
                                     ^
   drivers/tty/serial/fsl_lpuart.c:2791:2: note: Taking true branch
           if (lpuart_is_32(sport))
           ^
   drivers/tty/serial/fsl_lpuart.c:2796:6: note: Assuming field 'lpuart_dma=
_rx_use' is true
           if (sport->lpuart_dma_rx_use) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2796:2: note: Taking true branch
           if (sport->lpuart_dma_rx_use) {
           ^
   drivers/tty/serial/fsl_lpuart.c:2797:7: note: Assuming 'irq_wake' is true
                   if (irq_wake) {
                       ^~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2797:3: note: Taking true branch
                   if (irq_wake) {
                   ^
   drivers/tty/serial/fsl_lpuart.c:2798:9: note: Calling 'lpuart_start_rx_d=
ma'
                           if (!lpuart_start_rx_dma(sport))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1211:9: note: Assuming the condition is =
false
           bits =3D (termios->c_cflag & CSIZE) =3D=3D CS7 ? 9 : 10;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1211:9: note: '?' condition is false
   drivers/tty/serial/fsl_lpuart.c:1212:6: note: Assuming the condition is =
false
           if (termios->c_cflag & PARENB)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1212:2: note: Taking false branch
           if (termios->c_cflag & PARENB)
           ^
   drivers/tty/serial/fsl_lpuart.c:1220:33: note: The result of the left sh=
ift is undefined because the right operand is negative
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
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
   drivers/tty/serial/mvebu-uart.c:513:4: warning: Value stored to 'baud' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           baud =3D uart_get_baud_rate(port, old, NULL, 0, =
230400);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/tty/serial/mvebu-uart.c:513:4: note: Value stored to 'baud' is n=
ever read
                           baud =3D uart_get_baud_rate(port, old, NULL, 0, =
230400);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/tty/tty_ioctl.c:537:23: warning: Assigned value is garbage or un=
defined [clang-analyzer-core.uninitialized.Assign]
           termios.c_cc[VERASE] =3D tmp.sg_erase;
                                ^
   drivers/tty/tty_ioctl.c:842:2: note: Control jumps to the 'default' case=
 at line 881
           switch (cmd) {
           ^
   drivers/tty/tty_ioctl.c:883:10: note: Calling 'tty_mode_ioctl'
                   return tty_mode_ioctl(tty, file, cmd, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_ioctl.c:671:9: note: Assuming 'file' is equal to null
           BUG_ON(file =3D=3D NULL);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/tty/tty_ioctl.c:673:6: note: Assuming field 'type' is not equal =
to TTY_DRIVER_TYPE_PTY
           if (tty->driver->type =3D=3D TTY_DRIVER_TYPE_PTY &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_ioctl.c:673:47: note: Left side of '&&' is false
           if (tty->driver->type =3D=3D TTY_DRIVER_TYPE_PTY &&
                                                        ^
   drivers/tty/tty_ioctl.c:679:2: note: Control jumps to 'case 29706:'  at =
line 684
           switch (cmd) {
           ^
   drivers/tty/tty_ioctl.c:685:10: note: Calling 'set_sgttyb'
                   return set_sgttyb(real_tty, (struct sgttyb __user *) arg=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/tty_ioctl.c:529:6: note: Assuming 'retval' is 0
           if (retval)
               ^~~~~~
   drivers/tty/tty_ioctl.c:529:2: note: Taking false branch
           if (retval)
           ^
   drivers/tty/tty_ioctl.c:532:6: note: Calling 'copy_from_user'
           if (copy_from_user(&tmp, sgttyb, sizeof(tmp)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is false
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:86:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {

vim +301 fs/fcntl.c

c75b1d9421f80f Jens Axboe 2017-06-27  283  =

c75b1d9421f80f Jens Axboe 2017-06-27  284  static long fcntl_rw_hint(struct=
 file *file, unsigned int cmd,
c75b1d9421f80f Jens Axboe 2017-06-27  285  			  unsigned long arg)
c75b1d9421f80f Jens Axboe 2017-06-27  286  {
c75b1d9421f80f Jens Axboe 2017-06-27  287  	struct inode *inode =3D file_in=
ode(file);
e200327708e691 Ben Dooks  2019-10-15  288  	u64 __user *argp =3D (u64 __use=
r *)arg;
c75b1d9421f80f Jens Axboe 2017-06-27  289  	enum rw_hint hint;
5657cb0797c4ab Jens Axboe 2017-06-28  290  	u64 h;
c75b1d9421f80f Jens Axboe 2017-06-27  291  =

c75b1d9421f80f Jens Axboe 2017-06-27  292  	switch (cmd) {
c75b1d9421f80f Jens Axboe 2017-06-27  293  	case F_GET_FILE_RW_HINT:
5657cb0797c4ab Jens Axboe 2017-06-28  294  		h =3D file_write_hint(file);
5657cb0797c4ab Jens Axboe 2017-06-28  295  		if (copy_to_user(argp, &h, siz=
eof(*argp)))
c75b1d9421f80f Jens Axboe 2017-06-27  296  			return -EFAULT;
c75b1d9421f80f Jens Axboe 2017-06-27  297  		return 0;
c75b1d9421f80f Jens Axboe 2017-06-27  298  	case F_SET_FILE_RW_HINT:
5657cb0797c4ab Jens Axboe 2017-06-28  299  		if (copy_from_user(&h, argp, s=
izeof(h)))
c75b1d9421f80f Jens Axboe 2017-06-27  300  			return -EFAULT;
5657cb0797c4ab Jens Axboe 2017-06-28 @301  		hint =3D (enum rw_hint) h;
c75b1d9421f80f Jens Axboe 2017-06-27  302  		if (!rw_hint_valid(hint))
c75b1d9421f80f Jens Axboe 2017-06-27  303  			return -EINVAL;
c75b1d9421f80f Jens Axboe 2017-06-27  304  =

c75b1d9421f80f Jens Axboe 2017-06-27  305  		spin_lock(&file->f_lock);
c75b1d9421f80f Jens Axboe 2017-06-27  306  		file->f_write_hint =3D hint;
c75b1d9421f80f Jens Axboe 2017-06-27  307  		spin_unlock(&file->f_lock);
c75b1d9421f80f Jens Axboe 2017-06-27  308  		return 0;
c75b1d9421f80f Jens Axboe 2017-06-27  309  	case F_GET_RW_HINT:
5657cb0797c4ab Jens Axboe 2017-06-28  310  		h =3D inode->i_write_hint;
5657cb0797c4ab Jens Axboe 2017-06-28  311  		if (copy_to_user(argp, &h, siz=
eof(*argp)))
c75b1d9421f80f Jens Axboe 2017-06-27  312  			return -EFAULT;
c75b1d9421f80f Jens Axboe 2017-06-27  313  		return 0;
c75b1d9421f80f Jens Axboe 2017-06-27  314  	case F_SET_RW_HINT:
5657cb0797c4ab Jens Axboe 2017-06-28  315  		if (copy_from_user(&h, argp, s=
izeof(h)))
c75b1d9421f80f Jens Axboe 2017-06-27  316  			return -EFAULT;
5657cb0797c4ab Jens Axboe 2017-06-28  317  		hint =3D (enum rw_hint) h;
c75b1d9421f80f Jens Axboe 2017-06-27  318  		if (!rw_hint_valid(hint))
c75b1d9421f80f Jens Axboe 2017-06-27  319  			return -EINVAL;
c75b1d9421f80f Jens Axboe 2017-06-27  320  =

c75b1d9421f80f Jens Axboe 2017-06-27  321  		inode_lock(inode);
c75b1d9421f80f Jens Axboe 2017-06-27  322  		inode->i_write_hint =3D hint;
c75b1d9421f80f Jens Axboe 2017-06-27  323  		inode_unlock(inode);
c75b1d9421f80f Jens Axboe 2017-06-27  324  		return 0;
c75b1d9421f80f Jens Axboe 2017-06-27  325  	default:
c75b1d9421f80f Jens Axboe 2017-06-27  326  		return -EINVAL;
c75b1d9421f80f Jens Axboe 2017-06-27  327  	}
c75b1d9421f80f Jens Axboe 2017-06-27  328  }
c75b1d9421f80f Jens Axboe 2017-06-27  329  =


:::::: The code at line 301 was first introduced by commit
:::::: 5657cb0797c4ab303f5782442095319bd971257b fs/fcntl: use copy_to/from_=
user() for u64 types

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8431859289071221025==--

