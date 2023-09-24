Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D436D
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 01:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695520163; x=1727056163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNtENLDdfQqxbgr4i3Q/JAHfH5u1EqAZ/EenR/Lufns=;
  b=Iwli7nxnB0ZhBl2rCbhu35f2Uz6WDoKpixksnSb49JrLQL3c06sxRUbt
   04GTXMI4ADKcbPtCBFUpJq7bi+MkpShzbqaSn1ef98O2aB0ShmbhqgdY3
   TpU/hIlZAovJxWU4Tm3JYb9Ki360x8mJHZQB3Jt2BBe8O+u1U4pIYuh+R
   NU6rPQpvPyGuXXobC5Y5/LH6YN6yoCEUUiaPySC+zrQ+6WWrW9G6TTMH9
   0Hj47PjZJS74uNjc8dT0gFcP/xtt3Jf4GNyrehEfwOP1zhRqhGhm12mb6
   v8adKEEFV2W9cIqnJiW0Cz3doQgFheyXpWrmTBC2RVtRtpdv15MjM3log
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="378341258"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="378341258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 18:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838196869"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="838196869"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2023 18:49:21 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkEFL-00037l-0P;
	Sun, 24 Sep 2023 01:49:19 +0000
Date: Sun, 24 Sep 2023 09:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 25/252] lib/maple_tree.c:4653 mas_next_slot()
 warn: ignoring unreachable code.
Message-ID: <202309240906.F8ozmxsQ-lkp@intel.com>
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
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   42426847c1b99e1091d15f0727d4246496c5a3b1
commit: 8a6a5b6801d33123cd77abb7245aff5a02d3e263 [25/252] maple_tree: add MAS_UNDERFLOW and MAS_OVERFLOW states
:::::: branch date: 31 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240906.F8ozmxsQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240906.F8ozmxsQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309240906.F8ozmxsQ-lkp@intel.com/

smatch warnings:
lib/maple_tree.c:4653 mas_next_slot() warn: ignoring unreachable code.

vim +4653 lib/maple_tree.c

54a611b605901c Liam R. Howlett 2022-09-06  4591  
54a611b605901c Liam R. Howlett 2022-09-06  4592  /*
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4593   * mas_next_slot() - Get the entry in the next slot
54a611b605901c Liam R. Howlett 2022-09-06  4594   *
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4595   * @mas: The maple state
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4596   * @max: The maximum starting range
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4597   * @empty: Can be empty
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4598   * @set_overflow: Should @mas->node be set to overflow when the limit is
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4599   * reached.
54a611b605901c Liam R. Howlett 2022-09-06  4600   *
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4601   * Return: The entry in the next slot which is possibly NULL
54a611b605901c Liam R. Howlett 2022-09-06  4602   */
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4603  static void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty,
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4604  			   bool set_overflow)
54a611b605901c Liam R. Howlett 2022-09-06  4605  {
54a611b605901c Liam R. Howlett 2022-09-06  4606  	void __rcu **slots;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4607  	unsigned long *pivots;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4608  	unsigned long pivot;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4609  	enum maple_type type;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4610  	struct maple_node *node;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4611  	unsigned char data_end;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4612  	unsigned long save_point = mas->last;
54a611b605901c Liam R. Howlett 2022-09-06  4613  	void *entry;
54a611b605901c Liam R. Howlett 2022-09-06  4614  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4615  retry:
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4616  	node = mas_mn(mas);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4617  	type = mte_node_type(mas->node);
39d0bd86c499ec Liam Howlett    2023-02-27  4618  	pivots = ma_pivots(node, type);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4619  	data_end = ma_data_end(node, type, pivots, mas->max);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4620  	if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4621  		goto retry;
54a611b605901c Liam R. Howlett 2022-09-06  4622  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4623  	if (mas->max >= max) {
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4624  		if (likely(mas->offset < data_end))
54a611b605901c Liam R. Howlett 2022-09-06  4625  			pivot = pivots[mas->offset];
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4626  		else
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4627  			goto overflow;
54a611b605901c Liam R. Howlett 2022-09-06  4628  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4629  		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4630  			goto retry;
54a611b605901c Liam R. Howlett 2022-09-06  4631  
54a611b605901c Liam R. Howlett 2022-09-06  4632  		if (pivot >= max)
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4633  			goto overflow;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4634  	}
54a611b605901c Liam R. Howlett 2022-09-06  4635  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4636  	if (likely(mas->offset < data_end)) {
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4637  		mas->index = pivots[mas->offset] + 1;
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4638  again:
54a611b605901c Liam R. Howlett 2022-09-06  4639  		mas->offset++;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4640  		if (likely(mas->offset < data_end))
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4641  			mas->last = pivots[mas->offset];
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4642  		else
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4643  			mas->last = mas->max;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4644  	} else  {
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4645  		if (mas_next_node(mas, node, max)) {
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4646  			mas_rewalk(mas, save_point);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4647  			goto retry;
54a611b605901c Liam R. Howlett 2022-09-06  4648  		}
54a611b605901c Liam R. Howlett 2022-09-06  4649  
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4650  		if (WARN_ON_ONCE(mas_is_none(mas))) {
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4651  			mas->node = MAS_OVERFLOW;
54a611b605901c Liam R. Howlett 2022-09-06  4652  			return NULL;
8a6a5b6801d331 Liam R. Howlett 2023-09-21 @4653  			goto overflow;
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4654  		}
54a611b605901c Liam R. Howlett 2022-09-06  4655  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4656  		mas->offset = 0;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4657  		mas->index = mas->min;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4658  		node = mas_mn(mas);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4659  		type = mte_node_type(mas->node);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4660  		pivots = ma_pivots(node, type);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4661  		mas->last = pivots[0];
54a611b605901c Liam R. Howlett 2022-09-06  4662  	}
54a611b605901c Liam R. Howlett 2022-09-06  4663  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4664  	slots = ma_slots(node, type);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4665  	entry = mt_slot(mas->tree, slots, mas->offset);
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4666  	if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
54a611b605901c Liam R. Howlett 2022-09-06  4667  		goto retry;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4668  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4669  	if (entry)
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4670  		return entry;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4671  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4672  	if (!empty) {
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4673  		if (mas->last >= max)
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4674  			goto overflow;
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4675  
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4676  		mas->index = mas->last + 1;
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4677  		/* Node cannot end on NULL, so it's safe to short-cut here */
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4678  		goto again;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4679  	}
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4680  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4681  	return entry;
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4682  
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4683  overflow:
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4684  	if (set_overflow)
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4685  		mas->node = MAS_OVERFLOW;
8a6a5b6801d331 Liam R. Howlett 2023-09-21  4686  	return NULL;
54a611b605901c Liam R. Howlett 2022-09-06  4687  }
54a611b605901c Liam R. Howlett 2022-09-06  4688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
