Content-Type: multipart/mixed; boundary="===============4139119314313286302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/of/irq.c:619:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 12 Sep 2022 21:36:20 +0800
Message-ID: <202209122108.rlTxykbA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4139119314313286302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/o=
f/irq.c:619:2: warning: Use of memory after it is freed [clang-analyzer-uni=
x.Malloc]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e78fcce86de0288793a0ef0f6acf37656ee4cf
commit: e91033621d56e055803c4c4ba507fbbb2d145a7f of/irq: Use interrupts-ext=
ended to find parent
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220912/202209122108.rlTxykbA-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De91033621d56e055803c4c4ba507fbbb2d145a7f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e91033621d56e055803c4c4ba507fbbb2d145a7f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                     ^
   drivers/of/irq.c:608:10: note: Taking false branch
                   desc =3D list_first_entry_or_null(&intc_parent_list,
                          ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/of/irq.c:608:10: note: Loop condition is false.  Exiting loop
                   desc =3D list_first_entry_or_null(&intc_parent_list,
                          ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/of/irq.c:608:10: note: 'pos__' is not equal to 'head__'
                   desc =3D list_first_entry_or_null(&intc_parent_list,
                          ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~
   drivers/of/irq.c:608:10: note: '?' condition is true
                   desc =3D list_first_entry_or_null(&intc_parent_list,
                          ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/of/irq.c:610:7: note: Assuming 'desc' is null
                   if (!desc) {
                       ^~~~~
   drivers/of/irq.c:610:3: note: Taking true branch
                   if (!desc) {
                   ^
   drivers/of/irq.c:611:4: note: Loop condition is false.  Exiting loop
                           pr_err("of_irq_init: children remain, but no par=
ents\n");
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/of/irq.c:612:4: note:  Execution continues on line 619
                           break;
                           ^
   drivers/of/irq.c:619:27: note: Null pointer value stored to 'desc'
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
                                    ^
   include/linux/list.h:725:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:619:2: note: Dereference of null pointer
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
>> drivers/of/irq.c:619:2: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           list_for_each_entry_safe(desc, temp_desc, &intc_parent_list, lis=
t) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/of/irq.c:532:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1354:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:533:58: note: Left side of '||' is true
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                                                                          ^
   drivers/of/irq.c:535:4: note:  Execution continues on line 532
                           continue;
                           ^
   drivers/of/irq.c:532:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1354:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:533:58: note: Left side of '||' is true
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                                                                          ^
   drivers/of/irq.c:535:4: note:  Execution continues on line 532
                           continue;
                           ^
   drivers/of/irq.c:532:2: note: Loop condition is true.  Entering loop body
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1354:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:533:7: note: Left side of '||' is false
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                       ^
   drivers/of/irq.c:534:5: note: Assuming the condition is false
                                   !of_device_is_available(np))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:533:3: note: Taking false branch
                   if (!of_property_read_bool(np, "interrupt-controller") ||
                   ^
   drivers/of/irq.c:537:12: note: Assuming field 'data' is non-null
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                            ^
   include/asm-generic/bug.h:130:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/of/irq.c:537:7: note: Taking false branch
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                       ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/of/irq.c:537:3: note: Taking false branch
                   if (WARN(!match->data, "of_irq_init: no init function fo=
r %s\n",
                   ^
   drivers/of/irq.c:546:7: note: Assuming 'desc' is non-null
                   if (!desc) {
                       ^~~~~
   drivers/of/irq.c:546:3: note: Taking false branch
                   if (!desc) {
                   ^
   drivers/of/irq.c:559:7: note: Assuming field 'interrupt_parent' is non-n=
ull
                   if (!desc->interrupt_parent)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:559:3: note: Taking false branch
                   if (!desc->interrupt_parent)
                   ^
   drivers/of/irq.c:561:7: note: Assuming 'np' is equal to field 'interrupt=
_parent'
                   if (desc->interrupt_parent =3D=3D np) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/irq.c:561:3: note: Taking true branch
                   if (desc->interrupt_parent =3D=3D np) {
                   ^
   drivers/of/irq.c:532:2: note: Loop condition is false. Execution continu=
es on line 573
           for_each_matching_node_and_match(np, matches, &match) {
           ^
   include/linux/of.h:1354:2: note: expanded from macro 'for_each_matching_=
node_and_match'
           for (dn =3D of_find_matching_node_and_match(NULL, matches, match=
); \
           ^
   drivers/of/irq.c:573:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&intc_desc_list)) {
           ^
   drivers/of/irq.c:579:3: note: Loop condition is true.  Entering loop body
                   list_for_each_entry_safe(desc, temp_desc, &intc_desc_lis=
t, list) {
                   ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \

vim +619 drivers/of/irq.c

c71a54b0820179 Rob Herring        2011-09-20  514  =

c71a54b0820179 Rob Herring        2011-09-20  515  /**
c71a54b0820179 Rob Herring        2011-09-20  516   * of_irq_init - Scan an=
d init matching interrupt controllers in DT
c71a54b0820179 Rob Herring        2011-09-20  517   * @matches: 0 terminate=
d array of nodes to match and init function to call
c71a54b0820179 Rob Herring        2011-09-20  518   *
c71a54b0820179 Rob Herring        2011-09-20  519   * This function scans t=
he device tree for matching interrupt controller nodes,
c71a54b0820179 Rob Herring        2011-09-20  520   * and calls their initi=
alization functions in order with parents first.
c71a54b0820179 Rob Herring        2011-09-20  521   */
c71a54b0820179 Rob Herring        2011-09-20  522  void __init of_irq_init(=
const struct of_device_id *matches)
c71a54b0820179 Rob Herring        2011-09-20  523  {
264041e3796133 Masahiro Yamada    2015-11-24  524  	const struct of_device_=
id *match;
c71a54b0820179 Rob Herring        2011-09-20  525  	struct device_node *np,=
 *parent =3D NULL;
48a9b733e644ab Geert Uytterhoeven 2015-06-26  526  	struct of_intc_desc *de=
sc, *temp_desc;
c71a54b0820179 Rob Herring        2011-09-20  527  	struct list_head intc_d=
esc_list, intc_parent_list;
c71a54b0820179 Rob Herring        2011-09-20  528  =

c71a54b0820179 Rob Herring        2011-09-20  529  	INIT_LIST_HEAD(&intc_de=
sc_list);
c71a54b0820179 Rob Herring        2011-09-20  530  	INIT_LIST_HEAD(&intc_pa=
rent_list);
c71a54b0820179 Rob Herring        2011-09-20  531  =

264041e3796133 Masahiro Yamada    2015-11-24  532  	for_each_matching_node_=
and_match(np, matches, &match) {
6a245d959c7470 Sergei Shtylyov    2017-07-08  533  		if (!of_property_read_=
bool(np, "interrupt-controller") ||
bf49be02d6f92b Peter Crosthwaite  2013-11-27  534  				!of_device_is_availa=
ble(np))
c71a54b0820179 Rob Herring        2011-09-20  535  			continue;
264041e3796133 Masahiro Yamada    2015-11-24  536  =

264041e3796133 Masahiro Yamada    2015-11-24  537  		if (WARN(!match->data,=
 "of_irq_init: no init function for %s\n",
264041e3796133 Masahiro Yamada    2015-11-24  538  			 match->compatible))
264041e3796133 Masahiro Yamada    2015-11-24  539  			continue;
264041e3796133 Masahiro Yamada    2015-11-24  540  =

c71a54b0820179 Rob Herring        2011-09-20  541  		/*
48a9b733e644ab Geert Uytterhoeven 2015-06-26  542  		 * Here, we allocate a=
nd populate an of_intc_desc with the node
c71a54b0820179 Rob Herring        2011-09-20  543  		 * pointer, interrupt-=
parent device_node etc.
c71a54b0820179 Rob Herring        2011-09-20  544  		 */
c71a54b0820179 Rob Herring        2011-09-20  545  		desc =3D kzalloc(sizeo=
f(*desc), GFP_KERNEL);
6f7dc9a37f2b32 Geert Uytterhoeven 2019-05-02  546  		if (!desc) {
8363ccb917c6bd Julia Lawall       2015-10-22  547  			of_node_put(np);
c71a54b0820179 Rob Herring        2011-09-20  548  			goto err;
8363ccb917c6bd Julia Lawall       2015-10-22  549  		}
c71a54b0820179 Rob Herring        2011-09-20  550  =

264041e3796133 Masahiro Yamada    2015-11-24  551  		desc->irq_init_cb =3D =
match->data;
8363ccb917c6bd Julia Lawall       2015-10-22  552  		desc->dev =3D of_node_=
get(np);
e91033621d56e0 Samuel Holland     2022-04-12  553  		/*
e91033621d56e0 Samuel Holland     2022-04-12  554  		 * interrupts-extended=
 can reference multiple parent domains.
e91033621d56e0 Samuel Holland     2022-04-12  555  		 * Arbitrarily pick th=
e first one; assume any other parents
e91033621d56e0 Samuel Holland     2022-04-12  556  		 * are the same distan=
ce away from the root irq controller.
e91033621d56e0 Samuel Holland     2022-04-12  557  		 */
e91033621d56e0 Samuel Holland     2022-04-12  558  		desc->interrupt_parent=
 =3D of_parse_phandle(np, "interrupts-extended", 0);
e91033621d56e0 Samuel Holland     2022-04-12  559  		if (!desc->interrupt_p=
arent)
c71a54b0820179 Rob Herring        2011-09-20  560  			desc->interrupt_paren=
t =3D of_irq_find_parent(np);
e91033621d56e0 Samuel Holland     2022-04-12  561  		if (desc->interrupt_pa=
rent =3D=3D np) {
e91033621d56e0 Samuel Holland     2022-04-12  562  			of_node_put(desc->int=
errupt_parent);
d7fb6d0adb86ed Rob Herring        2011-11-27  563  			desc->interrupt_paren=
t =3D NULL;
e91033621d56e0 Samuel Holland     2022-04-12  564  		}
c71a54b0820179 Rob Herring        2011-09-20  565  		list_add_tail(&desc->l=
ist, &intc_desc_list);
c71a54b0820179 Rob Herring        2011-09-20  566  	}
c71a54b0820179 Rob Herring        2011-09-20  567  =

c71a54b0820179 Rob Herring        2011-09-20  568  	/*
c71a54b0820179 Rob Herring        2011-09-20  569  	 * The root irq control=
ler is the one without an interrupt-parent.
c71a54b0820179 Rob Herring        2011-09-20  570  	 * That one goes first,=
 followed by the controllers that reference it,
c71a54b0820179 Rob Herring        2011-09-20  571  	 * followed by the ones=
 that reference the 2nd level controllers, etc.
c71a54b0820179 Rob Herring        2011-09-20  572  	 */
c71a54b0820179 Rob Herring        2011-09-20  573  	while (!list_empty(&int=
c_desc_list)) {
c71a54b0820179 Rob Herring        2011-09-20  574  		/*
c71a54b0820179 Rob Herring        2011-09-20  575  		 * Process all control=
lers with the current 'parent'.
c71a54b0820179 Rob Herring        2011-09-20  576  		 * First pass will be =
looking for NULL as the parent.
c71a54b0820179 Rob Herring        2011-09-20  577  		 * The assumption is t=
hat NULL parent means a root controller.
c71a54b0820179 Rob Herring        2011-09-20  578  		 */
c71a54b0820179 Rob Herring        2011-09-20  579  		list_for_each_entry_sa=
fe(desc, temp_desc, &intc_desc_list, list) {
c71a54b0820179 Rob Herring        2011-09-20  580  			int ret;
c71a54b0820179 Rob Herring        2011-09-20  581  =

c71a54b0820179 Rob Herring        2011-09-20  582  			if (desc->interrupt_p=
arent !=3D parent)
c71a54b0820179 Rob Herring        2011-09-20  583  				continue;
c71a54b0820179 Rob Herring        2011-09-20  584  =

c71a54b0820179 Rob Herring        2011-09-20  585  			list_del(&desc->list);
c71a54b0820179 Rob Herring        2011-09-20  586  =

e55aeb6ba4e8cc Philipp Zabel      2016-08-09  587  			of_node_set_flag(desc=
->dev, OF_POPULATED);
e55aeb6ba4e8cc Philipp Zabel      2016-08-09  588  =

0d638a07d3a1e9 Rob Herring        2017-06-01  589  			pr_debug("of_irq_init=
: init %pOF (%p), parent %p\n",
0d638a07d3a1e9 Rob Herring        2017-06-01  590  				 desc->dev,
c71a54b0820179 Rob Herring        2011-09-20  591  				 desc->dev, desc->in=
terrupt_parent);
264041e3796133 Masahiro Yamada    2015-11-24  592  			ret =3D desc->irq_ini=
t_cb(desc->dev,
264041e3796133 Masahiro Yamada    2015-11-24  593  						desc->interrupt_pa=
rent);
c71a54b0820179 Rob Herring        2011-09-20  594  			if (ret) {
e55aeb6ba4e8cc Philipp Zabel      2016-08-09  595  				of_node_clear_flag(d=
esc->dev, OF_POPULATED);
c71a54b0820179 Rob Herring        2011-09-20  596  				kfree(desc);
c71a54b0820179 Rob Herring        2011-09-20  597  				continue;
c71a54b0820179 Rob Herring        2011-09-20  598  			}
c71a54b0820179 Rob Herring        2011-09-20  599  =

c71a54b0820179 Rob Herring        2011-09-20  600  			/*
c71a54b0820179 Rob Herring        2011-09-20  601  			 * This one is now se=
t up; add it to the parent list so
c71a54b0820179 Rob Herring        2011-09-20  602  			 * its children can g=
et processed in a subsequent pass.
c71a54b0820179 Rob Herring        2011-09-20  603  			 */
c71a54b0820179 Rob Herring        2011-09-20  604  			list_add_tail(&desc->=
list, &intc_parent_list);
c71a54b0820179 Rob Herring        2011-09-20  605  		}
c71a54b0820179 Rob Herring        2011-09-20  606  =

c71a54b0820179 Rob Herring        2011-09-20  607  		/* Get the next pendin=
g parent that might have children */
c0cdfaa0a5e7a3 Axel Lin           2013-06-23  608  		desc =3D list_first_en=
try_or_null(&intc_parent_list,
c0cdfaa0a5e7a3 Axel Lin           2013-06-23  609  						typeof(*desc), lis=
t);
c0cdfaa0a5e7a3 Axel Lin           2013-06-23  610  		if (!desc) {
c71a54b0820179 Rob Herring        2011-09-20  611  			pr_err("of_irq_init: =
children remain, but no parents\n");
c71a54b0820179 Rob Herring        2011-09-20  612  			break;
c71a54b0820179 Rob Herring        2011-09-20  613  		}
c71a54b0820179 Rob Herring        2011-09-20  614  		list_del(&desc->list);
c71a54b0820179 Rob Herring        2011-09-20  615  		parent =3D desc->dev;
c71a54b0820179 Rob Herring        2011-09-20  616  		kfree(desc);
c71a54b0820179 Rob Herring        2011-09-20  617  	}
c71a54b0820179 Rob Herring        2011-09-20  618  =

c71a54b0820179 Rob Herring        2011-09-20 @619  	list_for_each_entry_saf=
e(desc, temp_desc, &intc_parent_list, list) {
c71a54b0820179 Rob Herring        2011-09-20  620  		list_del(&desc->list);
c71a54b0820179 Rob Herring        2011-09-20  621  		kfree(desc);
c71a54b0820179 Rob Herring        2011-09-20  622  	}
c71a54b0820179 Rob Herring        2011-09-20  623  err:
c71a54b0820179 Rob Herring        2011-09-20  624  	list_for_each_entry_saf=
e(desc, temp_desc, &intc_desc_list, list) {
c71a54b0820179 Rob Herring        2011-09-20  625  		list_del(&desc->list);
8363ccb917c6bd Julia Lawall       2015-10-22  626  		of_node_put(desc->dev);
c71a54b0820179 Rob Herring        2011-09-20  627  		kfree(desc);
c71a54b0820179 Rob Herring        2011-09-20  628  	}
c71a54b0820179 Rob Herring        2011-09-20  629  }
c706c239af5bc2 Marc Zyngier       2015-07-28  630  =


:::::: The code at line 619 was first introduced by commit
:::::: c71a54b0820179e53483d5220cdef1a0df8d5bd1 of/irq: introduce of_irq_in=
it

:::::: TO: Rob Herring <rob.herring@calxeda.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4139119314313286302==--

