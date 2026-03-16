Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0533A6F8
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653151; cv=none; b=YzigXyqUZAnBE1gqbPZ7CquX+8dWrlki4A7+9WiELRKT2VLi+DRfU5lF5BLIy47tM57E4goK4HfXw3y8RJ480xZRXlrVvwU0UZ8TPv/nU5LQUNhro+ZXdFZbrNTWlxCRMeTDif6ESPysDk6Fa4nN+UWVkrtzj9GBaiRdZ5hmjuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653151; c=relaxed/simple;
	bh=K1kH5/LLsjXbQJK/374Ycu5Vs5FtePJRsZNwq5FvP5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FWBzefRYVh9NiaevaOE01Irtlxt6RP9dvD+hOTOugujnMKMmJtT5VfwmEqjokDvbl7HjfilUa9JhG+fULkoZMNPoGvXTkDe+aV3UsD5JkrUzOMnEchdWbKRNEEJQNQvQIbq8VHIr9cl4+jz5s3o1kyyrVD87oYxpgwXcHWVQ33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZqE11se; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZqE11se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773653148; x=1805189148;
  h=date:from:to:cc:subject:message-id;
  bh=K1kH5/LLsjXbQJK/374Ycu5Vs5FtePJRsZNwq5FvP5I=;
  b=MZqE11ses34zqzGH8ZXgP88FZHMLFKbSlO0OdeFiBP3uk1InTQ0DgyD7
   D8zaOfmrgPH0Q1jUN5FZU5qHa7ofJgHgs7ivL31NpFnkDX2iIF0qUC/64
   PRNlTGICfv+b6ur3u1DLeH6kWEZp15yc1Pbw8mnjdhyHP3418hns1+Q70
   uldexqC1BV2biFDibidU/n7BGkRrZuxusY0G/LBzCVGnEAnbJ3bipksBX
   Vifw4vHQ44WIKA/o2/SZW00MSNbvnZBP3NOr2laqogZP+4cZc3z3j/apQ
   T52LIp0qrwPMxi0aATOG0gcyZ8w12kL+IV7b0a1L5V5kYSAX4zz8f5GT1
   w==;
X-CSE-ConnectionGUID: AVus2ZTzT6ikrPH/PDMGpA==
X-CSE-MsgGUID: H9YwDhugS6CWGHXfqwBYew==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78269165"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78269165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 02:25:48 -0700
X-CSE-ConnectionGUID: l8qr3RekRwG97TZAa37Uvw==
X-CSE-MsgGUID: MUtbKQe0TjuWGPlstxoNig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="259759810"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Mar 2026 02:25:47 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w24Cm-000000000Qk-1uDl;
	Mon, 16 Mar 2026 09:25:44 +0000
Date: Mon, 16 Mar 2026 17:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/page_owner.c:558 print_page_owner() error: '%pGp' expects
 argument of type 'unsigned long *', argument 8 has type 'struct
 memdesc_flags_t*'
Message-ID: <202603161725.CUlRQUzF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: 53fbef56e07df822ea3029109ffca25328c2e5ac mm: introduce memdesc_flags_t
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161725.CUlRQUzF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603161725.CUlRQUzF-lkp@intel.com/

smatch warnings:
mm/page_owner.c:558 print_page_owner() error: '%pGp' expects argument of type 'unsigned long *', argument 8 has type 'struct memdesc_flags_t*'

vim +558 mm/page_owner.c

