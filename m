Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCDA2F7459
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709494; cv=none; b=XLOcSQ8FSLgFn6VSGMPs+58j8nsu+iP0tQ2obUFd0XCYNfvfLIeKs/N4sAsLb//N8mnwir8sqcg0vvt0FWsADLVVsAgilScGdI2OxN2NI69sdRB0WNn1ktXpXlA4bfDEfj/1wp7D7meRmnCNVXkjpbkZ7UL2UEfVaE+jhAyYrjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709494; c=relaxed/simple;
	bh=yrnuAiaLINF2z3VIR9un6DSw5Hdo9CFGIhML4wKpdn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SM6NzLZM3BpnGtjFojvX7xV2oUfpjUecssWDwPIQQQXAlrib6Kmp45O/CRHaL8ygfUmxWyu120l6hgFTIMnv0vjktd6AIgGJNHGjCOE31BwQoV1b/vTFVVEOhBN2oGcHh9wXG3qGRWn6k+IFnR/yNKrtk9z0PR9RQcDSJ541ZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jx1ZMcX4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx1ZMcX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764709493; x=1796245493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrnuAiaLINF2z3VIR9un6DSw5Hdo9CFGIhML4wKpdn0=;
  b=jx1ZMcX4vIFURmAVtDpe0usNxbwpIhgGSVy31NbEeDOSRxnD75J1cBJP
   ekVWic1EbiRChNEstO/egdlXOPzNazfHEW6EKF8gyN9yKqwVxmAmPaXNY
   c+WimrNOkd43cRUCFI3iSMo0xIiUlxefpCKOO7VedOl+YG5A6kDuDJ43T
   KrmZpWoQAUCcAItHEeSxCniSPEd+vrY5LNAEQGohN7MalkuShsXjpBqnv
   H0++7XjtFBk0M4uKfak5GvkCB9C53s3yi2lQQpaEDkAs8ynlxGuyND//j
   KrxxtHowgxgYI4W4/PJFkRnxq9Qrxij2GjPiI0eGAFCTPPmJD3IlzMs25
   w==;
X-CSE-ConnectionGUID: PkR8jd30RMC1VMmfBfP90w==
X-CSE-MsgGUID: XEXbd5FQQZioOudNFP4oSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78160317"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="78160317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 13:04:52 -0800
X-CSE-ConnectionGUID: OeOXIjD9TI6k2bVamSLTng==
X-CSE-MsgGUID: Je95aAU4Qq+EhGLGh5NrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="193773380"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2025 13:04:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQXYG-00000000ACr-2k4M;
	Tue, 02 Dec 2025 21:04:48 +0000
Date: Wed, 3 Dec 2025 05:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 1/1] mm/cma.c:770:24-29: ERROR:
 iterator variable bound on line 768 cannot be NULL
Message-ID: <202512030431.TSUlisX6-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c7e117640d8dc8b68d068c14d101402073625eb9
commit: 77c50f9147eabcf726f62c73167bb9d9e8621a43 [1/1] mm: cma: simplify cma_debug_show_areas()
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-104-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030431.TSUlisX6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512030431.TSUlisX6-lkp@intel.com/

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
