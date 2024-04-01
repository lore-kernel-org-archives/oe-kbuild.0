Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3B4F200
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711994174; cv=none; b=difMJVtbIrUKq5z9Zwgn3ga3s46qQvjqp6PjpzpyLiSgc0GvfO78IJdXUTSHoB1ERc4L7WfnOUfvjKxdozTK/o+trd41xPtv2Ke1uNAGmWZdTka2lCevs4EoyHEMnYOHIVOV3ya0kGP5vF59YRxsbXPmRR/0fMw9jGUaRCHCcOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711994174; c=relaxed/simple;
	bh=CFUUtAQcoiMf1eDinexXZkRwVD7iADDpzKi0p304f7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDKtYNWzFMXWHVKVizt/8lijJxvp05GmKKHsXSYofCi68QSgTck+3c+dIIQrjY0x5/fUFuz7Cc5eJip+7gMP1rnMlkGnZalqwsAm4Zz5k21p4kxm4GhWcEJbq1xHxr9mFwjtWAkp8gVs8tMaqFtNKmUpPQ83kcLV6ta6nHMZSMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1kyIvxP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1kyIvxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711994173; x=1743530173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFUUtAQcoiMf1eDinexXZkRwVD7iADDpzKi0p304f7c=;
  b=l1kyIvxPkg9Wy/zmChRqOwxttaUWB4Gz8wEUcj/QO6vxtq4dm8R0FYtk
   Fkm7A4OIHRm3lheOyqRG/eNFIZHf0A27ohDM8Wfa+385k0yqhUpa3bms5
   wCuhjMo8+O1H2n6AUHceK1ZcjTzywJ4bzF2hKueKSQ3EErao0e+cVbcKu
   M3V/9rOXZbxtaoLxDosQdz28NYt8fiK/c1LfTZlCLE1vvOScgcZg/b10d
   ZaVmLuM56sfIKqxKnFaFqjRPGDyJjbowRUEQC61vSf1FupIT19jWw//QX
   ulX8GvCMZnjGHORv2o60MVDBL9bI2A2aJ1oe2Tr+bFqZgyslyPKc/6y7W
   g==;
X-CSE-ConnectionGUID: TkQxzue7RWWtoCAfioTASA==
X-CSE-MsgGUID: Eu91huHSTq+rhgPJJeAphA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="6989246"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="6989246"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 10:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="22250000"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2024 10:56:11 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrLtA-0000Wn-2H;
	Mon, 01 Apr 2024 17:56:08 +0000
Date: Tue, 2 Apr 2024 01:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tnguy-next-queue:100GbE 7/47] net/unix/garbage.c:294:17-23: ERROR:
 invalid reference to the index variable of the iterator on line 325
Message-ID: <202404020140.zlbcZo42-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 100GbE
head:   d79b28fd34979281a1233eab45f8c3139a846d67
commit: 3484f063172dd88776b062046d721d7c2ae1af7c [7/47] af_unix: Detect Strongly Connected Components.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r053-20240401 (https://download.01.org/0day-ci/archive/20240402/202404020140.zlbcZo42-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404020140.zlbcZo42-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/unix/garbage.c:294:17-23: ERROR: invalid reference to the index variable of the iterator on line 325

vim +294 net/unix/garbage.c

6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  250  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  251  static void __unix_walk_scc(struct unix_vertex *vertex)
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  252  {
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  253  	unsigned long index = UNIX_VERTEX_INDEX_START;
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  254  	LIST_HEAD(vertex_stack);
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  255  	struct unix_edge *edge;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  256  	LIST_HEAD(edge_stack);
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  257  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  258  next_vertex:
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  259  	/* Push vertex to vertex_stack.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  260  	 * The vertex will be popped when finalising SCC later.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  261  	 */
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  262  	vertex->on_stack = true;
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  263  	list_add(&vertex->scc_entry, &vertex_stack);
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  264  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  265  	vertex->index = index;
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  266  	vertex->lowlink = index;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  267  	index++;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  268  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  269  	/* Explore neighbour vertices (receivers of the current vertex's fd). */
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  270  	list_for_each_entry(edge, &vertex->edges, vertex_entry) {
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  271  		struct unix_vertex *next_vertex = edge->successor->vertex;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  272  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  273  		if (!next_vertex)
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  274  			continue;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  275  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  276  		if (next_vertex->index == UNIX_VERTEX_INDEX_UNVISITED) {
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  277  			/* Iterative deepening depth first search
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  278  			 *
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  279  			 *   1. Push a forward edge to edge_stack and set
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  280  			 *      the successor to vertex for the next iteration.
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  281  			 */
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  282  			list_add(&edge->stack_entry, &edge_stack);
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  283  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  284  			vertex = next_vertex;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  285  			goto next_vertex;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  286  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  287  			/*   2. Pop the edge directed to the current vertex
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  288  			 *      and restore the ancestor for backtracking.
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  289  			 */
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  290  prev_vertex:
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  291  			edge = list_first_entry(&edge_stack, typeof(*edge), stack_entry);
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  292  			list_del_init(&edge->stack_entry);
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  293  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25 @294  			next_vertex = vertex;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  295  			vertex = edge->predecessor->vertex;
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  296  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  297  			/* If the successor has a smaller lowlink, two vertices
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  298  			 * are in the same SCC, so propagate the smaller lowlink
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  299  			 * to skip SCC finalisation.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  300  			 */
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  301  			vertex->lowlink = min(vertex->lowlink, next_vertex->lowlink);
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  302  		} else if (next_vertex->on_stack) {
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  303  			/* Loop detected by a back/cross edge.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  304  			 *
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  305  			 * The successor is on vertex_stack, so two vertices are
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  306  			 * in the same SCC.  If the successor has a smaller index,
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  307  			 * propagate it to skip SCC finalisation.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  308  			 */
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  309  			vertex->lowlink = min(vertex->lowlink, next_vertex->index);
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  310  		} else {
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  311  			/* The successor was already grouped as another SCC */
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  312  		}
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  313  	}
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  314  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  315  	if (vertex->index == vertex->lowlink) {
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  316  		struct list_head scc;
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  317  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  318  		/* SCC finalised.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  319  		 *
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  320  		 * If the lowlink was not updated, all the vertices above on
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  321  		 * vertex_stack are in the same SCC.  Group them using scc_entry.
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  322  		 */
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  323  		__list_cut_position(&scc, &vertex_stack, &vertex->scc_entry);
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  324  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25 @325  		list_for_each_entry_reverse(vertex, &scc, scc_entry) {
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  326  			/* Don't restart DFS from this vertex in unix_walk_scc(). */
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  327  			list_move_tail(&vertex->entry, &unix_visited_vertices);
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  328  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  329  			vertex->on_stack = false;
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  330  		}
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  331  
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  332  		list_del(&scc);
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  333  	}
3484f063172dd8 Kuniyuki Iwashima 2024-03-25  334  
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  335  	/* Need backtracking ? */
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  336  	if (!list_empty(&edge_stack))
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  337  		goto prev_vertex;
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  338  }
6ba76fd2848e10 Kuniyuki Iwashima 2024-03-25  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
