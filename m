Content-Type: multipart/mixed; boundary="===============8500498954070524442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-imx.c:592:23: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 27 Nov 2021 09:35:08 +0800
Message-ID: <202111270925.P1gCscC0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8500498954070524442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Clark Wang <xiaoning.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 4df2f5e1372e9eec8f9e1b4a3025b9be23487d36 spi: imx: add a check for =
speed_hz before calculating the clock
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211127/202111270925.P1gCscC0-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4df2f5e1372e9eec8f9e1b4a3025b9be23487d36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4df2f5e1372e9eec8f9e1b4a3025b9be23487d36
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                    ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/core/urb.c:1008:4: note: Calling '__usb_unanchor_urb'
                           __usb_unanchor_urb(victim, anchor);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/urb.c:151:14: note: Use of memory after it is freed
           urb->anchor =3D NULL;
           ~~~~~~~~~~~ ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/spi/spi-imx.c:453:8: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is <=3D 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking false branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:441:2: note: Taking false branch
           if (fin > fspi << post)
           ^
   drivers/spi/spi-imx.c:446:9: note: '__UNIQUE_ID___x256' is > '__UNIQUE_I=
D___y257'
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/spi/spi-imx.c:446:9: note: '?' condition is true
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/spi/spi-imx.c:447:2: note: Taking false branch
           if (unlikely(post > 0xf)) {
           ^
   drivers/spi/spi-imx.c:453:8: note: Division by zero
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
>> drivers/spi/spi-imx.c:592:23: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   drivers/spi/spi-imx.c:577:6: note: 'clk' declared without an initial val=
ue
           u32 clk, delay;
               ^~~
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is > 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking true branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:438:3: note: Returning without writing to '*fres'
                   return 0;
                   ^
   drivers/spi/spi-imx.c:591:10: note: Returning from 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:592:23: note: Assigned value is garbage or undefin=
ed
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/tty/serial/serial_core.c:160:17: warning: Access to field 'rs485=
_config' results in a dereference of a null pointer (loaded from variable '=
uport') [clang-analyzer-core.NullDereference]
           int rs485_on =3D uport->rs485_config &&
                          ^
   drivers/tty/serial/serial_core.c:2237:6: note: Assuming field 'suspended=
' is not equal to 0
           if (!uport->suspended && device_may_wakeup(tty_dev)) {
               ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2237:24: note: Left side of '&&' is fal=
se
           if (!uport->suspended && device_may_wakeup(tty_dev)) {
                                 ^
   drivers/tty/serial/serial_core.c:2250:6: note: Assuming field 'cons' is =
null
           if (uart_console(uport)) {
               ^
   include/linux/serial_core.h:24:3: note: expanded from macro 'uart_consol=
e'
           ((port)->cons && (port)->cons->index =3D=3D (port)->line)
            ^~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2250:6: note: Left side of '&&' is false
           if (uart_console(uport)) {
               ^
   include/linux/serial_core.h:24:16: note: expanded from macro 'uart_conso=
le'
           ((port)->cons && (port)->cons->index =3D=3D (port)->line)
                         ^
   drivers/tty/serial/serial_core.c:2270:6: note: Assuming the condition is=
 true
           if (tty_port_suspended(port)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2270:2: note: Taking true branch
           if (tty_port_suspended(port)) {
           ^
   drivers/tty/serial/serial_core.c:2274:3: note: Calling 'uart_change_pm'
                   uart_change_pm(state, UART_PM_STATE_ON);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2140:27: note: Value assigned to field =
'tty', which participates in a condition later
           struct uart_port *port =3D uart_port_check(state);
                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2142:6: note: Assuming 'pm_state' is eq=
ual to field 'pm_state'
           if (state->pm_state !=3D pm_state) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2142:2: note: Taking false branch
           if (state->pm_state !=3D pm_state) {
           ^
   drivers/tty/serial/serial_core.c:2274:3: note: Returning from 'uart_chan=
ge_pm'
                   uart_change_pm(state, UART_PM_STATE_ON);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2277:3: note: Calling 'spin_unlock_irq'
                   spin_unlock_irq(&uport->lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:404:2: note: Value assigned to 'console_suspend=
_enabled', which participates in a condition later
           raw_spin_unlock_irq(&lock->rlock);
           ^
   include/linux/spinlock.h:285:35: note: expanded from macro 'raw_spin_unl=
ock_irq'
   #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_irq(lock)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2277:3: note: Returning from 'spin_unlo=
ck_irq'
                   spin_unlock_irq(&uport->lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2278:7: note: Assuming 'console_suspend=
_enabled' is true
                   if (console_suspend_enabled || !uart_console(uport)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2278:31: note: Left side of '||' is true
                   if (console_suspend_enabled || !uart_console(uport)) {
--
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:998:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:999:9: note: Access to field 'name' results in a der=
eference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:512:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   17 warnings generated.
   drivers/spi/spi-imx.c:453:8: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is <=3D 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking false branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:441:2: note: Taking false branch
           if (fin > fspi << post)
           ^
   drivers/spi/spi-imx.c:446:9: note: '__UNIQUE_ID___x256' is > '__UNIQUE_I=
D___y257'
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/spi/spi-imx.c:446:9: note: '?' condition is true
           post =3D max(4U, post) - 4;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/spi/spi-imx.c:447:2: note: Taking false branch
           if (unlikely(post > 0xf)) {
           ^
   drivers/spi/spi-imx.c:453:8: note: Division by zero
           pre =3D DIV_ROUND_UP(fin, fspi << post) - 1;
                 ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
>> drivers/spi/spi-imx.c:592:23: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   drivers/spi/spi-imx.c:577:6: note: 'clk' declared without an initial val=
ue
           u32 clk, delay;
               ^~~
   drivers/spi/spi-imx.c:581:6: note: Assuming field 'slave_mode' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
               ^~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:581:26: note: Left side of '&&' is false
           if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
                                   ^
   drivers/spi/spi-imx.c:591:10: note: Calling 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:437:15: note: Assuming 'fspi' is > 'fin'
           if (unlikely(fspi > fin))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/spi/spi-imx.c:437:2: note: Taking true branch
           if (unlikely(fspi > fin))
           ^
   drivers/spi/spi-imx.c:438:3: note: Returning without writing to '*fres'
                   return 0;
                   ^
   drivers/spi/spi-imx.c:591:10: note: Returning from 'mx51_ecspi_clkdiv'
           ctrl |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-imx.c:592:23: note: Assigned value is garbage or undefin=
ed
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   mm/slub.c:3933:2: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(page, h, &discard, slab_list)
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:708:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   mm/slub.c:3958:2: note: Loop condition is true.  Entering loop body
           for_each_kmem_cache_node(s, node, n) {
           ^
   mm/slab.h:569:2: note: expanded from macro 'for_each_kmem_cache_node'
           for (__node =3D 0; __node < nr_node_ids; __node++) \
           ^
   mm/slub.c:3958:36: note: Assuming 'n' is non-null
           for_each_kmem_cache_node(s, node, n) {
                                             ^
   mm/slab.h:570:9: note: expanded from macro 'for_each_kmem_cache_node'
                    if ((__n =3D get_node(__s, __node)))
                         ^~~
   mm/slub.c:3958:2: note: Taking true branch
           for_each_kmem_cache_node(s, node, n) {
           ^
   mm/slab.h:570:4: note: expanded from macro 'for_each_kmem_cache_node'
                    if ((__n =3D get_node(__s, __node)))
                    ^
   mm/slub.c:3959:3: note: Calling 'free_partial'
                   free_partial(s, n);
                   ^~~~~~~~~~~~~~~~~~
   mm/slub.c:3920:9: note: Loop condition is false.  Exiting loop
           BUG_ON(irqs_disabled());
                  ^
   include/linux/irqflags.h:254:3: note: expanded from macro 'irqs_disabled'
                   raw_local_save_flags(_flags);           \
                   ^
   include/linux/irqflags.h:180:2: note: expanded from macro 'raw_local_sav=
e_flags'
           do {                                            \
           ^
   mm/slub.c:3920:2: note: Assuming the condition is true
           BUG_ON(irqs_disabled());
           ^
   include/asm-generic/bug.h:63:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   mm/slub.c:3920:2: note: Taking false branch
           BUG_ON(irqs_disabled());
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/slub.c:3920:2: note: Loop condition is false.  Exiting loop
           BUG_ON(irqs_disabled());

vim +592 drivers/spi/spi-imx.c

f677f17cced0ca drivers/spi/spi-imx.c Anton Bondarenko 2015-12-08  572  =

1d374703fb988d drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  573 =
 static int mx51_ecspi_prepare_transfer(struct spi_imx_data *spi_imx,
4df2f5e1372e9e drivers/spi/spi-imx.c Clark Wang       2021-04-08  574  				=
       struct spi_device *spi)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  575 =
 {
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  576 =
 	u32 ctrl =3D readl(spi_imx->base + MX51_ECSPI_CTRL);
4df2f5e1372e9e drivers/spi/spi-imx.c Clark Wang       2021-04-08  577  	u32=
 clk, delay;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  578  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  579 =
 	/* Clear BL field and set the right value */
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  580 =
 	ctrl &=3D ~MX51_ECSPI_CTRL_BL_MASK;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  581 =
 	if (spi_imx->slave_mode && is_imx53_ecspi(spi_imx))
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  582 =
 		ctrl |=3D (spi_imx->slave_burst * 8 - 1)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  583 =
 			<< MX51_ECSPI_CTRL_BL_OFFSET;
9f6aa42bbbb23d drivers/spi/spi-imx.c Fabio Estevam    2015-12-03  584  	else
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  585 =
 		ctrl |=3D (spi_imx->bits_per_word - 1)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  586 =
 			<< MX51_ECSPI_CTRL_BL_OFFSET;
9f6aa42bbbb23d drivers/spi/spi-imx.c Fabio Estevam    2015-12-03  587  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  588 =
 	/* set clock speed */
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  589 =
 	ctrl &=3D ~(0xf << MX51_ECSPI_CTRL_POSTDIV_OFFSET |
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  590 =
 		  0xf << MX51_ECSPI_CTRL_PREDIV_OFFSET);
4df2f5e1372e9e drivers/spi/spi-imx.c Clark Wang       2021-04-08  591  	ctr=
l |=3D mx51_ecspi_clkdiv(spi_imx, spi_imx->spi_bus_clk, &clk);
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30 @592 =
 	spi_imx->spi_bus_clk =3D clk;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  593  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  594 =
 	if (spi_imx->usedma)
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  595 =
 		ctrl |=3D MX51_ECSPI_CTRL_SMC;
00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  596  =

00b80ac9355397 drivers/spi/spi-imx.c Uwe Kleine-K=C3=B6nig 2018-11-30  597 =
 	writel(ctrl, spi_imx->base + MX51_ECSPI_CTRL);
0b599603d8534b drivers/spi/spi_imx.c Uwe Kleine-K=C3=B6nig 2010-09-09  598  =

6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  599  	/*
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  600  	 * =
Wait until the changes in the configuration register CONFIGREG
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  601  	 * =
propagate into the hardware. It takes exactly one tick of the
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  602  	 * =
SCLK clock, but we will wait two SCLK clock just to be sure. The
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  603  	 * =
effect of the delay it takes for the hardware to apply changes
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  604  	 * =
is noticable if the SCLK clock run very slow. In such a case, if
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  605  	 * =
the polarity of SCLK should be inverted, the GPIO ChipSelect might
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  606  	 * =
be asserted before the SCLK polarity changes, which would disrupt
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  607  	 * =
the SPI communication as the device on the other end would consider
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  608  	 * =
the change of SCLK polarity as a clock tick already.
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  609  	 */
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  610  	del=
ay =3D (2 * 1000000) / clk;
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  611  	if =
(likely(delay < 10))	/* SCLK is faster than 100 kHz */
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  612  		ud=
elay(delay);
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  613  	els=
e			/* SCLK is _very_ slow */
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  614  		us=
leep_range(delay, delay + 10);
6fd8b8503a0dcf drivers/spi/spi-imx.c Marek Vasut      2013-12-18  615  =

987a2dfe3f0485 drivers/spi/spi-imx.c Robin Gong       2018-10-10  616  	ret=
urn 0;
987a2dfe3f0485 drivers/spi/spi-imx.c Robin Gong       2018-10-10  617  }
987a2dfe3f0485 drivers/spi/spi-imx.c Robin Gong       2018-10-10  618  =


:::::: The code@line 592 was first introduced by commit
:::::: 00b80ac9355397455adec24c9ee76f1b0225cd27 spi: imx: mx51-ecspi: Move =
some initialisation to prepare_message hook.

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8500498954070524442==--

