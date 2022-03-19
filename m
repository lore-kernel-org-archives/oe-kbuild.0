Content-Type: multipart/mixed; boundary="===============4054025421503139306=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15 5109/5372] drivers/iommu/iova.c:364:3: warning: Value stored to 'candidate_gap' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 19 Mar 2022 12:09:47 +0800
Message-ID: <202203191211.fcb2dVA5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4054025421503139306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Liam Mark <lmark@codeaurora.org>
CC: Todd Kjos <tkjos@google.com>
CC: "Isaac J. Manjarres" <isaacm@codeaurora.org>
CC: Georgi Djakov <quic_c_gdjako@quicinc.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.15
head:   28b046777fb6eee7c4382a4272e6fa1f517d7038
commit: 150c882a3dd8f530eb425e8a264838131973a53f [5109/5372] FROMLIST: iomm=
u/iova: Add a best-fit algorithm
:::::: branch date: 21 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20319/202203191211.fcb2dVA5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e=
4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/150c882a3dd8f53=
0eb425e8a264838131973a53f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.15
        git checkout 150c882a3dd8f530eb425e8a264838131973a53f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/skbuff.h:1961:2: note: Loop condition is false.  Exiting l=
oop
           WRITE_ONCE(prev->next, newsk);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:1961:2: note: Dereference of null pointer
           WRITE_ONCE(prev->next, newsk);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/skbuff.h:2067:2: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           __skb_insert(newsk, next->prev, next, list);
           ^
   net/tipc/bcast.c:565:2: note: Calling 'tipc_bcbase_xmit'
           tipc_bcbase_xmit(net, &xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:184:2: note: Taking false branch
           if (skb_queue_empty(xmitq))
           ^
   net/tipc/bcast.c:189:6: note: Assuming 'bearer_id' is < 0
           if (bearer_id >=3D 0) {
               ^~~~~~~~~~~~~~
   net/tipc/bcast.c:189:2: note: Taking false branch
           if (bearer_id >=3D 0) {
           ^
   net/tipc/bcast.c:195:2: note: Calling '__skb_queue_head_init'
           __skb_queue_head_init(&_xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:195:2: note: Returning from '__skb_queue_head_init'
           __skb_queue_head_init(&_xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:196:2: note: Loop condition is true.  Entering loop body
           for (bearer_id =3D 0; bearer_id < MAX_BEARERS; bearer_id++) {
           ^
   net/tipc/bcast.c:197:7: note: Assuming the condition is false
                   if (!bb->dests[bearer_id])
                       ^~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:197:3: note: Taking false branch
                   if (!bb->dests[bearer_id])
                   ^
   net/tipc/bcast.c:200:3: note: Loop condition is true.  Entering loop body
                   skb_queue_walk(xmitq, skb) {
                   ^
   include/linux/skbuff.h:3556:3: note: expanded from macro 'skb_queue_walk'
                   for (skb =3D (queue)->next;                             =
          \
                   ^
   net/tipc/bcast.c:202:8: note: Assuming '_skb' is non-null
                           if (!_skb)
                               ^~~~~
   net/tipc/bcast.c:202:4: note: Taking false branch
                           if (!_skb)
                           ^
   net/tipc/bcast.c:204:4: note: Calling '__skb_queue_tail'
                           __skb_queue_tail(&_xmitq, _skb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2100:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2067:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/iommu/iova.c:364:3: warning: Value stored to 'candidate_gap' is =
never read [clang-analyzer-deadcode.DeadStores]
                   candidate_gap =3D gap;
                   ^               ~~~
   drivers/iommu/iova.c:364:3: note: Value stored to 'candidate_gap' is nev=
er read
                   candidate_gap =3D gap;
                   ^               ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/gpu/vga/vgaarb.c:235:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/vga/vgaarb.c:235:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/vga/vgaarb.c:373:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/vga/vgaarb.c:373:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D &vgadev->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   drivers/base/bus.c:873:18: warning: Access to field 'drivers_kset' resul=
ts in a dereference of a null pointer (loaded from field 'p') [clang-analyz=
er-core.NullDereference]
           kset_unregister(bus->p->drivers_kset);
                           ^
   drivers/base/bus.c:1139:9: note: Calling 'subsys_register'
           return subsys_register(subsys, groups, &system_kset->kobj);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:1083:8: note: Calling 'bus_register'
           err =3D bus_register(subsys);
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:788:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/base/bus.c:788:2: note: Taking false branch
           if (!priv)
           ^
   drivers/base/bus.c:794:2: note: Loop condition is false.  Exiting loop
           BLOCKING_INIT_NOTIFIER_HEAD(&priv->bus_notifier);
           ^
   include/linux/notifier.h:85:3: note: expanded from macro 'BLOCKING_INIT_=
NOTIFIER_HEAD'
                   init_rwsem(&(name)->rwsem);     \
                   ^
   include/linux/rwsem.h:123:30: note: expanded from macro 'init_rwsem'
   #define init_rwsem(sem)                                         \
                                                                   ^
   drivers/base/bus.c:794:2: note: Loop condition is false.  Exiting loop
           BLOCKING_INIT_NOTIFIER_HEAD(&priv->bus_notifier);
           ^
   include/linux/notifier.h:84:43: note: expanded from macro 'BLOCKING_INIT=
_NOTIFIER_HEAD'
   #define BLOCKING_INIT_NOTIFIER_HEAD(name) do {  \
                                             ^
   drivers/base/bus.c:797:6: note: Assuming 'retval' is not equal to 0
           if (retval)
               ^~~~~~
   drivers/base/bus.c:797:2: note: Taking true branch
           if (retval)
           ^
   drivers/base/bus.c:798:3: note: Control jumps to line 853
                   goto out;
                   ^
   drivers/base/bus.c:854:2: note: Null pointer value stored to field 'p'
           bus->p =3D NULL;
           ^~~~~~~~~~~~~
   drivers/base/bus.c:1083:8: note: Returning from 'bus_register'
           err =3D bus_register(subsys);
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:1084:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/base/bus.c:1084:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/base/bus.c:1088:6: note: Assuming 'dev' is null
           if (!dev) {
               ^~~~
   drivers/base/bus.c:1088:2: note: Taking true branch
           if (!dev) {
           ^
   drivers/base/bus.c:1090:3: note: Control jumps to line 1114
                   goto err_dev;
                   ^
   drivers/base/bus.c:1114:2: note: Calling 'bus_unregister'
           bus_unregister(subsys);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:868:2: note: Taking false branch
           pr_debug("bus: '%s': unregistering\n", bus->name);
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \

vim +/candidate_gap +364 drivers/iommu/iova.c

f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  320  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  321  =
static int __alloc_and_insert_iova_best_fit(struct iova_domain *iovad,
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  322  =
					    unsigned long size,
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  323  =
					    unsigned long limit_pfn,
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  324  =
					    struct iova *new, bool size_aligned)
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  325  {
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  326  =
	struct rb_node *curr, *prev;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  327  =
	struct iova *curr_iova, *prev_iova;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  328  =
	unsigned long flags;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  329  =
	unsigned long align_mask =3D ~0UL;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  330  =
	struct rb_node *candidate_rb_parent;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  331  =
	unsigned long new_pfn, candidate_pfn =3D ~0UL;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  332  =
	unsigned long gap, candidate_gap =3D ~0UL;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  333  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  334  =
	if (size_aligned)
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  335  =
		align_mask <<=3D limit_align_shift(iovad, fls_long(size - 1));
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  336  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  337  =
	/* Walk the tree backwards */
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  338  =
	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  339  =
	curr =3D &iovad->anchor.node;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  340  =
	prev =3D rb_prev(curr);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  341  =
	for (; prev; curr =3D prev, prev =3D rb_prev(curr)) {
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  342  =
		curr_iova =3D rb_entry(curr, struct iova, node);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  343  =
		prev_iova =3D rb_entry(prev, struct iova, node);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  344  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  345  =
		limit_pfn =3D min(limit_pfn, curr_iova->pfn_lo);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  346  =
		new_pfn =3D (limit_pfn - size) & align_mask;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  347  =
		gap =3D curr_iova->pfn_lo - prev_iova->pfn_hi - 1;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  348  =
		if ((limit_pfn >=3D size) && (new_pfn > prev_iova->pfn_hi)
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  349  =
				&& (gap < candidate_gap)) {
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  350  =
			candidate_gap =3D gap;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  351  =
			candidate_pfn =3D new_pfn;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  352  =
			candidate_rb_parent =3D curr;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  353  =
			if (gap =3D=3D size)
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  354  =
				goto insert;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  355  =
		}
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  356  =
	}
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  357  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  358  =
	curr_iova =3D rb_entry(curr, struct iova, node);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  359  =
	limit_pfn =3D min(limit_pfn, curr_iova->pfn_lo);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  360  =
	new_pfn =3D (limit_pfn - size) & align_mask;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  361  =
	gap =3D curr_iova->pfn_lo - iovad->start_pfn;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  362  =
	if (limit_pfn >=3D size && new_pfn >=3D iovad->start_pfn &&
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  363  =
			gap < candidate_gap) {
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26 @364  =
		candidate_gap =3D gap;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  365  =
		candidate_pfn =3D new_pfn;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  366  =
		candidate_rb_parent =3D curr;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  367  =
	}
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  368  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  369  =
insert:
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  370  =
	if (candidate_pfn =3D=3D ~0UL) {
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  371  =
		spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  372  =
		return -ENOMEM;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  373  =
	}
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  374  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  375  =
	/* pfn_lo will point to size aligned address if size_aligned is set */
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  376  =
	new->pfn_lo =3D candidate_pfn;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  377  =
	new->pfn_hi =3D new->pfn_lo + size - 1;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  378  =

150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  379  =
	/* If we have 'prev', it's a valid place to start the insertion. */
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  380  =
	iova_insert_rbtree(&iovad->rbroot, new, candidate_rb_parent);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  381  =
	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  382  =
	return 0;
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  383  }
150c882a3dd8f5 drivers/iommu/iova.c Liam Mark             2020-02-26  384  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4054025421503139306==--

