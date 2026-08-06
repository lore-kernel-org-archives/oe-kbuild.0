Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5253C42A145
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013279; cv=none; b=gPXR4YnZlxCnk4Dh1GMEEwZYiefbThC7HX5guXR+WK6sdInI10bAp5R/NWlLXOqu0YxdW6Am/B7tcVtNFE3McRX6lEgP+kt9mIlL/GPj2FHGGG7rWa/cDQ4qcCke0WW0mSJUXVRPQnmXUhy9hlCM5oZ3SA3zmew2CzdpTEvY0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013279; c=relaxed/simple;
	bh=pxYbC1E0PeTGhXly5a8VHdqwbrm+WRJhOdcQjyPCyEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ege5MWQNEoFqJqjAg/nNpL6cinOWq8a+5Kccu+W3oe1UdYs+qOD95GknELN2DOyq4DP/9EyRKByvNiPYgyaYkKryeTALzmdgzj7EKoqS26rlwXzxMllzeVh6/08gMZ8avUiZ5pJY200fDXwQe/yuFMNlsLgecnauEANRl1vptKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwgS9zMt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwgS9zMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786013274; x=1817549274;
  h=date:from:to:cc:subject:message-id;
  bh=pxYbC1E0PeTGhXly5a8VHdqwbrm+WRJhOdcQjyPCyEo=;
  b=GwgS9zMtx6xGnYAwWmGrUwRHNqjiyj3yOnTRP7Dz6yH0HUm+Td2QDY83
   wgaBEdvusrgq9/UAH2+Q5qz9J88JoL+n9ZLCCvLlxNtGB5gstG2N5pUQR
   YDP3h2cBXvHcZPuwh1bOfEcgHJ/a5t8+pgYgg03YyGMDQIJ3rqsowQLRq
   yQ14Bzm4KPshnDviDdqW9gNjxairVlH/fjQPjnpMXMmAFMVShFKecWvSN
   2VSPdiMz1Ht6hM9AIy5UgG061lhPGDsWrAHyPZGb8sK50NX6Gm6QGj/7r
   I7ZpZS5/F+MaWDcy/XvPuhubkToWXXcHNd0LztAKYS38wlNENjckCj2ws
   g==;
X-CSE-ConnectionGUID: Bq/apXzaSeW94dq6Uqaf9Q==
X-CSE-MsgGUID: CgK9Tk4rTOi3XUhg208G0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86807895"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86807895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:47:48 -0700
X-CSE-ConnectionGUID: V+LZEhlGRw6zcek2p3Q3mg==
X-CSE-MsgGUID: XaOf/SsET6mcYgGdqixy9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="267218089"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2026 03:47:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrvdY-00000000Etf-35MW;
	Thu, 06 Aug 2026 10:47:44 +0000
Date: Thu, 06 Aug 2026 18:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/cma.c:770:24-29: ERROR: iterator variable bound on line
 768 cannot be NULL
Message-ID: <202608061807.18LR4Yza-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 77c50f9147eabcf726f62c73167bb9d9e8621a43 mm: cma: simplify cma_debug_show_areas()
date:   1 year ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-101-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061807.18LR4Yza-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77c50f9147ea ("mm: cma: simplify cma_debug_show_areas()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608061807.18LR4Yza-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/cma.c:770:24-29: ERROR: iterator variable bound on line 768 cannot be NULL

vim +770 mm/cma.c

c009da4258f988 Frank van der Linden 2025-02-28  751  
dbe43d4d2837da Jaewon Kim           2017-02-24  752  static void cma_debug_show_areas(struct cma *cma)
dbe43d4d2837da Jaewon Kim           2017-02-24  753  {
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19  754) 	unsigned long start, end;
7365ff2c8eef4e Frank van der Linden 2025-02-28  755  	unsigned long nr_part;
c009da4258f988 Frank van der Linden 2025-02-28  756  	unsigned long nbits;
c009da4258f988 Frank van der Linden 2025-02-28  757  	int r;
c009da4258f988 Frank van der Linden 2025-02-28  758  	struct cma_memrange *cmr;
dbe43d4d2837da Jaewon Kim           2017-02-24  759  
0ef7dcac998fef Mike Kravetz         2021-05-04  760  	spin_lock_irq(&cma->lock);
dbe43d4d2837da Jaewon Kim           2017-02-24  761  	pr_info("number of available pages: ");
c009da4258f988 Frank van der Linden 2025-02-28  762  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  763  		cmr = &cma->ranges[r];
c009da4258f988 Frank van der Linden 2025-02-28  764  
c009da4258f988 Frank van der Linden 2025-02-28  765  		nbits = cma_bitmap_maxno(cma, cmr);
c009da4258f988 Frank van der Linden 2025-02-28  766  
c009da4258f988 Frank van der Linden 2025-02-28  767  		pr_info("range %d: ", r);
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19 @768) 		for_each_clear_bitrange(start, end, cmr->bitmap, nbits) {
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19  769) 			nr_part = (end - start) << cma->order_per_bit;
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19 @770) 			pr_cont("%s%lu@%lu", start ? "+" : "", nr_part, start);
dbe43d4d2837da Jaewon Kim           2017-02-24  771  		}
c009da4258f988 Frank van der Linden 2025-02-28  772  		pr_info("\n");
c009da4258f988 Frank van der Linden 2025-02-28  773  	}
7365ff2c8eef4e Frank van der Linden 2025-02-28  774  	pr_cont("=> %lu free of %lu total pages\n", cma->available_count,
7365ff2c8eef4e Frank van der Linden 2025-02-28  775  			cma->count);
0ef7dcac998fef Mike Kravetz         2021-05-04  776  	spin_unlock_irq(&cma->lock);
dbe43d4d2837da Jaewon Kim           2017-02-24  777  }
dbe43d4d2837da Jaewon Kim           2017-02-24  778  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
