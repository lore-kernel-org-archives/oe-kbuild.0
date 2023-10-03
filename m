Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01421373
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Oct 2023 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334120; x=1727870120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGiOEfftq8WfrJiYPuuSJDePitmYCasz2IOYAdaKcBI=;
  b=iabxP4W9fM3n4SHTYzDawy9dmwLlwTJp4QYzYJTqNW72IgsCvcjzrQHJ
   mv4zXBs3WoYQ3pcrJOdVX4U/IoJSiKaWK2D7jrYwt6Cug1zC02Tr/JKHH
   8oa2gpRH0ilDbNuVPe/5T70O4H+Yu1Ky60GWTeUs5OkcoSq0hcFKt39Sk
   ZUvmYLPBeTzGFFuu2SEQOGOI0QLSqFDLI9IxwfeL+EAqcclnebqX/HInK
   Yt4z8J0wq3d+QQyLtn6erkrfnsCNs/S8/oicYiUw8ASi+u4j38WDYP//x
   hpOjoUfdvsB9L0ddTYmpeCdEBlrz8T+xlEPPG35P8UVnBiS8e6rzZmQrJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="449344854"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="449344854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 04:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="727587106"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="727587106"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 04:55:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qndzg-00075w-2T;
	Tue, 03 Oct 2023 11:55:16 +0000
Date: Tue, 3 Oct 2023 19:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/maple_tree.c:4653 mas_next_slot() warn: ignoring unreachable
 code.
Message-ID: <202310031923.0QVCVZwA-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce36c8b149873b50f2a4b9818eb3dcdd74ddd5a3
commit: a8091f039c1ebf5cb0d5261e3613f18eb2a5d8b7 maple_tree: add MAS_UNDERFLOW and MAS_OVERFLOW states
date:   4 days ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231003/202310031923.0QVCVZwA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310031923.0QVCVZwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310031923.0QVCVZwA-lkp@intel.com/

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
a8091f039c1ebf Liam R. Howlett 2023-09-21  4598   * @set_overflow: Should @mas->node be set to overflow when the limit is
a8091f039c1ebf Liam R. Howlett 2023-09-21  4599   * reached.
54a611b605901c Liam R. Howlett 2022-09-06  4600   *
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4601   * Return: The entry in the next slot which is possibly NULL
54a611b605901c Liam R. Howlett 2022-09-06  4602   */
a8091f039c1ebf Liam R. Howlett 2023-09-21  4603  static void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty,
a8091f039c1ebf Liam R. Howlett 2023-09-21  4604  			   bool set_overflow)
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
a8091f039c1ebf Liam R. Howlett 2023-09-21  4627  			goto overflow;
54a611b605901c Liam R. Howlett 2022-09-06  4628  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4629  		if (unlikely(mas_rewalk_if_dead(mas, node, save_point)))
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4630  			goto retry;
54a611b605901c Liam R. Howlett 2022-09-06  4631  
54a611b605901c Liam R. Howlett 2022-09-06  4632  		if (pivot >= max)
a8091f039c1ebf Liam R. Howlett 2023-09-21  4633  			goto overflow;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4634  	}
54a611b605901c Liam R. Howlett 2022-09-06  4635  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4636  	if (likely(mas->offset < data_end)) {
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4637  		mas->index = pivots[mas->offset] + 1;
a8091f039c1ebf Liam R. Howlett 2023-09-21  4638  again:
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
a8091f039c1ebf Liam R. Howlett 2023-09-21  4650  		if (WARN_ON_ONCE(mas_is_none(mas))) {
a8091f039c1ebf Liam R. Howlett 2023-09-21  4651  			mas->node = MAS_OVERFLOW;
54a611b605901c Liam R. Howlett 2022-09-06  4652  			return NULL;
a8091f039c1ebf Liam R. Howlett 2023-09-21 @4653  			goto overflow;
a8091f039c1ebf Liam R. Howlett 2023-09-21  4654  		}
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
a8091f039c1ebf Liam R. Howlett 2023-09-21  4673  		if (mas->last >= max)
a8091f039c1ebf Liam R. Howlett 2023-09-21  4674  			goto overflow;
a8091f039c1ebf Liam R. Howlett 2023-09-21  4675  
a8091f039c1ebf Liam R. Howlett 2023-09-21  4676  		mas->index = mas->last + 1;
a8091f039c1ebf Liam R. Howlett 2023-09-21  4677  		/* Node cannot end on NULL, so it's safe to short-cut here */
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4678  		goto again;
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4679  	}
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4680  
fff4a58cc00b3b Liam R. Howlett 2023-05-18  4681  	return entry;
a8091f039c1ebf Liam R. Howlett 2023-09-21  4682  
a8091f039c1ebf Liam R. Howlett 2023-09-21  4683  overflow:
a8091f039c1ebf Liam R. Howlett 2023-09-21  4684  	if (set_overflow)
a8091f039c1ebf Liam R. Howlett 2023-09-21  4685  		mas->node = MAS_OVERFLOW;
a8091f039c1ebf Liam R. Howlett 2023-09-21  4686  	return NULL;
54a611b605901c Liam R. Howlett 2022-09-06  4687  }
54a611b605901c Liam R. Howlett 2022-09-06  4688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
