Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129B3C39
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676486221; x=1708022221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3Y5vDecIKq8htoRzgDHQuXaBUmo4XKDrhFUcnCoJD8=;
  b=ADPtsz5kDKToJzq/fqoDl7JxmeRO43ODib26QDbHhWbXBmbKFzHIfiBH
   Koslv4wD5mMa3HHEXTztMWpLOmh8f4XkJkeDXWK5Yur3IKLNW2UZhkQuK
   9ziqxzhIc3+M2Gc+JuX8NgT0J6UV1B/AGWMwe+0BKnzDCGDj1536B1RQJ
   dcYTA9gRzZYt4P0jNFtSktYQi2X1DvC/gLx+jV1P5sJt+VmafxrufPfC5
   c+i4PDkv4GUrmx88SAwWQBH+jqwhLoiMzB7r4fstYcjqzxscrIPUEbPyE
   SljWmFAXZbzfzwd89BtfIExlptjc+/AL3rb2TDESVrwUNjDLe3FODYy51
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="329228327"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="329228327"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 10:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758547812"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="758547812"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2023 10:37:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSMeJ-0009fx-1s;
	Wed, 15 Feb 2023 18:36:59 +0000
Date: Thu, 16 Feb 2023 02:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:irq/core 8/9] lib/group_cpus.c:237:22: warning: Division by
 zero [clang-analyzer-core.DivideZero]
