Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7915A8
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458082; cv=none; b=WDzSmfyKr01/NjBnGXdCq6xRYJP310WO6Iu8Remcl6/lCkUVWTSLvbDHA/OP98p7/vRenPJXjp23SEPuNY1UfhwfIfiVvtqCBu7WaH4XNaA3TrM0pZEJoN0EHUoHM1mtCgzvslxvktOhXhlD7jaeCjY/2a9A6gDC10ep2c/69A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458082; c=relaxed/simple;
	bh=yFa4V2SvkmHrT4J2sobVQRPjvxwHytsKhV7+AL+C3do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvjkCJakEJvTWPo5NinAvCf4J6CBcOWknSfR29GWJEnrmhCQOBYoL/0+IzWSXyqIt2k+cxR4ZBb/EMO85c0WLCR8aW8PAYp4MK22TGUUqwbej5rfoj1wdZTtwbJQIPcZAlnDnvEnN/6yR4GttK4zYlh7D0mseVTzQapXJC0lk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXkQg7+y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXkQg7+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742458081; x=1773994081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFa4V2SvkmHrT4J2sobVQRPjvxwHytsKhV7+AL+C3do=;
  b=dXkQg7+yubHdY+pzPKicrLQmUc1llM9SWZeDXurxMlzrC/p/LPzrpEtz
   0MOjLMeI0PwCI3za2wjyUCCZVU27pdvfRradhJR/3Yer3yb9f7AH+Ipeb
   Wwv09H+WqVqLRjqacUQzg/Vm4vOoJg9voFSTn3FvjVfawHWR+VWqV0HLE
   lKFj+ocUufJY0oyb4u79m7zMyDKT5NDFz/sTQL4zsNFXLIsAMTYbwst2w
   hvl+sZC5jq0WHt7IzIqRZO/0R1MQ7mJTxhA72k9p+tS8tKwFsuUbldhxn
   WcChdwWQ/M/q8+E+Ynzj2t2Ol03zwgkqZavhZabgxpKKu4RBwN9Ch0eQN
   w==;
X-CSE-ConnectionGUID: yomeOlBoS5WxLoWX91FGJw==
X-CSE-MsgGUID: UNbAhrD1R+6hNANRy3veCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54341850"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="54341850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 01:08:00 -0700
X-CSE-ConnectionGUID: Kfwn8oDYT6yUAe5+CckLhw==
X-CSE-MsgGUID: gcFWEubjQpm2p0FrhUvVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="127187583"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2025 01:07:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvAwX-0000IB-0Q;
	Thu, 20 Mar 2025 08:07:57 +0000
Date: Thu, 20 Mar 2025 16:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 10772/12447] mm/hugetlb.c:3668:21-30: opportunity
 for str_plural(nrinvalid)
Message-ID: <202503201522.13UePnXd-lkp@intel.com>
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
TO: Frank van der Linden <fvdl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
commit: 14ed3a595fa4e8f5bceddb91cbcd1ba566c9669b [10772/12447] mm/hugetlb: check bootmem pages for zone intersections
:::::: branch date: 22 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r054-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201522.13UePnXd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503201522.13UePnXd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/hugetlb.c:3668:21-30: opportunity for str_plural(nrinvalid)

vim +3668 mm/hugetlb.c

e5ff215941d59f Andi Kleen           2008-07-23  3651  
e5ff215941d59f Andi Kleen           2008-07-23  3652  static void __init report_hugepages(void)
e5ff215941d59f Andi Kleen           2008-07-23  3653  {
e5ff215941d59f Andi Kleen           2008-07-23  3654  	struct hstate *h;
14ed3a595fa4e8 Frank van der Linden 2025-02-28  3655  	unsigned long nrinvalid;
e5ff215941d59f Andi Kleen           2008-07-23  3656  
e5ff215941d59f Andi Kleen           2008-07-23  3657  	for_each_hstate(h) {
4abd32dbab201c Andi Kleen           2008-07-23  3658  		char buf[32];
c6247f72d46457 Matthew Wilcox       2017-07-10  3659  
14ed3a595fa4e8 Frank van der Linden 2025-02-28  3660  		nrinvalid = hstate_boot_nrinvalid[hstate_index(h)];
14ed3a595fa4e8 Frank van der Linden 2025-02-28  3661  		h->max_huge_pages -= nrinvalid;
14ed3a595fa4e8 Frank van der Linden 2025-02-28  3662  
c6247f72d46457 Matthew Wilcox       2017-07-10  3663  		string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
6213834c10de95 Muchun Song          2022-06-28  3664  		pr_info("HugeTLB: registered %s page size, pre-allocated %ld pages\n",
c6247f72d46457 Matthew Wilcox       2017-07-10  3665  			buf, h->free_huge_pages);
14ed3a595fa4e8 Frank van der Linden 2025-02-28  3666  		if (nrinvalid)
14ed3a595fa4e8 Frank van der Linden 2025-02-28  3667  			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
14ed3a595fa4e8 Frank van der Linden 2025-02-28 @3668  					buf, nrinvalid, nrinvalid > 1 ? "s" : "");
6213834c10de95 Muchun Song          2022-06-28  3669  		pr_info("HugeTLB: %d KiB vmemmap can be freed for a %s page\n",
6213834c10de95 Muchun Song          2022-06-28  3670  			hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);
e5ff215941d59f Andi Kleen           2008-07-23  3671  	}
e5ff215941d59f Andi Kleen           2008-07-23  3672  }
e5ff215941d59f Andi Kleen           2008-07-23  3673  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
