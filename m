Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131C19D074
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 04:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791347918; cv=none; b=SNlaR7yiJ41UA0dJVpCZgZr0O7ptuCnFbJs6k3vVyQop7X4LDNZrdnsRoI583trwAePxgZyOvJ6ny8OXSvONH/DTXFtsFnlHWUOnb3QsGQubpxo1K2m27Ofkxv6rCSKJsVH89DUmwKF8bVxw5WU/IYsj+6y+iVLvQYB4dTXlo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791347918; c=relaxed/simple;
	bh=dRxmOHTtVmxKpo+ppfRfJAMxSMNuYSDqWXBvQFvAU98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EIa62YKkDN73exnfgthiRZJvm/NNUZ5FlVMxEA5WLPOeJFLANr1Wsao3p1xmFmPLiPR5tw7oHh0XuUOpknLEpGWR3FAd9tkNAY5DBvU0jpyTO3akc76mjZ9LIf1xKOkh3YgHRHx4BXpI540N+WJ2QAgzD/WCdhzQ1fGmWj0KatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvnMBKxG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvnMBKxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791347916; x=1822883916;
  h=date:from:to:cc:subject:message-id;
  bh=dRxmOHTtVmxKpo+ppfRfJAMxSMNuYSDqWXBvQFvAU98=;
  b=SvnMBKxGERtZrky0QZZfP74xMLstkb9v47VXi2Drx8Q7YypsIfi02DeG
   /E3xSJWC40TDxopnanaGtmEHdDhbisHPMMw7tDzWI13cLy6AAw5bShEgj
   cVci2KANvDsWNg3k0zhQhISe28HeU73zLNSAE4RonijRgsghPvAtWp0ue
   7Y8PV/wBiQqNJSk777AkqGQGlPj5tPO+vkclp44xoaoVr2BE+0UWQyrNG
   ryLgQCS+TJg4119GlxuG2h5pjqkH6PAELw/Aqkt0iDinAs8KsnNab5MjA
   SgiAIRaAL6ESje0WjY+/9bfFJGWkr0rf4PtDlcijYgNJSVt5mTh49rOZd
   w==;
X-CSE-ConnectionGUID: nFSm2QHtQcG/4q4L7YkNXw==
X-CSE-MsgGUID: UB6uSIM1QkOgMjr8ayIBSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="110114"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="110114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 21:38:24 -0700
X-CSE-ConnectionGUID: RiUut5JDR5mIo0lhWAWYUQ==
X-CSE-MsgGUID: 7MWZQGaJSLqTUSrko+Rl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280573276"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 21:38:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEJQ5-000000002Tz-2drY;
	Wed, 07 Oct 2026 04:38:21 +0000
Date: Wed, 07 Oct 2026 06:37:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 15/15] mm/page_owner.c:558
 print_page_owner() error: '%pGp' expects argument of type 'unsigned long *',
 argument 8 has type 'struct memdesc_flags_t*'
Message-ID: <202610070651.K1PgdJAF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   efe665b77332621017fded6de1496bfff20ae5c6
commit: 53fbef56e07df822ea3029109ffca25328c2e5ac [15/15] mm: introduce memdesc_flags_t
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070651.K1PgdJAF-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 53fbef56e07d ("mm: introduce memdesc_flags_t")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610070651.K1PgdJAF-lkp@intel.com/

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
