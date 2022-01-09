Content-Type: multipart/mixed; boundary="===============2580650430695536935=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-rockchip.c:201:53: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 09 Jan 2022 08:45:42 +0800
Message-ID: <202201090830.dSQuR0Hf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2580650430695536935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jianqun Xu <jay.xu@rock-chips.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d1587f7bfe9a0f97a75d42ac1489aeda551106bc
commit: 3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082 gpio/rockchip: support nex=
t version gpio controller
date:   5 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-c004-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201090830.dSQuR0Hf-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/firewire/core-topology.c:328:15: note: Assuming 'i' is >=3D fiel=
d 'port_count'
                   for (i =3D 0; i < node->port_count; i++) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:328:3: note: Loop condition is false. E=
xecution continues on line 340
                   for (i =3D 0; i < node->port_count; i++) {
                   ^
   drivers/firewire/core-topology.c:340:3: note: Calling 'report_lost_node'
                   callback(card, node, parent);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:351:2: note: Calling 'fw_node_put'
           fw_node_put(node);
           ^~~~~~~~~~~~~~~~~
   drivers/firewire/core.h:206:2: note: Taking true branch
           if (refcount_dec_and_test(&node->ref_count))
           ^
   drivers/firewire/core.h:207:3: note: Memory is released
                   kfree(node);
                   ^~~~~~~~~~~
   drivers/firewire/core-topology.c:351:2: note: Returning; memory was rele=
ased
           fw_node_put(node);
           ^~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:340:3: note: Returning; memory was rele=
ased
                   callback(card, node, parent);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:325:2: note: Use of memory after it is =
freed
           list_for_each_entry(node, &list, link) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/firewire/core-topology.c:494:20: warning: Access to field 'node_=
id' results in a dereference of a null pointer (loaded from field 'root_nod=
e') [clang-analyzer-core.NullDereference]
           int node_count =3D (card->root_node->node_id & 0x3f) + 1;
                             ^
   drivers/firewire/core-topology.c:518:56: note: Left side of '&&' is false
           if (!is_next_generation(generation, card->generation) &&
                                                                 ^
   drivers/firewire/core-topology.c:524:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&card->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/firewire/core-topology.c:524:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&card->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/firewire/core-topology.c:539:15: note: Calling 'build_tree'
           local_node =3D build_tree(card, self_ids, self_id_count);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:182:2: note: Null pointer value stored =
to 'node'
           node =3D NULL;
           ^~~~~~~~~~~
   drivers/firewire/core-topology.c:191:2: note: Loop condition is false. E=
xecution continues on line 301
           while (sid < end) {
           ^
   drivers/firewire/core-topology.c:301:2: note: Null pointer value stored =
to field 'root_node'
           card->root_node =3D node;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:539:15: note: Returning from 'build_tre=
e'
           local_node =3D build_tree(card, self_ids, self_id_count);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:541:2: note: Calling 'update_topology_m=
ap'
           update_topology_map(card, self_ids, self_id_count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:494:20: note: Access to field 'node_id'=
 results in a dereference of a null pointer (loaded from field 'root_node')
           int node_count =3D (card->root_node->node_id & 0x3f) + 1;
                             ^     ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpio/gpio-pcf857x.c:237:23: warning: Value stored to 'np' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-pcf857x.c:237:23: note: Value stored to 'np' during it=
s initialization is never read
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpio/gpio-rockchip.c:201:53: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
                   max_debounce =3D (GENMASK(23, 0) + 1) * 2 * 1000000 / fr=
eq;
                                                                     ^
   drivers/gpio/gpio-rockchip.c:272:2: note: Control jumps to 'case PIN_CON=
FIG_INPUT_DEBOUNCE:'  at line 273
           switch (param) {
           ^
   drivers/gpio/gpio-rockchip.c:274:3: note: Calling 'rockchip_gpio_set_deb=
ounce'
                   rockchip_gpio_set_debounce(gc, offset, true);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:198:7: note: Calling 'IS_ERR'
           if (!IS_ERR(bank->db_clk)) {
                ^~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:198:7: note: Returning from 'IS_ERR'
           if (!IS_ERR(bank->db_clk)) {
                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:198:2: note: Taking true branch
           if (!IS_ERR(bank->db_clk)) {
           ^
   drivers/gpio/gpio-rockchip.c:200:10: note: Calling 'clk_get_rate'
                   freq =3D clk_get_rate(bank->db_clk);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/gpio/gpio-rockchip.c:200:10: note: Returning from 'clk_get_rate'
                   freq =3D clk_get_rate(bank->db_clk);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:200:3: note: The value 0 is assigned to 'fr=
eq'
                   freq =3D clk_get_rate(bank->db_clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:201:53: note: Division by zero
                   max_debounce =3D (GENMASK(23, 0) + 1) * 2 * 1000000 / fr=
eq;
                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/io_uring.c:1293:10: warning: Access to field 'io_wq' results in a der=
eference of a null pointer (loaded from variable 'tctx') [clang-analyzer-co=
re.NullDereference]
           BUG_ON(!tctx->io_wq);
                   ^
   fs/io_uring.c:8869:2: note: Calling 'io_ring_ctx_wait_and_kill'
           io_ring_ctx_wait_and_kill(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:8842:6: note: Assuming field 'rings' is null
           if (ctx->rings)
               ^~~~~~~~~~
   fs/io_uring.c:8842:2: note: Taking false branch
           if (ctx->rings)
           ^
   fs/io_uring.c:8844:2: note: Loop condition is false. Execution continues=
 on line 8846
           xa_for_each(&ctx->personalities, index, creds)
           ^
   include/linux/xarray.h:499:2: note: expanded from macro 'xa_for_each'
           xa_for_each_start(xa, index, entry, 0)
           ^
   include/linux/xarray.h:475:2: note: expanded from macro 'xa_for_each_sta=
rt'
           xa_for_each_range(xa, index, entry, start, ULONG_MAX)
           ^
   include/linux/xarray.h:446:2: note: expanded from macro 'xa_for_each_ran=
ge'
           for (index =3D start,                                           =
  \
           ^
   fs/io_uring.c:8852:2: note: Calling 'io_iopoll_try_reap_events'
           io_iopoll_try_reap_events(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2301:6: note: Assuming the condition is false
           if (!(ctx->flags & IORING_SETUP_IOPOLL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2301:2: note: Taking false branch
           if (!(ctx->flags & IORING_SETUP_IOPOLL))
           ^
   fs/io_uring.c:2305:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&ctx->iopoll_list)) {
           ^
   fs/io_uring.c:2308:3: note: Calling 'io_do_iopoll'
                   io_do_iopoll(ctx, &nr_events, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2258:9: note: Assuming field 'poll_multi_queue' is false
           spin =3D !ctx->poll_multi_queue && *nr_events < min;
                  ^~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2258:9: note: Left side of '&&' is true
   fs/io_uring.c:2261:2: note: Left side of '&&' is false
           list_for_each_entry_safe(req, tmp, &ctx->iopoll_list, inflight_e=
ntry) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'

vim +201 drivers/gpio/gpio-rockchip.c

936ee2675eee1f Jianqun Xu 2021-08-16  186  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  187  static int rockchip_gpio_set_deb=
ounce(struct gpio_chip *gc,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  188  				      unsigned int offset,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  189  				      unsigned int debounce)
936ee2675eee1f Jianqun Xu 2021-08-16  190  {
936ee2675eee1f Jianqun Xu 2021-08-16  191  	struct rockchip_pin_bank *bank =
=3D gpiochip_get_data(gc);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  192  	const struct rockchip_gpio_regs=
	*reg =3D bank->gpio_regs;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  193  	unsigned long flags, div_reg, f=
req, max_debounce;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  194  	bool div_debounce_support;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  195  	unsigned int cur_div_reg;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  196  	u64 div;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  197  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  198  	if (!IS_ERR(bank->db_clk)) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  199  		div_debounce_support =3D true;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  200  		freq =3D clk_get_rate(bank->db=
_clk);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16 @201  		max_debounce =3D (GENMASK(23, =
0) + 1) * 2 * 1000000 / freq;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  202  		if (debounce > max_debounce)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  203  			return -EINVAL;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  204  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  205  		div =3D debounce * freq;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  206  		div_reg =3D DIV_ROUND_CLOSEST_=
ULL(div, 2 * USEC_PER_SEC) - 1;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  207  	} else {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  208  		div_debounce_support =3D false;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  209  	}
936ee2675eee1f Jianqun Xu 2021-08-16  210  =

936ee2675eee1f Jianqun Xu 2021-08-16  211  	raw_spin_lock_irqsave(&bank->sl=
ock, flags);
936ee2675eee1f Jianqun Xu 2021-08-16  212  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  213  	/* Only the v1 needs to configu=
re div_en and div_con for dbclk */
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  214  	if (debounce) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  215  		if (div_debounce_support) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  216  			/* Configure the max debounce=
 from consumers */
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  217  			cur_div_reg =3D readl(bank->r=
eg_base +
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  218  					    reg->dbclk_div_con);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  219  			if (cur_div_reg < div_reg)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  220  				writel(div_reg, bank->reg_ba=
se +
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  221  				       reg->dbclk_div_con);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  222  			rockchip_gpio_writel_bit(bank=
, offset, 1,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  223  						 reg->dbclk_div_en);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  224  		}
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  225  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  226  		rockchip_gpio_writel_bit(bank,=
 offset, 1, reg->debounce);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  227  	} else {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  228  		if (div_debounce_support)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  229  			rockchip_gpio_writel_bit(bank=
, offset, 0,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  230  						 reg->dbclk_div_en);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  231  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  232  		rockchip_gpio_writel_bit(bank,=
 offset, 0, reg->debounce);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  233  	}
936ee2675eee1f Jianqun Xu 2021-08-16  234  =

936ee2675eee1f Jianqun Xu 2021-08-16  235  	raw_spin_unlock_irqrestore(&ban=
k->slock, flags);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  236  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  237  	/* Enable or disable dbclk at l=
ast */
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  238  	if (div_debounce_support) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  239  		if (debounce)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  240  			clk_prepare_enable(bank->db_c=
lk);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  241  		else
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  242  			clk_disable_unprepare(bank->d=
b_clk);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  243  	}
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  244  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  245  	return 0;
936ee2675eee1f Jianqun Xu 2021-08-16  246  }
936ee2675eee1f Jianqun Xu 2021-08-16  247  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2580650430695536935==--

