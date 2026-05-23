Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8BD27703
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779566509; cv=none; b=V2C12Ie6mgB3E/lD+hZBOvRNByPyj72bhVaHof3YJU8t/G6PLOU4+OQTpAzH5EnYkfxoWOvQnxQtq3VNX6aQucq0mCcJgPXQzoKKgkR53unRC2wMiPrxA6VRGdNkFE2PVNt3FZ0sBlEke3MSOCuNFx/JxFfs3podPjLdtwQz0fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779566509; c=relaxed/simple;
	bh=yIa2bY/+Hw+ccZZKDLKQ5o2tWvX8Zqa2RmPf6dj8tds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PqNv2ay5ONHlL/rdTwIx4bbr3/5JCdM8SjIWjRQUenupuBN0P0OcT406dpubdcgbGbQAK840j8HbPUzZeWYaggE793h9TvDAW+wkUQvg544ViiI9Ii/9If423UQYL6qIHVXLIaa3ZfPxcBT4RhVFzMjvmSpt9It2LGo8lmgPnfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+yJClwS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+yJClwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779566507; x=1811102507;
  h=date:from:to:cc:subject:message-id;
  bh=yIa2bY/+Hw+ccZZKDLKQ5o2tWvX8Zqa2RmPf6dj8tds=;
  b=e+yJClwSQjT+GJAZMkrJp2vNRAic6ciJ6Ax2YabTAHVWPz7ij4a4DCV4
   m/DQ1pMD6Z4PUnA+dmQT2QY3ixdqHKeEww1cHPIwNSn/OeuRMmNkfs6RH
   7Y4zAJPGKjmR+kuvPE1ijI9Yni7UJykN/GA8nQX68uDFUPjVxn0Y2kJtd
   M34HhkBRzuyFmaQf28h5cA6IE4MMagtutY+ypWJgDvUYi0Mw0jp9oyA1j
   gvX9ju5be75Y1kDQe9t2brHXREpnBpzs5MV9rnJ148eTTn8YAybNGMeq5
   dCLJA45eAInx6m5rVRUX66dEXmbqRiaps0jVbmKfwNUyoBOO7gSriHJMj
   g==;
X-CSE-ConnectionGUID: RlCUjus8SZKpH0kalOd73A==
X-CSE-MsgGUID: +WkSFBikRYGDl/dvgOf1fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="103131828"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="103131828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 13:01:47 -0700
X-CSE-ConnectionGUID: ImJliPkcRxyqxcihYS8qQw==
X-CSE-MsgGUID: Q1bqcJHJQzOeNGyEbd4VbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="240379724"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2026 13:01:45 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQsXW-000000000Jh-3tns;
	Sat, 23 May 2026 20:01:42 +0000
Date: Sun, 24 May 2026 04:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/cma.c:770:24-29: ERROR: iterator variable bound on line
 768 cannot be NULL
Message-ID: <202605240347.l0pmwezS-lkp@intel.com>
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
head:   eed108edc1170404bbef9e7d0189d18a3cc354f5
commit: 77c50f9147eabcf726f62c73167bb9d9e8621a43 mm: cma: simplify cma_debug_show_areas()
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-r051-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240347.l0pmwezS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77c50f9147ea ("mm: cma: simplify cma_debug_show_areas()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605240347.l0pmwezS-lkp@intel.com/

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
