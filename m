Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3112EE5F9
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Jul 2025 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705832; cv=none; b=Ye75zHGVQCpplTHL0XCtqGqycX6rwRiBP7oUn9uFnM+ZaCnE510eLqfv1Y9ZrG0/V5NF5TjwdhxZw4B63RIXO2fLOzuqkwmk19XNpMDjntL0zME5lwYuLec/UH0CyIeia1UHY9jXTrXuZcOqwFsjrWlyEjkdj0dFmkdXcjffwcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705832; c=relaxed/simple;
	bh=8zVkRHs4g6xh6Hlwz4ExnP4Y1Y3ln3hjIu4hM8RqXhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pw7hP7DiNVQGZ8Yif8IF55hpPnTfzv/HA8EgABYJakP/qTpWgq+K4016DvD2dvdC6tYYH9AYnz393iKpS2JAkU4TKjfxRn1ggRZdFpwYouJ/YpeamNT/7fn5Wr9Uo/QtC+U4WFjKAkm3rb2U2DDjT5o4rxo0+G05zcRMU+J48+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELQbRjgi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELQbRjgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752705831; x=1784241831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zVkRHs4g6xh6Hlwz4ExnP4Y1Y3ln3hjIu4hM8RqXhg=;
  b=ELQbRjgiALBSKLavGkt8CGZLrznuZV1xqA3/ow7VMov7sWTx8CJEl9F4
   vbMbugbjMCgiSAK8MXp4jyKJIvPMx90xPjXZ1mPT7+cyef2su0DNfkQ3C
   ey+q+HXyKIgaAtX47MX2np7Y0EmbGZxgq1f74aO9OxaFhU17aWs+apGPy
   0HtKCfflVqP3kBMcatbbTzG2DA5D+DO2E72T5+Aox4gIJ85tCRXt4SxH3
   B73N4Xv+TxbgIB97msjb9OLlzC7VCM+7kjNpwltXKoKvMrJhJTIW7sZSr
   KGCaHi3r+QlGPRNNKceVZywxuIE9+a9uyp6Z1+k2tv9n4DeoIf+Vjsxi0
   g==;
X-CSE-ConnectionGUID: 07Su8k3ES7WkJ7Ze+/T2UQ==
X-CSE-MsgGUID: UHKVTbDdR9CTJ+pV+30Q9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57578846"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="57578846"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:43:48 -0700
X-CSE-ConnectionGUID: m+UxskzaSYW0m9xG3t6sng==
X-CSE-MsgGUID: 2zVcDBshRuCC8WpkeGZp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="157297918"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2025 15:43:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucAqm-000CvE-2f;
	Wed, 16 Jul 2025 22:43:44 +0000
Date: Thu, 17 Jul 2025 06:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [norov:fnb 17/37] mm/cma.c:758:24-29: ERROR: iterator variable bound
 on line 756 cannot be NULL
Message-ID: <202507170612.Ez09D8cM-lkp@intel.com>
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
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux fnb
head:   a3d32c84f17f6f6ab41ab6c920df8c4e90d236e2
commit: e838c420a7954feef92be137971f99e20a296f97 [17/37] mm: cma: simplify cma_debug_show_areas()
:::::: branch date: 7 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-r051-20250716 (https://download.01.org/0day-ci/archive/20250717/202507170612.Ez09D8cM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507170612.Ez09D8cM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/cma.c:758:24-29: ERROR: iterator variable bound on line 756 cannot be NULL

vim +758 mm/cma.c

a254129e8686bf Joonsoo Kim          2014-08-06  739  
dbe43d4d2837da Jaewon Kim           2017-02-24  740  static void cma_debug_show_areas(struct cma *cma)
dbe43d4d2837da Jaewon Kim           2017-02-24  741  {
e838c420a7954f Yury Norov           2025-07-07  742  	unsigned long start, end;
7365ff2c8eef4e Frank van der Linden 2025-02-28  743  	unsigned long nr_part;
c009da4258f988 Frank van der Linden 2025-02-28  744  	unsigned long nbits;
c009da4258f988 Frank van der Linden 2025-02-28  745  	int r;
c009da4258f988 Frank van der Linden 2025-02-28  746  	struct cma_memrange *cmr;
dbe43d4d2837da Jaewon Kim           2017-02-24  747  
0ef7dcac998fef Mike Kravetz         2021-05-04  748  	spin_lock_irq(&cma->lock);
dbe43d4d2837da Jaewon Kim           2017-02-24  749  	pr_info("number of available pages: ");
c009da4258f988 Frank van der Linden 2025-02-28  750  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  751  		cmr = &cma->ranges[r];
c009da4258f988 Frank van der Linden 2025-02-28  752  
c009da4258f988 Frank van der Linden 2025-02-28  753  		nbits = cma_bitmap_maxno(cma, cmr);
c009da4258f988 Frank van der Linden 2025-02-28  754  
c009da4258f988 Frank van der Linden 2025-02-28  755  		pr_info("range %d: ", r);
e838c420a7954f Yury Norov           2025-07-07 @756  		for_each_clear_bitrange(start, end, cmr->bitmap, nbits) {
e838c420a7954f Yury Norov           2025-07-07  757  			nr_part = (start - end) << cma->order_per_bit;
e838c420a7954f Yury Norov           2025-07-07 @758  			pr_cont("%s%lu@%lu", start ? "+" : "", nr_part, start);
dbe43d4d2837da Jaewon Kim           2017-02-24  759  		}
c009da4258f988 Frank van der Linden 2025-02-28  760  		pr_info("\n");
c009da4258f988 Frank van der Linden 2025-02-28  761  	}
7365ff2c8eef4e Frank van der Linden 2025-02-28  762  	pr_cont("=> %lu free of %lu total pages\n", cma->available_count,
7365ff2c8eef4e Frank van der Linden 2025-02-28  763  			cma->count);
0ef7dcac998fef Mike Kravetz         2021-05-04  764  	spin_unlock_irq(&cma->lock);
dbe43d4d2837da Jaewon Kim           2017-02-24  765  }
dbe43d4d2837da Jaewon Kim           2017-02-24  766  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