Message-ID: <202302160257.uvKArXF7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/group_cpus.c:237:22: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ming Lei <ming.lei@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   188a569658584e93930ab60334c5a1079c0330d8
commit: f7b3ea8cf72f3d6060fe08e461805181e7450a13 [8/9] genirq/affinity: Move group_cpus_evenly() into lib/
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-c005-20230210 (https://download.01.org/0day-ci/archive/20230216/202302160257.uvKArXF7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=f7b3ea8cf72f3d6060fe08e461805181e7450a13
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip irq/core
        git checkout f7b3ea8cf72f3d6060fe08e461805181e7450a13
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302160257.uvKArXF7-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~
   crypto/testmgr.c:616:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < tsgl->nents; i++) {
           ^
   crypto/testmgr.c:617:25: note: Access to field 'offset' results in a dereference of an undefined pointer value (loaded from field 'div')
                   unsigned int offset = partitions[i].div->offset;
                                         ^             ~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   crypto/scatterwalk.c:61:6: note: Assuming 'nbytes' is not equal to 0
           if (!nbytes)
               ^~~~~~~
   crypto/scatterwalk.c:61:2: note: Taking false branch
           if (!nbytes)
           ^
   crypto/scatterwalk.c:67:2: note: Calling 'scatterwalk_copychunks'
           scatterwalk_copychunks(buf, &walk, nbytes, out);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/scatterwalk.c:29:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   crypto/scatterwalk.c:33:7: note: Assuming 'len_this_page' is <= 'nbytes'
                   if (len_this_page > nbytes)
                       ^~~~~~~~~~~~~~~~~~~~~~
   crypto/scatterwalk.c:33:3: note: Taking false branch
                   if (len_this_page > nbytes)
                   ^
   crypto/scatterwalk.c:36:7: note: Assuming 'out' is not equal to 2
                   if (out != 2) {
                       ^~~~~~~~
   crypto/scatterwalk.c:36:3: note: Taking true branch
                   if (out != 2) {
                   ^
   crypto/scatterwalk.c:37:12: note: Calling 'scatterwalk_map'
                           vaddr = scatterwalk_map(walk);
                                   ^~~~~~~~~~~~~~~~~~~~~
   include/crypto/scatterwalk.h:68:9: note: Calling 'kmap_atomic'
           return kmap_atomic(scatterwalk_page(walk)) +
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h:209:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PREEMPT_RT))
           ^
   include/linux/highmem-internal.h:212:3: note: Calling '__preempt_count_add'
                   preempt_disable();
                   ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> lib/group_cpus.c:237:22: warning: Division by zero [clang-analyzer-core.DivideZero]
                                    numgrps * ncpus / remaining_ncpus);
                                                    ^
   lib/group_cpus.c:354:6: note: Assuming the condition is false
           if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:354:2: note: Taking false branch
           if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
           ^
   lib/group_cpus.c:357:6: note: Assuming the condition is false
           if (!zalloc_cpumask_var(&npresmsk, GFP_KERNEL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:357:2: note: Taking false branch
           if (!zalloc_cpumask_var(&npresmsk, GFP_KERNEL))
           ^
   lib/group_cpus.c:361:7: note: 'node_to_cpumask' is non-null
           if (!node_to_cpumask)
                ^~~~~~~~~~~~~~~
   lib/group_cpus.c:361:2: note: Taking false branch
           if (!node_to_cpumask)
           ^
   lib/group_cpus.c:365:6: note: Assuming 'masks' is non-null
           if (!masks)
               ^~~~~~
   lib/group_cpus.c:365:2: note: Taking false branch
           if (!masks)
           ^
   lib/group_cpus.c:373:8: note: Calling '__group_cpus_evenly'
           ret = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:258:2: note: Taking false branch
           if (cpumask_empty(cpu_mask))
           ^
   lib/group_cpus.c:267:6: note: Assuming 'numgrps' is > 'nodes'
           if (numgrps <= nodes) {
               ^~~~~~~~~~~~~~~~
   lib/group_cpus.c:267:2: note: Taking false branch
           if (numgrps <= nodes) {
           ^
   lib/group_cpus.c:281:6: note: Assuming 'node_groups' is non-null
           if (!node_groups)
               ^~~~~~~~~~~~
   lib/group_cpus.c:281:2: note: Taking false branch
           if (!node_groups)
           ^
   lib/group_cpus.c:285:2: note: Calling 'alloc_nodes_groups'
           alloc_nodes_groups(numgrps, node_to_cpumask, cpu_mask,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/group_cpus.c:135:14: note: 'remaining_ncpus' initialized to 0
           unsigned n, remaining_ncpus = 0;
                       ^~~~~~~~~~~~~~~
   lib/group_cpus.c:137:2: note: Loop condition is true.  Entering loop body
           for (n = 0; n < nr_node_ids; n++) {
           ^
   lib/group_cpus.c:137:2: note: Loop condition is false. Execution continues on line 142
   lib/group_cpus.c:142:2: note: 'n' is < 1
           for_each_node_mask(n, nodemsk) {
           ^
   include/linux/nodemask.h:392:19: note: expanded from macro 'for_each_node_mask'
           for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
                            ^~~~~~
   lib/group_cpus.c:142:2: note: Left side of '&&' is true
           for_each_node_mask(n, nodemsk) {
           ^
   include/linux/nodemask.h:392:19: note: expanded from macro 'for_each_node_mask'
           for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
                            ^
   lib/group_cpus.c:142:2: note: Loop condition is false. Execution continues on line 154
           for_each_node_mask(n, nodemsk) {
           ^
   include/linux/nodemask.h:392:2: note: expanded from macro 'for_each_node_mask'
           for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
           ^
   lib/group_cpus.c:154:12: note: '__UNIQUE_ID___x249' is < '__UNIQUE_ID___y250'
           numgrps = min_t(unsigned, remaining_ncpus, numgrps);
                     ^
   include/linux/minmax.h:126:27: note: expanded from macro 'min_t'
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
   lib/group_cpus.c:154:12: note: '?' condition is true
           numgrps = min_t(unsigned, remaining_ncpus, numgrps);
                     ^
   include/linux/minmax.h:126:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'

vim +237 lib/group_cpus.c

f7b3ea8cf72f3d Ming Lei 2022-12-27  114  
f7b3ea8cf72f3d Ming Lei 2022-12-27  115  /*
f7b3ea8cf72f3d Ming Lei 2022-12-27  116   * Allocate group number for each node, so that for each node:
f7b3ea8cf72f3d Ming Lei 2022-12-27  117   *
f7b3ea8cf72f3d Ming Lei 2022-12-27  118   * 1) the allocated number is >= 1
f7b3ea8cf72f3d Ming Lei 2022-12-27  119   *
f7b3ea8cf72f3d Ming Lei 2022-12-27  120   * 2) the allocated number is <= active CPU number of this node
f7b3ea8cf72f3d Ming Lei 2022-12-27  121   *
f7b3ea8cf72f3d Ming Lei 2022-12-27  122   * The actual allocated total groups may be less than @numgrps when
f7b3ea8cf72f3d Ming Lei 2022-12-27  123   * active total CPU number is less than @numgrps.
f7b3ea8cf72f3d Ming Lei 2022-12-27  124   *
f7b3ea8cf72f3d Ming Lei 2022-12-27  125   * Active CPUs means the CPUs in '@cpu_mask AND @node_to_cpumask[]'
f7b3ea8cf72f3d Ming Lei 2022-12-27  126   * for each node.
f7b3ea8cf72f3d Ming Lei 2022-12-27  127   */
f7b3ea8cf72f3d Ming Lei 2022-12-27  128  static void alloc_nodes_groups(unsigned int numgrps,
f7b3ea8cf72f3d Ming Lei 2022-12-27  129  			       cpumask_var_t *node_to_cpumask,
f7b3ea8cf72f3d Ming Lei 2022-12-27  130  			       const struct cpumask *cpu_mask,
f7b3ea8cf72f3d Ming Lei 2022-12-27  131  			       const nodemask_t nodemsk,
f7b3ea8cf72f3d Ming Lei 2022-12-27  132  			       struct cpumask *nmsk,
f7b3ea8cf72f3d Ming Lei 2022-12-27  133  			       struct node_groups *node_groups)
f7b3ea8cf72f3d Ming Lei 2022-12-27  134  {
f7b3ea8cf72f3d Ming Lei 2022-12-27  135  	unsigned n, remaining_ncpus = 0;
f7b3ea8cf72f3d Ming Lei 2022-12-27  136  
f7b3ea8cf72f3d Ming Lei 2022-12-27  137  	for (n = 0; n < nr_node_ids; n++) {
f7b3ea8cf72f3d Ming Lei 2022-12-27  138  		node_groups[n].id = n;
f7b3ea8cf72f3d Ming Lei 2022-12-27  139  		node_groups[n].ncpus = UINT_MAX;
f7b3ea8cf72f3d Ming Lei 2022-12-27  140  	}
f7b3ea8cf72f3d Ming Lei 2022-12-27  141  
f7b3ea8cf72f3d Ming Lei 2022-12-27  142  	for_each_node_mask(n, nodemsk) {
f7b3ea8cf72f3d Ming Lei 2022-12-27  143  		unsigned ncpus;
f7b3ea8cf72f3d Ming Lei 2022-12-27  144  
f7b3ea8cf72f3d Ming Lei 2022-12-27  145  		cpumask_and(nmsk, cpu_mask, node_to_cpumask[n]);
f7b3ea8cf72f3d Ming Lei 2022-12-27  146  		ncpus = cpumask_weight(nmsk);
f7b3ea8cf72f3d Ming Lei 2022-12-27  147  
f7b3ea8cf72f3d Ming Lei 2022-12-27  148  		if (!ncpus)
f7b3ea8cf72f3d Ming Lei 2022-12-27  149  			continue;
f7b3ea8cf72f3d Ming Lei 2022-12-27  150  		remaining_ncpus += ncpus;
f7b3ea8cf72f3d Ming Lei 2022-12-27  151  		node_groups[n].ncpus = ncpus;
f7b3ea8cf72f3d Ming Lei 2022-12-27  152  	}
f7b3ea8cf72f3d Ming Lei 2022-12-27  153  
f7b3ea8cf72f3d Ming Lei 2022-12-27  154  	numgrps = min_t(unsigned, remaining_ncpus, numgrps);
f7b3ea8cf72f3d Ming Lei 2022-12-27  155  
f7b3ea8cf72f3d Ming Lei 2022-12-27  156  	sort(node_groups, nr_node_ids, sizeof(node_groups[0]),
f7b3ea8cf72f3d Ming Lei 2022-12-27  157  	     ncpus_cmp_func, NULL);
f7b3ea8cf72f3d Ming Lei 2022-12-27  158  
f7b3ea8cf72f3d Ming Lei 2022-12-27  159  	/*
f7b3ea8cf72f3d Ming Lei 2022-12-27  160  	 * Allocate groups for each node according to the ratio of this
f7b3ea8cf72f3d Ming Lei 2022-12-27  161  	 * node's nr_cpus to remaining un-assigned ncpus. 'numgrps' is
f7b3ea8cf72f3d Ming Lei 2022-12-27  162  	 * bigger than number of active numa nodes. Always start the
f7b3ea8cf72f3d Ming Lei 2022-12-27  163  	 * allocation from the node with minimized nr_cpus.
f7b3ea8cf72f3d Ming Lei 2022-12-27  164  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  165  	 * This way guarantees that each active node gets allocated at
f7b3ea8cf72f3d Ming Lei 2022-12-27  166  	 * least one group, and the theory is simple: over-allocation
f7b3ea8cf72f3d Ming Lei 2022-12-27  167  	 * is only done when this node is assigned by one group, so
f7b3ea8cf72f3d Ming Lei 2022-12-27  168  	 * other nodes will be allocated >= 1 groups, since 'numgrps' is
f7b3ea8cf72f3d Ming Lei 2022-12-27  169  	 * bigger than number of numa nodes.
f7b3ea8cf72f3d Ming Lei 2022-12-27  170  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  171  	 * One perfect invariant is that number of allocated groups for
f7b3ea8cf72f3d Ming Lei 2022-12-27  172  	 * each node is <= CPU count of this node:
f7b3ea8cf72f3d Ming Lei 2022-12-27  173  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  174  	 * 1) suppose there are two nodes: A and B
f7b3ea8cf72f3d Ming Lei 2022-12-27  175  	 * 	ncpu(X) is CPU count of node X
f7b3ea8cf72f3d Ming Lei 2022-12-27  176  	 * 	grps(X) is the group count allocated to node X via this
f7b3ea8cf72f3d Ming Lei 2022-12-27  177  	 * 	algorithm
f7b3ea8cf72f3d Ming Lei 2022-12-27  178  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  179  	 * 	ncpu(A) <= ncpu(B)
f7b3ea8cf72f3d Ming Lei 2022-12-27  180  	 * 	ncpu(A) + ncpu(B) = N
f7b3ea8cf72f3d Ming Lei 2022-12-27  181  	 * 	grps(A) + grps(B) = G
f7b3ea8cf72f3d Ming Lei 2022-12-27  182  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  183  	 * 	grps(A) = max(1, round_down(G * ncpu(A) / N))
f7b3ea8cf72f3d Ming Lei 2022-12-27  184  	 * 	grps(B) = G - grps(A)
f7b3ea8cf72f3d Ming Lei 2022-12-27  185  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  186  	 * 	both N and G are integer, and 2 <= G <= N, suppose
f7b3ea8cf72f3d Ming Lei 2022-12-27  187  	 * 	G = N - delta, and 0 <= delta <= N - 2
f7b3ea8cf72f3d Ming Lei 2022-12-27  188  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  189  	 * 2) obviously grps(A) <= ncpu(A) because:
f7b3ea8cf72f3d Ming Lei 2022-12-27  190  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  191  	 * 	if grps(A) is 1, then grps(A) <= ncpu(A) given
f7b3ea8cf72f3d Ming Lei 2022-12-27  192  	 * 	ncpu(A) >= 1
f7b3ea8cf72f3d Ming Lei 2022-12-27  193  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  194  	 * 	otherwise,
f7b3ea8cf72f3d Ming Lei 2022-12-27  195  	 * 		grps(A) <= G * ncpu(A) / N <= ncpu(A), given G <= N
f7b3ea8cf72f3d Ming Lei 2022-12-27  196  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  197  	 * 3) prove how grps(B) <= ncpu(B):
f7b3ea8cf72f3d Ming Lei 2022-12-27  198  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  199  	 * 	if round_down(G * ncpu(A) / N) == 0, vecs(B) won't be
f7b3ea8cf72f3d Ming Lei 2022-12-27  200  	 * 	over-allocated, so grps(B) <= ncpu(B),
f7b3ea8cf72f3d Ming Lei 2022-12-27  201  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  202  	 * 	otherwise:
f7b3ea8cf72f3d Ming Lei 2022-12-27  203  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  204  	 * 	grps(A) =
f7b3ea8cf72f3d Ming Lei 2022-12-27  205  	 * 		round_down(G * ncpu(A) / N) =
f7b3ea8cf72f3d Ming Lei 2022-12-27  206  	 * 		round_down((N - delta) * ncpu(A) / N) =
f7b3ea8cf72f3d Ming Lei 2022-12-27  207  	 * 		round_down((N * ncpu(A) - delta * ncpu(A)) / N)	 >=
f7b3ea8cf72f3d Ming Lei 2022-12-27  208  	 * 		round_down((N * ncpu(A) - delta * N) / N)	 =
f7b3ea8cf72f3d Ming Lei 2022-12-27  209  	 * 		cpu(A) - delta
f7b3ea8cf72f3d Ming Lei 2022-12-27  210  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  211  	 * 	then:
f7b3ea8cf72f3d Ming Lei 2022-12-27  212  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  213  	 * 	grps(A) - G >= ncpu(A) - delta - G
f7b3ea8cf72f3d Ming Lei 2022-12-27  214  	 * 	=>
f7b3ea8cf72f3d Ming Lei 2022-12-27  215  	 * 	G - grps(A) <= G + delta - ncpu(A)
f7b3ea8cf72f3d Ming Lei 2022-12-27  216  	 * 	=>
f7b3ea8cf72f3d Ming Lei 2022-12-27  217  	 * 	grps(B) <= N - ncpu(A)
f7b3ea8cf72f3d Ming Lei 2022-12-27  218  	 * 	=>
f7b3ea8cf72f3d Ming Lei 2022-12-27  219  	 * 	grps(B) <= cpu(B)
f7b3ea8cf72f3d Ming Lei 2022-12-27  220  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  221  	 * For nodes >= 3, it can be thought as one node and another big
f7b3ea8cf72f3d Ming Lei 2022-12-27  222  	 * node given that is exactly what this algorithm is implemented,
f7b3ea8cf72f3d Ming Lei 2022-12-27  223  	 * and we always re-calculate 'remaining_ncpus' & 'numgrps', and
f7b3ea8cf72f3d Ming Lei 2022-12-27  224  	 * finally for each node X: grps(X) <= ncpu(X).
f7b3ea8cf72f3d Ming Lei 2022-12-27  225  	 *
f7b3ea8cf72f3d Ming Lei 2022-12-27  226  	 */
f7b3ea8cf72f3d Ming Lei 2022-12-27  227  	for (n = 0; n < nr_node_ids; n++) {
f7b3ea8cf72f3d Ming Lei 2022-12-27  228  		unsigned ngroups, ncpus;
f7b3ea8cf72f3d Ming Lei 2022-12-27  229  
f7b3ea8cf72f3d Ming Lei 2022-12-27  230  		if (node_groups[n].ncpus == UINT_MAX)
f7b3ea8cf72f3d Ming Lei 2022-12-27  231  			continue;
f7b3ea8cf72f3d Ming Lei 2022-12-27  232  
f7b3ea8cf72f3d Ming Lei 2022-12-27  233  		WARN_ON_ONCE(numgrps == 0);
f7b3ea8cf72f3d Ming Lei 2022-12-27  234  
f7b3ea8cf72f3d Ming Lei 2022-12-27  235  		ncpus = node_groups[n].ncpus;
f7b3ea8cf72f3d Ming Lei 2022-12-27  236  		ngroups = max_t(unsigned, 1,
f7b3ea8cf72f3d Ming Lei 2022-12-27 @237  				 numgrps * ncpus / remaining_ncpus);
f7b3ea8cf72f3d Ming Lei 2022-12-27  238  		WARN_ON_ONCE(ngroups > ncpus);
f7b3ea8cf72f3d Ming Lei 2022-12-27  239  
f7b3ea8cf72f3d Ming Lei 2022-12-27  240  		node_groups[n].ngroups = ngroups;
f7b3ea8cf72f3d Ming Lei 2022-12-27  241  
f7b3ea8cf72f3d Ming Lei 2022-12-27  242  		remaining_ncpus -= ncpus;
f7b3ea8cf72f3d Ming Lei 2022-12-27  243  		numgrps -= ngroups;
f7b3ea8cf72f3d Ming Lei 2022-12-27  244  	}
f7b3ea8cf72f3d Ming Lei 2022-12-27  245  }
f7b3ea8cf72f3d Ming Lei 2022-12-27  246  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
