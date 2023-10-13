Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D9568D
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFWnYfLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697175303; x=1728711303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1M0OFTSC68AwGXZkHmbZcZb5x1lNBOVnMd7sPfNbAD0=;
  b=ZFWnYfLrR/p4aPZMRJItUck2ylx84+Zh6O8u3kWoDG1+To9A7q6Hz5Fn
   OOYL5IJwqlxIpg7PkKOQpwujzrie01AbEBVA+t0cm6tHjQqLKyZXhStrE
   of31eKg6ugpwxTyk0FecOalO5VrLSC2IMRoXvEjEx+lYf9UxZ0DsoAHUN
   0DQJWdFdGjHjrP7suVM+bklgPEumvZWiqMgPXF1isK48DbNvbl1wnQeYs
   4S4xTzCxjnnqRsVafGErsF+8OORk09xQJbW3s1eyP6MjeSC0ITPfrnfVz
   p4berlxZ+7gvezqbb9IsGOSk04YyuyiJYiZfoOZhTzUpvFiGKK/vhO+if
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370178472"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="370178472"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754575014"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="754575014"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Oct 2023 22:35:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrAp8-0004NR-2H;
	Fri, 13 Oct 2023 05:34:58 +0000
Date: Fri, 13 Oct 2023 13:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/maple_tree.c:4653 mas_next_slot() warn: ignoring unreachable
 code.
Message-ID: <202310131304.A7t0sbJr-lkp@intel.com>
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
head:   ce583d5fb9d3f4e20473b9d5619d51ea3cc92283
commit: a8091f039c1ebf5cb0d5261e3613f18eb2a5d8b7 maple_tree: add MAS_UNDERFLOW and MAS_OVERFLOW states
date:   13 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20231003 (https://download.01.org/0day-ci/archive/20231013/202310131304.A7t0sbJr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131304.A7t0sbJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310131304.A7t0sbJr-lkp@intel.com/

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
