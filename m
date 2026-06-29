Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8137DEA2
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754431; cv=none; b=KA/HnTHYT13UitLGsB5Cz/Ta6pt5BLupWsNmUx19yUTO/L+FCvciyk/TL7BDZmF5uf69jvZ9Q4fmVOTtpnBG+cPazZY8lvkDNxn0CEUj5WB1Xxd80KfabrEFZS+8G75S+rTBLLh+N8QjIyuspxr+n4YjRoiwTTF2csUZtv6lUuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754431; c=relaxed/simple;
	bh=HxSu3U1CZFROaKODStGOAG8uBed/YAkhbUowkW47sQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JT7BqQ6BWnmpa2QEP1vcBVFoNxP9dCo50bRYqi08lPnvVCOAa0Zok7mEJDz9nN/nbDSnDH0iyUt7P4AfosPbcHPeWodQh1M+4wtvNEEqWi/nG9RQn1pVfYW7bgaAwEHq89Fgz0DOrsPQTzlXzdIwZ61B/e1/gDsGTTTeNMLwJts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nm1/k6y2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nm1/k6y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782754430; x=1814290430;
  h=date:from:to:cc:subject:message-id;
  bh=HxSu3U1CZFROaKODStGOAG8uBed/YAkhbUowkW47sQU=;
  b=Nm1/k6y2omKl+tzl8IeQQZR12UBR2nOYCStMSOOlNN5MiOw2fBPcxFDg
   fvtIQ0UDMg0Gbn9bdRRsr/y3r21G+ENs98d+khkQa/sDlPh16Yd5xX2rV
   ylec1eA1sbn68U1SJ6x+7wG3QrSpRNUWCCypwEbtdcLUY0A9l0SYwD//Y
   tg4vsoA9vM8bQFbcwmUwBgmvvHJpQeXB1jqgG96amK1PEi3dWO+3HjlR1
   nTwaQ6bS63St4WjwFIqScmBvMfTmbUjbbdTARE1KFRbkr0W/uVL4h062B
   7IrTX1MPIWw8VjKzsDeg9KzkvaIaCWQNzukGZgC22LCCDBHm+GHHk3V63
   A==;
X-CSE-ConnectionGUID: LOiJYZxdQGyVOIprgwb59A==
X-CSE-MsgGUID: 0o19WBGoRMieRWIHnbxaZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83229386"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83229386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 10:33:50 -0700
X-CSE-ConnectionGUID: Em3z1cYXQWec1BU+IA7VNA==
X-CSE-MsgGUID: 899Tt6BZSQKqTeDtNObY3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="253928534"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jun 2026 10:33:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weFrd-000000007ca-40Nh;
	Mon, 29 Jun 2026 17:33:45 +0000
Date: Tue, 30 Jun 2026 01:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/cma.c:770:24-29: ERROR: iterator variable bound on line
 768 cannot be NULL
Message-ID: <202606300158.lMSr2D6Z-lkp@intel.com>
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
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 77c50f9147eabcf726f62c73167bb9d9e8621a43 mm: cma: simplify cma_debug_show_areas()
date:   11 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 11 months ago
config: sh-randconfig-r062-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300158.lMSr2D6Z-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 77c50f9147ea ("mm: cma: simplify cma_debug_show_areas()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606300158.lMSr2D6Z-lkp@intel.com/

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
