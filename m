Content-Type: multipart/mixed; boundary="===============5710907865934956355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/7] genirq/affinity: move group_cpus_evenly() into lib/
Date: Sun, 15 Aug 2021 09:49:54 +0800
Message-ID: <202108150937.Qdn6klQB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5710907865934956355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210814123532.229494-6-ming.lei@redhat.com>
References: <20210814123532.229494-6-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Jens Axboe <axboe@kernel.dk>
CC: linux-kernel(a)vger.kernel.org
CC: linux-block(a)vger.kernel.org
CC: Christoph Hellwig <hch@lst.de>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on next-20210813]
[cannot apply to block/for-next linux/master linus/master v5.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ming-Lei/genirq-affinity-a=
bstract-new-API-from-managed-irq-affinity-spread/20210814-203741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 04c2721=
d3530f0723b4c922a8fa9f26b202a20de
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-c001-20210814 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1f7b25=
ea76a925aca690da28de9d78db7ca99d0c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/0day-ci/linux/commit/759f72186bfdd5c3ba8b53ac0=
749cf7ba930012c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ming-Lei/genirq-affinity-abstract-=
new-API-from-managed-irq-affinity-spread/20210814-203741
        git checkout 759f72186bfdd5c3ba8b53ac0749cf7ba930012c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   lib/strnlen_user.c:34:2: warning: Value stored to 'src' is never read [c=
lang-analyzer-deadcode.DeadStores]
           src -=3D align;
           ^      ~~~~~
   lib/strnlen_user.c:34:2: note: Value stored to 'src' is never read
           src -=3D align;
           ^      ~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> lib/group_cpus.c:236:22: warning: Division by zero [clang-analyzer-core.=
DivideZero]
                                    numgrps * ncpus / remaining_ncpus);
                                                    ^
   lib/group_cpus.c:352:2: note: Taking false branch
           if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
           ^
   lib/group_cpus.c:355:2: note: Taking false branch
           if (!zalloc_cpumask_var(&npresmsk, GFP_KERNEL))
           ^
   lib/group_cpus.c:359:7: note: 'node_to_cpumask' is non-null
           if (!node_to_cpumask)
                ^~~~~~~~~~~~~~~
   lib/group_cpus.c:359:2: note: Taking false branch
           if (!node_to_cpumask)
           ^
   lib/group_cpus.c:363:6: note: Assuming 'masks' is non-null
           if (!masks)
               ^~~~~~
   lib/group_cpus.c:363:2: note: Taking false branch
           if (!masks)
           ^
   lib/group_cpus.c:371:8: note: Calling '__group_cpus_evenly'
           ret =3D __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:257:6: note: Assuming the condition is false
           if (!cpumask_weight(cpu_mask))
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:257:2: note: Taking false branch
           if (!cpumask_weight(cpu_mask))
           ^
   lib/group_cpus.c:266:6: note: Assuming 'numgrps' is > 'nodes'
           if (numgrps <=3D nodes) {
               ^~~~~~~~~~~~~~~~
   lib/group_cpus.c:266:2: note: Taking false branch
           if (numgrps <=3D nodes) {
           ^
   lib/group_cpus.c:279:6: note: Assuming 'node_groups' is non-null
           if (!node_groups)
               ^~~~~~~~~~~~
   lib/group_cpus.c:279:2: note: Taking false branch
           if (!node_groups)
           ^
   lib/group_cpus.c:283:2: note: Calling 'alloc_nodes_groups'
           alloc_nodes_groups(numgrps, node_to_cpumask, cpu_mask,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:134:14: note: 'remaining_ncpus' initialized to 0
           unsigned n, remaining_ncpus =3D 0;
                       ^~~~~~~~~~~~~~~
   lib/group_cpus.c:136:2: note: Loop condition is true.  Entering loop body
           for (n =3D 0; n < nr_node_ids; n++) {
           ^
   lib/group_cpus.c:136:2: note: Loop condition is false. Execution continu=
es on line 141
   lib/group_cpus.c:141:2: note: Taking false branch
           for_each_node_mask(n, nodemsk) {
           ^
   include/linux/nodemask.h:384:2: note: expanded from macro 'for_each_node=
_mask'
           if (!nodes_empty(mask))                         \
           ^
   lib/group_cpus.c:153:12: note: '__UNIQUE_ID___x401' is < '__UNIQUE_ID___=
y402'
           numgrps =3D min_t(unsigned, remaining_ncpus, numgrps);
                     ^
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
   lib/group_cpus.c:153:12: note: '?' condition is true
           numgrps =3D min_t(unsigned, remaining_ncpus, numgrps);
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
   lib/group_cpus.c:226:2: note: Loop condition is true.  Entering loop body
           for (n =3D 0; n < nr_node_ids; n++) {
           ^
   lib/group_cpus.c:229:7: note: Assuming the condition is false
                   if (node_groups[n].ncpus =3D=3D UINT_MAX)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:229:3: note: Taking false branch
                   if (node_groups[n].ncpus =3D=3D UINT_MAX)
                   ^
   lib/group_cpus.c:232:3: note: Taking true branch
                   WARN_ON_ONCE(numgrps =3D=3D 0);
                   ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'

vim +236 lib/group_cpus.c

759f72186bfdd5 Ming Lei 2021-08-14  113  =

759f72186bfdd5 Ming Lei 2021-08-14  114  /*
759f72186bfdd5 Ming Lei 2021-08-14  115   * Allocate group number for each =
node, so that for each node:
759f72186bfdd5 Ming Lei 2021-08-14  116   *
759f72186bfdd5 Ming Lei 2021-08-14  117   * 1) the allocated number is >=3D=
 1
759f72186bfdd5 Ming Lei 2021-08-14  118   *
759f72186bfdd5 Ming Lei 2021-08-14  119   * 2) the allocated number is <=3D=
 active CPU number of this node
759f72186bfdd5 Ming Lei 2021-08-14  120   *
759f72186bfdd5 Ming Lei 2021-08-14  121   * The actual allocated total grou=
ps may be less than @numgrps when
759f72186bfdd5 Ming Lei 2021-08-14  122   * active total CPU number is less=
 than @numgrps.
759f72186bfdd5 Ming Lei 2021-08-14  123   *
759f72186bfdd5 Ming Lei 2021-08-14  124   * Active CPUs means the CPUs in '=
@cpu_mask AND @node_to_cpumask[]'
759f72186bfdd5 Ming Lei 2021-08-14  125   * for each node.
759f72186bfdd5 Ming Lei 2021-08-14  126   */
759f72186bfdd5 Ming Lei 2021-08-14  127  static void alloc_nodes_groups(uns=
igned int numgrps,
759f72186bfdd5 Ming Lei 2021-08-14  128  			       cpumask_var_t *node_to_c=
pumask,
759f72186bfdd5 Ming Lei 2021-08-14  129  			       const struct cpumask *cp=
u_mask,
759f72186bfdd5 Ming Lei 2021-08-14  130  			       const nodemask_t nodemsk,
759f72186bfdd5 Ming Lei 2021-08-14  131  			       struct cpumask *nmsk,
759f72186bfdd5 Ming Lei 2021-08-14  132  			       struct node_groups *node=
_groups)
759f72186bfdd5 Ming Lei 2021-08-14  133  {
759f72186bfdd5 Ming Lei 2021-08-14  134  	unsigned n, remaining_ncpus =3D 0;
759f72186bfdd5 Ming Lei 2021-08-14  135  =

759f72186bfdd5 Ming Lei 2021-08-14  136  	for (n =3D 0; n < nr_node_ids; n+=
+) {
759f72186bfdd5 Ming Lei 2021-08-14  137  		node_groups[n].id =3D n;
759f72186bfdd5 Ming Lei 2021-08-14  138  		node_groups[n].ncpus =3D UINT_MA=
X;
759f72186bfdd5 Ming Lei 2021-08-14  139  	}
759f72186bfdd5 Ming Lei 2021-08-14  140  =

759f72186bfdd5 Ming Lei 2021-08-14  141  	for_each_node_mask(n, nodemsk) {
759f72186bfdd5 Ming Lei 2021-08-14  142  		unsigned ncpus;
759f72186bfdd5 Ming Lei 2021-08-14  143  =

759f72186bfdd5 Ming Lei 2021-08-14  144  		cpumask_and(nmsk, cpu_mask, node=
_to_cpumask[n]);
759f72186bfdd5 Ming Lei 2021-08-14  145  		ncpus =3D cpumask_weight(nmsk);
759f72186bfdd5 Ming Lei 2021-08-14  146  =

759f72186bfdd5 Ming Lei 2021-08-14  147  		if (!ncpus)
759f72186bfdd5 Ming Lei 2021-08-14  148  			continue;
759f72186bfdd5 Ming Lei 2021-08-14  149  		remaining_ncpus +=3D ncpus;
759f72186bfdd5 Ming Lei 2021-08-14  150  		node_groups[n].ncpus =3D ncpus;
759f72186bfdd5 Ming Lei 2021-08-14  151  	}
759f72186bfdd5 Ming Lei 2021-08-14  152  =

759f72186bfdd5 Ming Lei 2021-08-14  153  	numgrps =3D min_t(unsigned, remai=
ning_ncpus, numgrps);
759f72186bfdd5 Ming Lei 2021-08-14  154  =

759f72186bfdd5 Ming Lei 2021-08-14  155  	sort(node_groups, nr_node_ids, si=
zeof(node_groups[0]),
759f72186bfdd5 Ming Lei 2021-08-14  156  	     ncpus_cmp_func, NULL);
759f72186bfdd5 Ming Lei 2021-08-14  157  =

759f72186bfdd5 Ming Lei 2021-08-14  158  	/*
759f72186bfdd5 Ming Lei 2021-08-14  159  	 * Allocate groups for each node =
according to the ratio of this
759f72186bfdd5 Ming Lei 2021-08-14  160  	 * node's nr_cpus to remaining un=
-assigned ncpus. 'numgrps' is
759f72186bfdd5 Ming Lei 2021-08-14  161  	 * bigger than number of active n=
uma nodes. Always start the
759f72186bfdd5 Ming Lei 2021-08-14  162  	 * allocation from the node with =
minimized nr_cpus.
759f72186bfdd5 Ming Lei 2021-08-14  163  	 *
759f72186bfdd5 Ming Lei 2021-08-14  164  	 * This way guarantees that each =
active node gets allocated at
759f72186bfdd5 Ming Lei 2021-08-14  165  	 * least one group, and the theor=
y is simple: over-allocation
759f72186bfdd5 Ming Lei 2021-08-14  166  	 * is only done when this node is=
 assigned by one group, so
759f72186bfdd5 Ming Lei 2021-08-14  167  	 * other nodes will be allocated =
>=3D 1 groups, since 'numgrps' is
759f72186bfdd5 Ming Lei 2021-08-14  168  	 * bigger than number of numa nod=
es.
759f72186bfdd5 Ming Lei 2021-08-14  169  	 *
759f72186bfdd5 Ming Lei 2021-08-14  170  	 * One perfect invariant is that =
number of allocated groups for
759f72186bfdd5 Ming Lei 2021-08-14  171  	 * each node is <=3D CPU count of=
 this node:
759f72186bfdd5 Ming Lei 2021-08-14  172  	 *
759f72186bfdd5 Ming Lei 2021-08-14  173  	 * 1) suppose there are two nodes=
: A and B
759f72186bfdd5 Ming Lei 2021-08-14  174  	 * 	ncpu(X) is CPU count of node X
759f72186bfdd5 Ming Lei 2021-08-14  175  	 * 	grps(X) is the group count al=
located to node X via this
759f72186bfdd5 Ming Lei 2021-08-14  176  	 * 	algorithm
759f72186bfdd5 Ming Lei 2021-08-14  177  	 *
759f72186bfdd5 Ming Lei 2021-08-14  178  	 * 	ncpu(A) <=3D ncpu(B)
759f72186bfdd5 Ming Lei 2021-08-14  179  	 * 	ncpu(A) + ncpu(B) =3D N
759f72186bfdd5 Ming Lei 2021-08-14  180  	 * 	grps(A) + grps(B) =3D G
759f72186bfdd5 Ming Lei 2021-08-14  181  	 *
759f72186bfdd5 Ming Lei 2021-08-14  182  	 * 	grps(A) =3D max(1, round_down=
(G * ncpu(A) / N))
759f72186bfdd5 Ming Lei 2021-08-14  183  	 * 	grps(B) =3D G - grps(A)
759f72186bfdd5 Ming Lei 2021-08-14  184  	 *
759f72186bfdd5 Ming Lei 2021-08-14  185  	 * 	both N and G are integer, and=
 2 <=3D G <=3D N, suppose
759f72186bfdd5 Ming Lei 2021-08-14  186  	 * 	G =3D N - delta, and 0 <=3D d=
elta <=3D N - 2
759f72186bfdd5 Ming Lei 2021-08-14  187  	 *
759f72186bfdd5 Ming Lei 2021-08-14  188  	 * 2) obviously grps(A) <=3D ncpu=
(A) because:
759f72186bfdd5 Ming Lei 2021-08-14  189  	 *
759f72186bfdd5 Ming Lei 2021-08-14  190  	 * 	if grps(A) is 1, then grps(A)=
 <=3D ncpu(A) given
759f72186bfdd5 Ming Lei 2021-08-14  191  	 * 	ncpu(A) >=3D 1
759f72186bfdd5 Ming Lei 2021-08-14  192  	 *
759f72186bfdd5 Ming Lei 2021-08-14  193  	 * 	otherwise,
759f72186bfdd5 Ming Lei 2021-08-14  194  	 * 		grps(A) <=3D G * ncpu(A) / N=
 <=3D ncpu(A), given G <=3D N
759f72186bfdd5 Ming Lei 2021-08-14  195  	 *
759f72186bfdd5 Ming Lei 2021-08-14  196  	 * 3) prove how grps(B) <=3D ncpu=
(B):
759f72186bfdd5 Ming Lei 2021-08-14  197  	 *
759f72186bfdd5 Ming Lei 2021-08-14  198  	 * 	if round_down(G * ncpu(A) / N=
) =3D=3D 0, vecs(B) won't be
759f72186bfdd5 Ming Lei 2021-08-14  199  	 * 	over-allocated, so grps(B) <=
=3D ncpu(B),
759f72186bfdd5 Ming Lei 2021-08-14  200  	 *
759f72186bfdd5 Ming Lei 2021-08-14  201  	 * 	otherwise:
759f72186bfdd5 Ming Lei 2021-08-14  202  	 *
759f72186bfdd5 Ming Lei 2021-08-14  203  	 * 	grps(A) =3D
759f72186bfdd5 Ming Lei 2021-08-14  204  	 * 		round_down(G * ncpu(A) / N) =
=3D
759f72186bfdd5 Ming Lei 2021-08-14  205  	 * 		round_down((N - delta) * ncp=
u(A) / N) =3D
759f72186bfdd5 Ming Lei 2021-08-14  206  	 * 		round_down((N * ncpu(A) - de=
lta * ncpu(A)) / N)	 >=3D
759f72186bfdd5 Ming Lei 2021-08-14  207  	 * 		round_down((N * ncpu(A) - de=
lta * N) / N)	 =3D
759f72186bfdd5 Ming Lei 2021-08-14  208  	 * 		cpu(A) - delta
759f72186bfdd5 Ming Lei 2021-08-14  209  	 *
759f72186bfdd5 Ming Lei 2021-08-14  210  	 * 	then:
759f72186bfdd5 Ming Lei 2021-08-14  211  	 *
759f72186bfdd5 Ming Lei 2021-08-14  212  	 * 	grps(A) - G >=3D ncpu(A) - de=
lta - G
759f72186bfdd5 Ming Lei 2021-08-14  213  	 * 	=3D>
759f72186bfdd5 Ming Lei 2021-08-14  214  	 * 	G - grps(A) <=3D G + delta - =
ncpu(A)
759f72186bfdd5 Ming Lei 2021-08-14  215  	 * 	=3D>
759f72186bfdd5 Ming Lei 2021-08-14  216  	 * 	grps(B) <=3D N - ncpu(A)
759f72186bfdd5 Ming Lei 2021-08-14  217  	 * 	=3D>
759f72186bfdd5 Ming Lei 2021-08-14  218  	 * 	grps(B) <=3D cpu(B)
759f72186bfdd5 Ming Lei 2021-08-14  219  	 *
759f72186bfdd5 Ming Lei 2021-08-14  220  	 * For nodes >=3D 3, it can be th=
ought as one node and another big
759f72186bfdd5 Ming Lei 2021-08-14  221  	 * node given that is exactly wha=
t this algorithm is implemented,
759f72186bfdd5 Ming Lei 2021-08-14  222  	 * and we always re-calculate 're=
maining_ncpus' & 'numgrps', and
759f72186bfdd5 Ming Lei 2021-08-14  223  	 * finally for each node X: grps(=
X) <=3D ncpu(X).
759f72186bfdd5 Ming Lei 2021-08-14  224  	 *
759f72186bfdd5 Ming Lei 2021-08-14  225  	 */
759f72186bfdd5 Ming Lei 2021-08-14  226  	for (n =3D 0; n < nr_node_ids; n+=
+) {
759f72186bfdd5 Ming Lei 2021-08-14  227  		unsigned ngroups, ncpus;
759f72186bfdd5 Ming Lei 2021-08-14  228  =

759f72186bfdd5 Ming Lei 2021-08-14  229  		if (node_groups[n].ncpus =3D=3D =
UINT_MAX)
759f72186bfdd5 Ming Lei 2021-08-14  230  			continue;
759f72186bfdd5 Ming Lei 2021-08-14  231  =

759f72186bfdd5 Ming Lei 2021-08-14  232  		WARN_ON_ONCE(numgrps =3D=3D 0);
759f72186bfdd5 Ming Lei 2021-08-14  233  =

759f72186bfdd5 Ming Lei 2021-08-14  234  		ncpus =3D node_groups[n].ncpus;
759f72186bfdd5 Ming Lei 2021-08-14  235  		ngroups =3D max_t(unsigned, 1,
759f72186bfdd5 Ming Lei 2021-08-14 @236  				 numgrps * ncpus / remaining_n=
cpus);
759f72186bfdd5 Ming Lei 2021-08-14  237  		WARN_ON_ONCE(ngroups > ncpus);
759f72186bfdd5 Ming Lei 2021-08-14  238  =

759f72186bfdd5 Ming Lei 2021-08-14  239  		node_groups[n].ngroups =3D ngrou=
ps;
759f72186bfdd5 Ming Lei 2021-08-14  240  =

759f72186bfdd5 Ming Lei 2021-08-14  241  		remaining_ncpus -=3D ncpus;
759f72186bfdd5 Ming Lei 2021-08-14  242  		numgrps -=3D ngroups;
759f72186bfdd5 Ming Lei 2021-08-14  243  	}
759f72186bfdd5 Ming Lei 2021-08-14  244  }
759f72186bfdd5 Ming Lei 2021-08-14  245  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5710907865934956355==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5710907865934956355==--