fcf8935832b86d Waiman Long             2022-03-24  534  
48c96a3685795e Joonsoo Kim             2014-12-12  535  static ssize_t
48c96a3685795e Joonsoo Kim             2014-12-12  536  print_page_owner(char __user *buf, size_t count, unsigned long pfn,
9300d8dfd282bd Joonsoo Kim             2016-10-07  537  		struct page *page, struct page_owner *page_owner,
f2ca0b55710752 Joonsoo Kim             2016-07-26  538  		depot_stack_handle_t handle)
48c96a3685795e Joonsoo Kim             2014-12-12  539  {
af52bf6b92f7d8 Thomas Gleixner         2019-04-25  540  	int ret, pageblock_mt, page_mt;
48c96a3685795e Joonsoo Kim             2014-12-12  541  	char *kbuf;
48c96a3685795e Joonsoo Kim             2014-12-12  542  
c8f61cfc871fad Miles Chen              2018-12-28  543  	count = min_t(size_t, count, PAGE_SIZE);
48c96a3685795e Joonsoo Kim             2014-12-12  544  	kbuf = kmalloc(count, GFP_KERNEL);
48c96a3685795e Joonsoo Kim             2014-12-12  545  	if (!kbuf)
48c96a3685795e Joonsoo Kim             2014-12-12  546  		return -ENOMEM;
48c96a3685795e Joonsoo Kim             2014-12-12  547  
3ebc4397612732 Waiman Long             2022-03-24  548  	ret = scnprintf(kbuf, count,
b459f0905eec31 Audra Mitchell          2023-10-13  549  			"Page allocated via order %u, mask %#x(%pGg), pid %d, tgid %d (%s), ts %llu ns\n",
9300d8dfd282bd Joonsoo Kim             2016-10-07  550  			page_owner->order, page_owner->gfp_mask,
9cc7e96aa846f9 Liam Mark               2020-12-14  551  			&page_owner->gfp_mask, page_owner->pid,
bf215eab785a30 Yixuan Cao              2022-03-24  552  			page_owner->tgid, page_owner->comm,
b459f0905eec31 Audra Mitchell          2023-10-13  553  			page_owner->ts_nsec);
48c96a3685795e Joonsoo Kim             2014-12-12  554  
48c96a3685795e Joonsoo Kim             2014-12-12  555  	/* Print information relevant to grouping pages by mobility */
0b423ca22f95a8 Mel Gorman              2016-05-19  556  	pageblock_mt = get_pageblock_migratetype(page);
01c0bfe061f309 Wei Yang                2020-06-03  557  	page_mt  = gfp_migratetype(page_owner->gfp_mask);
3ebc4397612732 Waiman Long             2022-03-24 @558  	ret += scnprintf(kbuf + ret, count - ret,
399fd496c49b39 Kassey Li               2023-06-13  559  			"PFN 0x%lx type %s Block %lu type %s Flags %pGp\n",
48c96a3685795e Joonsoo Kim             2014-12-12  560  			pfn,
60f30350fd69a3 Vlastimil Babka         2016-03-15  561  			migratetype_names[page_mt],
48c96a3685795e Joonsoo Kim             2014-12-12  562  			pfn >> pageblock_order,
60f30350fd69a3 Vlastimil Babka         2016-03-15  563  			migratetype_names[pageblock_mt],
23efd0804c0a86 Matthew Wilcox (Oracle  2021-10-19  564) 			&page->flags);
48c96a3685795e Joonsoo Kim             2014-12-12  565  
0f68d45ef41abb Imran Khan              2021-11-08  566  	ret += stack_depot_snprint(handle, kbuf + ret, count - ret, 0);
48c96a3685795e Joonsoo Kim             2014-12-12  567  	if (ret >= count)
48c96a3685795e Joonsoo Kim             2014-12-12  568  		goto err;
48c96a3685795e Joonsoo Kim             2014-12-12  569  
9300d8dfd282bd Joonsoo Kim             2016-10-07  570  	if (page_owner->last_migrate_reason != -1) {
3ebc4397612732 Waiman Long             2022-03-24  571  		ret += scnprintf(kbuf + ret, count - ret,
7cd12b4abfd2f8 Vlastimil Babka         2016-03-15  572  			"Page has been migrated, last migrate reason: %s\n",
9300d8dfd282bd Joonsoo Kim             2016-10-07  573  			migrate_reason_names[page_owner->last_migrate_reason]);
7cd12b4abfd2f8 Vlastimil Babka         2016-03-15  574  	}
7cd12b4abfd2f8 Vlastimil Babka         2016-03-15  575  
fcf8935832b86d Waiman Long             2022-03-24  576  	ret = print_page_owner_memcg(kbuf, count, ret, page);
fcf8935832b86d Waiman Long             2022-03-24  577  
48c96a3685795e Joonsoo Kim             2014-12-12  578  	ret += snprintf(kbuf + ret, count - ret, "\n");
48c96a3685795e Joonsoo Kim             2014-12-12  579  	if (ret >= count)
48c96a3685795e Joonsoo Kim             2014-12-12  580  		goto err;
48c96a3685795e Joonsoo Kim             2014-12-12  581  
48c96a3685795e Joonsoo Kim             2014-12-12  582  	if (copy_to_user(buf, kbuf, ret))
48c96a3685795e Joonsoo Kim             2014-12-12  583  		ret = -EFAULT;
48c96a3685795e Joonsoo Kim             2014-12-12  584  
48c96a3685795e Joonsoo Kim             2014-12-12  585  	kfree(kbuf);
48c96a3685795e Joonsoo Kim             2014-12-12  586  	return ret;
48c96a3685795e Joonsoo Kim             2014-12-12  587  
48c96a3685795e Joonsoo Kim             2014-12-12  588  err:
48c96a3685795e Joonsoo Kim             2014-12-12  589  	kfree(kbuf);
48c96a3685795e Joonsoo Kim             2014-12-12  590  	return -ENOMEM;
48c96a3685795e Joonsoo Kim             2014-12-12  591  }
48c96a3685795e Joonsoo Kim             2014-12-12  592  

:::::: The code at line 558 was first introduced by commit
:::::: 3ebc439761273274ea00258da84d997841f01e72 mm/page_owner: use scnprintf() to avoid excessive buffer overrun check

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
