Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC586341
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607098; cv=none; b=CavYbl0/cQZCinp3jRQ3JvRsEMzVyfrxLa3nOgf2fUH5UvzYKxvjHNqx24uoMBhXlFDOZvckGVtDlZXCQ90VHtnJb4h2FvQFOaPq320cQhd5B8q7xsn/DZ0bZSh/oTksruMjES47DqdBxIQXeDLPTP4dHl923STdJYwDraKIdNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607098; c=relaxed/simple;
	bh=w3qJYPuawqHGoLx1+V/fRnaew7KRDPKWbv5PZFqW55w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GBqs4OLkoJjPmr6Qv73cGrkPc3kJBw+4y9dkz6ucGT39FScATP+TWextxOe1/6JhHYT3t28fWYJiI/g/irEtyteYfKifcFNDZPPks+1Fu8bs1hkc7LYEv0Uy4+ZHWE5ARvI8K1+MeXil0goGV/9Bd8lz+oK1SLNGZkKDmpAFwNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ69Gfzu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ69Gfzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764607096; x=1796143096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3qJYPuawqHGoLx1+V/fRnaew7KRDPKWbv5PZFqW55w=;
  b=OZ69GfzuV/j8VYWobBydzagLtH2QD+vOdAeP7oiynn7zPMocqvluwYMr
   nk5l9TAUU1pEj2W1b80AHIq441bxFhdcwNF7pR+eknhztYX6O9bC25Oaj
   lyBTpaSm/kBDq1kicjMbib/4/sUPiTs+CoiNYFZf6cspZ39W0t9TXumFF
   +228+TLzbygpcVHkibdEzsy56CT9ym+7mBcoBrxVAMliF5VwPRygXulYG
   et8dxt62U2V7UX3lwACJUBoPPl+GH14+/o33b94KLGQmhP8OM1eDCSD/Y
   kaRJR3PSFIrbxyWz7oC24VLKBTrbfVWcIJw5y2mebPSnkdt3stcOV+jfn
   A==;
X-CSE-ConnectionGUID: 4LIsHRQZRmabxWYl78zpBA==
X-CSE-MsgGUID: WVMF1FQvQeGra9lakn0luw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69145806"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="69145806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:38:15 -0800
X-CSE-ConnectionGUID: D5cTucHwSAq1odxQC15Hdw==
X-CSE-MsgGUID: 7X33D7UuQ8+FjL1vRX9zTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199244958"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2025 08:38:13 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ6uh-000000008wD-13eF;
	Mon, 01 Dec 2025 16:38:11 +0000
Date: Tue, 2 Dec 2025 00:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/page_owner.c:558 print_page_owner() error: '%pGp' expects
 argument of type 'unsigned long *', argument 8 has type 'struct
 memdesc_flags_t*'
Message-ID: <202512020036.DneJGnzn-lkp@intel.com>
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
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: 53fbef56e07df822ea3029109ffca25328c2e5ac mm: introduce memdesc_flags_t
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020036.DneJGnzn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512020036.DneJGnzn-lkp@intel.com/

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
