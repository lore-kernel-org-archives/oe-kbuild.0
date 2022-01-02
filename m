Content-Type: multipart/mixed; boundary="===============1949603163616414009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sched/sch_htb.c:94:8: warning: Excessive padding in 'struct htb_class' (104 padding bytes, where 40 is optimal).
Date: Sun, 02 Jan 2022 23:30:26 +0800
Message-ID: <202201022319.OFZC4n3j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1949603163616414009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maxim Mikityanskiy <maximmi@mellanox.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 83271586249c8ecf8458834864c827f67ad57773 sch_htb: Stats for offload=
ed HTB
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20211206 (https://download.01.org/0day-ci/arch=
ive/20220102/202201022319.OFZC4n3j-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f50be8=
eb0a12a61d23db6cda452c693001d76898)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D83271586249c8ecf8458834864c827f67ad57773
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 83271586249c8ecf8458834864c827f67ad57773
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/sched/sch_htb.c:1509:3: note: Taking false branch
                   WARN_ON(!old);
                   ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/sched/sch_htb.c:1510:11: note: Assuming 'old' is equal to 'q'
                   WARN_ON(old !=3D q);
                           ^
   include/asm-generic/bug.h:119:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/sched/sch_htb.c:1510:3: note: Taking false branch
                   WARN_ON(old !=3D q);
                   ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/sched/sch_htb.c:1513:10: note: Field 'parent' is non-null
           if (cl->parent) {
                   ^
   net/sched/sch_htb.c:1513:2: note: Taking true branch
           if (cl->parent) {
           ^
   net/sched/sch_htb.c:1519:15: note: 'last_child' is true
                   .command =3D !last_child ? TC_HTB_LEAF_DEL :
                               ^~~~~~~~~~
   net/sched/sch_htb.c:1519:14: note: '?' condition is false
                   .command =3D !last_child ? TC_HTB_LEAF_DEL :
                              ^
   net/sched/sch_htb.c:1520:7: note: 'destroying' is false
                              destroying ? TC_HTB_LEAF_DEL_LAST_FORCE :
                              ^~~~~~~~~~
   net/sched/sch_htb.c:1520:7: note: '?' condition is false
   net/sched/sch_htb.c:1527:6: note: Assuming 'err' is 0
           if (!err || destroying)
               ^~~~
   net/sched/sch_htb.c:1527:11: note: Left side of '||' is true
           if (!err || destroying)
                    ^
   net/sched/sch_htb.c:1532:6: note: 'last_child' is true
           if (last_child)
               ^~~~~~~~~~
   net/sched/sch_htb.c:1532:2: note: Taking true branch
           if (last_child)
           ^
   net/sched/sch_htb.c:1533:3: note: Returning zero (loaded from 'err'), wh=
ich participates in a condition later
                   return err;
                   ^~~~~~~~~~
   net/sched/sch_htb.c:1657:9: note: Returning from 'htb_destroy_class_offl=
oad'
                   err =3D htb_destroy_class_offload(sch, cl, last_child, f=
alse,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/sched/sch_htb.c:1659:7: note: 'err' is 0
                   if (err)
                       ^~~
   net/sched/sch_htb.c:1659:3: note: Taking false branch
                   if (err)
                   ^
   net/sched/sch_htb.c:1663:6: note: 'last_child' is 1
           if (last_child) {
               ^~~~~~~~~~
   net/sched/sch_htb.c:1663:2: note: Taking true branch
           if (last_child) {
           ^
   net/sched/sch_htb.c:1666:18: note: Field 'offload' is true
                   dev_queue =3D q->offload ? cl->leaf.q->dev_queue : sch->=
dev_queue;
                                  ^
   net/sched/sch_htb.c:1666:15: note: '?' condition is true
                   dev_queue =3D q->offload ? cl->leaf.q->dev_queue : sch->=
dev_queue;
                               ^
   net/sched/sch_htb.c:1667:3: note: Value assigned to 'new_q'
                   new_q =3D qdisc_create_dflt(dev_queue, &pfifo_qdisc_ops,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_htb.c:1670:10: note: Field 'offload' is true
                   if (q->offload) {
                          ^
   net/sched/sch_htb.c:1670:3: note: Taking true branch
                   if (q->offload) {
                   ^
   net/sched/sch_htb.c:1671:8: note: Assuming 'new_q' is null
                           if (new_q)
                               ^~~~~
   net/sched/sch_htb.c:1671:4: note: Taking false branch
                           if (new_q)
                           ^
   net/sched/sch_htb.c:1673:47: note: Passing null pointer value via 3rd pa=
rameter 'new_q'
                           htb_parent_to_leaf_offload(sch, dev_queue, new_q=
);
                                                                      ^~~~~
   net/sched/sch_htb.c:1673:4: note: Calling 'htb_parent_to_leaf_offload'
                           htb_parent_to_leaf_offload(sch, dev_queue, new_q=
);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_htb.c:1484:21: note: Passing null pointer value via 1st pa=
rameter 'qdisc'
           qdisc_refcount_inc(new_q);
                              ^~~~~
   net/sched/sch_htb.c:1484:2: note: Calling 'qdisc_refcount_inc'
           qdisc_refcount_inc(new_q);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sch_generic.h:122:6: note: Access to field 'flags' results i=
n a dereference of a null pointer (loaded from variable 'qdisc')
           if (qdisc->flags & TCQ_F_BUILTIN)
               ^~~~~
>> net/sched/sch_htb.c:94:8: warning: Excessive padding in 'struct htb_clas=
s' (104 padding bytes, where 40 is optimal). =

   Optimal fields order: =

   drops, =

   prio, =

   quantum, =

   filter_list, =

   block, =

   filter_cnt, =

   level, =

   children, =

   parent, =

   rate_est, =

   prio_activity, =

   cmode, =

   overlimits, =

   buffer, =

   cbuffer, =

   mbuffer, =

   tokens, =

   ctokens, =

   t_c, =

   pq_key, =

   common, =

   pq_node, =

   rate, =

   ceil, =

   bstats, =

   bstats_bias, =

   xstats, =

   , =

   node, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct htb_class {
   ~~~~~~~^~~~~~~~~~~
   net/sched/sch_htb.c:94:8: note: Excessive padding in 'struct htb_class' =
(104 padding bytes, where 40 is optimal). Optimal fields order: drops, prio=
, quantum, filter_list, block, filter_cnt, level, children, parent, rate_es=
t, prio_activity, cmode, overlimits, buffer, cbuffer, mbuffer, tokens, ctok=
ens, t_c, pq_key, common, pq_node, rate, ceil, bstats, bstats_bias, xstats,=
 , node, consider reordering the fields or adding explicit padding members
   struct htb_class {
   ~~~~~~~^~~~~~~~~~~
   net/sched/sch_htb.c:241:17: warning: Although the value stored to 'resul=
t' is used in the enclosing expression, the value is never actually read fr=
om 'result' [clang-analyzer-deadcode.DeadStores]
           while (tcf && (result =3D tcf_classify(skb, tcf, &res, false)) >=
=3D 0) {
                          ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_htb.c:241:17: note: Although the value stored to 'result' =
is used in the enclosing expression, the value is never actually read from =
'result'
           while (tcf && (result =3D tcf_classify(skb, tcf, &res, false)) >=
=3D 0) {
                          ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_htb.c:1425:17: warning: The left operand of '!=3D' is a ga=
rbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   WARN_ON(old_q !=3D *old);
                                 ^
   include/asm-generic/bug.h:119:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/sched/sch_htb.c:1398:2: note: 'old_q' declared without an initial va=
lue
           struct Qdisc *old_q;
           ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_htb.c:1400:6: note: Assuming field 'level' is 0
           if (cl->level)
               ^~~~~~~~~
   net/sched/sch_htb.c:1400:2: note: Taking false branch
           if (cl->level)
           ^
   net/sched/sch_htb.c:1403:6: note: Assuming field 'offload' is false
           if (q->offload) {
               ^~~~~~~~~~
   net/sched/sch_htb.c:1403:2: note: Taking false branch
           if (q->offload) {
           ^
   net/sched/sch_htb.c:1408:6: note: Assuming 'new' is non-null
           if (!new) {
               ^~~~
   net/sched/sch_htb.c:1408:2: note: Taking false branch
           if (!new) {
           ^
   net/sched/sch_htb.c:1415:9: note: Field 'offload' is false
           if (q->offload) {
                  ^
   net/sched/sch_htb.c:1415:2: note: Taking false branch
           if (q->offload) {
           ^
   net/sched/sch_htb.c:1422:9: note: Calling 'qdisc_replace'
           *old =3D qdisc_replace(sch, new, &cl->leaf.q);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sch_generic.h:1153:6: note: Assuming 'old' is equal to NULL
           if (old !=3D NULL)
               ^~~~~~~~~~~
   include/net/sch_generic.h:1153:2: note: Taking false branch
           if (old !=3D NULL)
           ^
   include/net/sch_generic.h:1155:2: note: Calling 'sch_tree_unlock'
           sch_tree_unlock(sch);
           ^~~~~~~~~~~~~~~~~~~~
   include/net/sch_generic.h:566:6: note: Assuming the condition is false
           if (q->flags & TCQ_F_MQROOT)
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/sch_generic.h:566:2: note: Taking false branch
           if (q->flags & TCQ_F_MQROOT)
           ^
   include/net/sch_generic.h:569:18: note: Value assigned to field 'offload=
', which participates in a condition later
                   spin_unlock_bh(qdisc_root_sleeping_lock(q));
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sch_generic.h:1155:2: note: Returning from 'sch_tree_unlock'
           sch_tree_unlock(sch);
           ^~~~~~~~~~~~~~~~~~~~
   net/sched/sch_htb.c:1422:9: note: Returning from 'qdisc_replace'

vim +94 net/sched/sch_htb.c

c9364636dcb01a Eric Dumazet       2013-06-15   89  =

ca4ec90b31d1ec Eric Dumazet       2013-06-13   90  /* interior & leaf nodes=
; props specific to leaves are marked L:
ca4ec90b31d1ec Eric Dumazet       2013-06-13   91   * To reduce false shari=
ng, place mostly read fields at beginning,
ca4ec90b31d1ec Eric Dumazet       2013-06-13   92   * and mostly written on=
es at the end.
ca4ec90b31d1ec Eric Dumazet       2013-06-13   93   */
87990467d387f9 Stephen Hemminger  2006-08-10  @94  struct htb_class {
f4c1f3e0c59be0 Patrick McHardy    2008-07-05   95  	struct Qdisc_class_comm=
on common;
ca4ec90b31d1ec Eric Dumazet       2013-06-13   96  	struct psched_ratecfg	r=
ate;
ca4ec90b31d1ec Eric Dumazet       2013-06-13   97  	struct psched_ratecfg	c=
eil;
ca4ec90b31d1ec Eric Dumazet       2013-06-13   98  	s64			buffer, cbuffer;/=
* token bucket depth/rate */
ca4ec90b31d1ec Eric Dumazet       2013-06-13   99  	s64			mbuffer;	/* max w=
ait time */
cbd375567f7e48 stephen hemminger  2013-08-01  100  	u32			prio;		/* these t=
wo are used only by leaves... */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  101  	int			quantum;	/* but s=
tored for parent-to-leaf return */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  102  =

25d8c0d55f241c John Fastabend     2014-09-12  103  	struct tcf_proto __rcu	=
*filter_list;	/* class attached filters */
6529eaba33f046 Jiri Pirko         2017-05-17  104  	struct tcf_block	*block;
ca4ec90b31d1ec Eric Dumazet       2013-06-13  105  	int			filter_cnt;
^1da177e4c3f41 Linus Torvalds     2005-04-16  106  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  107  	int			level;		/* our le=
vel (see above) */
4207759939c208 Patrick McHardy    2008-07-05  108  	unsigned int		children;
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  	struct htb_class	*paren=
t;	/* parent class */
^1da177e4c3f41 Linus Torvalds     2005-04-16  110  =

1c0d32fde5bdf1 Eric Dumazet       2016-12-04  111  	struct net_rate_estimat=
or __rcu *rate_est;
ca4ec90b31d1ec Eric Dumazet       2013-06-13  112  =

ca4ec90b31d1ec Eric Dumazet       2013-06-13  113  	/*
ca4ec90b31d1ec Eric Dumazet       2013-06-13  114  	 * Written often fields
ca4ec90b31d1ec Eric Dumazet       2013-06-13  115  	 */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  116  	struct gnet_stats_basic=
_packed bstats;
83271586249c8e Maxim Mikityanskiy 2021-01-19  117  	struct gnet_stats_basic=
_packed bstats_bias;
ca4ec90b31d1ec Eric Dumazet       2013-06-13  118  	struct tc_htb_xstats	xs=
tats;	/* our special stats */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  119  =

ca4ec90b31d1ec Eric Dumazet       2013-06-13  120  	/* token bucket paramet=
ers */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  121  	s64			tokens, ctokens;/=
* current number of tokens */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  122  	s64			t_c;		/* checkpoi=
nt time */
c19f7a34f7cc75 Jarek Poplawski    2008-12-03  123  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  124  	union {
^1da177e4c3f41 Linus Torvalds     2005-04-16  125  		struct htb_class_leaf {
c9364636dcb01a Eric Dumazet       2013-06-15  126  			int		deficit[TC_HTB_M=
AXDEPTH];
c9364636dcb01a Eric Dumazet       2013-06-15  127  			struct Qdisc	*q;
^1da177e4c3f41 Linus Torvalds     2005-04-16  128  		} leaf;
^1da177e4c3f41 Linus Torvalds     2005-04-16  129  		struct htb_class_inner=
 {
c9364636dcb01a Eric Dumazet       2013-06-15  130  			struct htb_prio clpri=
o[TC_HTB_NUMPRIO];
^1da177e4c3f41 Linus Torvalds     2005-04-16  131  		} inner;
11957be20ff68d Cong Wang          2018-09-07  132  	};
5343a7f8be1195 Eric Dumazet       2013-06-04  133  	s64			pq_key;
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  135  	int			prio_activity;	/*=
 for which prios are we active */
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  	enum htb_cmode		cmode;	=
	/* current mode of the class */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  137  	struct rb_node		pq_node=
;	/* node for event queue */
ca4ec90b31d1ec Eric Dumazet       2013-06-13  138  	struct rb_node		node[TC=
_HTB_NUMPRIO];	/* node for self or feed tree */
338ed9b4de57c4 Eric Dumazet       2016-06-21  139  =

338ed9b4de57c4 Eric Dumazet       2016-06-21  140  	unsigned int drops ____=
cacheline_aligned_in_smp;
3c75f6ee139d46 Eric Dumazet       2017-09-18  141  	unsigned int		overlimit=
s;
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  };
^1da177e4c3f41 Linus Torvalds     2005-04-16  143  =


:::::: The code at line 94 was first introduced by commit
:::::: 87990467d387f922103db31678034785d8f21cb7 [HTB]: Lindent

:::::: TO: Stephen Hemminger <shemminger@osdl.org>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1949603163616414009==--

